from django.urls import path
from . import views

app_name = 'podcast'

urlpatterns = [
    path('podcast/', views.all_podcast, name="podcast-list",),
    path('podcast/create/', views.PodcastCreateView.as_view(), name="podcast-create",),
    # path('<slug:domain_slug>/news/', views.domain_list, name="slug-news-list",),
    # path('<slug:domain_slug>/news/update/<int:pk>/', views.NewsUpdateView.as_view(), name="news-update"),
    # path('<slug:domain_slug>/news/delete/<int:pk>/', views.NewsDeleteView.as_view(), name="news-delete"),
]