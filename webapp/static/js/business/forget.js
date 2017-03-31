/*
*******
*/
var forgetFunc=function(){
	this.ready();
}

var proto=forgetFunc.prototype;

proto.wait=60;

proto.flags_data={86:"中国"
              ,60:"马来西亚"
              ,91:"印度"
              ,62:"印尼"
              ,84:"越南"
              ,886:"台湾"
              ,850:"朝鲜"
              ,82:"韩国"
              ,63:"菲律宾"
              ,66:"泰国"
              ,855:"柬埔寨"
              ,65:"新加坡"
              ,81:"日本"
};

proto.flagEvent=function(){
  var _self=this;
  //country flags select
      var $area_tel_hidden=$('#area-tel-hidden');
      var area_code='';
      if($area_tel_hidden)
      {
            var telNumber=$area_tel_hidden.val();
            if(telNumber)  
            {
              var _tel_arr=telNumber.split(' ');
                if(_tel_arr.length>1)
                {
                  area_code=_tel_arr[0];
                  var telphone_code=_tel_arr[1];
                      $('#input-telephone').val(_tel_arr[1])
                }
                else
                  $('#input-telephone').val(_tel_arr[0]);

            }
          var flags_menu_content='';
          for(var i in _self.flags_data)
          {
            var country=_self.flags_data[i];
            var class_str='';
            if(area_code) //设置默认国家。
            {
              if(area_code==('+'+i))
                class_str='class="active"';
            }
            else if(i==86)
              class_str='class="active"';
            flags_menu_content+='<li '+class_str+' data-flag-code='+i+'>'+'<img src="https://o5uaa1ha4.qnssl.com/static/images/flags/'+i+'.gif" />'+'<span> '+country+' </span>'+'</li>';
          }
              
              var area_str='';
      //去掉加号
      if(area_code!=''){
        area_code = area_code.replace("\+","");
      }
              if(area_code=='')
              {
                area_code=86;
              }



      area_str=' + '+area_code;



          $('.flag-menu')
          .html(flags_menu_content)
              .siblings('.flag-btn')
              .data('flagCode',area_code)
              .find('img')
              .attr('src','https://o5uaa1ha4.qnssl.com/static/images/flags/'+area_code+'.gif')
              .siblings('.area-code')
              .html(area_str);


        $('[data-flag]')
        .on('click',function(){
           var $this=$(this);
           var $forObj=$('.'+$this.data('flag'));
           $forObj.toggle();
        });

        $('.flag-menu').on('click','li',function(){
          var flag_code=$(this).data('flagCode');
          var flagName=$(this).find('span').text();
          var oldarea=$('#telphone-type').data('flatCode');

          if(flag_code!=oldarea)  //更换国家
          { 
             $(".voice").show();
                       $('.valid-img-box').show();
          }
          flagName=$.trim(flagName);
          $(this)
          .addClass('active')
              .siblings()
              .removeClass('active')
              .closest('ul')
              .toggle()
              .siblings('.flag-btn')
              .data('flagCode',flag_code)
              .find('.area-code')
              .html(" + "+flag_code)
              .siblings('img')
              .attr('src','https://o5uaa1ha4.qnssl.com/static/images/flags/'+flag_code+'.gif');
        })
      }
}


proto.time=function (obj) {
	var _self=this;
        if (_self.wait == 0) {
            obj.removeAttribute("disabled");
            //$(o).attr("disabled", false);  jquery
            obj.value = " 获取短信验证码 ";
            _self.wait = 60;
        } else {
            obj.setAttribute("disabled", true);
            obj.value =_self.wait + "秒后重新发送";
            _self.wait--;
            setTimeout(function () {
               _self.time(obj)
            },1000);
        }
}

