/*****
**@name：home主页
**
**/
//Memorabilia 图片轮播
    var carousel=function(data){
        var _self = this;
        _self.pic = $(data.pic);
        _self.picLength = _self.pic.length;
        _self.indexer = 5;
        _self.bar = $(data.bar);
        _self.barWidth = _self.bar.width();
        if(data.speed){
            var direction = 0;
            _self.speed = data.speed;
            var timer = setInterval(function(){
                if(_self.indexer == _self.picLength-1){
                    direction = 1;
                }else if(_self.indexer == 0){
                    direction = 0;
                }
                if (direction == 1) {
                    _self.indexer--;
                } else if(direction == 0){
                    _self.indexer++;
                };
                _self.change();
            }, _self.speed )
        }
        if (data.prev) {
            $(data.prev).on('click', function(event) {
                event.preventDefault();
                _self.indexer -- ;
                _self.change();
                if(data.speed){
                    clearInterval(timer);
                }
            });
        };
        if (data.next) {
            $(data.next).on('click', function(event) {
                event.preventDefault();
                _self.indexer ++ ;
                _self.change();
                if(data.speed){
                    clearInterval(timer);
                }
            });
        };
        if(data.bar){
            _self.bar.each(function(index, el) {
                $(this).on('click', function(event) {
                    event.preventDefault();
                    _self.indexer = index;
                    _self.change();
                    if(data.speed){
                        clearInterval(timer);
                    }
                });
            });
        }
        _self.ready();
    }
    var prCarousel = carousel.prototype;
    prCarousel.ready = function(){
        var _self = this;
        _self.change();
    }
    prCarousel.change = function(){
        var _self = this;
        if(_self.indexer >= _self.picLength){
            _self.indexer = _self.picLength-1 ;
        }else if( _self.indexer < 0 ){
            _self.indexer = 0;
        }
        _self.pic.each(function(index, el) {
            var that = $(this);
            var thatIndex = that.index();
            if(thatIndex < _self.indexer){
                $(this).removeClass('active').removeClass('after').addClass('before').css('z-index', thatIndex );
            }else if(thatIndex == _self.indexer){
                $(this).removeClass('before').removeClass('after').addClass('active').css('z-index', _self.picLength+1 );
            }else if(thatIndex > _self.indexer){
                $(this).removeClass('active').removeClass('before').addClass('after').css('z-index', _self.picLength - thatIndex );
            }
        });
        _self.bar.each(function(index, el) {
            var that = $(this);
            var thatIndex = that.index();
            if(thatIndex == _self.indexer){
                $(this).addClass('active').siblings().removeClass('active');
                $(this).css({'opacity': 1 ,"z-index":"1" });
            }
            if(thatIndex == _self.indexer+1 || thatIndex == _self.indexer-1 ){
                $(this).css({'opacity': 0.7 ,"z-index":"1"})
            }
            if(thatIndex == _self.indexer+2 || thatIndex == _self.indexer-2 ){
                $(this).css({'opacity': 0.4 ,"z-index":"1"})
            }
            if(thatIndex == _self.indexer+3 || thatIndex == _self.indexer-3 ){
                $(this).css({'opacity': 0.1 ,"z-index":"1" })
            }
            if(thatIndex >= _self.indexer+4 || thatIndex <= _self.indexer-4 ){
                $(this).css({'opacity': 0 ,"z-index":"0"})
            }
        });
        
        _self.bar.parent().animate({"left": -(_self.barWidth*(_self.indexer+0.5))}, 500);
    }

