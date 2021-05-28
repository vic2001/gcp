from django.urls import path
from . import views

urlpatterns = [
    path('', views.index),
    path('login_utilisateur/', views.log_client),
    path('login_commercant/', views.log_commercant),
    path('login_Livreur/', views.log_livreur),
    path('restaurant/', views.restaurant),
    path('restaurant/validation', views.validation),
    path('restaurant/confirmation', views.confirmation),
]
