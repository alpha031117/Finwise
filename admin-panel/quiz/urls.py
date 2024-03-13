from django.urls import path
from . import views

app_name = 'quiz'

urlpatterns = [
    path('quiz/', views.all_quiz, name="all-quiz-list",),
    path('<slug:domain_slug>/quiz/', views.domain_quiz, name='domain-quiz'),
    path('<slug:domain_slug>/quiz/create/', views.QuizCreateView.as_view(), name="quiz-create",),
    # path('<slug:domain_slug>/news/', views.domain_list, name="slug-news-list",),
    # path('<slug:domain_slug>/news/update/<int:pk>/', views.NewsUpdateView.as_view(), name="news-update"),
    # path('<slug:domain_slug>/news/delete/<int:pk>/', views.NewsDeleteView.as_view(), name="news-delete"),
]