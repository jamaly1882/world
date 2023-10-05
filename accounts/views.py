from django.shortcuts import render,redirect

from django.urls import reverse
from  .form import SignupForm,UserForm,ProfileForm
from .models import Profile
from django.contrib.auth import authenticate,login
from django.contrib.auth import authenticate,login
from django.contrib.auth.decorators import login_required,permission_required
from django.core.serializers import serialize 
from django.contrib.auth.models import User
from django.http import  HttpResponse

from django.contrib.sessions.models import Session
from django.contrib.auth.decorators import user_passes_test
from django.http import HttpResponseForbidden
def admin_check(user):
    return user.groups.filter(name='Admins').exists()

admin_required = user_passes_test(admin_check, login_url='login')

@admin_required
def admin_page(request):
    # رمز المشرف
      pass
def Signup(request):
		 if request.method=="POST":
		 	form=SignupForm(request.POST)
		 	if form.is_valid():
		 	   form.save()
		 	   username=form.cleaned_data['username']
		 	   password=form.cleaned_data['password1']
		 	   user=authenticate(username=username,password=password)
		 	   login(request,user)
		 	   return redirect('my_job:profile')


		 else:
		 	   form=SignupForm()
		 return render(request, 'registration/signup.html',{'form':form})

def profile(request):
	 profile=Profile.objects.get(user=request.user)

	 return render(request,'accounts/profile.html',{'profile':profile})


def profile_edite(request):
		profile=Profile.objects.get(user=request.user)
		if request.method=="POST":
		 	userform=UserForm(request.POST,instance=request.user)
		 	profileform=ProfileForm(request.POST,request.FILES,instance=profile)
		 	if  userform.is_valid() and profileform.is_valid():
		 		userform.save()
		 		profileform.user=request.user
		 		profileform.save()
		 		return redirect(reverse('accounts:profile'))

		else:
		 	userform=UserForm(instance=request.user)
		 	profileform=ProfileForm(instance=profile)
		return render(request,'accounts/edite_profile.html',{'userform':userform,'profileform':profileform})






def setsession(request):
  user,created=User.objects.get_or_create(username=request.user)
  
  request.session['username']=user.username
  return render(request,'accounts/setsession.html')
def getsession(request):
	username=request.session['username']
	return render(request,'accounts/getsession.html',{'username':username})
    
def get_data(request):
 s = Session.objects.get(session_key='bj6et58qfh5y5cy53xz77z1zjj2q9bk8')
 x=s.session_data
 y=s.get_decoded()
 return render(request,'accounts/show_session.html',{'y':y})
	
