/**
* @ tab 切换
* @author yang
**/
define(function(require, exports, module){
    var Widget = require('./widget');
    var tab = Widget({
        Options: {
            taber: "",
            tab_con: "",
            motion: "click",
            auto: 300
        },
        _init: function(){
            var self = this;
            var taber = $(self.taber);
            var longer = taber.length;
            var tab_con = $(self.tab_con);
            var nunIndex = 0;
            change(nunIndex);
            function change(n){
                taber.eq(n).addClass('active').siblings().removeClass('active');
                tab_con.eq(n).show().siblings().hide();
            }
            if(self.auto){
                var timer = setInterval(function(){
                    nunIndex++;
                    if(nunIndex>=longer){
                        nunIndex = 0;
                    }
                    change(nunIndex);
                },self.auto)
            }
            taber.each(function(index, el) {
                $(this).on(self.motion, function(event) {
                    event.preventDefault();
                    nunIndex=$(this).index()
                    change(nunIndex);
                    if(self.auto&&timer){
                        clearInterval(timer);
                    }
                });
            });
        }
    })
    module.exports = tab;
});