import datetime
from django.utils import timezone
from django.shortcuts import render
# Create your views here.
from api.models import GasEmployee


def index(request):
    print(timezone.now())
    return render(request, 'index/index.html')
