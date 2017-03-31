<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>Mind Asset</title>
    <!-- Meta -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="shortcut icon" href="/static/images/favicon.ico" type="image/x-icon"/>
    <!-- css -->
    <link rel="stylesheet" type="text/css" href="/static/v6/css/base.css">
    <link rel="stylesheet" type="text/css" href="/static/v6/css/iconfont.css">
    <link rel="stylesheet" type="text/css" href="/static/v6/css/main.css">
    <link rel="stylesheet" type="text/css"
          href="https://o5uaa1ha4.qnssl.com/static/css/plugin/flexslider.css">
    <link rel="stylesheet" type="text/css" href="/static/v6/css/styles-index.css">

</head>
<body>
<!--[if IE]>
<div class="iealert"><P>为使您获得更好的体验，推荐使用谷歌浏览器 或 火狐浏览器。<a class="chrome" href="http://www.chromeliulanqi.com/"
                                                        target="_blank">谷歌</a> <a class="firefox"
                                                                                  href="http://www.firefox.com.cn/"
                                                                                  target="_blank">火狐</a><i
        id="closeIeAlert">X</i></p></div>
<script type="text/javascript">
    $("#closeIeAlert").on('click', function (event) {
        event.preventDefault();
        /* Act on the event */
        $(".iealert").hide();
    });
</script>
<style type="text/css">
    .iealert {
        position: fixed;
        width: 100%;
        padding: 10px 0;
        background: rgba(255, 255, 255, .88);
        z-index: 100;
    }

    .iealert p {
        max-width: 1080px;
        margin: 0 auto;
        color: #333;
        font-size: 16px;
        line-height: 35px;
    }

    .iealert p a {
        display: inline-block;
        height: 35px;
        line-height: 35px;
        padding: 0 10px 0 40px;
        margin: -10px;
        color: #FFF;
        text-decoration: none;
    }

    .iealert p a.chrome {
        background: url("/static/v6/images/index/chrome_logo_2x.png") no-repeat 5px 5px #008dff;
        background-size: 25px 25px;
    }

    .iealert p a.firefox {
        background: url("/static/v6/images/index/firefox_logo_2x.png") no-repeat 5px 5px #69c700;
        background-size: 25px 25px;
    }

    .iealert p i {
        float: right;
        font-weight: lighter;
        font-size: 20px;
    }
</style>
<![endif]-->


<div class="fixed_topper" id="fixed_topper">
<#if SS_USERNAME?exists >
    <input type="hidden" class="appeal_count" value="${appeal_count}">
    <input type="hidden" class="forbidden_time" value="${forbidden_time}">
    <input type="hidden" class="mystatus" value="${user.status}">
    <#include "v6/common/toper.ftl" >
</#if>
    <div class="header">
        <div class="warper clearfix">
            <div class="index_logo"><i class="icon iconfont icon-mindassetlogo"></i>MINDASSET</div>
            <div class="container">
            <#if SS_USERNAME?exists >
                <#include "common/header_new.ftl" >
            <#else>
                <div class="btn"><a href="user/login"><@spring.messageText "login" "登录"/></a> / <a
                        href="user/signup"><@spring.messageText "register" "注册"/></a></div>
                <div class="topbar-price">
                    <span class=""><@spring.messageText "index.new.text1" "最新"/>
                        BTC <@spring.messageText "index.new.text2" "价格"/> : </span>
                    <span class='new-btc-price'></span><i>|</i>
                    <span class=""><@spring.messageText "index.new.text1" "最新"/>
                        MG <@spring.messageText "index.new.text2" "价格"/> : </span>
                    <span class='new-mg-price'></span><i>|</i>
                </div>
            </#if>
            </div>
        </div>
    </div>
</div>

<div class="bg-slider-wrapper">
    <div class="flexslider bg-slider">
        <ul class="slides">
        <#list bannerAdSlotResList as i >
            <li class="slide slide-2 flex-active-slide">
                <#if i.defaultHref>
                    <a href="${i.defaultHref}" target="_blank">
                        <img src="${i.defaultRes}" draggable="false"/>
                    </a>
                <#else>
                    <img src="${i.defaultRes}" draggable="false"/>
                </#if>
            </li>
        </#list>
        </ul>
    </div>