proto.getCode=function (obj){
    var _self=this;
    var telephone = $("#input-telephone").val();
    var _area=$('#telphone-type').data('flagCode');
    var tel_number='';
      if(_area!=86)
          tel_number='+'+_area+' '+telephone;
      else
         tel_number=telephone;
    if(telephone == "" || telephone == null){
        $("#input-telephone").after('<span id="remind" class="input-valid-style">请输入手机号</span>');
    }else{
        $.ajax({
            url:'/user/getSmsCode',
            type:'POST',
            data:{'mobile':tel_number,'validatecode':$('#input-captcha').val(),'biz_type':"CHANGE_PWD",'ctoken':$("#ctoken").val()},
            dataType:'json',
            success:function(data){
                if(data.status == 0)
                {
              	  _self.time(obj);
                }
                else{
              	  changeImg();
              	  alertBoxFunc(data.error.message,"sure",function(){
                    $("#input-telephone").val("");
                  });
                }
            },
            error:function(){
                alert("函数执行错误！");
            }
        });
    }
}
proto.checkout=function (){
    var code_input = $("#input-telephonecode").val();

    //flag添加
    var _areaCode=$('#telphone-type').data('flagCode');
    var tel_num=$('#input-telephone').val();
    _areaCode=$.trim(_areaCode);
    tel_num=$.trim(tel_num);
    var telephone_code='';
    if(_areaCode==86)    //中国
    {
       telephone_code=tel_num;
    }
    else{
    	telephone_code='+'+_areaCode+" "+tel_num;
    }

    //pass
    var passwd1=$.trim($('#password').val());
    var passwd2=$.trim($('#passwordconfirm').val());
    var pa=/^[A-Za-z0-9]{6,}$/;
    if (!pa.exec(passwd1)) {
      alertBoxFunc("请输入6位以上含数字和字母的密码,字母区分大小写。", "sure");
      $('#password').val("");
      $('#passwordconfirm').val("");
      return false
    } 
    if(passwd1=='')
    {
      $('.pass-valid').remove();
      $("#password").after("<span class='input-valid-style pass-valid'>"+"请输入密码"+"</span>");
      return false;
    }
    else if(passwd1!=passwd2)
    {
      $('.passconfirm-valid').remove();
      $("#passwordconfirm").after("<span class='input-valid-style passconfirm-valid'>"+"两次输入的密码不一致"+"</span>");
      return false;
    }
    //-------
    
    $('#area-tel-hidden').val(telephone_code);
    $.ajax({
  		type : "POST",
  		url:'/user/forget'
  		,data:{'mobile':telephone_code,'smsCode':code_input,'password':passwd1},
  		dataType : "json"
  		,success:function(msg){
  			if(msg.status == 0){
  				alertBoxFunc(msg.data,"sure",function(){
					window.location = '/user/login';
				});
  			}else{
           $('.passconfirm-valid').remove();
  				alertBoxFunc(msg.error.message,"sure");
  			}
  		}
  		,error:function(err){
             console.log(err);
  		}
	  });
}

proto.ready=function(){
   var _self=this;
   $('#sendcode').on('click',function(){
       _self.getCode(this);
   });

   $('#changeBtn').on('click',function(){
   	  _self.checkout();
   })

   $("#input-telephone").on('keyup',function(){       //填写手机号输入框时，清除下面的提示信息
      $("#remind").remove();
  });

   $("#input-telephonecode").on('keyup',function(){       //填写手机号输入框时，清除下面的提示信息
      $("#remindcode").remove();
   });
   
   $('#password').on('keyup',function(){
      $(this).nextAll().remove();
   });

   $('#passwordconfirm').on('keyup',function(){
      $(this).nextAll().remove();
   });

    _self.flagEvent();
    //flags国际化
    var _lang=langType();
    $.i18n.properties({
            name : 'strings', //资源文件名称
            path : 'https://o5uaa1ha4.qnssl.com/static/i18n/', //资源文件路径
            cache: true,
            mode : 'map', //用Map的方式使用资源文件中的值
            language :_lang,
            callback : function() {//加载成功后设置显示内容
              for(var i in _self.flags_data)
              {
                  $('[data-flag-code='+i+']').find('span').text(' '+$.i18n.prop(''+i));
              }
            }
    });
}

$(function(){
	var forget=new forgetFunc();
})







  
 


  
