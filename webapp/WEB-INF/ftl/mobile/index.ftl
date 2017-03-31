<#include "../../v6/common/base_v6_m.ftl" />
<#macro title>
Mind Asset
</#macro>
<#macro head>
<meta name="viewport" content="width=device-width,height=device-height,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<script type="text/javascript">
      (function (doc, win) {
            var docEl = doc.documentElement,
             resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize',
               recalc = function () {
                  var clientWidth = docEl.clientWidth;
                  if (!clientWidth) return;
                    docEl.style.fontSize = 100 * (clientWidth / 750) + 'px';
                };
                // Abort if browser does not support addEventListener
              if (!doc.addEventListener) return;
              win.addEventListener(resizeEvt, recalc, false);
              doc.addEventListener('DOMContentLoaded', recalc, false);
    })(document, window);

    function getCookie(name) {
        var value = "; " + document.cookie;
        var parts = value.split("; " + name + "=");
        if (parts.length == 2) return parts.pop().split(";").shift();
    }

    (function(){
        var isLangSet = localStorage.getItem('isLangSet') || 0;
        if(!isLangSet){
            localStorage.setItem('isLangSet', 1);
            var lang = getCookie('locale');
            console.log(lang);
            var sysLang = navigator.language;
            if(sysLang && (['zh-CN', 'zh-TW', 'en-US'].indexOf(sysLang) > -1)){

            }else{
                sysLang = 'en-US';
            }
            sysLang = sysLang.replace('-','_')
            if(lang != sysLang){
                location.replace('/?locale='+sysLang);
            }
        }
    })();

    
    </script>
<link rel="stylesheet" type="text/css" href="/static/css/plugin/flexslider.css">
<link rel="stylesheet" type="text/css" href="/static/v6/css/iconfont.css">
<link rel="stylesheet" type="text/css" href="/static/v6/css/mobile-main.css">
<link rel="stylesheet" type="text/css" href="/static/v6/css/mobile-index.css">
</#macro>
<#macro body>
<div class="m-wrap price">
    <div class="topbar-price">
        <p><span><@spring.messageText "index.new.text1" "最新"/> BTC <@spring.messageText "index.new.text2" "价格"/> : </span>
        <span class='new-btc-price'></span></p>
        <p><span><@spring.messageText "index.new.text1" "最新"/> MG <@spring.messageText "index.new.text2" "价格"/> : </span>
        <span class='new-mg-price'></span></p>
    </div>
