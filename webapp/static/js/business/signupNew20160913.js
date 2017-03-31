/*****
**@name：login页
****/


var signupFunc=function(){
    this.steper = 0;
    this.formbox = $("#bd .simcenter").find('.formbox');
    this.step = $("#bd .simcenter").find('.step');
    this.phonenum ="";
	this.ready();
}
var proto=signupFunc.prototype;
proto.nextstep=function (){
    var _self=this;
    var telephone = $("#txt_username").val();
    var code = $("#vcodebox").find('input[type="text"]').val();
    var invitationCode = $("#invite_code").val();
    if(invitationCode == "" || invitationCode == null){
        alertBoxFunc($.i18n.prop('signupAlert1'),"sure");
        return;
    }
    if(telephone == "" || telephone == null){
        alertBoxFunc($.i18n.prop('signupAlert2'),"sure");
        return;
    }
    if(code == "" || code == null){
        alertBoxFunc($.i18n.prop('signupAlert3'),"sure");
        return;
    }
    _self.getPhoneNum();
    $.ajax({
        type : "post",
        url:'/v2/user/auth/check_code'
        ,data:{'phone':_self.phonenum,
               'code':code,
               'invitationCode':invitationCode,
           },
        dataType : "json"
        ,success:function(msg){
            if(msg.status == 0){
                _self.steper ++;
                _self.taber();
            }else{
                alertBoxFunc(msg.error.message,"sure");
            }
        }
        ,error:function(err){
           console.log(err);
        }
    });
    
}
proto.goindex=function (){
    var back = $(".successbox #deadline")
    var wait = 15;
    back.text(wait + " S");
    var timer = setInterval(function(){
        if(0 == wait){
            clearInterval(timer);
            self.location='/'; 
        }else{
            back.text(wait + " S");
            wait--;
        }
    }, 1000);
}
proto.getNickname = function(){
    $.ajax({
        type : "get",
        url:'/v2/user/auth/get_name',
        // data:{},
        dataType : "json",
        success:function(msg){
            if(msg.status == 0){
                $("#nickname").val(msg.data);
            }else{
                alertBoxFunc(msg.error.message,"sure");
            }
        }
        ,error:function(err){
           console.log(err);
        }
    });
}
proto.getPhoneNum=function (){
    var telephone = $("#txt_username").val();
    //flag添加
    var _areaCode=$("#countryCode").find("option:selected").val();
    var tel_num=$.trim(telephone);
    _areaCode=$.trim(_areaCode);
    var telephone_code='';
    if(_areaCode==86)    //中国
    {
       telephone_code=tel_num;
    }else{
       telephone_code='+'+_areaCode+" "+tel_num;
    }
    this.phonenum = telephone_code;
}
proto.test=function (){
	var _self=this;
	var telephone = $("#txt_username").val();
    var code = $("#vcodebox").find('input[type="text"]').val();
    var invitationCode = $("#invite_code").val();
    var username = $("#nickname").val();
    var password = $("#password").val();
    var passwordagain = $("#passwordagain").val();
    var payPassword = $("#paypassword").val();
    var paypasswordagain = $("#paypasswordagain").val();
    var email = $("#email").val();
    if(invitationCode == "" || invitationCode == null){
        alertBoxFunc($.i18n.prop('signupAlert1'),"sure");
        return;
    }
	if(telephone == "" || telephone == null){
		alertBoxFunc($.i18n.prop('signupAlert2'),"sure");
        return;
	}
    if(code == "" || code == null){
        alertBoxFunc($.i18n.prop('signupAlert3'),"sure");
        return;
    }
    if(username == "" || username == null){
        alertBoxFunc($.i18n.prop('signupAlert4'),"sure");
        return;
    }else if(username.length>16||username.length<2){
        alertBoxFunc($.i18n.prop('signupAlert5'),"sure");
        return;
    }
    if( !isLoadPassword(password)){
        $("#password").val("").focus();
        $("#passwordagain").val("");
        return;
    }
    if(password == "" || password == null){
		alertBoxFunc($.i18n.prop('signupAlert6'),"sure");
        return;
	}else if(passwordagain == "" || passwordagain == null){
        alertBoxFunc($.i18n.prop('signupAlert7'),"sure");
        $("#passwordagain").val("").focus();
        return;
    }
    else if(password!=passwordagain){
        alertBoxFunc($.i18n.prop('signupAlert8'),"sure");
        $("#passwordagain").val("").focus();
        return;
    }
    if(payPassword == "" || payPassword == null){
        alertBoxFunc($.i18n.prop('signupAlert9'),"sure");
        return;
    }else if(paypasswordagain == "" || paypasswordagain == null){
        alertBoxFunc($.i18n.prop('signupAlert10'),"sure");
        $("#paypasswordagain").val("").focus();
        return;
    }
    else if(payPassword!=paypasswordagain){
        alertBoxFunc($.i18n.prop('signupAlert11'),"sure");
        $("#paypasswordagain").val("").focus();
        return;
    }
     
    if(email == "" || email == null){
        alertBoxFunc($.i18n.prop('signupAlert12'),"sure");
        return;
    }else if(!isEmail(email)){
        alertBoxFunc($.i18n.prop('signupAlert13'),"sure");
        return;
    }
    _self.getPhoneNum();
    password = encodeURIComponent(ENCRYPT.encrypt(password));
    payPassword = encodeURIComponent(ENCRYPT.encrypt(payPassword));
	$.ajax({
		type : "post",
		url:'/v2/user/auth/sign'
		,data:{'phone':_self.phonenum,
               'password':password,
               'code':code,
               'invitationCode':invitationCode,
               'username':username,
               'payPassword':payPassword,
               'email':email
           },
		dataType : "json"
		,success:function(msg){
			if(msg.status == 0){
				_self.steper ++;
                _self.taber();
                _self.goindex();
			}else{
                if(msg.error.code == 8){
                    console.log("0x8：msg.error.message = "+ msg.error.message );
                    alertBoxFunc(msg.error.message,"sure",function(){
                        _self.steper --;
                        _self.taber();
                    });
                }else{
                    alertBoxFunc(msg.error.message,"sure");
                }
			}
		}
		,error:function(err){
           console.log(err);
		}
	});
}
proto.taber=function(){
    var _self = this;
    _self.formbox.eq(_self.steper).show().siblings().hide();
    console.log( _self.steper );
    _self.step.removeClass('active');
    for (var i = 0; i < _self.step.length; i++) {
        if (i<=_self.steper) {
            _self.step.eq(i).addClass('active');
        }else{
            _self.step.eq(i).removeClass('active');
        };
    };
}
proto.ready=function(){
	var _self=this;
	var login=new addressCountry({id:"#countryCode",showId:true});
	var vheight = $(window).height();
    $("#countryCode").val("86");
    var inviteCode = GetQueryString("code");
    $("#invite_code").val(inviteCode);
    $('#signupBtn').on('click',function(){
		_self.test();
	});
    $("#nextstep").on('click', function(event) {
        _self.nextstep();
    });
    $(".nicknamebox i").on('click', function(event) {
        _self.getNickname();
    });
    $(".nicknamebox i").trigger('click');
    _self.taber();
    // $("#nickname").on('blur', function(event) {
    //     var username = $("#nickname").val();
    //     if(username == "" || username == null){
    //         alertBoxFunc("请填写用户名称","sure");
    //         return;
    //     }else if(username.length>20||username.length<5){
    //         alertBoxFunc("请输入5-20个字符的用户名称","sure");
    //         $(this).val("");
    //         return;
    //     }
    // });
}

$(function($){
    var signup=new signupFunc();
    //验证邮箱
    $("#email").on('blur', function(event) {
      var  email = $("#email");
      if(email.val()==""||email.val()==null){
          alertBoxFunc($.i18n.prop('signupAlert14'),"sure"); 
      }else if(!isEmail(email.val())){
          alertBoxFunc($.i18n.prop('signupAlert13'),"sure");
      }else{
          $.ajax({
            type : "post",
            url:'/v2/user/auth/check_email'
            ,data:{'email':email.val()},
            dataType : "json"
            ,success:function(msg){
              if(msg.status != 0){
                alertBoxFunc(msg.error.message,"sure");
              }
            }
            ,error:function(err){
              console.log(err);
            }
          });
      }
  });
})