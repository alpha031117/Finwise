from django.contrib.auth.views import LoginView
from django.urls import reverse_lazy    
from django.contrib.auth import logout
from django.shortcuts import redirect
from .forms import CustomAuthenticationForm

class CustomLoginView(LoginView):
    form_class = CustomAuthenticationForm
    template_name = 'admin_accounts/login.html'
    success_url = reverse_lazy('base:home')  # Redirect to home page after login

def logout_view(request):
    logout(request)
    return redirect('accounts:login')  # Replace 'home' with the URL name of your home page


