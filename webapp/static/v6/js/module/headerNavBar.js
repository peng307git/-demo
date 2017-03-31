/**
* headerNav 导航鼠标经过
* @author yang
*/
define(function(require, exports, module){
    var $ = require('jquery');
    var headerNav = function (){
        var header = $(".header .nav");
        var ibar = header.find('#ibar');
        var nowActive = header.find('.active');
        var nowLefter = nowActive.aPosition().left
        var nowWidther = nowActive.width();
        ibar.animate({"width": nowWidther, "left": nowLefter }, 300);
        header.find('li').each(function(index, el) {
            var navigation_bar = $(this).find('.navigation_bar');
            var lefter = $(this).aPosition().left;
            var widther = $(this).width()
            if(navigation_bar){
                navigation_bar.css('left', lefter+(widther/2));
            }
            $(this).hover(function() {
                $(this).addClass('hov');
                ibar.stop().animate({"width": widther , "left": lefter }, 300);
                navigation_bar.show();
            }, function() {
                $(this).removeClass('hov');
                navigation_bar.hide();
            });
        });
        header.on('mouseleave', function(event) {
            event.preventDefault();
            ibar.stop().animate({"width": nowWidther , "left": nowLefter }, 300);
        });
    }
    $.fn.aPosition = function() {
        thisLeft = this.offset().left;
        thisTop = this.offset().top;
        thisParent = this.parent();
        parentLeft = thisParent.offset().left;
        parentTop = thisParent.offset().top;
        return {
            left: thisLeft-parentLeft,
            top: thisTop-parentTop
        };
    };
    module.exports = headerNav;
});