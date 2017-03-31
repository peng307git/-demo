$(document).ready(function(){    
   $("html").on("keydown",function(event){    
        if(event.keyCode==13){    
           btn_sm();   
        }    
    }); 
    $("#login-box form button[type='button']").on("click",function(){
    	btn_sm();   
    })  
   function btn_sm (){
   	$("#login-box form ").submit(function(e){
	    return mySubmit(false); 
	});
	var name = $("#login-box form input[type='text']").val();
	var password = $("#login-box form input[type='password']").val();
	if(name!=""&&password!=""){
	   	$.ajax({
	        cache: true,
	        type: "POST",
	        url:"/admin/user/login",
	        data:{"username":name,"password":password},
	        async: false,
	        error: function(request) {
	        },
	        success: function(data) {
	        	if(data.status == 0){
	        		window.location.href = '/admin/';
	            }else{
	            	$("#login-box form input[type='text']").val("");
	            	$("#login-box form input[type='password']").val("");
	            	alertBoxFunc(data.error.message,"sure");
	            }
	        }
	   	});
   	}else{
   		alert("请填写有户名和密码！")
   	}
   }
 });   