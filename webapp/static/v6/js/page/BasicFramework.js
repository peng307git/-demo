define(function(require, exports, module){
    var $ = require('jquery');
    var Util = require("../module/util");
    var Modal = require("../module/modal");
    var topbarUser = require("../module/topbarUser");
    //时区
    var appAndUct  = require("../module/appAndUTC");  
            appAndUct();
    var HeaderNavBar = require("../module/headerNavBar");
    if(IS_LOGIN){
        HeaderNavBar();
    }
    //footer 判断当前语言
    var footLanguage = require("../module/footLanguage");
    footLanguage();
    //更新价格
    var updateBtcInfo = require("../module/updateBtcInfo");
    var updatePrice = new updateBtcInfo({
        Box: ".topbar-price",
        btcBox:".new-btc-price",
        mgBtc:".new-mg-price",
        rate:30*1000
    })
});
