from django.shortcuts import render
from .models import Destination

def home(request):
    destinations = Destination.objects.all()
    return render(request, 'travel/home.html')
# , {'destinations': destinations})