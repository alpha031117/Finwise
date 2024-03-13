# news/views.py
from admin_accounts.mixins import LoginRequiredMixin
from django.views.generic.edit import CreateView
from .models import News
from django.shortcuts import get_object_or_404, render
from base.models import Domain  # Assuming your domain model is named Domain
from django.urls import reverse_lazy
from django.db.models import Count
from django.contrib.auth.decorators import login_required

class NewsCreateView(LoginRequiredMixin, CreateView):
    model = News
    fields = ['title', 'content', 'author']  # Add fields as needed
    template_name = 'news/news_form.html'  # Path to the template for the form
    success_url = reverse_lazy('news:all-news-list')  # URL to redirect to after successful form submission

    def form_valid(self, form):
        # Retrieve the domain object using the provided slug
        domain = get_object_or_404(Domain, slug=self.kwargs['domain_slug'])
        #Add domain to the 

        form.instance.domain = domain  # Assign the domain to the news item
        return super().form_valid(form)

@login_required(login_url=reverse_lazy('accounts:login'))
def all_news(request):
    all_news = News.objects.all()  # Retrieve all news objects
    all_domains = Domain.objects.all()  # Retrieve all domain objects
    domains_with_news_count = Domain.objects.annotate(news_count=Count('infotype__news'))

    return render(request, 'news/all_news.html', {'all_news': all_news, 'all_domains': all_domains, 'domains_with_news_count': domains_with_news_count})

@login_required(login_url=reverse_lazy('accounts:login'))
def domain_news(request, domain_slug):
    # Retrieve the domain object based on the domain_slug
    domain = get_object_or_404(Domain, slug=domain_slug)
    # Retrieve news items related to the domain
    all_news = News.objects.filter(info_type__domain=domain)
    return render(request, 'news/domain_news.html', {'all_news': all_news, 'domain': domain})