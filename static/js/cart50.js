
      $(document).ready(function(){
      $("select[name=select1], select[name=select2], select[name=select3]").on('change', function(){
        var a=$("select[name=select1]").val() || '';
        var  b=$("select[name=select2]").val() || '';
       var c=$("select[name=select3]").val() || '';
  
});
});

var form_resom=document.getElementsByClassName('account_reome_form_type')
for (var i = 0 ; i < form_resom.length; i++) {
    form_resom[i].addEventListener('click',function(){
    document.getElementsById('hidden1').value=a;
    document.getElementsById('hidden2').value=b;
    document.getElementsById('hidden3').value=c;
    var x= document.getElementsById('hidden1').value;
    var y=document.getElementsById('hidden2').value;
    var z=document.getElementsById('hidden3').value;
    update_resome(x,y,z)
   
 })
}



function update_resome(t,m,p){

var url= '//'
     fetch( url,
        {method:'POST',

        headers:{'Content-Type':'application/json','X-CSRFToken':csrftoken,},
         body:JSON.stringify({'t':t,'m':m,'p':p})

    })
    
 .then((response)=>{ return response.json()
 })
 .then((data)=>{console.log('data:',data)
   location.reload()});
}

