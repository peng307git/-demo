define(function(require,exports,module){

    require('jquery');
    var ENCRYPT = require('../module/rsa');
    var Pop = require('../module/alertPop');

    var NewPassword=function(){
        this.init();
        this.bindEvent();
        this.alertPop =new Pop({
            css:{
                'font-size':'0.28rem'
            }
        });//气泡弹出提示
    }
    NewPassword.prototype = {
        init:function(){
            $(".step0").show();
            var uid = GetQueryString("UID");
            this.uid = uid;
            var uid2;
            if( !uid || uid==""){
                window.location.href = '/user/forget';
            }else{
                var  a = uid.substring(0,3);
                var b = uid.substring(7,11);
                uid2 = a+"****"+b;
            }
            $("#bd").find('.title .blue').html(uid2);
        },
        bindEvent:function(){
            var _self = this;
             //获取验证码
            $(document).on('click','.get-vcode', function(){
                var self = $(this);
                var captcha1 = $('#input-captcha').val();
                var newPassword = $("#password").val();
                var newPasswordagain = $("#passwordagain").val();
                
                if(newPassword=="" || newPassword==null){
                    _self.alertPop.show(I18N.prop('signup_login_password_null_error'));
                    return;
                }

                if(!isLoadPassword(newPassword)){
                    _self.alertPop.show(I18N.prop('signup_login_password_module'));
                    $("#password").val("").focus();
                    $("#passwordagain").val("");
                    return;
                }
                if(newPasswordagain=="" || newPasswordagain==null){
                    _self.alertPop.show(I18N.prop('signup_login_password_again_null'));
                    return;
                }
                if(newPassword!=newPasswordagain){
                    _self.alertPop.show(I18N.prop('signup_double_password_notonly_error'));
                    $("#passwordagain").val("").focus();
                    return;
                }
                if (captcha1==""||captcha1==null) {
                    _self.alertPop.show(I18N.prop('vcodeNullError'));
                    return;
                } else{
                    var ctoken = $('#ctoken').val();
                    self[0].setAttribute("disabled", true);
                    $.ajax({
                        type : "post",
                        url:'/v2/user/auth/find_password_code'
                        ,data:{'phone':_self.uid,'pCode':captcha1,'ctoken':ctoken},
                        dataType : "json"
                        ,success:function(msg){
                            if(msg.status == 0){
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
                                $("#msgcode").focus();
                            }else{
                                changeImg();
                                self[0].removeAttribute("disabled");
                                _self.alertPop.show(msg.error.message);
                                $('#input-captcha').val("");
                            }
                        }
                        ,error:function(err){
                           console.log(err);
                        }
                    }); 
                };
                
            });
            
            $("#sure").on('click', function(event) {
                var vcode = $("#msgcode");

                var newPassword = $("#password");
                var newPasswordagain = $("#passwordagain");
               
                if(vcode.val()==""){
                    _self.alertPop.show(I18N.prop('newpassword_msgcode_error'));
                    vcode.focus();
                    return;
                }
                if(newPassword.val()=="" || newPassword.val()==null){
                    _self.alertPop.show(I18N.prop('signup_login_password_null_error'));
                    return;
                }
                if( !isLoadPassword(newPassword.val())){
                    _self.alertPop.show(I18N.prop('signup_login_password_module'));
                    newPassword.val("").focus();
                    newPasswordagain.val("");
                    return;
                }
                if(newPassword.val()!=newPasswordagain.val()){
                    _self.alertPop.show(I18N.prop('signup_double_password_notonly_error'));
                    newPasswordagain.val("").focus();
                    return;
                }
                if(isLoadPassword(newPassword.val())&&vcode.val()!=""&&newPassword.val()==newPasswordagain.val()){
                    var pwd = encodeURIComponent(ENCRYPT.encrypt(newPassword.val()));
                    $.ajax({
                        type: 'post',
                        url: '/v2/user/auth/find_password',
                        data:{
                            'phone':_self.uid,
                            'newPassword': pwd,
                            'code': vcode.val()
                        },
                        success: function(data){
                            if(0 == data.status){
                                //设置成功页面
                                $(".step0").css({"display":"none"});
                                $(".step1").css({"display":"block"});
                                
                            }else{
                                _self.alertPop.show(data.error.message);
                            }
                        },
                        fail: function (status) {
                            location.reload();
                        }
                    });
                }
            })
            $("#login").on('click',function(event) {
                window.location = '/user/login';
            })
        }
    }

    $(function(){
        var newPassword = new NewPassword();
    })
});




 

////刷新图片验证码
function changeImg(){
    document.getElementById("captcha").src="/user/vaildatecode?ctoken="+$('#ctoken').val()+"&random="+Math.random();
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
    var patrn=/(?!^[0-9]+$)(?!^[A-z]+$)(?!^[^A-z0-9]+$)^.{6,16}$/; 
    var kong =/^[^\s]{6,16}$/  
    if (!patrn.exec(s)) return false ;
    if (!kong.exec(s)) return false ;
    return true 
}



