</div>
<#if SS_USERNAME?exists >
    <div class="warp notice-box">
        <div class="warper clearfix">
            <em><i class="iconfont icon-gonggao"></i> <@spring.messageText "notice.text1" "公告"/></em>
        </div>
    </div>
</div>
</#if>
<section class="product-section">
    <div class="header3"><h3><i class="iconfont icon-liujiaoxing"></i><@spring.messageText "index.new.text3" "智慧生态"/>
    </h3></div>
    <div class="product-box">
        <div class="slide-bg">
        </div>
        <div class="flexslider product">
            <ul class="slides">
                <li class="slide slide-a">
                    <img src="/static/v6/images/index/mindapp-screen.png" alt="">
                    <div class="infobox info-a">
                        <h5><@spring.messageText "index.new.text4" "智慧认证"/></h5>
                        <p><@spring.messageText "index.new.text5" "通过蓝牙将APP与Mind Link连接即可认证MG，在获得更多财富的同时，感受宁静、平和的冥想时光，开启智慧之旅。"/></p>
                    </div>
                    <div class="infobox info-b">
                        <h5><@spring.messageText "index.new.text6" "智慧视界"/></h5>
                        <p><@spring.messageText "index.new.text7" "有关Mind Asset初创理念、系统操作和使用方法，以及加密数字货币等知识，带您享受趣味、生动的视听课堂。"/></p>
                    </div>
                    <div class="infobox info-c">
                        <h5><@spring.messageText "index.new.text8" "智慧成就"/></h5>
                        <p><@spring.messageText "index.new.text9" "您可以通过APP查看个人所有的冥想记录及脑波详情，以精确、直观的数据记录为参考，更加合理地制定每日冥想计划。"/></p>
                    </div>
                    <div class="infobox info-d">
                        <h5><@spring.messageText "index.new.text10" "邀请体验"/></h5>
                        <p><@spring.messageText "index.new.text11" "邀请更多人加入到您的社区中，共同体验冥想的乐趣，培养健康的生活方式，并能够增加个人的产能及资产收益。"/></p>
                    </div>
                    <p class="link-box"><a
                            href='<@spring.messageText "iTunesUrl" "iTunesUrl =  https://itunes.apple.com/hk/app/infinite-mind/id1097680754?l=zh"/>'
                            target="_blank"><i class="iconfont icon-ios"></i>iPhone</a>
                        <a href="http://app.mindasset.com/?v=1.0.15" target="_blank"><i
                                class="iconfont icon-android"></i>Android</a></p>
                </li>
                <li class="slide  slide-b">
                    <img src="/static/v6/images/index/mindlink-screen.png" alt="">
                    <div class="infobox info-a">
                        <h5><@spring.messageText "index.new.text12" "采集人体脑波"/></h5>
                        <p><@spring.messageText "index.new.text13" "Mind Link脑电波头箍，结合脑波感应、生物识别、生物传感等先进技术，实现对大脑生物电波的采集。"/></p>
                    </div>
                    <div class="infobox info-b">
                        <h5><@spring.messageText "index.new.text14" "个人收益奖励"/></h5>
                        <p><@spring.messageText "index.new.text15" "系统通过评定每一次冥想的放松和专注程度，将M.A Blockchain的加密数字货币发行给那些内心平和、拥有智慧的人"/></p>
                    </div>
                    <div class="infobox info-c">
                        <h5><@spring.messageText "index.new.text16" "数据精准呈现"/></h5>
                        <p><@spring.messageText "index.new.text17" "Mind Link可以与移动设备APP进行蓝牙连接，实现脑波数据直观、精确的呈现，了解每一次放松的质量。"/></p>
                    </div>
                    <div class="infobox info-d">
                        <h5><@spring.messageText "index.new.text18" "培养健康生活"/></h5>
                        <p><@spring.messageText "index.new.text19" "通过每日冥想习惯的培养及奖励，鼓励并帮助人们更加科学地管理个人身心健康，培养规律、良性的生活习惯。"/></p>
                    </div>
                    <p class="link-box"><a href="/deal/buy_link"><@spring.messageText "buythen.text95" "兑换"/></a></p>
                </li>
                <li class="slide  slide-c">
                    <img src="/static/v6/images/index/mindbank-screen.png" alt="">
                    <div class="infobox info-e">
                        <h5><@spring.messageText "index.new.text20" "智慧银行"/></h5>
                        <p><@spring.messageText "index.new.text21" "智慧银行是智慧资产去中心化核心系统M.A Blockchain的开源应用程序，基于区块链公开、透明的特性，建立人类历史上第一个去中心化全球公益系统，并通过Locktime、账户实时切换等功能创新，实现便捷、高效的账户管理及资产收益方案。"/></p>
                    </div>
                    <p class="link-box"><a
                            href="http://www.mindgene.org/download_<@spring.messageText "index.text39" "CN"/>.html"
                            target="_blank"><i class="iconfont icon-ios"></i>Mac</a>
                        <a href="http://www.mindgene.org/download_<@spring.messageText "index.text39" "CN"/>.html"
                           target="_blank"><i class="iconfont icon-win"></i>Windows</a></p>
                </li>
            </ul>
        </div>
    </div>
