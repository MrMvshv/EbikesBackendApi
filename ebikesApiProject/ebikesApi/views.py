from django.shortcuts import render
from django.http import JsonResponse
from rest_framework import generics
from .models import Post
from .serializers import PostSerializer

def root_view(request):
    return JsonResponse({"status": "OK"})

class PostListCreate(generics.ListCreateAPIView):
    queryset = Post.objects.all()
    serializer_class = PostSerializer

class PostRetrieveUpdateDestroy(generics.RetrieveUpdateDestroyAPIView):
    queryset = Post.objects.all()
    serializer_class = PostSerializer