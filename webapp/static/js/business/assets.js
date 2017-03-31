var assetsFunc=function(){
	this.ready();
}

var proto=assetsFunc.prototype;

proto.page='assets';

proto.ready=function(){
   //导航栏添加active
   var page=this.page;
   $('.navbar-nav')
   .find('li[data-page='+page+']')
   .addClass('active')
   .siblings()
   .removeClass('active');

   //信息栏每30s更新
   firRequest();
   window.setInterval("firRequest()",1000*30);  //每30s执行一次方法
//   //事件绑定
//	$(".getcash").click(function () {
//         alertBoxFunc('alertStr1','sure');
//	})

}

$(function(){
   var recommend=new assetsFunc();
})