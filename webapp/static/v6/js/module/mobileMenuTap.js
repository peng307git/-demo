/**
 * @ mobileMenuTap 移动端导航
 * @author yang
 */

define(function(require, exports, module){
    var mobileMenuTap = function (){
        var navBox = $('.nav_wrap');
        var iNu = 0;
        $("#menu").on('click', function(event) {
            event.preventDefault();
            /* Act on the event */
            var self = $(this);
            //console.log("menu")
            if (iNu==0) {
                self.addClass('close');
                navBox.show();
                navBox.find('.nav_box').scrollTop(0);
                iNu = 1;
                var htmler="";
                $.ajax({
                    type:'GET',
                    url:'/deal/user/balance',
                    success:function(msg){
                        if(msg.status == 1){
                            alertBoxFunc(msg.error.message,'sure');
                        }else{
                            htmler= '<p>฿ <span class="btc-change">'+ msg.data.balanceBtc +'</span>&nbsp;&nbsp; ≈ &nbsp;&nbsp;$<span class="dollar-change">'+ msg.data.balanceUsd +'</span></p><p>MN:<span class="mn-change">'+msg.data.mn +'</span> MG:<span class="mg-change">'+ msg.data.mg +'</span></p>';
                            $(".topbar-user-detail-content").html(htmler);
                            $('.mn-cheated').html(msg.data.cheat_mg.toFixed(4));
                            $('.mn-deducted').html(msg.data.mg_frozen.toFixed(4));
                        }
                    },
                    error:function(err){
                        console.log(err);
                    }
                });
                var windowHeight = $(window).height();
                var pardTop = parseInt($(".nav_wrap").css('padding-top'));
                $(".nav_box").height(windowHeight-pardTop);
                $("body").css('position','fixed')
            } else{
                self.removeClass('close');
                navBox.hide();
                iNu = 0;
                $("body").css('position','relative')
            };
        });
       
        var naver = $(".nav li span");
        naver.each(function(index, el) {
            var iny = 0;
            var self = $(this)
            self.on('click', function(event) {
                event.preventDefault();
                /* Act on the event */
                if (iny == 0) {
                    iny = 1;
                    self.parent().addClass('close');
                } else{
                    iny = 0;
                    self.parent().removeClass('close');
                };
            });
        });
    }

    module.exports = mobileMenuTap;
});
