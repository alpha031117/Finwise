from django.urls import path
from . import views

app_name = 'reward'

urlpatterns = [
    path('reward/', views.all_reward, name="reward-list",),
    path('reward/create/', views.RewardCreateView.as_view(), name="reward-create",),
    # path('<slug:domain_slug>/news/', views.domain_list, name="slug-news-list",),
    # path('<slug:domain_slug>/news/update/<int:pk>/', views.NewsUpdateView.as_view(), name="news-update"),
    # path('<slug:domain_slug>/news/delete/<int:pk>/', views.NewsDeleteView.as_view(), name="news-delete"),
]