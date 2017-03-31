/*****
**@name：login页
****/

//console.log(document.referrer);
var loginFunc=function(){

	this.ready();
}
var proto=loginFunc.prototype;

proto.test=function (){
	var _self=this;
	var telephone = $("#txt_username").val();
	var password = $("#txt_password").val();
	var inputCaptcha = $("#input-captcha").val();
	var ctoken = $("#ctoken").val();
	var referer = $("#referer").val();

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
	}else if(password == "" || password == null){
		alertBoxFunc($.i18n.prop('loginAlert2'),"sure");
	}else{
        if (inputCaptcha==""||inputCaptcha==null) {
            alertBoxFunc($.i18n.prop('loginAlert3'),"sure");
        } else{
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
                            alertBoxFunc(msg.error.message,"sure",function(){
                                window.location.href = '/user/loadPpassWordNew?UID='+telephone_code;
                            });
                        }else{
                            changeImg();
                            $('#input-captcha').val('');
                            alertBoxFunc(msg.error.message,"sure");
                        }
                    }
                }
                ,error:function(err){
                   console.log(err);
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
	var login=new addressCountry({id:"#countryCode",showId:true});
	var vheight = $(window).height();
	//console.log(vheight);
	$(".bd-container").css('min-height', (vheight-95)+'px');

	if ($.cookie("rmbUser") == "true") {
	    $("#ck_rmbUser").attr("checked", true);
	    $("#txt_username").val($.cookie("username"));
	    $("#txt_password").val($.cookie("password"));
	    //$("#countryCode").find('option[value="'+$.cookie("countryCode")+'"]').attr("selected",true);
        $("#countryCode").val($.cookie("countryCode"));
    }else{
    	//$("#countryCode").find('option[value="86"]').attr("selected",true);
        $("#countryCode").val("86");
    }
    $(document).keydown(function(e) {
		if (e.keyCode == 13) {
		//$("#loginform").submit();
		$('#loginBtn').trigger("click");
		}
	})
    $('#loginBtn').on('click',function(){
		_self.test();
	});
}

$(function($){
    var login=new loginFunc();
})