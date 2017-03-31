define(function(require,exports,module){

    //var jquery = require('jquery');//jquery.i18n里面已经引入jquery
    var ji18 = require('../module/jquery.i18n');
    require('../../../js/jquery.cookie');
    var addCountry = require('../../../js/business/addressCountry');
    var ENCRYPT = require('../module/rsa');
    var History = require('../module/history');
    var Pop = require('../module/alertPop');

    
    /*****
    **@name：注册页
    ****/
    var signupFunc=function(){
        this.steper = 0;
        this.formbox = $("#bd .simcenter").find('.formbox');
        this.step = $("#bd .simcenter").find('.step');
        this.phonenum ="";
        this.ready();
        this.init();
        this.alertPop =new Pop({
            css:{
                'font-size':'0.28rem'
            }
        });//气泡弹出提示
        
    }
    var proto=signupFunc.prototype;
    proto.nextstep=function (){
        var _self=this;

        //将第二步中文本框清空
        $("#nickname").val("");
        $("#password").val("");
        $("#passwordagain").val("");

        var telephone = $("#txt_username").val();
        var code = $("#msgcode").val();
        var invitationCode = $("#invite_code").val();
        if(invitationCode == "" || invitationCode == null){
            _self.alertPop.show(I18N.prop("signup_icode_null_error"));
            return false;
        }
        if(telephone == "" || telephone == null){
            _self.alertPop.show(I18N.prop("signup_phone_null_error"));

            return false;
        }
        if(code == "" || code == null){
              _self.alertPop.show(I18N.prop("signup_msg_code_null_error"));
            return false;
        }
        _self.getPhoneNum();
        $.ajax({
            type : "post",
            async:false,
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
                     _self.history.add("signup1",'/signup1');
                     return true;
                }else{
                     _self.alertPop.show(msg.error.message);
                     return false;
                }
            }
            ,error:function(err){
               console.log(err);
               return false;
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
        _self=this;
        $.ajax({
            type : "get",
            url:'/v2/user/auth/get_name',
            // data:{},
            dataType : "json",
            success:function(msg){
                if(msg.status == 0){
                    $("#nickname").val(msg.data);
                }else{
                    _self.alertPop.show(msg.error.message);
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
        var code = $("#msgcode").val();
        var invitationCode = $("#invite_code").val();
        var username = $("#nickname").val();
        var password = $("#password").val();
        var passwordagain = $("#passwordagain").val();
        var payPassword = $("#paypassword").val();
        var paypasswordagain = $("#paypasswordagain").val();
        var email = $("#email").val();
        if(invitationCode == "" || invitationCode == null){
            _self.alertPop.show(I18N.prop("signup_icode_null_error"));
            return false;
        }
        if(telephone == "" || telephone == null){
             _self.alertPop.show(I18N.prop("signup_phone_null_error"));
            return;
        }
        if(code == "" || code == null){
            _self.alertPop.show(I18N.prop("signup_msg_code_null_error"));
            return;
        }
        if(username == "" || username == null){
            _self.alertPop.show(I18N.prop("signup_nick_null_error"));
            return;
        }else if(username.length>16||username.length<2){
            _self.alertPop.show(I18N.prop("signup_nick_module"));
            return;
        }
        if( !isLoadPassword(password)){
            $("#password").val("").focus();
            $("#passwordagain").val("");
            return;
        }
        if(password == "" || password == null){
            _self.alertPop.show(I18N.prop("signup_login_password_null_error"));
            return;
        }else if(passwordagain == "" || passwordagain == null){
            _self.alertPop.show(I18N.prop("signup_login_password_again_null"));
            $("#passwordagain").val("").focus();
            return;
        }
        else if(password!=passwordagain){
            _self.alertPop.show(I18N.prop("signup_double_password_notonly_error"));
            $("#passwordagain").val("").focus();
            return;
        }
        if(payPassword == "" || payPassword == null){
            _self.alertPop.show(I18N.prop("signup_pay_password_null_error"));
            return;
        }else if(!isNamberPassword(payPassword)){
            _self.alertPop.show(I18N.prop("signup_pay_password_module"));
            return;
        }else if(paypasswordagain == "" || paypasswordagain == null){
            _self.alertPop.show(I18N.prop("signup_pay_password_again_null"));
            $("#paypasswordagain").val("").focus();
            return;
        }else if(payPassword!=paypasswordagain){
            _self.alertPop.show(I18N.prop("signup_double_pay_password_notonly"));
            $("#paypasswordagain").val("").focus();
            return;
        }
         
        if(email == "" || email == null){
            _self.alertPop.show(I18N.prop("signup_email_null_error"));
            return;
        }else if(!isEmail(email)){
            _self.alertPop.show(I18N.prop("signup_email_error"));
            return;
        }else{
            $.ajax({
                type : "post",
                url:'/v2/user/auth/check_email',
                data:{'email':email},
                dataType : "json",
                success:function(msg){
                  if(msg.status != 0){
                    _self.alertPop.show(msg.error.message);
                    return;
                  }else{
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
                        ,success:function(msg1){
                            if(msg1.status == 0){
                                // _self.steper ++;
                                // _self.taber();
                                // _self.goindex();
                                window.location = '/';
                            }else{
                                if(msg1.error.code == 8){
                                    console.log("0x8：msg.error.message = "+ msg1.error.message );
                                    _self.alertPop.show(msg1.error.message);
                                    _self.steper = _self.steper-2;
                                    _self.taber();
                                    $("#msgcode").val("");
                                    $("#input-captcha").val("");
                                }else{
                                    _self.alertPop.show(msg1.error.message);
                                }
                            }
                        }
                        ,error:function(err){
                           console.log(err);
                        }
                    });
                  }
                },error:function(err){
                  console.log(err);
                  return;
                }
              });
        }
        
    }
    proto.taber=function(){
        var _self = this;
        _self.formbox.eq(_self.steper).show().siblings().hide();
        
        console.log( _self.steper );
    }

    proto.ready=function(){
        var _self=this;
        var login=new addressCountry({id:"#countryCode",showId:true});
        var vheight = $(window).height();
        //console.log(vheight);
        $(".bd-inner").css('min-height', (vheight-95)+'px');
        //$("#countryCode").find('option[value="86"]').attr("selected",true);
        $("#countryCode").val("86");
        var inviteCode = GetQueryString("code");
        $("#invite_code").val(inviteCode);
        $('#signupBtn').on('click',function(){
            _self.test();
        });
        $("#nextstep").on('click', function(event) {
            _self.nextstep();
            is=true;
        });
        $("#baseInfoNext").on('click',function(e){
            _self.baseInfoCheck();
            
        })
        $(".nicknamebox .right").on('click', function(event) {
            _self.getNickname();
        });
        $(".nicknamebox i").trigger('click');

        _self.taber();
        
    }

    proto.init=function(){
        
        var _self=this;
        _self.initHistorySet();

        $("#capbox").on('click', function(event) {
            event.preventDefault();
            changeImg();
            $("#capbg").hide();
        });

        //获取验证码
        $("#vcodebox").on('click','.get-vcode', function(){
            var self = $(this);
            var telephone = $('#txt_username').val();
            var _areaCode=$("#countryCode").find("option:selected").val();
            var invitationCode = $("#invite_code").val();
            var tel_num=$.trim(telephone);
            if(invitationCode == "" || invitationCode == null){
                _self.alertPop.show(I18N.prop("signup_icode_null_error"));
                return;
            }

            if(tel_num==""||tel_num==null){
              _self.alertPop.show(I18N.prop("signup_phone_null_error"));
              return;
            }
            _areaCode=$.trim(_areaCode);
            var telephone_code='';
            if(_areaCode==86)    //中国
            {
               telephone_code=tel_num;
            }else{
               telephone_code='+'+_areaCode+" "+tel_num;
            }
            var captcha1 = $('#input-captcha').val();
            
            if (captcha1==""||captcha1==null) {
              _self.alertPop.show(I18N.prop("signup_pic_code_null_error"));
            } else{
              var ctoken = $('.signup-vcodebox #ctoken').val();
              self[0].setAttribute("disabled", true);
              $.ajax({
                type : "post",
                url:'/v2/user/auth/invitation_code'
                ,data:{'phone':telephone_code,'pCode':captcha1,'ctoken':ctoken,'invitationCode':invitationCode},
                dataType : "json"
                ,success:function(msg){
                  if(msg.status == 0){
                    $("#capbg").show();
                    $(".simcenter .usernamebox .prompt").hide();
                    var wait = 60;
                    self.val(wait + I18N.prop('withdrawal.text20'));
                    var timer = setInterval(function(){
                      if(0 == wait){
                        clearInterval(timer);
                        self[0].removeAttribute("disabled");
                        self.val(I18N.prop('getsmscaptcha'));
                      }else{
                        self.val(wait + I18N.prop('withdrawal.text20'));
                        wait--;
                      }
                    }, 1000);
                    self.parent().find('input[type="text"]').focus();
                  }else{
                    changeImg();
                    self[0].removeAttribute("disabled");
                    if (msg.error.code == 4) {//TODO立即登錄
                      alertBoxFunc(I18N.prop('signup_phone_ishave'),'login',function(){
                            window.location.href = "/user/mobileLogin";
                      });
                    }else{
                        _self.alertPop.show(msg.error.message);
                        $('#input-captcha').val("");
                    }
                  }
                }
                ,error:function(err){
                    console.log(err);
                }
              }); 
            };
        });
    
    }
    proto.initHistorySet = function(){
        history.replaceState({"url":"signup0"},"","signup0");
        
        this.history  =  new History(function(e){
            var url = e.state.url;
            console.log(url);
            if(url.indexOf('signup0')>-1){
                if(is){
                    
                }else{
                    $("#invite_code").val('');
                    $("#txt_username").val('');
                    $("#input-captcha").val('');
                    $("#msgcode").val('');
                }
                is=false;
                signup.steper = 0;
                signup.taber();
               
            }else if(url.indexOf('signup1')>-1){
                var step = signup.steper;
                is=true;
                if(step == 0){
                    //验证
                    var ss = signup.nextstep();
                    if(ss==false || ss == undefined){
                        is=true;
                        window.history.back();
                        is=true;
                    }else{
                        is=true;
                        $("#nickname").val("");
                        $("#password").val("");
                        $("#passwordagain").val("");
                    }
                }else if(step == 2){
                    signup.steper = 1;
                    signup.taber();
                } 
            }else if(url.indexOf('signup2')>-1){

                var step = signup.steper;
                if(step == 1){
                    //验证
                    var ss = signup.baseInfoCheck();
                    if(!ss){
                        window.history.back();
                    }else{
                         $("#paypassword").val('');
                         $("#paypasswordagain").val('');
                         $("#email").val('');
                    }
                }
            }
        });
    }
    proto.baseInfoCheck = function(){
        _self = this;

        //将第三步中文本框清空
        $("#paypassword").val('');
        $("#paypasswordagain").val('');
        $("#email").val('');

        var username = $("#nickname").val();
        var password = $("#password").val();
        var passwordagain = $("#passwordagain").val();

        if(password == "" || password == null){
            _self.alertPop.show(I18N.prop('signup_login_password_null_error'));
            return;
        }else if(passwordagain == "" || passwordagain == null){
            _self.alertPop.show(I18N.prop('signup_login_password_again_null'));
            $("#passwordagain").val("").focus();
            return;
        }
        else if(password!=passwordagain){
            _self.alertPop.show(I18N.prop('signup_double_password_notonly_error'));
            $("#passwordagain").val("").focus();
            return;
        }
        if( !isLoadPassword(password)){
            $("#password").val("").focus();
            $("#passwordagain").val("");
            _self.alertPop.show(I18N.prop('signup_login_password_module'));
            return;
        }

        if(username == "" || username == null){
            _self.alertPop.show(I18N.prop('signup_nick_null_error'));
            return;
        }else if(username.length>16||username.length<2 || !illegalChar(username)){
            _self.alertPop.show(I18N.prop('signup_nick_module'));
            return;
        }else{
            $.ajax({
                type : "get",
                url:'/v2/user/auth/get_name',
                data:{name:username},
                dataType : "json",
                success:function(msg){
                    if(msg.data == username){
                         _self.steper++;
                         _self.taber();
                         _self.history.add("signup2",'/signup2');
                         return true;
                    }else{
                        _self.alertPop.show(I18N.prop('signup_nick_ishave'));
                        return;
                    }
                }
                ,error:function(err){
                   console.log(err);
                   return;
                }
            });
        }

        
    }

    $(function($){
        signup=new signupFunc();
    });

});




////刷新图片验证码
function changeImg(){
    document.getElementById("captcha").src="/user/vaildatecode?ctoken="+$('#ctoken').val()+"&random="+Math.random();
}
//跳转到注册页
function goSignUp(){
    window.location.href ='';
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
/*url中获取参数*/
function GetQueryString(name) {
   var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)","i");
   var r = window.location.search.substr(1).match(reg);
   if (r!=null) return unescape(r[2]); return null;
}

function isLoadPassword(s){   
    //var patrn=/(?!^[0-9]+$)(?!^[A-z]+$)(?!^[^A-z0-9]+$)^.{6,16}$/; 
    var patrn=/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$/;
    var kong =/^[^\s]{6,16}$/  
    if (!patrn.exec(s)) return false ;
    if (!kong.exec(s)) return false ;
    return true 
}
function isEmail(mail){   
    var filter  = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if (!filter.test(mail)) return false;
    return true 
}
function isNamberPassword(s){   
    var patrn=/^\d{6}$/;   
    if (!patrn.exec(s)) return false 
    return true 
}
function textfocus(o){
    $('.bd-container').css({'position':'relative','top':'-1.5rem'});
}
function textblur(o){
    $('.bd-container').css({'position':'relative','top':'0'});
}




//模态对话框
function alertBoxFunc(strIndex,btntype,backFunc){//btntype:sure,cancel,all
    $('#alertWrap').remove();
    var $alertWrap=$('<div id="alertWrap"></div>');
    var _alertBg='<div class="alert-bg">'+I18N.prop('login_note_title')+'<div class = "close">x</div></div>';
    var _alertContainer='<div class="alert-text text-center">'+strIndex+'</div>';
    var btnStr='<div class="alert-box">';
    btnStr+=_alertContainer;
    if(btntype=='login')
    {
        btnStr+='<div class="text-center top20">'
        btnStr+='<button class="btn-default-black immediately_login">'+I18N.prop('immediately_login')+'</button>';
        btnStr+='</div>';
    }
    btnStr+='</div>';
    $alertWrap
        .empty()
        .append(_alertBg)
        .append(btnStr);

    var wrap_ht=$alertWrap.height();

    $alertWrap.appendTo($('body')).css('marginTop','-'+parseInt(wrap_ht/2)+'px');
    
    $alertWrap.on('click','.immediately_login',function(){
        $alertWrap.fadeOut(0,function(){
            $(this).remove();
        });
        if(backFunc)
            backFunc();
    })


    $alertWrap.on('click','.alert-bg .close',function(){
        $alertWrap.fadeOut(0,function(){
            $(this).remove();
        });
        return false;
    })
}
//判断是否有特殊字符
function illegalChar(str)
{
    var pattern=/[`~!@#\$%\^\&\*\(\)_\+<>\?:"\{\},\.\\\/;'\[\]]/im;  
    if(pattern.test(str)){  
        return false;     
    }     
    return true;  
}












