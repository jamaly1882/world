from django.shortcuts import render
from .models import prodect,Sanf

from django.shortcuts import render,redirect

from django.urls import reverse

from django.contrib.auth import authenticate,login
from django.contrib.auth import authenticate,login
from django.contrib.auth.decorators import login_required ,permission_required
from django.views.decorators.csrf import csrf_exempt  

from django.http import HttpResponse
from django.http import Http404

from django.http import HttpResponseRedirect

from django.contrib import messages
def interface(request):
  return render(request,'markt/interface.html')

def store(request):
	store=prodect.objects.all()
	context={'store':store}
	return render(request,'markt/store.html',context)
def interface_employ(request):
	return render(request,'markt/interface_employ.html')
@permission_required("markt.add_prodect")
def add_prodect(request):
	 sanf=Sanf.objects.all()
	 context={'sanf':sanf}
	 return render(request,'markt/add_prodect.html',context)
@csrf_exempt
def add_prodect_to_db(request):
	 if request.method=="POST":


	  
	 
	    hid_anjaz=request.POST.get('hid_anjaz')
	    prod_name=request.POST.get('prod_name')
	    price=request.POST.get('price')
	    
	    img_agree=request.FILES.get('img_agree', "")
	    san=Sanf.objects.get(id=hid_anjaz)
	    ad_pro=prodect.objects.create(name=prod_name,price=price,img_trhl=img_agree,sanf=san)
	    return HttpResponse(status=200)

def company(request):
	 return render(request,'markt/company.html')
def show_prodect(request,id):
	store=prodect.objects.get(id=id)
	context={'store':store}
	return render(request,'markt/show_prodect.html',context)

def prodact_company(request):
	sanf=Sanf.objects.all()
	context={'sanf':sanf}
	return render(request,'markt/prodact_company.html',context)


def show_acot(request,id):
	sa=Sanf.objects.get(id=id)
	pr=prodect.objects.filter(sanf=id)
	context={'pr':pr}
	return render(request,'markt/show_prodact_alsanf.html',context)
@permission_required("markt.add_prodect")
def inteface_customer(request):
	return render(request,'markt/inteface_customer.html')
@permission_required("markt.add_prodect")
def add_sanf(request):
	return render(request,'markt/add_sanf.html')
@csrf_exempt
def add_sanf_db(request):
	if request.method=="POST":


	  

	    prod_name=request.POST.get('prod_name')

	    san=Sanf.objects.create(name=prod_name)
	  
	    return HttpResponse(status=200)