</section>
<section class="blockchain">
    <div class="header3"><h3><i class="iconfont icon-liujiaoxing"></i>M.A Blockchain</h3></div>
    <div class="warper boxer">
        <div class="box active">
            <svg class="icon" aria-hidden="true">
                <use xlink:href="#icon-icon-test13"></use>
            </svg>
            <h5>M.A Blockchain</h5>
            <p><@spring.messageText "index.new.text22" "全球公共区块链生态最佳解决方案"/></p>
        </div>
        <div class="box">
            <svg class="icon" aria-hidden="true">
                <use xlink:href="#icon-icon-test12"></use>
            </svg>
            <h5><@spring.messageText "index.new.text24" "意念力"/>+</h5>
            <p><@spring.messageText "index.new.text25" "智能穿戴设备领域人体大数据生态颠覆性解决方案"/></p>
        </div>
        <div class="box">
            <svg class="icon" aria-hidden="true">
                <use xlink:href="#icon-icon-test11"></use>
            </svg>
            <h5><@spring.messageText "index.new.text27" "平静=财富"/></h5>
            <p><@spring.messageText "index.new.text28" "最具正能量的可操作性社会实践"/></p>
        </div>
        <div class="box">
            <svg class="icon" aria-hidden="true">
                <use xlink:href="#icon-icon-test10"></use>
            </svg>
            <h5><@spring.messageText "index.new.text30" "公益"/></h5>
            <p><@spring.messageText "index.new.text31" "人类有史以来第一个去中心化分布式全球公益慈善系统"/></p>
        </div>
    </div>
    <div class="warper explain-box">
        <div class="explain"><@spring.messageText "index.new.text23" "智慧资产是一次区块链技术底层协议的全面提升，它优化并完善了比特币的诸多设计缺陷，通过更具人性化与公平性的发行方式与分配机制，将财富分配给更多的人，从而建立更加健康、良性、可持续发展的公共区块链生态——M.A Blockchain，成为全球最平衡、透明、公平的去中心化分布式系统，服务于未来社会的每一个人。"/></div>
        <div class="explain"><@spring.messageText "index.new.text26" "将人体大脑生物电波技术，通过手机APP应用进行蓝牙连接，形成未来智能穿戴设备领域的核心产品；意念力穿戴设备，又结合M.A区块链系统，将未来人类数字资产的发行机制与人绑定，人们每天的心态、运动、健康等身体特征指标会来评定个人资产所得，为未来的全球人体大数据生态系统形成基础，它让我们的未来变得更加美好、智能、健康，我们把它叫做：“意念力+”。"/></div>
        <div class="explain"><@spring.messageText "index.new.text29" "现在，这个世界的各个角落，充斥着欲望、贪婪、焦躁与暴力，是应该出现一种事物让人们愿意选择平静下来了，它就是Mind Asset。它通过人性的引导，使人们愿意去尝试让自己平静下来，而最终形成一种习惯，一种面对生活的态度，一种对生命的敬畏。"/></div>
        <div class="explain"><@spring.messageText "index.new.text32" "Mind Asset，基于区块链技术，形成了人类有史以来的第一个去中心化慈善系统，使未来人们的支付、转账等行为， 都在全球M.A区块链的共同协议上变为一种慈善机制，让人们的生活中充满智慧与关爱，因为智慧与爱是人类最强大的事物，Mind Asset要再次诠释，如果没有“爱“，再强大的科技也没有任何价值…"/></div>
    </div>