</div>
<div class="m-wrap hearder">
    <div class="logo"><i class="iconfont icon-mindassetlogo"></i>MINDASSET</div>
    <#if SS_USERNAME?exists >
        <div id="menu" class="">
            <i></i>
        </div>
        <div class="nav_wrap">
            <div class="nav_box">
                <div class="info">
                    <div class="name"><i class="iconfont icon-headphoto"></i>${SS_USERNAME}</div>
                    <div class="clearfix">
                        <div class="topbar-user-detail-title">
                            <span><@spring.messageText "topbar.balance" "可用" /></span>
                        </div>
                        <div class="topbar-user-detail-content">
                            <p>฿ <span class="btc-change"></span>&nbsp;&nbsp;&nbsp;&nbsp; ≈ &nbsp;&nbsp;&nbsp;&nbsp;$<span class="dollar-change"></span></p>
                            <p>MN:<span class="mn-change"></span> MG:<span class="mg-change"></span></p>
                        </div>
                    </div>
                    <div class="clearfix">
                        <div class="topbar-user-detail-title"> 
                           <span><@spring.messageText "deduct.query.text6" "已扣除" /></span>
                        </div>
                        <div class="topbar-user-detail-content2">
                            <p>MG:<span class="mn-cheated"></span></p>
                        </div>
                    </div> 
                    <div class="clearfix">
                        <div class="topbar-user-detail-title"> 
                           <span><@spring.messageText "deduct.query.text15" "冻结中" /></span>
                        </div>
                        <div class="topbar-user-detail-content2">
                            <p>MG:<span class="mn-deducted"></span></p>
                        </div>
                    </div>
                </div>
                <ul class="nav">
                    <li><a href="/"><@spring.messageText "index.header.text2" "首页"/></a></li>
                    <li><a href="/deal/recharge"><@spring.messageText "index.header.text3" "资产"/></a></li>
                    <li><a href="/record/mydata"><@spring.messageText "index.header.text4" "业绩"/></a></li>
                    <li>
                        <#if isNewRegister == 1>
                        <span><@spring.messageText "index.header.text5" "认购"/></span>
                        <div class="navigation_bar">
                            <a href="/deal/buy"><@spring.messageText "buylink.text56" "智慧包"/></a>
                            <a href="/deal/buy_link"><@spring.messageText "buylink.text50" "购买"/>MindLink </a>
                        </div>
                        <#else>
                        <a href="/deal/buy"><@spring.messageText "index.header.text5" "认购"/></a>
                        </#if>
                    </li>
                    <li><a href="/mine/user/v2"><@spring.messageText "index.header.text6" "矿场"/></a></li>
                    <li><span><@spring.messageText "index.header.text1" "脑波"/></span>
                        <div class="navigation_bar">
                            <a href="/record/meditation/my/brain/search"><@spring.messageText "wave.query.text45" "我的脑波查询"/></a>
                            <a href="/record/meditation/global/brain/search"><@spring.messageText "wave.query.text46" "全球脑波查询"/> </a>
                            <a href="/record/meditation/deduct/brain/search"><@spring.messageText "deduct.query.text1" "脑波扣除公示"/></a>
                        </div>
                    </li>
                    <li><a href="/v2/user/account/info" class="user" <#if nav_page=='user'> onclick="javascript:return false" </#if> > <@spring.messageText "safety.text1" "账户"/></a></li>
                    <li><a href="/deal/mgOpen"><@spring.messageText "open.mg.text1" "公开"/></a></li>
                    <!-- <li><a href="/notice/"><@spring.messageText "notice.text1" "公告"/> <#if (unReadNoticeNum > 0)><i></i></#if></a></li> -->
                    <li><span><@spring.messageText "reports.nav" "生态动态"/></span>
                        <div class="navigation_bar">
                            <a href="/reports/newses"><@spring.messageText "news.title" "最新动态"/></a>
                            <a href="/reports/notices/"><@spring.messageText "notice.text1" "公告"/></a>
                        </div>
                    </li>
                    <li><a href="/user/logout"><@spring.messageText "logout" "退出"/></a></li>
                </ul>
            </div>
        </div>         
    <#else>
        <div class="login_box">
            <a href="user/login"><@spring.messageText "login" "登录"/></a>  
            <a href="user/signup"><@spring.messageText "register" "注册"/></a>
        </div>
    </#if>
    
</div>
<div class="bg-slider-wrapper">
    <div class="flexslider bg-slider">
        <ul class="slides">
        <#list bannerAdSlotResList as i >
            <li class="slide slide-2 flex-active-slide">
             <#if i.defaultHref>
                <a href="${i.defaultHref}" target="_blank">
                    <img src="${i.defaultRes}" draggable="false" />
                </a>
             <#else>
                <img src="${i.defaultRes}" draggable="false" />
             </#if>
            </li>
        </#list>
        </ul>
    </div>
</div>
<#if SS_USERNAME?exists >
    <div class="notice-box">
        
    </div>
