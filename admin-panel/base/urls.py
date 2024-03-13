from django.urls import path, include
from . import views

app_name = 'base'

urlpatterns = [
    path("", views.home, name="home"),
    path('domain/create/', views.DomainCreateView.as_view(), name="domain-create",),
    path('domain/', views.domain_list, name="domain-list",),
    path('domain/update/<int:pk>', views.DomainUpdateView.as_view(), name="domain-update"),
    path('domain/delete/<int:pk>', views.DomainDeleteView.as_view(), name="domain-delete"),
]