</section>
<section class="video-box" id="video-box" style="background-image:url('/static/v6/images/index/Bitmap.png')">
    <div class="warper">
        <i class="iconfont icon-video-play1"></i>
        <em class="small-line"></em>
        <p> <@spring.messageText "index.new.text33" "让我们一起去改变一个未知的未来，<br/> 让世界变的更加美好……"/></p>
    </div>
</section>
<section class="memorabilia" id="memorabilia">
    <div class="header3"><h3><i class="iconfont icon-liujiaoxing"></i><@spring.messageText "index.new.text34" "大事记"/>
    </h3></div>
    <div class="warper moudles">
        <div class="moudle-box">

        </div>
        <div class="left-gradient" id="prev-gradient"></div>
        <div class="right-gradient" id="next-gradient"></div>
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
                    <a href='http://www.mindgene.org/download_<@spring.messageText "index.text39" "CN"/>.html'
                       target="_blank">Mind Bank</a>
                </li>
                <li>
                    <a href='https://www.btc123.com/' target="_blank">BTC123</a>
                </li>
            </ul>
            <div class="language">
                <span></span>
                <i class="arrow-down iconfont icon-littlearrow-right"></i>
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
        </div>
        <div class="footer-moudle footer-fast">
            <h4><@spring.messageText "FastEntry" "快捷通道"/></h4>
            <ul>
                <li>
                    <a href='/deal/recharge'><@spring.messageText "asset.text4" "比特币充值"/></a>
                </li>
                <li>
                    <a href='/deal/mg_recharge'><@spring.messageText "mg_recharge.text0" "MG充值"/></a>
                </li>
                <li>
                    <a href='/deal/buy'> <@spring.messageText "buythen.text95" "兑换"/> MP</a>
                </li>
                <li>
                    <a href='/deal/buy_link'> <@spring.messageText "buythen.text95" "兑换"/> MindLink</a>
                </li>
                <li>
                    <a href='/mine/user/v2'><@spring.messageText "index.header.text6" "矿场"/></a>
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
                    <a href='<@spring.messageText "iTunesUrl" "iTunesUrl =  https://itunes.apple.com/hk/app/infinite-mind/id1097680754?l=zh"/>'
                       target="_blank">Inifite Mind IOS</a>
                </li>
                <li>
                    <a href='http://www.mindgene.org/download_<@spring.messageText "index.text39" "CN"/>.html'
                       target="_blank">Mind Bank</a>
                </li>
            </ul>
        </div>
        <div class="footer-logo">
            <i class="iconfont icon-mindassetlogo"></i>
            MINDASSET
        </div>
    </div>
    <div class="footer-copyright">Copyright © 2016 Mind Asset. All Rights Reserved</div>
</div>
<div class="modal safe-tip-modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel"><@spring.messageText "safety.text92" "安全提醒"/></h4>
            </div>
            <div class="modal-body">
                <div class="form-group text-center">
                    <div class="index-safe-tip-text">
                    </div>
                    <div class="index-safe-tip-option">
                        <label><input type="checkbox"
                                      id="safe-tip-checkbox"><@spring.messageText "safety.text93" "不再提醒"/></label>
                    </div>
                </div>
                <div class="form-group text-center">
                    <a href="/v2/user/safety/into"
                       class="btn btn-confirm"><@spring.messageText "safety.text95" "进入安全中心"/></a>
                    <button type="button" class="btn btn-confirm"><@spring.messageText "safety.text98" "不，谢谢"/></button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--//footer-->
