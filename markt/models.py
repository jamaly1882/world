from django.db import models
class Notification(models.Model):
    is_read = models.BooleanField(default=False)
    message = models.TextField()
    almo = models.TextField()
    date_a = models.TextField()

    timestamp = models.DateTimeField(auto_now_add=True)



class Sanf(models.Model):
	
	name=models.CharField(max_length=100)
	bine=models.CharField(max_length=100)
	
	
	img_trhl=models.ImageField(upload_to='images/',null=True, blank=True)
	img_persone=models.ImageField(upload_to='images/',null=True, blank=True)
	def __str__(self):
              return  str(self.id)




class prodect(models.Model):
	
	name=models.CharField(max_length=100)
	price=models.IntegerField(default=0,blank=True)
	img_trhl=models.ImageField(upload_to='images/',null=True, blank=True)
	sanf=models.ForeignKey(Sanf,null=True, blank=True,on_delete=models.CASCADE)
	class Meta: 

	 	permissions = (

            ("can_add_prodect", "can_view_prodect"),
        
        )
	def __str__(self):
                    return  str(self.id)

# Create your models here.
