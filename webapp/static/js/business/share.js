var shareFunc=function(){
	this.ready();
}

$(function() {
	var share = new shareFunc();
})
var proto=shareFunc.prototype;
proto.page='share';

// 获取url中的参数
function getUrlParam(name) {
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); // 构造一个含有目标参数的正则表达式对象
	var r = window.location.search.substr(1).match(reg); // 匹配目标参数
	if (r != null)
		return unescape(r[2]);
	return null; // 返回参数值
}

proto.ready=function(){
	
	var code = getUrlParam('vcode');
	$('#copyText').text(code);
	
	if ( window.clipboardData ) {  
        $('.copyBtn').click(function() {  
            window.clipboardData.setData("Text", $.trim($('#copyText').text()));  
            alert('复制成功');  
        });  
    } else {  
//    	$('#copyText').zclip({
//    		path : '/static/other/ZeroClipboard.swf',
//    		copy : function() {// 复制内容
//    			return $.trim($('#copyText').val());
//    		},
//    		afterCopy : function() {
//    			alert('复制成功');
//    		}
//    	}); 
    }
	
	
}