<div id='back-to-top'>
    <i></i>
</div>

<!-- 添加温馨提示 -->
<div id="alert_status"
     style="width:600px; position: fixed;z-index: 999; left:35%; top: 15%; background: #fff; text-align: center;padding:0 40px 20px 40px;font-size: 16px; box-shadow: #666 0 0 3px; display:none;">
    <br/><br/><@spring.messageText "wave.index.text1" "温馨提示"/><br/><br/><br/><br/>
${forbidden_message}
    <br/><br/>
    <strong style="float:right;">----Mindasset<@spring.messageText "wave.index.text3" "智慧资产"/></strong><br/><br/>

    <button id="iCan" style="width:174px; height:54px;"><@spring.messageText "wave.index.text4" "我已了解"/></button>
</div>
<!-- js -->
<script type="text/javascript"
        src='https://o5uaa1ha4.qnssl.com/static/js/jquery-1.11.2.min.js?v=201604261834'></script>

<script type="text/javascript" src='/static/v6/js/common.js?v=201609121527'></script>
<script type="text/javascript" src='/static/v6/js/iconfont.js?'></script>
<script type="text/javascript" src='/static/v6/js/home.js?'></script>
<script src='https://o5uaa1ha4.qnssl.com/static/js/jquery.i18n.properties-1.0.9.js'></script>
<!-- plugin.js -->
<script type="text/javascript"
        src='https://o5uaa1ha4.qnssl.com/static/js/plugin/jquery.flexslider-min.js?v=201604261834'></script>
<script>
    (function () {
        var isLangSet = localStorage.getItem('isLangSet') || 0;
        if (!isLangSet) {
            localStorage.setItem('isLangSet', 1);
            var lang = getCookie('locale');
            console.log(lang);
            var sysLang = navigator.language;
            if (sysLang && (['zh-CN', 'zh-TW', 'en-US'].indexOf(sysLang) > -1)) {

            } else {
                sysLang = 'en-US';
            }
            sysLang = sysLang.replace('-', '_')
            if (lang != sysLang) {
                location.replace('/?locale=' + sysLang);
            }
        }
    })();
