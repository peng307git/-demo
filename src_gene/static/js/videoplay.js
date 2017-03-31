$(function(){

    // var video = document.getElementById('myVideo');
    // var timer; //定时器
    // var signout = true; //全屏开关
    //默认状态
   // defaultState();
    // //首页播放视频
    // $(".vido_head").on('click', function(event) {
    //         if(navigator.userAgent.match(/(iPhone|iPod|Android|ios)/i)){  //移动端视频播放
    //                 $('#myControls').hide();
    //                 $('.video-modal').css('visibility','visible');
    //                 $('.video-modal').show();
    //                 video.controls = true;
    //                 video.play();
    //                 launchFullscreen(video);
    //         }
    //         else{
    //             $('.onoff-play').addClass('clickplay');
    //             $('.video-modal').css('visibility','visible');
    //                 video.play();
    //                 clearTimeout(timer);
    //                 timer = setTimeout(function(){
    //                      $('#myControls').stop(true,true).slideUp(500);
    //                      $('.video h2').stop(true,true).slideUp(500);
    //                 },2000);
    //         }
    // });
    // //播放暂停
    // $('.onoff-play').on('click',function(){
    //     if( video.paused ){
    //         video.play();
    //         $(this).addClass('clickplay');
    //     }else{
    //         video.pause();
    //         clearTimeout(timer);
    //         $(this).removeClass('clickplay');
    //         $('#myControls').stop(true,true).slideDown(500);
    //         $('.video h2').stop(true,true).slideDown(500);
    //     }
    // })
    //ios safari 退出全屏时捕获不到退出全屏事件
    // $(document).on('touchstart',function(){
    //     if (navigator.userAgent.match(/(iPhone|iPod|Android|ios)/i) && video.paused) {
    //         hiderVideo();
    //         $('.video-modal').hide();
    //     }
    // })
    // //点击关闭播放器
    // $('.close-video').on('click',function(event) {
    //         hiderVideo();
    //         defaultState();
    // });
    // function hiderVideo(){
    //         video.pause();
    //         $('.video-modal').css('visibility','hidden');
    //         video.load();
    // }
    //当前播放时间
    // $('#myVideo').on('timeupdate', function() {
    //         var mynum = changeTime(video.currentTime);
    //         $('.move-time').text(mynum);
    // });
    // //播放时长
    // $('#myVideo').on('loadedmetadata', function() {
    //         var mynum = changeTime(video.duration);
    //         $('.total-tiem').text(mynum);
    // });
    // //静音按钮
    // $(document).on('click','.playMetu',function(e){
    //         e.preventDefault();
    //     if( video.muted ){
    //         $(this).removeClass('metu-no');
    //         video.muted = !video.muted;
    //     }
    //     else{
    //         $(this).addClass('metu-no');
    //         video.muted = !video.muted;
    //     }
    // });
    // //音量控制

    // $('.volumeBar').on('mousedown', function(e) {
    //        var position = e.pageX - $(this).offset().left;
    //        var percentage = 100 * position / $(this).width();
    //        $('.volume').css('width', percentage+'%');
    //        $('.volumegarden').css('left', percentage+'%');
    //            video.volume = percentage / 100;
    // });
    // //全屏播放
    // $('.fullScreen').on('click', function() {
    //     if(signout){
    //         launchFullscreen(video);
    //         clickFullScreen();
    //     }
    //     else{
    //         exitFullscreen();
    //     }
    // });
    // //檢查瀏覽器是否處於全屏
    // document.addEventListener('webkitfullscreenchange', function(){ /*chrome浏览器*/
    //     if(!document.webkitIsFullScreen){
    //         if(navigator.userAgent.match(/(iPhone|iPod|Android|ios)/i)){
    //             hiderVideo();
    //             $('.video-modal').hide();
    //         }
    //         else{
    //             exitFullscreen();
    //         }
    //     }
    // });
    // document.addEventListener('mozfullscreenchange', function(){ /*FF浏览器*/
    //     if(!window.fullScreen){
    //         if(navigator.userAgent.match(/(iPhone|iPod|Android|ios)/i)){
    //             hiderVideo();
    //             $('.video-modal').hide();
    //         }
    //         else{
    //             exitFullscreen();
    //         }
    //     }
    // });
    // //视频进度条
    // $('#myVideo').on('timeupdate', function() {
    //            var currentPos = video.currentTime; //当前播放时间 
    //            var maxduration = video.duration; //播放时长
    //            var percentage = 100 * currentPos / maxduration; // %
    //            $('.timeBar').css('width', percentage+'%');
    //            $('.boeridus').css('left',percentage-1+'%');
    //            if(video.ended){
    //                 video.pause();
    //                 video.load();
    //                 $('.onoff-play').removeClass('clickplay');
    //             }
    // });
    // var timeDrag = false;   /* Drag status */
    // $('.progressBar').mousedown(function(e) {
    //        timeDrag = true;
    //        updatebar(e.pageX);
    // });
    // var updatebar = function(x) {
    //        var progress = $('.progressBar');
    //        var maxduration = video.duration; //Video duraiton
    //        var position = x - progress.offset().left; //Click pos
    //        var percentage = 100 * position / progress.width();
    //        if(percentage > 100) {
    //           percentage = 100;
    //        }
    //        if(percentage < 0) {
    //           percentage = 0;
    //        }
    //        $('.timeBar').css('width', percentage+'%');
    //        $('.boeridus').css('left',percentage-1+'%');
    //        video.currentTime = maxduration * percentage / 100;
    // };
    // //缓冲进度条
    // var startBuffer = function() {
    //    var maxduration = video.duration;
    //    var currentBuffer = video.buffered.end(0);
    //    var percentage = 100 * currentBuffer / maxduration;
    //    $('.bufferBar').css('width', percentage+'%');
    //    if(currentBuffer < maxduration) {
    //       setTimeout(startBuffer, 500);
    //    }
    // };
    // setTimeout(startBuffer, 500);
    //拖拽进度条
    //进度条END
    // //视频范围鼠标移入移出
    // $('#myVideo').hover(function(){
    //         $('#myControls').stop(true,true).slideDown(500);
    //         $('.video h2').stop(true,true).slideDown(500);
    //         if(!video.paused){
    //             clearTimeout(timer);
    //             timer = setTimeout(function(){
    //                  $('#myControls').stop(true,true).slideUp(500);
    //                  $('.video h2').stop(true,true).slideUp(500);
    //             },2000);
    //         }
    // },function(){
    //     if(!video.paused){
    //         clearTimeout(timer);
    //         timer = setTimeout(function(){
    //              $('#myControls').stop(true,true).slideUp(500);
    //              $('.video h2').stop(true,true).slideUp(500);
    //         },2000);
    //     }
    // })
    // //视频范围鼠标移动
    // $('#myVideo').on('mousemove',function(){
    //     $('#myControls').stop(true,true).slideDown(500);
    //     $('.video h2').stop(true,true).slideDown(500);
    //     if(!video.paused){
    //         clearTimeout(timer);
    //         timer = setTimeout(function(){
    //              $('#myControls').stop(true,true).slideUp(500);
    //              $('.video h2').stop(true,true).slideUp(500);
    //         },2000);
    //     }
    // })
    // //控件范围内鼠标移入移出
    // $('#myControls').mouseover(function(){
    //         clearTimeout(timer);
    // })
    // $('#myControls').mouseout(function(){
    //     if(!video.paused){
    //         clearTimeout(timer);
    //         timer = setTimeout(function(){
    //              $('#myControls').stop(true,true).slideUp(500);
    //              $('.video h2').stop(true,true).slideUp(500);
    //         },2000);
    //     }
    // })
    

// //时间转换
// function changeTime( inum ){
//     inum = parseInt(inum);
//     var iM = toZero(Math.floor(inum/60));
//     var iS = toZero(Math.floor(inum%60));
//     return iM + ':'+ iS

// }
// function toZero(num){
//     if(num <= 9){
//         return '0'+num;
//     }
//     else{
//         return ''+num;
//     }
// }
// //进入全屏样式
// function clickFullScreen(){
//     $('#myControls').addClass('maxZindex');
//     $('.video').addClass('videoMaxZidex');
//     $('.fullScreen').addClass('fullScreenhover');
//     signout = false;
//     $('.play-back').addClass('guideMaxIndex');
// }
// //退出全屏样式
// function exitFullscreen() {
//      var de = document;
//      if (de.exitFullscreen) {
//          de.exitFullscreen();
//      } else if (de.mozCancelFullScreen) {
//          de.mozCancelFullScreen();
//      } else if (de.webkitCancelFullScreen) {
//          de.webkitCancelFullScreen();
//      }
//      $('#myControls').removeClass('maxZindex');
//      $('.video').removeClass('videoMaxZidex');
//      $('.fullScreen').removeClass('fullScreenhover');
//      signout = true;
//      $('.play-back').removeClass('guideMaxIndex');
// }
//默认状态
// function defaultState(){
//     video.volume = 0.8;
//     video.currentTime = 0;
//     var movetime = '00:00';
//     $('.timeBar').css('width', 0);
//     $('.boeridus').css('left',0);
//     $('.move-time').text(movetime);
//     $('.onoff-play').removeClass('clickplay');
//     $('.volume').css('width','80%');
//     $('.volumegarden').css('left','80%');
// }
// // 判断各种浏览器，找到正确的方法
// function launchFullscreen(element) {
//       if(element.requestFullscreen) {
//         element.requestFullscreen();
//       } else if(element.mozRequestFullScreen) {
//         element.mozRequestFullScreen();
//       } else if(element.webkitRequestFullscreen) {
//         element.webkitRequestFullscreen();
//       } else if(element.msRequestFullscreen) {
//         element.msRequestFullscreen();
//       }
// }

})