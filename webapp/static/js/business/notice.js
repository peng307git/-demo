/*
********
*/
var noticeFunc=function(){
	this.ready();
}

var proto=noticeFunc.prototype;

proto.page='notice';
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

  var paging = new pagingFunc({
    pageBox:".table-pager",
    ajaxUrl:"/notice/user",
    type: "Get",
    pageKey:"notice_page_page",
    sizeKey:"notice_page_size",
    size:20, 
    mode:"Server", 
    intoBox : function(msg){ 
      var datar = msg.rows;
      var lierHtml = "";
         for(var i=0;i<datar.length;i++){
          //console.log(datar[i].is_read);
          if (datar[i].is_read==0) {
           lierHtml+="<li class='lister' id-name='"+datar[i].id+"'><i class='ic-point point'></i><span class='times'>"+datar[i].title+"</span><span class='times time'>"+timeType(datar[i].release_time)+"</span><section><h3>"+datar[i].title+"</h3><div>"+datar[i].notice+"</div></section></li>";
          } else if(datar[i].is_read==1){
           lierHtml+="<li class='lister' id-name='"+datar[i].id+"'><i class='ic-point'></i><span  class='times'>"+datar[i].title+"</span><span class='times time'>"+timeType(datar[i].release_time)+"</span><section><h3>"+datar[i].title+"</h3><div>"+datar[i].notice+"</div></section></li>";
          };
        } 
        $('#lier').html(lierHtml);
        this.changeLi("#lier");
    }
  });
  (function ($) {
      $.getUrlParam = function (name) {
          var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
          var r = window.location.search.substr(1).match(reg);
          if (r != null) return unescape(r[2]); return null;
      }
  })(jQuery);

   var ider= $.getUrlParam('id');
  //console.log(ider);
  paging.changeLi=function(a){
    var lier = $(a).find("li")
    var diver = $(a).find("section")
    //console.log(diver.length)
    diver.hide()
    lier.each(function(i) {
      var self = $(this);
      var off = 0;
      self.on('click', '.times', function(event) {
        event.preventDefault();
        shower();
      });
      var idName = self.attr("id-name")
       //console.log("id="+idName)
      if(idName==ider){
        console.log("idName="+idName);
        shower();
      }
      function shower(){
        //if(lier.eq(i).find("i").attr("class")=="ic-point point"){
          $.ajax({
              type:'post',
              url:'/notice/user/read',
              data:{noticeid:lier.eq(i).attr("id-name")},
              success:function(msg){
               if(msg.status == 0){
                  lier.eq(i).find("i").removeClass("point");
                }else{
                  // alertBoxFunc(msg.error.message,'sure');  
                }
              },
              error:function(err){
                 console.log(err);
              }
          });
       // }
        if (off==0) {
          self.find('section').show();
          self.addClass('active');
          off=1;
        } else if(off==1){
          self.find('section').hide();
          self.removeClass('active');
          off=0;
        };
        // $(this).siblings().find('section').hide();
      }
    });
  }
   //var data = "{\"status\": 0,\"data\": [{\"id\": 2,\"title\": \"这是公告2\",\"notice\": \"APP发布乐乐乐乐乐乐乐乐乐乐乐乐乐乐乐乐乐乐22222222222222\", \"create_time\": \"2016-03-26 20:12:16\", \"is_read\": 0}]}" 

}

$(function(){
	var notice=new noticeFunc();
})

function timeType(time){
  var _lang=langType();
  var chTime="";
  var timeArry = time.split(' ');
  var timeArry2 = timeArry[0].split('-');
  if(_lang=="en"){
    chTime = timeArry[1]+"  "+timeArry2[1]+"-"+timeArry2[2]+"-"+timeArry2[0];
  }else{
    chTime = time ;
  }
  return chTime;
}




 