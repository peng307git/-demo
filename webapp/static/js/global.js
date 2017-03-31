//=======common.js=========
//@date: Mar 07,2016


//需要ready的模块
$(function($){
    // 导航hover动画调用
    //navbar_hover();
})

//js方法

function changeImg(){
      document.getElementById("captcha").src="/user/vaildatecode?ctoken="+$('#ctoken').val()+"&random="+Math.random();
 }

//信息栏实时刷新
function firRequest(){
  $.ajax({
     url:'/deal/getCurrentcoin',
     type:'GET',
     success:function(data){
    	 if(data.status == 0){
    		 var $price=$('.topbar');
    	      $price.find('.new-price').text("$ "+data.data['btcUsdPrice']);
          $price.find('.new-mg-price').text("฿ " + parseFloat(data.data['mg_price']).toFixed(6));
    	      var $btcAble=$price.find('.btc-able').text("¥ "+data.data['btcRmbPrice']);
    	      var $dollarChange=$price.find('.dollar-change').text(data.data['balanceUsd']);
    	      var $btcChange=$price.find('.btc-change').text(data.data['balanceBtc']);
    	      var $mnChange=$price.find('.mn-change').text(data.data['mn']);
    	      $price.find('.mg-change').text(data.data['mg']);
    	      $price.find('.username-able').text(data.data['username']);
    	 }
     }
    })
}

//模态对话框
function alertBoxFunc(strIndex,btntype,backFunc){     //btntype:sure,cancel,all
   $('#alertWrap').remove();
   var $alertWrap=$('<div id="alertWrap"></div>');
   var _alertBg='<div class="alert-bg"></div>';

   var _alertContainer='<div class="alert-text text-center"></div>';
   var btnStr='<div class="alert-box">';
       btnStr+=_alertContainer;
   if(btntype=='sure')
   {
      btnStr+='<div class="text-center top20">'
      btnStr+='<button class="btn-default-black alert-sure">'+$.i18n.prop('ok')+'</button>';
      btnStr+='</div>';
   }
   else if(btntype=='cancel')
   {
      btnStr+='<div class="text-center top20">'
      btnStr+='<button class="btn-default-black alert-cancel">'+$.i18n.prop('cancel')+'</button>';
      btnStr+='</div>';
   }
   else if(btntype=='all')
   {
      btnStr+='<div class="text-center top20">'
      btnStr+='<button class="btn-default-black right20 alert-sure">'+$.i18n.prop('ok')+'</button>';
      btnStr+='<button class="btn-default-black alert-cancel">'+$.i18n.prop('cancel')+'</button>';
      btnStr+='</div>';
   }

   btnStr+='</div>';

   $alertWrap
   .empty()
   .append(_alertBg)
   .append(btnStr);

   //alertStr国际化
   var _lang=langType();
   $.i18n.properties({
            name : 'strings', //资源文件名称
            path : 'https://o5uaa1ha4.qnssl.com/static/i18n/', //资源文件路径
            cache: true,
            mode : 'map', //用Map的方式使用资源文件中的值
            language : _lang,
            callback : function() {//加载成功后设置显示内容
               var _re=/^alertStr/;
               if(_re.test(strIndex)) //需要国际化
               {
                  $alertWrap.find('.alert-text').text($.i18n.prop(strIndex));
               }
               else
                  $alertWrap.find('.alert-text').text(strIndex);
               var wrap_ht=$alertWrap.height();
               var btnButton = $alertWrap.find('button')
               btnButton.each(function() {
                 var texter =$(this).text().split("[")[1];
                 if(texter){
                   $(this).text($.i18n.prop(texter.split("]")[0]));
                 }
               });
               $alertWrap
               .appendTo($('body'))
               .css('marginTop','-'+parseInt(wrap_ht/2)+'px');
            }
   });

    $alertWrap.on('click','.alert-sure',function(){
       $alertWrap.fadeOut(0,function(){
  	  	  $(this).remove();
  	   });
       if(backFunc)
  	      backFunc();
    })


    $alertWrap.on('click','.alert-cancel',function(){
  	   $alertWrap.fadeOut(0,function(){
  	  	   $(this).remove();
  	   });
     })
}

/***导航hover动画
var navbar_hover=function(){
	var $navbar=$('.navbar-nav');
	var $navbarLi=$navbar.find('li');
	$navbarLi
	.find('a')
	.hover(function(){
		var $li=$(this).parent();
		if($li.is('.active'))
			return false;
		$li
		.parent()
		.find('.flydiv')
		.remove();

		var $flydiv_lf=$('<div class="flydiv fdiv_lf"></div>');
	    var $flydiv_rt=$('<div class="flydiv fdiv_rt"></div>');

        $li.append($flydiv_lf)
           .append($flydiv_rt);

        var _width=$(this).width();

        $flydiv_lf
        .animate({'left':_width+'px','opacity':.2},700,function(){
        	 $(this).remove();
        })
        $flydiv_rt
        .animate({'right':_width+'px','opacity':.2},700,function(){
        	 $(this).remove();
        })
	},function(){
       $(this).nextAll()
              .fadeOut(300,function(){
              	 $(this).remove();
              });
	});
}
**/
function getCookie(name)
{
    var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
    if(arr=document.cookie.match(reg))
        return unescape(arr[2]);
    else
        return null;
}

//判定国际化文字类别
function langType(){
    var locale = getCookie("locale");
   var langObj={'zh_CN':'zh','zh_TW':'tw','en_US':'en'};
   if(locale==null)
     return 'tw';
   else
   {
      return langObj[locale];
   }
}

