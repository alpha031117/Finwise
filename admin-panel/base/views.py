from django.shortcuts import render
from .models import Domain, InfoType
from django.views.generic.edit import CreateView, UpdateView, DeleteView
from admin_accounts.mixins import LoginRequiredMixin
from django.urls import reverse_lazy
from django.contrib import messages
from django.contrib.auth.decorators import login_required

# Create your views here.
@login_required(login_url=reverse_lazy('accounts:login'))
def home(request):
    # Retrieve all Domain objects
    domains = Domain.objects.all()

    # Retrieve all InfoType objects
    info_types = InfoType.objects.all()

    context = {
        'domains': domains,
        'info_types': info_types,
    }

    return render(request, "base/home.html", context=context)

@login_required(login_url=reverse_lazy('accounts:login'))
def domain_list(request):
    # Retrieve all Domain objects
    domains = Domain.objects.all()
    context = {
        'domain_data': domains,
    }

    return render(request, "base/domain_list.html", context=context)

class MessageMixin:
    success_message = ""
    error_message = ""

    def form_valid(self, form):
        response = super().form_valid(form)
        if self.success_message:
            messages.success(self.request, self.success_message)
        return response

    def form_invalid(self, form):
        response = super().form_invalid(form)
        if self.error_message:
            messages.error(self.request, self.error_message)
        return response
    
class DomainCreateView(LoginRequiredMixin, MessageMixin, CreateView):
    model = Domain
    fields = '__all__'
    success_url = reverse_lazy('domain-list') 
    success_message = "Domain created successfully!"
    error_message = "An error occurred. Repeated Domain Detected."
    
class DomainUpdateView(LoginRequiredMixin, MessageMixin, UpdateView):
    model = Domain
    fields = "__all__"
    success_url = reverse_lazy('domain-list')
    success_message = "Domain updated successfully!"
    error_message = "An error occurred. Please try again."


class DomainDeleteView(LoginRequiredMixin, MessageMixin, DeleteView):
    model = Domain
    success_url = reverse_lazy('domain-list')
    success_message = "Domain deleted successfully!"
    error_message = "An error occurred. Please try again."