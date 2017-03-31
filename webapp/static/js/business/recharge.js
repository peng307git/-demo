/*
********
*/
var rechargeFunc=function(){
	this.ready();
}

var proto=rechargeFunc.prototype;

proto.page='recharge';
proto.ready=function(){
    //导航栏添加active
   var page=this.page;
   $('.navbar-nav')
   .find('li[data-page='+page+']')
   .addClass('active')
   .siblings()
   .removeClass('active');
   //信息栏刷新
   firRequest();
   window.setInterval("firRequest()",1000*30);  //每30s执行一次方法
   $('#copyBtn').zclip({
        path: '/static/other/ZeroClipboard.swf',
        copy: function () {//复制内容 
            return $.trim($(this).text());

        },
        afterCopy: function () {//复制成功 
        	
            // alert("复制成功")
            alertBoxFunc('alertStr9','sure');

        }
    });

    var current_dollor = $("#current_dollor").val();
}

$(function(){
	var recharge=new rechargeFunc();
})

 