from django.shortcuts import render
from django.urls import reverse_lazy
from django.views.generic.edit import CreateView  # Import the missing CreateView class
from .models import Reward
from admin_accounts.mixins import LoginRequiredMixin
from django.contrib.auth.decorators import login_required

# Create your views here.
@login_required(login_url=reverse_lazy('accounts:login'))
def all_reward(request):
    rewards = Reward.objects.all()
    return render(request, 'reward/all_reward.html', {'rewards': rewards})

class RewardCreateView(LoginRequiredMixin, CreateView):
    model = Reward
    fields = ['name', 'description', 'points_required', 'image', 'available']  # Add fields as needed
    template_name = 'reward/reward_form.html'  # Path to the template for the form
    success_url = reverse_lazy('reward:reward-list')  # URL to redirect to after successful form submission
