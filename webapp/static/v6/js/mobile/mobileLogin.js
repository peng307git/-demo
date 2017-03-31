define(function(require, exports, module){
    
    //var jquery = require('jquery');//jquery.i18n里面已经引入jquery
    var ji18 = require('../module/jquery.i18n');
    require('../../../js/jquery.cookie');
    var addCountry = require('../../../js/business/addressCountry');
    var ENCRYPT = require('../module/rsa');
    var Pop = require('../module/alertPop');
    
    /*****
    **@name：login页
    ****/
    //console.log(document.referrer);
    var loginFunc=function(){
        this.ready();
        this.alertPop =new Pop({
            css:{
                'font-size':'0.28rem'
            }
        });//气泡弹出提示
    }
    var proto=loginFunc.prototype;

    proto.test=function (){
        var _self=this;
        var telephone = $("#txt_username").val();
        var password = $("#txt_password").val();
        var inputCaptcha = $("#input-captcha").val();
        var ctoken = $("#ctoken").val();
        var referer = $("#referer").val();
        var isLoding = true;
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
        // --
        if(telephone == "" || telephone == null){
            _self.alertPop.show(I18N.prop('phoneNullError'));
        }else if(password == "" || password == null){
            _self.alertPop.show(I18N.prop('passwordNullError'));
        }else{
            if (inputCaptcha==""||inputCaptcha==null) {
                _self.alertPop.show(I18N.prop('vcodeNullError'));
            } else{
               
                $("#loginBtn")[0].setAttribute("disabled", true);
               
                password = encodeURIComponent(ENCRYPT.encrypt(password));
                $.ajax({
                    type : "post",
                    url:'/user/login'
                    ,data:{
                        'mobile':telephone_code,
                        'password':password,
                        'pCode': inputCaptcha,
                        'ctoken': ctoken,
                        'referer':referer
                    },
                    dataType : "json"
                    ,success:function(msg){
                        if(msg.status == 0){
                            _self.Save();
                            window.location.href = msg.data.redirect;
                        }else{
                            if(msg.error.code == -9991){
                                //alertBoxFunc(msg.error.message,"sure",function(){
                                    window.location.href = '/user/loadPpassWordNew?UID='+telephone_code;
                                //});
                            }else{
                                changeImg();
                                $('#input-captcha').val('');
                               // alertBoxFunc(msg.error.message,"sure");
                                _self.alertPop.show(msg.error.message);
                            }
                        }
                        $("#loginBtn")[0].removeAttribute("disabled");
                    }
                    ,error:function(err){
                       console.log(err);
                       $("#loginBtn")[0].removeAttribute("disabled");
                    }
                });
            };
            //_self.Save();
        }
    }
    //记住用户名密码
    proto.Save=function(){
        if ($("#ck_rmbUser").is(':checked')) {
            var str_username = $("#txt_username").val();
            var str_password = $("#txt_password").val();
            var str_countryCode = $("#countryCode").find("option:selected").val();
            $.cookie("rmbUser", "true", { expires: 7 }); //存储一个带7天期限的cookie
            $.cookie("username", str_username, { expires: 7 });
            $.cookie("password", str_password, { expires: 7 });
            $.cookie("countryCode", str_countryCode, { expires: 7 });
        }
        else {
            $.cookie("rmbUser", "false", { expire: -1 });
            $.cookie("username", "", { expires: -1 });
            $.cookie("password", "", { expires: -1 });
            $.cookie("countryCode", "", { expires: -1 });
        }
    };

    proto.ready=function(){
        var _self=this;
        var otop = document.getElementById('loginBtn').offsetTop;
        if(document.body.clientHeight < otop+150){
            $("#noLogin").removeClass('no-login-trip');
            $("#noLogin").css({
                'position':'static',
                'margin':'0.5rem 0.25rem',
                'text-align': 'center',
                'font-size': '0.24rem'
            });
            //_self.tips.top
        }

        var login=new addressCountry({id:"#countryCode",showId:true,default:86});

        if ($.cookie("rmbUser") == "true") {
            $("#ck_rmbUser").attr("checked", true);
            $("#txt_username").val($.cookie("username"));
            $("#txt_password").val($.cookie("password"));
            //$("#countryCode").find('option[value="'+$.cookie("countryCode")+'"]').attr("selected",true);
            $("#countryCode").val($.cookie("countryCode"));
        }else{
            //$("#countryCode").find('option[value="86"]').attr("selected",true);
            $("#countryCode").val("86");
            $("#ck_rmbUser").attr("checked", false);
        }
        $('#loginBtn').on('click',function(){
            _self.test();
        });
    }


    $(function($){
        var login=new loginFunc();
    })

});

////刷新图片验证码
function changeImg(){
    document.getElementById("captcha").src="/user/vaildatecode?ctoken="+$('#ctoken').val()+"&random="+Math.random();
}
//跳转到注册页
function goSignUp(){
    window.location.replace('/user/signup');
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
function textfocus(o){
    $('.formbox').css({'position':'relative','top':'-1.5rem'});
}
function textblur(o){
    $('.formbox').css({'position':'relative','top':'0'});
}


