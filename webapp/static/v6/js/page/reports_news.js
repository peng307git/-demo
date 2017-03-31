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
        ajaxUrl:"/reports/newses/json",
        type: "Get",
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
                    var title = datar[i].title ;
                    var thumbnail = datar[i].thumbnail ;
                    var pushAt = Util.timeType(datar[i].pushAt.split(" ")[0]);
                    var info = datar[i].info;
                    var readCount = datar[i].readCount;
                    var newsId = datar[i].newsId;

                    htmlT += '<figure class="clearfix">'+
                                    '<a href="/reports/news/'+newsId+'" target="_blank"><img src="'+thumbnail+'"/></a>'+
                                    '<figcaption><a href="/reports/news/'+newsId+'" target="_blank">'+title+'</a></figcaption>'+
                                    '<p>'+info+'</p>'+
                                    '<div><span><i class="iconfont icon-shijian1"></i>'+pushAt+'</span>'+
                                    '<span><i class="iconfont icon-chakan"></i>'+readCount+'</span>'+
                                    '</div>'+
                                '</figure>';
                }
            };
            $("#news-list").html(htmlT);
        }
    })
});
