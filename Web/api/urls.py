from django.urls import path
from . import views


urlpatterns = [
    path('checkSession/', views.checkSession),
    path('login/', views.login),
    path('addRequest/', views.addRequest),
    path('acceptRequest/', views.acceptRequest),
    path('getMList/', views.getMList),
    path('getReportRequest/', views.getReportRequest),
    path('getListCharacter/', views.getListCharacter),
    path('deleteCharacter/', views.deleteCharacter),
    path('editCharacterInfo/', views.editCharacterInfo),
]