</#if>
<section class="product-section">
    <h3><i class="iconfont icon-liujiaoxing"></i><@spring.messageText "index.new.text3" "智慧生态"/></h3>
    <div class="product-box">
        <div class="product product_a">
            <img src='/static/v6/images/nomd5/mindapp-screen-<@spring.messageText "index.text39" "CN"/>.png' alt="">
            <p class="link-box"><a href='<@spring.messageText "iTunesUrl" "iTunesUrl =  https://itunes.apple.com/hk/app/infinite-mind/id1097680754?l=zh"/>' target="_blank"><i class="iconfont icon-ios"></i>iPhone</a>
            <a href="http://app.mindasset.com/?v=1.0.15" target="_blank"><i class="iconfont icon-android"></i>Android</a></p>
            <div class="infobox info-a">
                <h5><@spring.messageText "index.new.text4" "智慧认证"/></h5>
                <p><@spring.messageText "index.new.text5" "通过蓝牙将APP与Mind Link连接即可认证MG，在获得更多财富的同时，感受宁静、平和的冥想时光，开启智慧之旅。"/></p>
            </div>
            <i class="iconfont icon-more"></i>
            <div class="infobox">
                <h5><@spring.messageText "index.new.text6" "智慧视界"/></h5>
                <p><@spring.messageText "index.new.text7" "有关Mind Asset初创理念、系统操作和使用方法，以及加密数字货币等知识，带您享受趣味、生动的视听课堂。"/></p>
            </div>
            <div class="infobox">
                <h5><@spring.messageText "index.new.text8" "智慧成就"/></h5>
                <p><@spring.messageText "index.new.text9" "您可以通过APP查看个人所有的冥想记录及脑波详情，以精确、直观的数据记录为参考，更加合理地制定每日冥想计划。"/></p>
            </div>
            <div class="infobox">
                <h5><@spring.messageText "index.new.text10" "邀请体验"/></h5>
                <p><@spring.messageText "index.new.text11" "邀请更多人加入到您的社区中，共同体验冥想的乐趣，培养健康的生活方式，并能够增加个人的产能及资产收益。"/></p>
            </div>
        </div>
        <div class="product">
            <img src="/static/v6/images/index/mindlink-screen.png" alt="">
            <p class="link-box"><a href="/deal/buy_link" ><@spring.messageText "buythen.text95" "兑换"/></a></p>
            <div class="infobox info-a">
                <h5><@spring.messageText "index.new.text12" "采集人体脑波"/></h5>
                <p><@spring.messageText "index.new.text13" "Mind Link脑电波头箍，结合脑波感应、生物识别、生物传感等先进技术，实现对大脑生物电波的采集。"/></p>
            </div>
            <i class="iconfont icon-more"></i>
            <div class="infobox">
                <h5><@spring.messageText "index.new.text14" "个人收益奖励"/></h5>
                <p><@spring.messageText "index.new.text15" "系统通过评定每一次冥想的放松和专注程度，将M.A Blockchain的加密数字货币发行给那些内心平和、拥有智慧的人"/></p>
            </div>
            <div class="infobox">
                <h5><@spring.messageText "index.new.text16" "数据精准呈现"/></h5>
                <p><@spring.messageText "index.new.text17" "Mind Link可以与移动设备APP进行蓝牙连接，实现脑波数据直观、精确的呈现，了解每一次放松的质量。"/></p>
            </div>
            <div class="infobox">
                <h5><@spring.messageText "index.new.text18" "培养健康生活"/></h5>
                <p><@spring.messageText "index.new.text19" "通过每日冥想习惯的培养及奖励，鼓励并帮助人们更加科学地管理个人身心健康，培养规律、良性的生活习惯。"/></p>
            </div>
        </div>
        <div class="product product_c">
            <img src="/static/v6/images/index/mindbank-screen.png" alt="">
            <p class="link-box"><a href="http://www.mindgene.org/download_<@spring.messageText "index.text39" "CN"/>.html"target="_blank" ><i class="iconfont icon-ios"></i>Mac</a>
            <a href="http://www.mindgene.org/download_<@spring.messageText "index.text39" "CN"/>.html" target="_blank"><i class="iconfont icon-win"></i>Windows</a></p>
            <div class="infobox info-a">
                <h5><@spring.messageText "index.new.text20" "智慧银行"/></h5>
                <p><@spring.messageText "index.new.text21" "智慧银行是智慧资产去中心化核心系统M.A Blockchain的开源应用程序，基于区块链公开、透明的特性，建立人类历史上第一个去中心化全球公益系统，并通过Locktime、账户实时切换等功能创新，实现便捷、高效的账户管理及资产收益方案。"/></p>
            </div>
        </div>
    </div>
