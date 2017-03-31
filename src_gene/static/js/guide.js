$(function(){
        var video = document.getElementById('myVideo');
        var srcNumber = 0;
        var myonoff = true;
        var mytimer = null;
        var urlName = location.pathname.replace('/','').replace('.html','');
        if( urlName  == 'guide_CN' ){
                urlName = 'zh_CN';
        }
        else if( urlName  == 'guide_TW' ){
                urlName = 'zh_TW';
        }
        else{
                urlName = 'en_US';
        }
        console.log(urlName);
        //ajax
        $.ajax({
           url: "http://www.mindasset.com/v2/video/curricula?locale="+urlName,
           type: "GET",
           dataType: 'jsonp',
           jsonpCallback:"insertClassifiedRes",
           success: function (data) {
                update(data);
           }
       });
        function update(datar){
                var iHTML = "";
                for(var i=0; i<datar.length; i++){
                    var rows = datar[i];
                    if( i == 0 ){
                        iHTML += '<div class="album"> <strong>'+rows.defaultTitle+'</strong>'+
                                                    '<span class="rotate rotate-dag180"></ span>'+
                                 '</div>'+
                                 '<ul class="album_ul album-active uli'+i+'"></ul>';
                             $('.albumName').html(rows.defaultTitle); //专辑名称
                    }
                    else{
                        iHTML+='<div class="album">  <strong>'+rows.defaultTitle+'</strong>'+
                                                     '<span class="rotate"></span>'+
                             '</div>'+
                             '<ul class="album_ul uli'+i+'"></ul>';
                    }
                }
                $('.video-li').append(iHTML);
                datachange(datar);              //塞入li
                $('.video-li').wheeler();
                defaultState();                //默认样式
                var play = new playvideo({
                    'id':video,
                    'mask':'.play-back',
                    'autoPlay':true
                });
                albumClick(); //列表控制
                playVideo(); //播放视频 顺序播放
                liClick();   //点击切换播放
        }

        function datachange(datar){
            for(var i=0; i<datar.length; i++){
                var myHTML = "";
                var rows = datar[i].chapters;
                for(var j=0; j<rows.length; j++){
                    var rowsObj = rows[j];
                    myHTML += ' <li iSrc = "'+rowsObj.defaultUrl+'" >'+ rowsObj.defaultTitle  +'  </li> ';
                }
                $('.uli'+i).append(myHTML);
            }
        }

        //列表控制
        function albumClick() {
            $('.album').on('click',function(){
                if( $(this).find('span').hasClass('rotate-dag180') ){
                    $(this).find('span').removeClass('rotate-dag180');
                    $(this).next().hide();
                    videoUlScroll();
                }
                else{
                    if( $('.album').find('span').hasClass('rotate-dag180') ){
                        $('.rotate').removeClass('rotate-dag180');
                        $('.album_ul').hide();
                    }
                    $(this).find('span').addClass('rotate-dag180');
                    $(this).next().show();
                    videoUlScroll();
                }
            })
        }
         
         //点击视频播放
        function playVideo(){
            $('.guide-play').on('click',function(){
                    $('.play-back').hide();
                    $('#myControls').show();
                    $('.onoff-play').addClass('clickplay');
                    video.play();
                    timeload();
            })
            
            $('.onoff-play').on('click',function(){
                if( video.paused ){
                    $('.play-back').show();
                    $('#myControls').hide();
                }
            })
        }

        //自动顺序播放
        function sequentialPlay(){
            var src_length =  $('.video-li li').size();
            var mysrc = $('.video-li li');
                if( srcNumber == src_length-1 ){
                    srcNumber = 0;
                    $('.play-back').show();
                    $('#myControls').hide();
                    $('.onoff-play').removeClass('clickplay');
                    myonoff = false;
                }
                else{
                    srcNumber ++;
                }
            var liParent = mysrc.eq(srcNumber).parent();
            var livideoame = liParent.eq(0).prev().text();
                $('#myVideo').attr('src',mysrc.eq(srcNumber).attr('iSrc')); //视频地址
                $('.videoName').html(mysrc.eq(srcNumber).html()); //视频名称
                $('.albumName').html(livideoame); //专辑名称
                $('.album_ul').hide();
                $('.rotate').removeClass('rotate-dag180');
                mysrc.css('color','rgba(255,255,255,0.5)');
                mysrc.eq(srcNumber).css('color','rgba(255,255,255,1)');
                liParent.eq(0).prev().find('span').addClass('rotate-dag180');
                liParent.eq(0).show();
                videoUlScroll();
                video.load();
                if( myonoff ){
                    video.play();
                }
                else{
                    video.pause();
                    myonoff = true;
                }
        }

        //点击切换播放
        function liClick(){
            $('.video-li').find('li').on('click',function(e){
                e.preventDefault();
                var newSrc = $(this).attr('iSrc');
                var newName = $(this).html();
                var newParentul = $(this).parent();
                var newalbumname = newParentul.eq(0).prev().text();
                    srcNumber = $('.video-li li').index(this);
                $('#myVideo').attr('src',newSrc); 
                $('.videoName').html(newName);
                $('.albumName').html(newalbumname);
                $('.play-back').hide();
                $('.album_ul').hide();
                $('.video-li li').css('color','rgba(255,255,255,0.5)');
                $(this).css('color','rgba(255,255,255,1)');
                newParentul.eq(0).show();
                video.load();
                video.play();
                timeload();
                 
            })
        }
        //默认样式   
        function defaultState(){
                var mysrc = $('.video-li li');
                $('#myVideo').attr('src',mysrc.eq(0).attr('iSrc'));
                $('.videoName').html(mysrc.eq(0).html());
                mysrc.css('color','rgba(255,255,255,0.5)');
                mysrc.eq(0).css('color','rgba(255,255,255,1)');
                $('.album_ul').hide();
                $('.uli0').show();
                videoUlScroll();
                video.load();
                timeload();
        }
        //顺序播放定时器
        function timeload(){
            clearInterval(mytimer);
            mytimer = setInterval(function(){
                var newtime = Math.ceil(video.currentTime);
                var globaltime = Math.floor(video.duration);
                if( newtime >= globaltime){
                    sequentialPlay();
                }
            },1000)
        }
        //绑定滚动事件
        function videoUlScroll(){
                var albumheight = $('.album').outerHeight() * $('.album').size();//专辑的高度
                var videoUl = $('.video-li').find('ul');
                var liLength = 1;
                for (var i = 0; i < videoUl.length; i++) {
                    if( !videoUl.eq(i).is(':hidden') ) {
                         liLength = videoUl.eq(i).children().size() * 32;
                    }
                }
                var newheight = albumheight +  liLength;
                if( newheight > 500 ){
                    var l = newheight;
                    $('.barbox').show();
                    $('.video-li').bind("mousewheel DOMMouseScroll", function(s) {
                        s.preventDefault();
                        mousebind(s,l);
                    });

                }
                else{
                    $('.video-li').unbind();
                    $('.barbox').hide();
                    $(".scrollerbox").css('top','0px');
                }
        }
function mousebind(s,l){
    var d = $('.video-li');
    var e = d.find('.barbox');
    var j = e.find('.bar');
    var a = 5;
    var k = d.find(".scrollerbox");
    var c = d.height();
    var o = parseInt(j.css("height").split("px")[0]);
    var p = c - o - a;
    var t = (s.originalEvent.wheelDelta && (s.originalEvent.wheelDelta > 0 ? 1 : -1)) || (s.originalEvent.detail && (s.originalEvent.detail > 0 ? -1 : 1));
    var r = (s.originalEvent.wheelDelta && (s.originalEvent.wheelDelta / 40)) || (s.originalEvent.detail && (s.originalEvent.detail / 1));
    var q = parseInt(j.css("top").split("px")[0]);
    if (s.originalEvent.wheelDelta) {
        i(q - r,a,p,l,c,j,k)
    } else {
        if (s.originalEvent.detail) {
            i(q + r,a,p,l,c,j,k)
        }
    }
}
function i(q,a,p,l,c,j,k) {
    var r = q;
    if (q <= a) {
        r = a
    } else {
        if (r >= p) {
            r = p
        }
    }
    j.css("top", r);
    k.css("top", -(r * (l / c)  - 7 ))
}

})



