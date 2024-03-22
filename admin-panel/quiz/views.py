from django.http import HttpResponseRedirect
from .models import Quiz, Choice  # Import the Domain class
from base.models import Domain
from django.db.models import Count
from django.shortcuts import get_object_or_404, render, redirect
from django.views.generic.edit import CreateView
from django.urls import reverse_lazy
from django.forms import inlineformset_factory
from admin_accounts.mixins import LoginRequiredMixin
from django.contrib.auth.decorators import login_required

# Create your views here.
@login_required(login_url=reverse_lazy('accounts:login'))
def all_quiz(request):
    all_quiz = Quiz.objects.all()  # Retrieve all news objects
    all_choices = Choice.objects.all()  # Retrieve all domain objects
    domain = Domain.objects.all()  # Retrieve all domain objects
    domains_with_quiz_count = Domain.objects.annotate(quiz_count=Count('infotype__quiz'))

    return render(request, 'quiz/quiz_list.html', {'all_quiz': all_quiz, 'all_choices': all_choices, 'all_domains': domain, 'domains_with_quiz_count': domains_with_quiz_count})

@login_required(login_url=reverse_lazy('accounts:login'))
def domain_quiz(request, domain_slug):
    # Retrieve the domain object based on the domain_slug
    domain = get_object_or_404(Domain, slug=domain_slug)
    # Retrieve news items related to the domain
    all_quiz = Quiz.objects.filter(info_type__domain=domain)
    return render(request, 'quiz/domain_quiz.html', {'all_quiz': all_quiz, 'domain': domain})

class QuizCreateView(LoginRequiredMixin, CreateView):
    model = Quiz
    fields = ['question_text', 'status']  # Fields for the Quiz model
    template_name = 'quiz/quiz_form.html'  # Path to the template for the form
    success_url = reverse_lazy('quiz:quiz_list')  # URL to redirect to after successful form submission

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        ChoiceFormSet = inlineformset_factory(Quiz, Choice, fields=['choice_text', 'is_correct'], extra=4, can_delete=False)
        TrueFalseFormSet = inlineformset_factory(Quiz, Choice, fields=['choice_text', 'is_correct'], extra=2, can_delete=False)

        if self.request.POST:
            context['formset'] = ChoiceFormSet(self.request.POST)
            if not context['formset'].is_valid():
                context['true_false_formset'] = TrueFalseFormSet(self.request.POST)
        else:
            context['formset'] = ChoiceFormSet()
            context['true_false_formset'] = TrueFalseFormSet()

        return context

    def form_valid(self, form):
        context = self.get_context_data()
        formset = context['formset']

        if 'true_false_formset' in context and context['true_false_formset'].is_valid():
            true_false_formset = context['true_false_formset']
            true_false_formset.instance = form.save()  # Save the Quiz instance first
            true_false_formset.save()  # Save the True/False formset

        if formset.is_valid():
            formset.instance = form.save()
            formset.save()
            return redirect(self.get_success_url())
        else:
            return self.render_to_response(self.get_context_data(form=form))