$(function($){
    if(ISLOGIN && ISLOGIN == true){
        function noticeList(){
            var noticeHtml = $(".notice-box .warper").html();
            $.ajax({
                url: '/notice/user/limit',
                type: 'GET',
                dataType: 'json',
                success:function(data){
                    var datar = data.data;
                    //console.log(datar);
                    var lengther=20;
                    for (var i = 0; i <  3; i++) {
                        if(/^[a-zA-Z]/.test(datar[i].title)){
                            lengther=lengther*2;
                        }
                        noticeHtml += '<a href="/reports/notice/'+datar[i].id+'"  target="_blank">'+datar[i].title.substring(0,lengther)+' … ';
                        //datar[i].is_read  0：未读 1：已读
                        if(datar[i].is_read == 0){
                            noticeHtml += '<i class="red">NEW</i>'
                        }
                        noticeHtml += '</a>'
                    };
                    $(".notice-box .warper").html(noticeHtml);
                    readyLoad(".notice-box a",{"opacity":"0"},{"opacity":"1"});
                }
            })
            
        }
        noticeList();
    }
    /*  ======= back-to-top when scrolled ======= */    
    $(window).on('scroll', function() {
         
         if ($(window).scrollTop() > 0) {
            $('#back-to-top').fadeIn();
         }
         else {
            $('#back-to-top').fadeOut();
         }
    });
    
    $('#back-to-top').on('click',function(){
         $("html,body").animate({"scrollTop":top})
    })

    /* ======= Header Background Slideshow - Flexslider ======= */   
    $('.bg-slider').flexslider({
        animation: "fade",
        slideshow: true,
        slideshowSpeed: 3000,
        directionNav: false, //remove the default direction-nav - https://github.com/woothemes/FlexSlider/wiki/FlexSlider-Properties
        slideshowSpeed: 8000
    }); 
    $('.product').flexslider({
        animation: "slide",
        slideshow: true,
        direction:"horizontal",
        slideshowSpeed: 3000,
        directionNav: true,
        slideshowSpeed: 8000,
        prevText: "Previous", 
        nextText: "Next"
    }); 
    var windowHeight = $(window).height();

    // function scrollAddCss(name,scrollDate,className){
    //     var bot = scrollDate; 
    //     var name = $(name);
    //     //console.log(name.offset().top);
    //     $(window).scroll(function () {
    //         if($(window).scrollTop() > bot){
    //             name.addClass(className);
    //         }else if($(window).scrollTop() <= bot){
    //             name.removeClass(className);
    //         }
    //     })
    // }
    
    //导航整体效果
    function scrollHeader(name,scrollDate,className){
        var bot = scrollDate; 
        var name = $(name);
        var barHeught = name.height();
        var scrollToper = $(window).scrollTop();
        $(window).scroll(function () {
            var scrollTopNow = $(window).scrollTop();
            if(scrollTopNow > bot && scrollTopNow < windowHeight){
                name.addClass(className);
            }else if(scrollTopNow <= bot){
                name.removeClass(className);
                name.stop().animate({"top": "0px"}, 100 );
            }else if(scrollTopNow >= windowHeight){
                name.addClass(className);
                var delta = scrollToper - scrollTopNow ;
                //console.log(delta);
                if(delta >= 50){
                    //console.log("+");
                    name.stop().animate({"top": "0px"}, 100 );
                }else if(delta < -50 ){
                    //console.log("-");
                    name.stop().animate({"top": "-"+barHeught+"px"}, 200 );
                }
            }
            if(scrollTopNow <= 0){
                name.removeClass(className);
                name.stop().animate({"top": "0px"}, 100 );
            }
            scrollToper = scrollTopNow ;
        });
        // $(window).on("mousewheel DOMMouseScroll", function (e) {
        //     var delta = (e.originalEvent.wheelDelta && (e.originalEvent.wheelDelta > 0 ? 1 : -1)) ||  // chrome & ie
        //                 (e.originalEvent.detail && (e.originalEvent.detail > 0 ? -1 : 1));              // firefox
        //     //console.log(delta);
        //     if(delta > 0){
        //         name.animate({"top": "0px"}, 100 );
        //     }else if(delta < 0 && $(window).scrollTop()>= windowHeight ){
        //         name.animate({"top": "-"+barHeught+"px"}, 200 );
        //     }
        // });
    }
    scrollHeader("#fixed_topper",12,"to-narrow");
    //Blockchain tab
    tab(".blockchain .boxer .box",".blockchain .explain-box .explain","click",5000);
    readyLoad(".news-box a",{"opacity":"0"},{"opacity":"1"});
    readyLoad(".blockchain .boxer .box",{"opacity":"0"},{"opacity":"1"});
    readyLoad("#video-box",{"opacity":"0"},{"opacity":"1"});
    readyLoad("#video-box .iconfont",{"opacity":"0","padding-top": 220},{"opacity":"1","padding-top": 120});
    readyLoad("#video-box p",{"opacity":"0","padding-top": 120},{"opacity":"1","padding-top": 0});
    //readyLoad("#memorabilia .moudle-box",{"opacity":"0","top":"-50%"},{"opacity":"1","top":"50%"},95);
    //readyLoad("#memorabilia .mark-cover",{"opacity":"0","top":"150%"},{"opacity":"1","top":"50%"},90);
    readyLoad(".footer",{"opacity":"0"},{"opacity":"1"},90);
    $("section h3").each(function(index, el) {
        readyLoad(this,{"opacity":"0","top": 100},{"opacity":"1","top": 0});
    });
})