</script>
<script>
    var ISLOGIN
    <#if SS_USERNAME?exists >
    ISLOGIN = true;
    <#else>
    ISLOGIN = false;
    </#if>
    $(document).ready(function () {

        $("#video-box").on('click', '.iconfont', function (event) {
            event.preventDefault();
            /* Act on the event */
            //poster="/static/images/index/video-poster4.jpg"
            var videoHtml = '<div class="fluid-width-video-wrapper">' +
                    '<video id="myVideo" width="100%"  controls autoplay="autoplay" webkit-playsinline>' +
                    '<source src="<@spring.messageText "index.video1" "https://o4we6sxpt.qnssl.com/mindbank_20160826_cn.mp4"/>" type="video/mp4"/>' +
                    '<object type="application/x-shockwave-flash" name="player" width="100%" id="player" style="visibility: visible;">' +
                    '<param name="allowFullScreen" value="true">' +
                    '<param name="allowScriptAccess" value="always">' +
                    '<param name="bgcolor" value="#000000">' +
                    '</object>' +
                    '</video>' +
                    '</div>';
            alertBoxNew({
                alertWidth: "960px",
                alertTitle: ' &nbsp; ',
                alertContent: videoHtml,
                btnType: 'none'
            });
            $(".fluid-width-video-wrapper").parent().css('padding', '0').parent().css({
                'padding': '0',
                'border': 'none'
            });
        });
//console.log($(".blockchain .boxer .box").offset().top);

        //memorabilia 延迟加载
        var memorabiliaData = [{
            node: '<@spring.messageText "index.new.text35" "创世纪"/>',
            pic: "/static/v6/images/index/Memorabilia01.jpg",
            title: '<@spring.messageText "index.new.text37" "智慧资产官方网站正式启动"/>',
            info: '<@spring.messageText "index.new.text36" "创启新程·区块链生态的人文契约"/>',
            url: '/static/20160905New-<@spring.messageText "index.text39" "CN"/>.html#New-0'
        }, {
            node: '<@spring.messageText "index.new.text38" "第一世纪"/>',
            pic: "/static/v6/images/index/Memorabilia02.jpg",
            title: '<@spring.messageText "index.new.text40" "交易生态初启"/>',
            info: '<@spring.messageText "index.new.text39" "财富机遇·自由交易领奏价值序章"/>',
            url: '/static/20160905New-<@spring.messageText "index.text39" "CN"/>.html#New-1'
        }, {
            node: '<@spring.messageText "index.new.text41" "第二世纪"/>',
            pic: "/static/v6/images/index/Memorabilia03.jpg",
            title: '<@spring.messageText "index.new.text43" "全球公益顺势启航"/>',
            info: '<@spring.messageText "index.new.text42" "新程·大爱公约"/>',
            url: '/static/20160905New-<@spring.messageText "index.text39" "CN"/>.html#New-2'
        }, {
            node: '<@spring.messageText "index.new.text44" "第三世纪"/>',
            pic: "/static/v6/images/index/Memorabilia04.jpg",
            title: '<@spring.messageText "index.new.text46" "全球商业多维联动"/>',
            info: '<@spring.messageText "index.new.text45" "开放·全球机遇"/>',
            url: '/static/20160905New-<@spring.messageText "index.text39" "CN"/>.html#New-3'
        }, {
            node: '<@spring.messageText "index.new.text47" "第四世纪"/>',
            pic: "/static/v6/images/index/Memorabilia05.jpg",
            title: '<@spring.messageText "index.new.text49" "创新应用生态布局"/>',
            info: '<@spring.messageText "index.new.text48" "律动·智慧未来"/>',
            url: '/static/20160905New-<@spring.messageText "index.text39" "CN"/>.html#New-4'
        }, {
            node: '<@spring.messageText "index.new.text51" "第五世纪"/>',
            pic: "/static/v6/images/index/Memorabilia06.png",
            title: '<@spring.messageText "index.new.text53" "商业价值爆发前夜"/>',
            info: '<@spring.messageText "index.new.text52" "便捷交互·构建流通生态闭环"/>',
            url: '/static/20160905New-<@spring.messageText "index.text39" "CN"/>.html#New-5'
        }, {
            node: '<@spring.messageText "index.new.text54" "未来"/>',
            pic: "/static/v6/images/index/Memorabilia07.png",
            title: '<@spring.messageText "index.new.text55" "智慧资产全球发展基金会未来计划将陆续揭晓……"/>'
        }]
        nextReadyLoad("#memorabilia", memorabiliaHtml);
        function memorabiliaHtml() {
            var thisHtml = "";
            var barHtml = "";
            for (var i = 0; i < memorabiliaData.length; i++) {
                if (i < memorabiliaData.length - 1) {
                    thisHtml += '<div class="pic-moudle after">' +
                            '<img src="' + memorabiliaData[i].pic + '" alt="' + memorabiliaData[i].title + '">' +
                            '<div>' +
                            '<h4>[ ' + memorabiliaData[i].title + ' ]</h4>' +
                            '<em class="small-line"></em>' +
                            '<p>' + memorabiliaData[i].info + '</p>' +
                            '<a href="' + memorabiliaData[i].url + '" target = "_blank"><@spring.messageText "index.new.text50" "了解更多"/> <i class="iconfont icon-littlearrow-right"></i></a>' +
                            '</div>' +
                            '</div>';
                } else if (i == memorabiliaData.length - 1) {
                    thisHtml += '<div class="pic-moudle after">' +
                            '<img src="' + memorabiliaData[i].pic + '" alt="' + memorabiliaData[i].title + '">' +
                            '<div>' +
                            '<h3>[ ' + memorabiliaData[i].title + ' ]</h3>' +
                            '</div>' +
                            '</div>';
                }

                barHtml += '<div class="marker"> <i></i> <span>[ ' + memorabiliaData[i].node + ' ]</span></div>';
            }
            ;
            $("#memorabilia .moudle-box").html(thisHtml);
            $("#marks-bar").html(barHtml);
            var picer = new carousel({
                "pic": "#memorabilia .pic-moudle",
                "speed": 3000,
                "prev": "#prev-gradient",
                "next": "#next-gradient",
                "bar": "#marks-bar .marker"
            });
        }
    })