</section>
<section class="blockchain">
    <h3><i class="iconfont icon-liujiaoxing"></i>M.A Blockchain</h3>
    <div class="boxer clearfix">
        <div class="box">
            <svg class="icon" aria-hidden="true">
                <use xlink:href="#icon-icon-test13"></use>
            </svg>
        </div>
        <div class="box">
            <svg class="icon" aria-hidden="true">
                <use xlink:href="#icon-icon-test12"></use>
            </svg>
        </div>
        <div class="box">
            <svg class="icon" aria-hidden="true">
                <use xlink:href="#icon-icon-test11"></use>
            </svg>
        </div>
        <div class="box">
            <svg class="icon" aria-hidden="true">
                <use xlink:href="#icon-icon-test10"></use>
            </svg>
        </div>
    </div>
    <div class="explain-box">
        <div class="explain">
            <h5>M.A Blockchain</h5>
            <h6><@spring.messageText "index.new.text22" "全球公共区块链生态最佳解决方案"/></h6>
            <p><@spring.messageText "index.new.text23" "智慧资产是一次区块链技术底层协议的全面提升，它优化并完善了比特币的诸多设计缺陷，通过更具人性化与公平性的发行方式与分配机制，将财富分配给更多的人，从而建立更加健康、良性、可持续发展的公共区块链生态——M.A Blockchain，成为全球最平衡、透明、公平的去中心化分布式系统，服务于未来社会的每一个人。"/></p>
        </div>
        <div class="explain">
            <h5><@spring.messageText "index.new.text24" "意念力"/>+</h5>
            <h6><@spring.messageText "index.new.text25" "智能穿戴设备领域人体大数据生态颠覆性解决方案"/></h6>
            <p><@spring.messageText "index.new.text26" "将人体大脑生物电波技术，通过手机APP应用进行蓝牙连接，形成未来智能穿戴设备领域的核心产品；意念力穿戴设备，又结合M.A区块链系统，将未来人类数字资产的发行机制与人绑定，人们每天的心态、运动、健康等身体特征指标会来评定个人资产所得，为未来的全球人体大数据生态系统形成基础，它让我们的未来变得更加美好、智能、健康，我们把它叫做：“意念力+”。"/></p>
        </div>
        <div class="explain">
            <h5><@spring.messageText "index.new.text27" "平静=财富"/></h5>
            <h6><@spring.messageText "index.new.text28" "最具正能量的可操作性社会实践"/></h6>
            <p><@spring.messageText "index.new.text29" "现在，这个世界的各个角落，充斥着欲望、贪婪、焦躁与暴力，是应该出现一种事物让人们愿意选择平静下来了，它就是Mind Asset。它通过人性的引导，使人们愿意去尝试让自己平静下来，而最终形成一种习惯，一种面对生活的态度，一种对生命的敬畏。"/></p>
        </div>
        <div class="explain">
            <h5><@spring.messageText "index.new.text30" "公益"/></h5>
            <h6><@spring.messageText "index.new.text31" "人类有史以来第一个去中心化分布式全球公益慈善系统"/></h6>
            <p><@spring.messageText "index.new.text32" "Mind Asset，基于区块链技术，形成了人类有史以来的第一个去中心化慈善系统，使未来人们的支付、转账等行为， 都在全球M.A区块链的共同协议上变为一种慈善机制，让人们的生活中充满智慧与关爱，因为智慧与爱是人类最强大的事物，Mind Asset要再次诠释，如果没有“爱“，再强大的科技也没有任何价值…"/></p>
        </div>
    </div>
</section>
<section class="video-box" id="video-box" style="background-image:url('/static/v6/images/index/video-m-bg.jpg')">
    <div class="warper">
        <i class="iconfont icon-video-play1"></i>
        <!-- <i class="iconfont icon-video-play"></i> -->
        <em class="small-line"></em>
        <p> <@spring.messageText "index.new.text33" "让我们一起去改变一个未知的未来，<br/> 让世界变的更加美好……"/></p>
    </div>
