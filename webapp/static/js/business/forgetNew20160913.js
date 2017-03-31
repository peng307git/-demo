/*****
**@name：login页
****/


var forgetFunc=function(){
	this.ready();
}
var proto=forgetFunc.prototype;

proto.test=function (){
	var _self=this;
	var telephone = $("#txt_username").val();
	var captcha = $("#input-captcha").val();
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
		alertBoxFunc($.i18n.prop('loginAlert1'),"sure");
	}else if(captcha == "" || captcha == null){
		alertBoxFunc($.i18n.prop('loginAlert3'),"sure");
	}else{
        changeImg();
        $("#input-captcha").val("");
        //验证手机号和图片验证码 ajax -------- 保杰
		$.ajax({
			type : "post",
			url:'/v2/user/auth/check_phone',
			data:{'phone':telephone_code,'pCode':captcha,'ctoken':$("#ctoken").val()},
			dataType : "json",
			success:function(msg){
				if(msg.status == 0){
                    if (msg.data== 0) {
                        window.location.href = '/user/loadPpassWordNew?UID='+telephone_code;
                    } else{
                        alertBoxFunc($.i18n.prop('loginAlert4'),"sure");
                    };
				}else{
					alertBoxFunc(msg.error.message,"sure");
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
	//console.log(vheight);
	$(".bd-inner").css('min-height', (vheight-95)+'px');
    //$("#countryCode").find('option[value="86"]').attr("selected",true);
    $("#countryCode").val("86");
    $('#loginBtn').on('click',function(){
		_self.test();
	});
}

$(function($){
    var forget=new forgetFunc();
})