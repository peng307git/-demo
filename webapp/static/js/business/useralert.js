var alertText = function(idname){
	var scriptText = $(idname).html();
	return scriptText;
}
var alertFunc=function(data){
	var _self = this;
	_self.titler = data.title;
	_self.contents = data.contents;
	var width = 545;
	if(data.width){
		width = data.width;
	}
	var padding = 10;
	if(data.padding){
		padding = data.padding;
	}
	$('#alertWrap').remove();
	$('#alertBox').remove();
	var htmler=[
			'<div class="alertBox" id="alertBox">',
				'<div class="alertBoxBg">',
				'</div>',
				'<div class="alertCover">',
					'<i class="closeAlertBox" id="closeAlertBox">X</i>',
					'<div class="alertTitle">',
						''+_self.titler ,
					'</div>',
					'<div class="alertDetail">',
						''+_self.contents,
					'</div>',
				'</div>',
			'</div>'
		].join('');
	$(document.body).append(htmler);
	var boxer = $('#alertBox');
	boxer.css({
		'position': 'fixed',
		'top': '0',
		'width':'100%',
		'height':'100%'
	});
	boxer.find(".alertBoxBg").css({
		'position':'absolute',
		'width':'100%',
		'height':'100%',
		'background':'rgba(0,0,0,.5)'
	})
	boxer.find('.alertCover').css({
		'position':'absolute',
		'top':'80px',
		'left':'50%',
		'width': width+'px',
		'margin-left':'-'+(width/2)+'px',
		'padding-top':'30px',
		'background':'#FFF'
	});
	boxer.find('#closeAlertBox').css({
		'position':'absolute',
		'top':'5px',
		'right':'10px',
		'color':'#CCC',
		'font-style':'normal',
		'font-size':'20px',
		'cursor':'poibter'
	})
	boxer.find('.alertTitle').css({
		'background':'#F0F0F0',
		'color':'#333',
		'padding':'10px',
		'font-style':'normal',
		'font-size':'16px',
		'cursor':'poibter',
		'text-align':'center',
		'line-height':1.5
	})
	boxer.find('.alertDetail').css({
		'padding': padding +'px',
	})
	boxer.on('click', '.closeAlertBox', function(event) {
		$('#alertBox').remove();
	});
	// boxer.on('click', '.alertBoxBg', function(event) {
	// 	$('#alertBox').remove();
	// });
}
$(document).on('keypress','.NamberPassword',function(event) {
	var eventObj = event || e;
    var keyCode = eventObj.keyCode || eventObj.which;
    if (keyCode == 46  || ((keyCode >= 48 && keyCode <= 57)|| keyCode == 8||keyCode==0)) {
    	//console.log(keyCode);
    	return true;
    }else{
    	return false;
    }
});
function isNamberPassword(s){   
	var patrn=/^\d{6}$/;   
	if (!patrn.exec(s)) return false 
	return true 
}
function isNamber(s){   
	var patrn=/^[0-9]*$/;   
	if (!patrn.exec(s)) return false 
	return true 
}
function isLoadPassword(s){   
	var patrn=/(?!^[0-9]+$)(?!^[A-z]+$)(?!^[^A-z0-9]+$)^.{6,16}$/; 
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
checkPassword("#alert-security .password");
checkPassword("#alert-loadpassword .password");
function checkPassword(box){
	$(box).find(' em.warning div').hide();
	$(document).on('keyup',box+' input[type="password"]', function(event) {
		var password = $(this).val();
		var alertTextB = $(box).find(' em.warning div');
		var alertTextP = $(box).find(' em.warning p');
		if(isLoadPassword(password)){
			alertTextP.removeClass('no').addClass("ok");
			alertTextB.hide();
		}else{
			alertTextB.show();
			var longer = password.length;
			if(longer>=6&&longer<=16){
				alertTextP.eq(0).removeClass('no').addClass("ok");
			}else{
				alertTextP.eq(0).removeClass('ok').addClass("no");
			}
			var per = /(?!^[0-9]+$)(?!^[A-z]+$)(?!^[^A-z0-9]+$)^.{1,160}$/;
			if (!per.exec(password)) {
				alertTextP.eq(1).removeClass('ok').addClass("no");
			}else{
				alertTextP.eq(1).removeClass('no').addClass("ok");
			}
			var kong =/^[^\s]{0,160}$/  
			if (!kong.exec(password)) {
				alertTextP.eq(2).removeClass('ok').addClass("no");
			}else{
				alertTextP.eq(2).removeClass('no').addClass("ok");
			}
		}
	});
	$(document).on('focus',box+' input[type="password"]', function(event) {
		var password = $(this).val();
		var alertTextB = $(box).find(' em.warning div');
		var alertTextP = $(box).find(' em.warning p');
		if(isLoadPassword(password)){
			alertTextP.removeClass('no').addClass("ok");
			alertTextB.hide();
		}else{
			alertTextB.show();
		}
	})
}
$(document).on('keypress','.only-number',function(){
	var eventObj = event || e;
    var keyCode = eventObj.keyCode || eventObj.which;
    if ((keyCode >= 48 && keyCode <= 57))
        return true;
    else
        return false;
})
$(document).on('click', '#alertBox .closeSure', function(event) {
	event.preventDefault();
	/* Act on the event */
	$('#alertBox').remove();
});
$(document).on('click', '#alertBox .backto', function(event) {
	event.preventDefault();
	/* Act on the event */
	window.location.href="/v2/user/safety/into"
});
function arryPus(arry1,arry2){
	var data = [];
	lengther = arry1.length;
	if(arry1.length>arry2.length){
		lengther = arry2.length;
	}
	for (var i = 0; i < lengther ; i++) {
		data[i] = "";
		data[i] += arry1[i]+",";
		data[i] += $.md5(arry2[i]);
	};
	return data;
}
function toX(em){
	var tel = "";
	var length = em.length;
	if(isNamber(em)){
		tel = em.substring(0,3)+"****"+em.substring((length-3),length);	
		return tel;
	}else{
		var emArry = em.split("@");
		length = emArry[0].length;
		tel = emArry[0].substring(0,2)+"****"+emArry[0].substring((length-2),length)+"@"+emArry[1];	
		return tel;
	}
}
/*url中获取参数*/
function GetQueryString(name) {
   var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)","i");
   var r = window.location.search.substr(1).match(reg);
   if (r!=null) return unescape(r[2]); return null;
}