</section>
<section class="memorabilia" id="memorabilia">
    <h3><i class="iconfont icon-liujiaoxing"></i><@spring.messageText "index.new.text34" "大事记"/></h3>
    <div class="warper moudles">
        <div class="moudle-box">

        </div>
    </div>
    <div class="warper marks">
        <div class="mark-cover">
            <div class="mark-box" id="marks-bar">

            </div>
        </div>
    </div>
</section>
<!-- ******FOOTER****** -->
<div class="footer">
    <div class="warper clearfix">
        <div class="footer-moudle footer-links">
            <h4><@spring.messageText "index.text40" "友情链接"/></h4>
            <ul>
                <li>
                    <a href='http://www.mindgene.org/download_<@spring.messageText "index.text39" "CN"/>.html' target="_blank">Mind Bank</a>
                </li>
                <li>
                    <a href='https://www.btc123.com/' target="_blank">BTC123</a>
                </li>
                <li>
                    <a href='http://angel.mindasset.com/'
                       target="_blank">Mind Angel</a>
                </li>
            </ul>
        </div>
        <div class="footer-moudle footer-fast">
            <h4><@spring.messageText "FastEntry" "快捷通道"/></h4>
            <ul>
                <li>
                    <a href='/deal/recharge' ><@spring.messageText "asset.text4" "比特币充值"/></a>
                </li>
                <li>
                    <a href='/deal/mg_recharge' ><@spring.messageText "mg_recharge.text0" "MG充值"/></a>
                </li>
                <li>
                    <a href='/deal/buy' > <@spring.messageText "buythen.text95" "兑换"/> MP</a>
                </li>
                <li>
                    <a href='/deal/buy_link' > <@spring.messageText "buythen.text95" "兑换"/> Mind Link</a>
                </li>
                <li>
                    <a href='/mine/user/v2' ><@spring.messageText "index.header.text6" "矿场"/></a>
                </li>
            </ul>
        </div>
        <div class="footer-moudle footer-download">
            <h4><@spring.messageText "Download" "下载"/></h4>
            <ul>
                <li>
                    <a href='http://app.mindasset.com/?v=1.0.15' target="_blank">Inifite Mind Android</a>
                </li>
                <li>
                    <a href='<@spring.messageText "iTunesUrl" "iTunesUrl =  https://itunes.apple.com/hk/app/infinite-mind/id1097680754?l=zh"/>' target="_blank">Inifite Mind IOS</a>
                </li>
                <li>
                    <a href='http://www.mindgene.org/download_<@spring.messageText "index.text39" "CN"/>.html' target="_blank">Mind Bank</a>
                </li>
            </ul>
        </div>
        <div class="language">
            <div><span></span>
            <i class="arrow-down iconfont icon-littlearrow-right"></i></div>
            <ul>
                <li class="enbar">
                        <img src="/static/v6/images/usa_bg.png">
                        <a href="${request.contextPath}?locale=en_US">English</a>
                </li>
                <li class="chbar">
                        <img src="/static/v6/images/china_bg.png">
                        <a href="${request.contextPath}?locale=zh_CN">中文简体</a>
                </li>
                <li class="hkbar">
                        <img src="/static/v6/images/hk_bg.png">
                        <a href="${request.contextPath}?locale=zh_TW">中文繁體</a>
                </li>
            </ul>
        </div>
        <div class="footer-logo">
            <i class="iconfont icon-mindassetlogo"></i>
            MINDASSET
        </div>
    </div>
    <div class="footer-copyright"><a href="http://www.mindasset.com?agent-mobile=web"><@spring.messageText "PC.Version" "访问电脑版"/></a></div>
    <div class="footer-copyright">Copyright © 2016 Mind Asset. All Rights Reserved</div>
