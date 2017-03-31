/*
*@name:sigup页
*/
var signupFunc=function(){
  this.ready();
}

var proto=signupFunc.prototype;

proto.wait=60;

proto.flags_data={86:'中国'
        ,60:'马来西亚'
        ,91:'印度'
        ,62:'印尼'
        ,84:'越南'
        ,886:'台湾'
        ,850:'朝鲜'
        ,82:'韩国'
        ,63:'菲律宾'
        ,66:'泰国'
        ,855:'柬埔寨'
        ,65:'新加坡'
        ,81:'日本'
        ,93:'阿富汗'
        ,54:'阿根廷'
        ,61:'澳大利亚'
        ,43:'奥地利'
        ,880:'孟加拉国'
        ,375:'白俄罗斯'
        ,32:'比利时'
        ,55:'巴西'
        ,95:'缅甸'
        ,99901:'加拿大'
        ,1345:'开曼群岛'
        ,56:'智利'
        ,57:'哥伦比亚'
        ,242:'刚果'
        ,53:'古巴'
        ,357:'塞浦路斯'
        ,420:'捷克'
        ,45:'丹麦'
        ,593:'厄瓜多尔'
        ,20:'埃及'
        ,251:'埃塞俄比亚'
        ,679:'斐济'
        ,358:'芬兰'
        ,33:'法国'
        ,241:'加蓬'
        ,49:'德国'
        ,233:'加纳'
        ,30:'希腊'
        ,224:'几内亚'
        ,509:'海地'
        ,852:'香港'
        ,36:'匈牙利'
        ,354:'冰岛'
        ,98:'伊朗'
        ,353:'爱尔兰'
        ,972:'以色列'
        ,39:'意大利'
        ,1876:'牙买加'
        ,327:'哈萨克斯坦'
        ,254:'肯尼亚'
        ,965:'科威特'
        ,331:'吉尔吉斯坦'
        ,856:'老挝'
        ,371:'拉脱维亚'
        ,961:'黎巴嫩'
        ,231:'利比里亚'
        ,370:'立陶宛'
        ,261:'马达加斯加'
        ,960:'马尔代夫'
        ,52:'墨西哥'
        ,377:'摩纳哥'
        ,976:'蒙古'
        ,212:'摩洛哥'
        ,674:'瑙鲁'
        ,977:'尼泊尔'
        ,31:'荷兰'
        ,64:'新西兰'
        ,227:'尼日尔'
        ,234:'尼日利亚'
        ,47:'挪威'
        ,968:'阿曼'
        ,92:'巴基斯坦'
        ,507:'巴拿马'
        ,51:'秘鲁'
        ,48:'波兰'
        ,351:'葡萄牙'
        ,1787:'波多黎各'
        ,974:'卡塔尔'
        ,40:'罗马尼亚'
        ,7:'俄罗斯'
        ,966:'沙特阿拉伯'
        ,27:'南非'
        ,34:'西班牙'
        ,94:'斯里兰卡'
        ,46:'瑞典'
        ,41:'瑞士'
        ,992:'塔吉克斯坦'
        ,255:'坦桑尼亚'
        ,90:'土耳其'
        ,993:'土库曼斯坦'
        ,256:'乌干达'
        ,380:'乌克兰'
        ,971:'阿拉伯联合酋长国'
        ,44:'英国'
        ,1:'美国'
        ,598:'乌拉圭'
        ,998:'乌兹别克斯坦'
        ,260:'赞比亚'
        ,853:'澳门'
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
            if(99901 == i){
              flags_menu_content+='<li '+class_str+' data-real-code='+i+' data-flag-code="01">'+'<img src="https://o5uaa1ha4.qnssl.com/static/images/flags/01.gif" />'+'<span> '+country+' </span>'+'</li>';
            }else{
              flags_menu_content+='<li '+class_str+' data-real-code='+i+' data-flag-code='+i+'>'+'<img src="https://o5uaa1ha4.qnssl.com/static/images/flags/'+i+'.gif" />'+'<span> '+country+' </span>'+'</li>';
            }
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


proto.time= function (obj) {
  var _self=this;
    if (_self.wait == 0) {
        obj.removeAttribute("disabled");
        //$(o).attr("disabled", false);  jquery
        obj.value = " 获取手机验证码 ";
        _self.wait = 60;
    } 
    else {
        obj.setAttribute("disabled", true);
        obj.value = _self.wait + "秒后重新发送";
        _self.wait--;
        setTimeout(function () {
                    _self.time(obj);
                },
                1000)
    }
}

proto.getCode=function (obj){
          var _self = this;
          var telephone = $("#input-telephone").val();
          var _area = $('#telphone-type').data('flagCode');
          var telephone_code = '';
          if (_area != 86) {
              telephone_code = '+' + _area + ' ' + telephone;
          } else{
              telephone_code = telephone;
          }
          
		  $.ajax({
   			url: '/user/verifyPhone',
   			type: 'POST',
   			dataType:'json',
   			data: {
   				mobile: telephone_code
   			},
   			success: function(data){
   				if(0 == data.status){
   					$('#tel-tip').html('');
   					$('#canMobileUse').val(1);
   					var password1=$('#input-password').val();
			          var password2=$('#passAgain').val();
			          password1=$.trim(password1);
			          password2=$.trim(password2);
			          var pa=/(?!^[0-9]+$)(?!^[A-z]+$)(?!^[^A-z0-9]+$)^.{6,16}$/;
                if (!pa.exec(password1)) {
                  alertBoxFunc("请输入6-16位含数字和字母的密码,字母区分大小写。", "sure");
                  $('#input-password').val("");
                  $('#passAgain').val("");
                  return false
                } 
			          if(password1 == "" || password1 == null){
			            alertBoxFunc("密码不能为空", "sure");
			              return false;
			          }
			          if(password2 == "" || password2 == null){
			            alertBoxFunc("再次确认密码不能为空", "sure");
			              return false;
			          }
			          
			          if(password1!=password2)
			          {
			            alertBoxFunc("对不起，两次输入的密码不一致", "sure");
			              return false;
			          }
			          
			          
			          var inputcaptcha = $("#input-captcha").val();
			        
			          if(telephone == "" || telephone == null){
			            alertBoxFunc("请输入手机号", "sure");
			          }else if($("#invitation_code").val() == "" || $("#invitation_code").val() == null){
			            alertBoxFunc("请输入邀请码", "sure");
			          }else if(inputcaptcha == "" || inputcaptcha == null){
			            alertBoxFunc("请输入图片验证码", "sure");
			          }else{
			              $.ajax({
			                  url:'/user/getSmsCode',
			                  type:'POST',
			                  data:{'mobile':telephone_code,'validatecode':$('#input-captcha').val(),'biz_type':"SIGN",'ctoken':$("#ctoken").val()},
			                  dataType:'json',
			                  success:function(data){
			                      if(data.status == 0)
			                      {
			                        _self.time(obj);
			                      }
			                      else{
			                        changeImg();
			                        alertBoxFunc(data.error.message, "sure",function(){
                                $('#input-captcha').val("");
                              });
			                      }
			                  },
			                  error:function(){
			                      alert("函数执行错误！");
			                  }
			              });
			          }
   				}else{
   					$('#tel-tip').html(data.error.message);
   					$('#canMobileUse').val(0);
   				}
   			}
   		});
          
}

proto.checkout=function(){
  var telephone = $("#input-telephone").val();
  if(telephone == "" || telephone == null){
    alertBoxFunc("请输入手机号", "sure");
     return;
  }

    //flag添加
    var _areaCode=$('#telphone-type').data('flagCode');
    var telephone_code='';
    if(_areaCode==86)    //中国
    {
       telephone_code=$('#input-telephone').val();
    }
    else
       telephone_code='+'+$('#telphone-type').data('flagCode')+" "+$('#input-telephone').val();
    $('#area-tel-hidden').val(telephone_code);
    // ---
    //document.getElementById("registerform").submit();
    
  var password = $("#input-password").val();
  if(password == "" || password == null){
    alertBoxFunc("请输入密码", "sure");
     return;
  }
  
  //再次输入密码验证
    var password1=$('#input-password').val();
    var password2=$('#passAgain').val();
    password1=$.trim(password1);
    password2=$.trim(password2);
    
    if(password2 == "" || password2 == null){
      alertBoxFunc("再次确认密码不能为空", "sure");
        return false;
    }
    
    if(password1!=password2)
    {
      alertBoxFunc("对不起，两次输入的密码不一致", "sure");
      return false;
    }
    
    
  var invitationCode = $("#invitation_code").val();
  if(invitationCode == "" || invitationCode == null){
    alertBoxFunc("请输入邀请码", "sure");
     return;
  }
  var inputUsername = $("#input-username").val();
  if(invitationCode == "" || invitationCode == null){
    alertBoxFunc("请输入用户名", "sure");
     return;
  }
  var sex = $(".sex-hidden").val();
  
  var address = $("#input-address").val();
  if(address.length>105){
    alertBoxFunc("对不起您输入地址超长!", "sure");
    return;
  }
  
  var inputNickname = $("#input-nickname").val();
  if(inputNickname == "" || inputNickname == null){
    alertBoxFunc("请输入昵称", "sure");
     return;
  }
  
  var inputEmail = $("#input-email").val();
  if(inputEmail == "" || inputEmail == null){
    alertBoxFunc("请输入Email", "sure");
     return;
  }
  var re = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/
  if(!re.test(inputEmail)){
    alertBoxFunc("输入Email格式不正确，请输入正确的Email。", "sure");
   return;
  }

  
  //按钮置灰
  $("#signupBtn").attr('disabled',"true");
    $.ajax({
    type : "post",
    url:'/user/signup'
    //contentType:'application/json;charset=UTF-8'
    ,data:{'mobile':telephone_code,'password':password,'inviteCode':invitationCode,'username':inputUsername,'gender':sex,'address':address,'smsCode':$("#input-telephonecode").val(),
      'nickname':inputNickname,'email':inputEmail},
    dataType : "json"
    ,success:function(msg){
      if(msg.status == 0){
       
          window.location = "/user/signup/success";
       
      }else{
        $("#signupBtn").removeAttr("disabled");
        alertBoxFunc(msg.error.message,"sure");
      }
    }
    ,error:function(err){
      $("#signupBtn").removeAttr("disabled");
           console.log(err);
    }
  });
    // }
  }

proto.change=function(){
  var telephone = $("#input-telephone").val();
  if(telephone == "" || telephone == null){
    alertBoxFunc("请输入手机号", "sure");
     return false;
  }
  
    //再次输入密码验证
    var password1=$('#input-password').val();
    var password2=$('#passAgain').val();
    password1=$.trim(password1);
    password2=$.trim(password2);
    
    if(password1 == "" || password1 == null){
      alertBoxFunc("密码不能为空", "sure");
        return false;
    }
    if(password2 == "" || password2 == null){
      alertBoxFunc("再次确认密码不能为空", "sure");
        return false;
    }
    
    
    if(password1!=password2)
    {
      alertBoxFunc("对不起，两次输入的密码不一致", "sure");
      return false;
    }
    
    var invitationCode = $("#invitation_code").val();
  if(invitationCode == "" || invitationCode == null){
    alertBoxFunc("请输入邀请码", "sure");
     return false;
  }
  
  var inputcaptcha = $("#input-captcha").val();
  if(inputcaptcha == "" || inputcaptcha == null){
    alertBoxFunc("请输入图片验证码", "sure");
     return false;
  }
  
  var vcode = $("#input-telephonecode").val();
  if(vcode == "" || vcode == null){
    alertBoxFunc("请输入手机号验证码", "sure");
     return false;
  }


    var _area = $('#telphone-type').data('flagCode');
    var telephone_code = '';
    if (_area != 86) {
        telephone_code = '+' + _area + ' ' + telephone;
    } else{
        telephone_code = telephone;
    }
    
    $.ajax({
      url:'/user/checkSmsCode',
      type:'POST',
      data:{'validatecode':$('#input-telephonecode').val(),'mobile':telephone_code},
      dataType:'json',
      success:function(data){
        if(data.status == 1){
          alertBoxFunc(data.error.message,"sure");
        }else if(data.status == 0){
           $('.hidebox1').hide();
           $('.hidebox2').show();
           
           var nick = 'VIP'+$('#input-telephone').val()
           $('#input-nickname').val(nick);
        }
  
      },
      error:function(){
        alert("函数执行错误！");
      }
    });
}

proto.ready=function(){
    var _self=this;

   $('#sendcode').on('click',function(){
    var the=this;
      $.ajax({
        url:'/user/checkInvitationCode',
        type:'POST',
        data:{'invitationCode':$('#invitation_code').val()},
        dataType:'json',
        success:function(data){
          console.log("fu")
          if(data.status == 1){
            alertBoxFunc(data.error.message,"sure");
          }else{
            _self.getCode(the);
          }
        },
        error:function(){
          alert("函数执行错误！");
        }
      });   
   })

   $('.sex-box').on('click',function(){
       var type='';
       var sexval=0;   //默认是男
       if($(this).find('.sex-male').length>0)
         type='男';
       else
       {
         type='女';
         $('.sex-hidden').val(1);
       }

       $('.sex-text').attr('placeholder',type);
       $(this).addClass('sex-box-active')
              .siblings('.sex-box')
              .removeClass('sex-box-active');
  });

  $("#input-telephone").on('keyup',function(){       //填写手机号输入框时，清除下面的提示信息
    $("#remind").empty();
  });

  $("#input-telephonecode").on('keyup',function(){       //填写手机验证码输入框时，清除下面的提示信息
      $("#remindcode").empty();
  });

  $(".surecancel").on('click',function(){
      alertBoxFunc('alertStr10');
  })

  $('#preBtn').on('click',function(){
         $('.hidebox2').hide();
         $('.hidebox1').show();
  })

  $('#nextBtn').on('click',function(){
      _self.change();
  })

  $('#signupBtn').on('click',function(){
      _self.checkout();
  })

   _self.flagEvent();
  //flags国际化
  var _lang=langType();
  $.i18n.properties({
          name : 'strings', //资源文件名称
          path : 'https://o5uaa1ha4.qnssl.com/static/i18n/', //资源文件路径
          cache: true,
          mode : 'map', //用Map的方式使用资源文件中的值
          language : _lang,
          callback : function() {//加载成功后设置显示内容
            for(var i in _self.flags_data)
            {
                $('[data-real-code='+i+']').find('span').text(' '+$.i18n.prop(''+i));
            }
          }
  });
}

$(function($){
   var signup=new signupFunc();
   $('#input-telephone').on('blur', function(){
   		var _areaCode=$('#telphone-type').data('flagCode');
	    var telephone_code='';
	    if(_areaCode==86)    //中国        
	    {
	       telephone_code=$('#input-telephone').val();
	    }
	    else
	       telephone_code='+'+$('#telphone-type').data('flagCode')+" "+$('#input-telephone').val();
   		$.ajax({
   			url: '/user/verifyPhone',
   			type: 'POST',
   			dataType:'json',
   			data: {
   				mobile: telephone_code
   			},
   			success: function(data){
   				if(0 == data.status){
   					$('#tel-tip').html('');
   					$('#canMobileUse').val(1);
   				}else{
   					$('#tel-tip').html(data.error.message);
   					$('#canMobileUse').val(0);
   				}
   			}
   		});
   });
   $('#input-telephone').on('focus', function(){
    $('#tel-tip').html('');
   });
});