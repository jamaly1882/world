from django.urls import path
from . import views
app_name='markt'
urlpatterns = [
path('company',views.company, name='company'),
path('interface',views.interface, name='interface'),
path('',views.store, name='store'),
path('interface_employ',views.interface_employ, name='interface_employ'),
path('add_prodect',views.add_prodect, name='add_prodect'),
path('show_prodect/<int:id>',views.show_prodect, name='show_prodect'),
path('markt/add_prodect_to_db',views.add_prodect_to_db, name='add_prodect_to_db'),
path('prodact_company',views.prodact_company, name='prodact_company'),
path('show_acot/<int:id>',views.show_acot, name='show_acot'),
path('inteface_customer',views.inteface_customer, name='inteface_customer'),
path('add_sanf',views.add_sanf, name='add_sanf'),
path('markt/add_sanf_db',views.add_sanf_db, name='add_sanf_db'),
]