</script>

<#if user?exists >
<script type="text/javascript">
    //新增申诉功能
    var myStatus = $('.mystatus').val();
    var appealCount = $('.appeal_count').val();
    if (parseInt(myStatus) == -90) {
        if (appealCount < 3) {
            $('#alert_status').css('display', 'block');
            $('#iCan').click(function () {
                $('#alert_status').css('display', 'none');
            })
            $('#noCan').click(function () {
                $('#alert_status').css('display', 'none');
                $('#alert_megs').css('display', 'block');
                $('#nextCan').click(function () {
                    $('#alert_megs').css('display', 'none');
                    var myval = $('#mytext').val();
                    if (myval.length < 50) {

                        $('#alert_megs').css('display', 'block');
                    } else {
                        $.ajax({
                            type: "POST",
                            url: "/brainwave/complaints/appeal",
                            dataType: "json",
                            data: {message: myval},
                            success: function (data) {
                                if (data.status != 0) {
                                    var myMessage = data.error.message;
                                    alertBoxFunc(myMessage, "all");
                                } else {
                                    alertBoxFunc('<@spring.messageText "wave.index.text9" "申诉成功！请耐心等待申诉结果."/>', "sure");
                                }
                            }
                        })
                    }
                })
            })
        } else {
            alertBoxFunc('<@spring.messageText "wave.index.text10" " 您今日的申诉次数已经用完。请耐心等待申诉结果!"/>', "sure");
        }
    }
    function safeWarn() {
        if (localStorage && localStorage.getItem('safetip')) {

        } else {
            $.ajax({
                type: "GET",
                url: "/v2/user/security_level_index",
                success: function (data) {
                    if (data.level && Number(data.level) < 4) {
                        $('.index-safe-tip-text').html(data.info);
                        $('.safe-tip-modal .btn-confirm').on('click', function () {
                            if ($('#safe-tip-checkbox').prop('checked')) {
                                localStorage.setItem('safetip', 1);
                            }
                            $('.safe-tip-modal').hide();
                        });
                        $('.safe-tip-modal').show();
                    }
                }
            })
        }
    }
        <#if USED_IP ??>
        console.log('包含用户异地登录提示信息, 请使用 ajax 请求 接口, 并显示返回结果');
        $.ajax({
            type: "GET",
            url: "/user/alert/info/ip",
            success: function (data) {
                console.log("加载错误提示信息成功……")
                console.log(data);
                // TODO 需要前端 填写处理方案
                // data.ip --> 上次登录的 Ip
                // data.region --> 上次登录地点
                if (data.status == 0 && data.data !== null) {
                    var conHtml = '<p class="other-place-p"><@spring.messageText "otherplace.text2" "您的账号在异地进行登录。如果这不是您本人操作，建议您修改"/><b><@spring.messageText "otherplace.text9" "登录密码。"/></b></p>' +
                            '<p class="other-place-p">登录时间：' + data.data.time + '</p>' +
                            '<p class="other-place-p">参考地点：' + data.data.region + '</p>';
                    alertBoxNew({
                        alertTitle: '<@spring.messageText "otherplace.text1" "异地登录提示"/>',
                        alertContent: conHtml,
                        sureText: '<@spring.messageText "otherplace.text5" "修改密码"/>',
                        cancelText: '<@spring.messageText "safety.text3" "确定"/>',
                        sureFunc: function () {
                            window.location = '/v2/user/safety/into';
                        },
                        cancelFunc: function () {
                            safeWarn();
                        }
                    });
                }
            }
        })
        <#else>
        safeWarn();
        </#if>
</script>
</#if>
<div style="display: none;">
    <script src="https://s4.cnzz.com/z_stat.php?id=1258113243&web_id=1258113243" language="JavaScript"></script>
</div>
</body>
</html>
