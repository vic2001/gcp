from django.shortcuts import render
from .models import *


def index(request):
    context = {}
    context['restaurants'] = Enseigne.objects.all()
    return render(request, "index.html", context)

def log_client(request):
    return render(request, "log_client.html")

def log_commercant(request):
    return render(request, "log_commercant.html")

def log_livreur(request):
    return render(request, "log_livreur.html")

def restaurant(request):
    return render(request, "restaurant.html")

def validation(request):
    return render(request, "validation.html")

def confirmation(request):
    return render(request, "confirmation.html")

