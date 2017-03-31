/**
 * @ 新版 footer 底部语言切换
 * @author yang
 */

define(function(require, exports, module){
    var Util = require('./util');
    var footLanguage = function (){
        //console.log(_lang);
        var iner = 0;
        var box = $(".footer .language");
        var _lang=Util.langType();
        switch(_lang){
            case "zh":
                box.addClass('chainlogo');
                box.find('.chbar').addClass('language_active');
                box.find('span').text(box.find('.chbar').text());
                break;
            case "en":
                box.addClass('usalogo');
                box.find('.enbar').addClass('language_active');
                box.find('span').text(box.find('.enbar').text());
                break;
            case "tw":
                box.addClass('hklogo');
                box.find('.hkbar').addClass('language_active');
                box.find('span').text(box.find('.hkbar').text());
                break;
        }
        $(".footer .language").on('click','div', function(event) {
            if(iner==0){
                iner=1;
                //console.log("hover");
                $(this).parent().addClass('hover');
            }else{
                iner=0;
                //console.log("hide");
                $(this).parent().removeClass('hover');
            }
        });
    }

    module.exports = footLanguage;
});
