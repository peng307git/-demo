var withdrawFunc = function() {
	this.ready();
}

var proto = withdrawFunc.prototype;
proto.wait=60;

proto.page = 'assets';
proto.ready = function() {
	// 导航栏添加active
	var page = this.page;
	$('.navbar-nav').find('li[data-page=' + page + ']').addClass('active')
			.siblings().removeClass('active');
	// 信息栏刷新
	firRequest();
	window.setInterval("firRequest()", 1000 * 30); // 每30s执行一次方法

	var _self = this;

	$('#sendcode').on('click', function() {
		_self.getCode(this);
	})

	$('#submitBtn').on('click', function() {
		_self.commitData();
	})
}

$(function() {
	var withdraw = new withdrawFunc();
})

proto.commitData = function() {
	var btcAddress = $("#input-address").val();
	if (btcAddress == "" || btcAddress == null) {
		alertBoxFunc("提现地址不能为空", "sure");
		return;
	}
	
	var btcAmount = $("#input-amount").val();
	if (btcAmount == "" || btcAmount == null) {
		alertBoxFunc("提币数量不能为空", "sure");
		return;
	}
	
	if (isNaN(btcAmount)) {
		alertBoxFunc("提币数量不是数字", "sure");
		return;
	}
	
	var smsVCode = $("#input-smsVCode").val();
	if (smsVCode == "" || smsVCode == null) {
		alertBoxFunc("短信验证码不能为空", "sure");
		return;
	}
	var googlecode = $("#input-googlecode").val();
	if (googlecode == "" || googlecode == null) {
		alertBoxFunc("<@spring.messageText "safety.text111" "请输入谷歌验证码"/>", "sure");
		return;
	}
	//按钮置灰
	$("#submitBtn").attr('disabled',"true");
	$.ajax({
		type : "post",
		url : '/deal/withdraw/btc',
		data : {
			'btc_address' : btcAddress,
			'amount' : btcAmount,
			'sms_v_code' : smsVCode,
			'googlecode':googlecode
		},
		dataType : "json",
		success : function(msg) {
			if (msg.status == 0) {
				alertBoxFunc(msg.data, "sure", function() {
					window.location = "/deal/withdraw/btc";
				});
			} else {
				$("#submitBtn").removeAttr("disabled");
				alertBoxFunc(msg.error.message, "sure");
			}
		},
		error : function(err) {
			$("#submitBtn").removeAttr("disabled");
			console.log(err);
		}
	});
	// }
}

proto.time = function(obj) {
	var _self = this;
	if (_self.wait == 0) {
		obj.removeAttribute("disabled");
		// $(o).attr("disabled", false); jquery
		obj.value = " 获取手机验证码 ";
		_self.wait = 60;
	} else {
		obj.setAttribute("disabled", true);
		obj.value = _self.wait + "秒后重新发送";
		_self.wait--;
		setTimeout(function() {
			_self.time(obj);
		}, 1000)
	}
}

proto.getCode = function(obj) {
	var _self = this;
	
	var btcAddress = $("#input-address").val();
	if (btcAddress == "" || btcAddress == null) {
		alertBoxFunc("提现地址不能为空", "sure");
		return;
	}
	
	var btcAmount = $("#input-amount").val();
	if (btcAmount == "" || btcAmount == null) {
		alertBoxFunc("提币数量不能为空", "sure");
		return;
	}
	
	if (isNaN(btcAmount)) {
		alertBoxFunc("提币数量不是数字", "sure");
		return;
	}
	
	$.ajax({
		url : '/deal/sms/vercode',
		type : 'POST',
		dataType : 'json',
		success : function(data) {
			if (data.status == 0) {
				_self.time(obj);
			}else{
				alertBoxFunc(msg.error.message, "sure");
			}
		},
		error : function() {
			alert("函数执行错误！");
		}
	});
}
