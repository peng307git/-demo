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
    //分页
    var pager = require("../module/paging");
    var newsPaging = new pager({
        pageBox:"#page_box",
        ajaxUrl:"/notice/user",
        type: "Get",
        pageKey:"notice_page_page",
        sizeKey:"notice_page_size",
        size:10,
        mode:"Server",
        translation:true,
        intoBox : function(data){
            var datar = data.rows;
            console.log(data);
            var htmlT="";
            if (datar==null || datar.length <= 0) {
                htmlT='';
            } else{
                for(var i = 0 ; i < datar.length ; i++){
                        htmlT+='<li>'
                        if (datar[i].is_read==0) {
                            htmlT+='<i class="ren_con"></i>';
                        }else{
                            htmlT+='<i></i>';
                        }
                        htmlT += '<a href="/reports/notice/'+datar[i].id+'" target="_blank">'+datar[i].title+'</a>'+'<span>'+Util.timeType(datar[i].release_time.split(" ")[0])+'</span>'+'</li>';
                }
            };
            $("#notices-list").html(htmlT);
        }
    })
});
