from django.shortcuts import render, HttpResponse

# Create your views here.
def holaMundo(request):
    return HttpResponse("Hola mundo desde Django")