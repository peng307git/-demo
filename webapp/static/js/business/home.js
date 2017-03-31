/*****
**@name：home主页
**
**/
var homeFunc=function(){
   this.ready();      //初始化，绑定事件。
}

var proto=homeFunc.prototype;

/*首页时间计算*/
proto.day_count=function(timeout){     //传入截止时间 yyyy-mm-dd
    var time_arr=timeout.split('-');
    var timeStamp=new Date();
    timeStamp.setYear(time_arr[0]-0);
    timeStamp.setMonth(time_arr[1]-0-1);
    timeStamp.setDate(time_arr[2]-0);
    var timeSecs=timeStamp.getTime();
    var today=new Date();
    var todaySecs=today.getTime();
    var lastSecs=timeSecs-todaySecs;
    var lastDay=parseInt(lastSecs/1000/3600/24);
    var lastDayArr=(lastDay+'').split('');
    return {'month':today.getMonth(),'date':today.getDate(),'hour':today.getHours(),'lastDay':lastDayArr};
}


proto.ready=function(){
  //时间计算
    var _self=this;
    var $countDown_box=$('#countDown-box');
    var time_obj=_self.day_count('2016-07-01');
    var $imgs=$countDown_box.find('.imgBox').find('img');
    $countDown_box.find('.today_m').text(time_obj.month);
    $countDown_box.find('.today_d').text(time_obj.date);
    $countDown_box.find('.today_h').text(time_obj.hour);
    $imgs.eq(0)
         .attr('src','catalog/view/theme/default/font/index/num'+time_obj.lastDay[0]+'.png');
    $imgs.eq(1)
         .attr('src','catalog/view/theme/default/font/index/num'+time_obj.lastDay[1]+'.png');
    $imgs.eq(2)
         .attr('src','catalog/view/theme/default/font/index/num'+time_obj.lastDay[2]+'.png');

    var browser=getOs();
    if(browser!='Firefox' &&  browser!='Chrome' && browser!='Safari')
    {
        $('#cover-div').show();
    }
    $('#cover-div').click(function(){
         $(this).fadeOut(300);
    });


    // ==================
       /* ======= Twitter Bootstrap hover dropdown ======= */   
    /* Ref: https://github.com/CWSpear/bootstrap-hover-dropdown */ 
    /* apply dropdownHover to all elements with the data-hover="dropdown" attribute 
    
    /* ======= Fixed header when scrolled ======= */    
    $(window).on('scroll', function() {
         
         if ($(window).scrollTop() > 0) {
            $('#back-to-top').fadeIn();
         }
         else {
            $('#back-to-top').fadeOut();
         }
    });
    
    
    /* ======= jQuery Placeholder ======= */
    /* Ref: https://github.com/mathiasbynens/jquery-placeholder */  
    
    
    
    /* ======= Header Background Slideshow - Flexslider ======= */    
    /* Ref: https://github.com/woothemes/FlexSlider/wiki/FlexSlider-Properties */
    
    $('.bg-slider').flexslider({
        animation: "fade",
        slideshow: true,
        slideshowSpeed: 3000,
        directionNav: false, //remove the default direction-nav - https://github.com/woothemes/FlexSlider/wiki/FlexSlider-Properties
        slideshowSpeed: 8000
    }); 

    $('#back-to-top').on('click',function(){
         $("html,body").animate({"scrollTop":top})
    })
}

$(function($){
    var home=new homeFunc();

})