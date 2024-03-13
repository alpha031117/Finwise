from django.urls import path
from . import views

app_name = 'news'

urlpatterns = [
    path('news/', views.all_news, name="all-news-list",),
    path('<slug:domain_slug>/news/', views.domain_news, name='domain-news'),
    path('<slug:domain_slug>/news/create/', views.NewsCreateView.as_view(), name="news-create",),
    # path('<slug:domain_slug>/news/', views.domain_list, name="slug-news-list",),
    # path('<slug:domain_slug>/news/update/<int:pk>/', views.NewsUpdateView.as_view(), name="news-update"),
    # path('<slug:domain_slug>/news/delete/<int:pk>/', views.NewsDeleteView.as_view(), name="news-delete"),
]