</div>
<!-- 基金宣言广告 -->
<div class="feedback-index-bg">
    <div class="feedback-text">
        <h2><@spring.messageText "fund.notice.text17" "《M.A Blockchain宣言》正式公布，点击即可查看！"/></h2>
        <p><@spring.messageText "fund.notice.text18" "写下你与Mind Asset的故事，即有机会入选“世纪之约”精彩留言、获得高额MG奖励！"/>
        </p>
        <div class="isbtn"><@spring.messageText "fund.notice.text19" "查看更多"/></div>
        <span class="iconfont icon-guanbi feedback-close"></span>
    </div>
</div>
</#macro>
<#macro footerjs>
<script>
    I18N.addLang({
        'index.more': '<@spring.messageText "index.new.text50" "了解更多"/>',
        'index.appeal_success': '<@spring.messageText "wave.index.text9" "申诉成功！请耐心等待申诉结果."/>',
        'index.appeal_fail': '<@spring.messageText "wave.index.text10" " 您今日的申诉次数已经用完。请耐心等待申诉结果!"/>'
    });
    //memorabilia 延迟加载
    var memorabiliaData = [
            {   pic: "https://oepud6a2o.qnssl.com/static/v6/images/index/Memorabilia01-<@spring.messageText 'index.text39' 'CN'/>.jpg" }, 
            {   pic: "https://oepud6a2o.qnssl.com/static/v6/images/index/Memorabilia02-<@spring.messageText 'index.text39' 'CN'/>.jpg" },
            {   pic: "https://oepud6a2o.qnssl.com/static/v6/images/index/Memorabilia03-<@spring.messageText 'index.text39' 'CN'/>.jpg" },
            {   pic: "https://oepud6a2o.qnssl.com/static/v6/images/index/Memorabilia04-<@spring.messageText 'index.text39' 'CN'/>.jpg" },
            {   pic: "https://oepud6a2o.qnssl.com/static/v6/images/index/Memorabilia05_1-<@spring.messageText 'index.text39' 'CN'/>.jpg" },
            {   pic: "https://oepud6a2o.qnssl.com/static/v6/images/index/Memorabilia06-<@spring.messageText 'index.text39' 'CN'/>.jpg" },
            {   pic: "https://oepud6a2o.qnssl.com/static/v6/images/index/Memorabilia07-<@spring.messageText 'index.text39' 'CN'/>.jpg" },
            {   pic: "https://oepud6a2o.qnssl.com/static/v6/images/index/Memorabilia08-<@spring.messageText 'index.text39' 'CN'/>.jpg" },
            {   pic: "https://oepud6a2o.qnssl.com/static/v6/images/index/Memorabilia09-<@spring.messageText 'index.text39' 'CN'/>.jpg" },
            {   pic: "https://oepud6a2o.qnssl.com/static/v6/images/index/Memorabilia010-<@spring.messageText 'index.text39' 'CN'/>.jpg" },
            {   pic: "https://oepud6a2o.qnssl.com/static/v6/images/index/Memorabilia011-<@spring.messageText 'index.text39' 'CN'/>.jpg" },
            {   pic: "https://oepud6a2o.qnssl.com/static/v6/images/index/Memorabilia012-<@spring.messageText 'index.text39' 'CN'/>.jpg" },
            {   pic: "/static/v6/images/index/Memorabilia013_1-<@spring.messageText 'index.text39' 'CN'/>.jpg" },
            {   pic: "https://oepud6a2o.qnssl.com/static/v6/images/index/Memorabilia014-<@spring.messageText 'index.text39' 'CN'/>.jpg" },
            {   pic: "https://oepud6a2o.qnssl.com/static/v6/images/index/Memorabilia015-<@spring.messageText 'index.text39' 'CN'/>.jpg" }
        ]
    var videoUrl = '<@spring.messageText "index.video1" "https://o4we6sxpt.qnssl.com/mindbank_20160826_cn.mp4"/>';
</script>
<script src="/static/v6/js/lib/require.js"></script>
<script>
require.config({
    baseUrl: '/',
    paths: {
        jquery: '/static/v6/js/lib/jquery-1.11.2.min'
    }
});
require(['static/v6/js/page/index_mobile']);
</script>
</#macro>
