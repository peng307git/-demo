/**
*
*/
var mineNullFunc=function(){
	this.ready();
}

var proto=mineNullFunc.prototype;

proto.page='mine';

proto.ready=function(){
	//导航栏添加active
   var page=this.page;
   $('.navbar-nav')
   .find('li[data-page='+page+']')
   .addClass('active')
   .siblings()
   .removeClass('active');
   //信息栏每30s刷新
    firRequest();
    window.setInterval("firRequest()",1000*30);
}

$(function(){
	var mineNull=new mineNullFunc();
})