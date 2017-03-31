/**
*
*/

var preinfoFunc=function(){
  this.ready();
}

var proto=preinfoFunc.prototype;

proto.submitdata=function (){
	var password = $("#password").val();
	$.ajax({
		type : "post",
		url:'/user/preinfo'
		,data:{'password':password},
		dataType : "json"
		,success:function(msg){
			if(msg.status == 0){
				window.location = '/user/info';
			}else{
				alertBoxFunc(msg.error.message,"sure");
			}
		}
		,error:function(err){
           console.log(err);
		}
	});
}


proto.page='assets';

proto.ready=function(){
	
	var _self=this;
	
	$('.btn-default-black').on('click', function(e){
		$('#preinfoform').submit();			
	});
	$('#preinfoform').on('submit',function(e){
		e.preventDefault();
		_self.submitdata();
	});
	
    //导航栏添加active
   var page=this.page;
   $('.navbar-nav')
   .find('li[data-page='+page+']')
   .addClass('active')
   .siblings()
   .removeClass('active');
   //信息栏每30s刷新
   firRequest();
   window.setInterval("firRequest()",1000*30); 
   //事件绑定
   // $(".getcash").on('click',function () {
   //    alertBoxFunc('alertStr8','sure');
   // })
}

$(function(){
	var preinfo=new preinfoFunc();
})

$(function(){

   
   /*添加导航栏*/ 

           nav_hover('#myquery','#myaquery','#query_li'); //脑波查询导航
           nav_hover('#mybuy','#myabuy','#buy_li');       // 认购导航
      function nav_hover(obj,obj_a,obj_li){
            var myleft = 0;
           $(obj).hover(function(){
                  myleft = $(obj_a).offset().left - 25;
                  $(obj_li).css("display","block");
                  $(obj_li).css("left",myleft);
             },function(){
                   $(obj_li).css("display","none");  
           })
           $(obj_li).find('li').hover(function(){
                  $(obj_li).css("display","block");
                  $(this).css('color','#1783e8');
                  $(this).css('background','#e6e6e6');
               
           },function(){
                   $(obj_li).css("display","none");
                    $(this).css('color','#777577');
                   $(this).css('background','#fff');
           })
      }
      //脑波查询导航跳转
           $('#myquery_btn').click(function(){
                    window.location.href = "/record/meditation/my/brain/search";
           })
           $('#query_btn').click(function(){
                    window.location.href = "/record/meditation/global/brain/search";
           })
     //认购界面跳转
          $('#buy_btn').click(function(){
                    window.location.href = "/deal/buy";
           })
           $('#buy_link_btn').click(function(){
                    window.location.href = "/deal/buy_link";
           })
        
    
})



