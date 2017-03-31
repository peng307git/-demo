define(function(require,exports,module){

    var ji18 = require('../module/jquery.i18n');
    var addCountry = require('../../../js/business/addressCountry');
    var Pop = require('../module/alertPop');
    var History = require('../module/history');
    
    var forgetFunc=function(){
        this.ready();
        this.alertPop =new Pop({
            css:{
                'font-size':'0.28rem'
            }
        });//气泡弹出提示
    }
    var proto=forgetFunc.prototype;

    proto.test=function (){
        var _self=this;
        var telephone = $("#txt_username").val();
        var captcha1 = $("#input-captcha").val();
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
        }else if(captcha1 == "" || captcha1 == null){
            _self.alertPop.show(I18N.prop('vcodeNullError'));
        }else{
            changeImg();
            $("#input-captcha").val("");
            //验证手机号和图片验证码 ajax -------- 保杰
            $.ajax({
                type : "post",
                url:'/v2/user/auth/check_phone',
                data:{'phone':telephone_code,'pCode':captcha1,'ctoken':$("#ctoken").val()},
                dataType : "json",
                success:function(msg){
                    if(msg.status == 0){
                        if (msg.data== 0) {
                            window.location.href = '/user/loadPpassWordNew?UID='+telephone_code;
                        } else{
                            _self.alertPop.show(I18N.prop('forget_phone_noregist'));
                        };
                    }else{
                        _self.alertPop.show(msg.error.message);
                    }
                }
                ,error:function(err){
                   console.log(err);
                }
            });
        }
    }

    proto.ready=function(){
        var _self=this;
        var login=new addressCountry({id:"#countryCode",showId:true});
        var vheight = $(window).height();
        $(".bd-inner").css('min-height', (vheight-95)+'px');
        $("#countryCode").val("86");
        $('#loginBtn').on('click',function(){
            _self.test();
        });

        history.replaceState({"url":"back"},"","back");
        _self.history  =  new History(function(e){
            var url = e.state.url;
            console.log(url);
            if(url.indexOf('back')>-1){
                window.location.href = '/user/forget';
            }
        }); 
    }

    $(function($){
        var forget=new forgetFunc();
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




















