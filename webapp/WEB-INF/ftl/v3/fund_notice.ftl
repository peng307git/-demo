<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0 maximum-scale=1, user-scalable=no">
    <meta content="telephone=no" name="format-detection">
    <meta name="description" content="">
    <meta name="author" content="">
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
    </script>
    <title><@spring.messageText "fund.notice.text20" "M.A Blockchain宣言"/></title>
    <link rel="shortcut icon" href="/static/images/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" type="text/css" href="/static/v6/css/base.css">
    <link rel="stylesheet" type="text/css" href="/static/v6/css/main.css">
    <link rel="stylesheet" type="text/css" href="/static/v6/css/iconfont.css">
    <link rel="stylesheet" type="text/css" href="/static/css/fund_notice.css">
</head>
<body>
    <section class="body">
        <header class="head">
            <div class="video">
                <div class="playvideo"></div>
                <h1 class="video-title">人文蓝图，致敬初心</h1>
            </div>
        </header>
        <section class="main">
            <div class="main-text"></div>
        </section>
        <footer class="footer">
            <div class="footer-text">
                <div class="text-head">
                    <h2><@spring.messageText "fund.notice.text1" "参加Mind Asset“世纪之约”，领取高额MG奖励"/></h2>
                    <h3><@spring.messageText "fund.notice.text2" "规则说明："/></h3>
                    <ul>
                        <li><span></span><p><@spring.messageText "fund.notice.text3" "请写下你与Mind Asset的故事，我们将收集本世纪中所有参与者的精彩留言，并于世纪末抽取“世纪之约”奖励名额；"/></p></li>
                        <li><span></span><p><@spring.messageText "fund.notice.text4" "“世纪之约”获奖名单将于第四世纪公布，每位获奖参与者的奖励额度为1000MG，入选后奖励金额将转入您的智慧资产账户中；"/></p></li>
                        <li><span class="en-down-bor"></span><p><@spring.messageText "fund.notice.text5" "您的留言未来将有可能出现在M.A Blockchain的社交媒体平台上，与更多Mind Asset的爱好者分享您的故事。"/></p></li>
                    </ul>
                </div>
                <div class="text-main">
                    <textarea id="sub-text" placeholder='<@spring.messageText "fund.notice.text11" "写下您对未来的期许"/>'></textarea>
                    <div class="text-imit text-show"><@spring.messageText "fund.notice.text6" "您最多可输入1000字"/></div>
                    <div class="text-imit text-hide"><@spring.messageText "fund.notice.text7" "您还可以输入"/><span class="text-num">xxx</span> <@spring.messageText "fund.notice.text10" "字"/></div>
                    <div class="wrap-text">
                        <@spring.messageText "fund.notice.text16" "您需要登录后才可以评论"/>
                        <div class="btn"><a href="/user/login"><@spring.messageText "login" "登录"/></a> <!-- | <a href="/user/signup"><@spring.messageText "register" "注册"/></a> --></div>
                    </div>
                </div>
                <footer class="text-footer">
                    <span><@spring.messageText "fund.notice.text8" "免责声明：本项活动最终解释权归智慧资产全球发展基金会志愿者开发团队所有。"/></span>
                    <div id="upbtn"><@spring.messageText "fund.notice.text9" "提交评论"/></div>
                </footer>
            </div>
        </footer>
<!-- js -->
<!-- Go to www.addthis.com/dashboard to customize your tools --> <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-58a2c9c4e98470fa"></script> 
<script type="text/javascript" src='https://o5uaa1ha4.qnssl.com/static/js/jquery-1.11.2.min.js?v=201604261834'></script>
<script src='https://o5uaa1ha4.qnssl.com/static/js/jquery.i18n.properties-1.0.9.js'></script>
<script>
        //播放视频
        var ISLOGIN;
        var _lang =langType();
        if(navigator.userAgent.match(/(iPhone|iPod|Android|ios)/i)){
                    $(".video div").removeClass("pc-video").addClass("mobile-video");
        }else{
                    $(".video div").removeClass("mobile-video").addClass("pc-video");
        }
        $(".pc-video").on('click', function (event) {
            event.preventDefault();
            /* Act on the event */
            //poster="/static/images/index/video-poster4.jpg"
            var videoHtml = '<div class="fluid-width-video-wrapper">' +
                    '<video id="myVideo" width="100%"  controls autoplay="autoplay" webkit-playsinline>' +
                    '<source src="http://7xpapt.com1.z0.glb.clouddn.com/fundNotice-cn.mp4" type="video/mp4"/>' +
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
            if ( _lang == "en" ){
                $("#myVideo").attr("src","http://7xpapt.com1.z0.glb.clouddn.com/fundNotice-en.mp4");
            }
            $(".fluid-width-video-wrapper").parent().css('padding', '0').parent().css({
                'padding': '0',
                'border': 'none'
            });
            $("#alertWrap .alert-bg .alert-closer").html(" ").addClass("iconfont icon-guanbi")
        });
        //移动端播放视频
        videoFun();
    function videoFun(){
        var html = '<video id="myVideo" -webkit-playsinline="false" ><source src="http://7xpapt.com1.z0.glb.clouddn.com/fundNotice-cn.mp4" type="video/mp4" /></video>';
        $(".mobile-video").on('click', function(event) {
            console.log("click");
            hiderVideo(0);
            $("body").append(html);
            if ( _lang == "en" ){
                $("#myVideo").attr("src","http://7xpapt.com1.z0.glb.clouddn.com/fundNotice-en.mp4");
            }
            var video = document.getElementById("myVideo");
            var status = 1;
            video.controls = true;
            launchFullscreen(video);
            video.play();
            
            video.addEventListener('pause',function(){
                console.log("pause");
                hiderVideo(0);
            });

            video.addEventListener("fullscreenchange", FShandler);  
            video.addEventListener("webkitfullscreenchange", FShandler);  
            video.addEventListener("mozfullscreenchange", FShandler);  
            video.addEventListener("MSFullscreenChange", FShandler); 
            function FShandler() { 
                console.log("fullscreenchange");
                if(status == 0 ){
                    hiderVideo(status);
                    status = 1
                }else{
                    status = 0
                }
            }
        });
        
        $(".icon-video-play").on('click', function(event) {
            hiderVideo(0);
        });
        //ios safari 退出全屏时捕获不到退出全屏事件
        // $(document).on('touchstart',function(){
        //     if (navigator.userAgent.match(/(iPhone|iPod|Android|ios)/i)) {
        //         hiderVideo(0);
        //     }
        // })
        function hiderVideo(n){
            var video = document.getElementById("myVideo");
            if(n==0) {
                console.log("hiderVideo");
                $("#myVideo").remove();
            }
        }
        //判断各种浏览器，找到正确的方法
        function launchFullscreen(element) {
            if(element.requestFullscreen) {
                element.requestFullscreen();
            } else if(element.mozRequestFullScreen) {
                element.mozRequestFullScreen();
            } else if(element.webkitRequestFullscreen) {
                element.webkitRequestFullscreen();
            } else if(element.msRequestFullscreen) {
                element.msRequestFullscreen();
            }
        }
    };
     var maintext = [
                        ["是时候，重新审视 <br/>这个我们共同创造、维系的时代 <br/>这个光辉与暗流并存的，并不那么完美的时代"
                        ,"我们看到，世界的无数面孔<br/>冷漠的，热情的<br/>罪恶的，善良的<br/>激进的，保守的<br/>偏执的，包容的<br/>抱怨的，感恩的<br/>充满智慧与爱的"
                        ,"每一个时代都有属于它的梦想者与实践者<br/>他们不畏重负，礼赞智慧<br/>只为重拾那些被遗失的梦想"
                        ,"自区块链出现之时，新的时代已被打开<br/>它将世界重新格式化，颠覆信任与连接的认知<br/>它蕴藏着无穷的力量，重塑时代的巨大力量<br/>我们始终在求索，它应该为谁效劳"
                        ,"我们珍视爱的力量<br/>那是人类从古至今的永恒财富<br/>我们崇尚科技的伟大<br/>那是人类数千年探索的文明之光<br/>而信任，才是人类进步与发展的不变根基"
                        ,"M.A Blockchain的诞生<br/>用人文重新定义科技的价值<br/>它将逆转爱的消逝<br/>指引我们铭记应有的生存之道"
                        ,"当我们的每一次投票<br/>为困顿挣扎的人增添一抹笑容<br/>当我们的每一笔支付<br/>为寒冷饥饿的孩子点燃生活希望<br/>当我们的每一声祝福<br/>被世界上更多的人感知并赞许<br/>你会发现，你不再只是那个你认为的自己<br/>你将影响这个世界的每一个人"
                        ,"你终会看到<br/>智慧与爱，才是人类最强大的事物<br/>你终会看到<br/>如果没有爱，再伟大的科技也没有任何价值<br/>你终会看到<br/>一个充满信任、分享、感恩、自由的新世界"
                        ,"我们要做冥冥之中，那些我们注定要做的事情<br/>我们不会畏惧那些质疑的目光<br/>我们不会害怕那些遥远的未知<br/>我们更不会向任何困难做出一点让步<br/>因为，我们拥有信仰与理想<br/>而绝不仅仅，只是为了活着"
                        ,"珍视我们的智慧吧<br/>它将成为我们未来的指引<br/>让它发光，让它在被需要的地方焕发光芒<br/>保持斗志，保持初心，保持感恩<br/>它已如黎明般到来"
                        ],
                        ["是時候，重新審視<br/>這個我們共同創造、維繫的時代<br/>這個光輝與暗流幷存的，幷不那麽完美的時代"
                        ,"我們看到，世界的無數面孔<br/>冷漠的，熱情的<br/>罪惡的，善良的<br/>激進的，保守的<br/>偏執的，包容的<br/>抱怨的，感恩的<br/>充滿智慧與愛的"
                        ,"每一個時代都有屬它的夢想者與實踐者<br/>他們不畏重負，禮贊智慧<br/>只爲重拾那些被遺失的夢想"
                        ,"自區塊鏈出現之時，新的時代已被打開<br/>它將世界重新格式化，顛覆信任與連接的認知<br/>它蘊藏著無窮的力量，重塑時代的巨大力量<br/>我們始終在求索，它應該爲誰效勞"
                        ,"我們珍視愛的力量<br/>那是人類從古至今的永恒財富<br/>我們崇尚科技的偉大<br/>那是人類數千年探索的文明之光<br/>而信任，才是人類進步與發展的不變根基"
                        ,"M.A Blockchain的誕生<br/>用人文重新定義科技的價值<br/>它將逆轉愛的消逝<br/>指引我們銘記應有的生存之道"
                        ,"當我們的每一次投票<br/>爲困頓掙扎的人增添一抹笑容<br/>當我們的每一筆支付<br/>爲寒冷饑餓的孩子點燃生活希望<br/>當我們的每一聲祝福<br/>被世界上更多的人感知幷贊許<br/>你會發現，你不再只是那個你認爲的自己<br/>你將影響這個世界的每一個人"
                        ,"你終會看到<br/>智慧與愛，才是人類最强大的事物<br/>你終會看到<br/>如果沒有愛，再偉大的科技也沒有任何價值<br/>你終會看到<br/>一個充滿信任、分享、感恩、自由的新世界"
                        ,"我們要做冥冥之中，那些我們注定要做的事情<br/>我們不會畏懼那些質疑的目光<br/>我們不會害怕那些遙遠的未知<br/>我們更不會向任何困難做出一點讓步<br/>因爲，我們擁有信仰與理想<br/>而絕不僅僅，只是爲了活著"
                        ,"珍視我們的智慧吧<br/>它將成爲我們未來的指引<br/>讓它發光，讓它在被需要的地方煥發光芒<br/>保持鬥志，保持初心，保持感恩<br/>它已如黎明般到來"
                        ],
                        ["It is the time for us to re-examine this time<br/>This time we create and keep together<br/>This time glory and undercurrent coexist, and not quite perfect"
                        ,"We see countless faces of the world<br/>Indifferent, enthusiastic <br/>Evil, kind<br/>Radical, conservative<br/>Paranoid, comprehensive<br/>Complaining, grateful<br/>Full of wisdom and love"
                        ,"Every time has its own dreamers and practitioners<br/>They are not afraid of the burden, in praise of wisdom<br/>Only for restoring the lost dreams"
                        ,"While the block chain appears, the new time has been opened<br/>It re-formats the world, and subverts the perception of trust and connection<br/>It contains infinite power, the great power of remodeling the times <br/>We are always seeking, it should serve for who"
                        ,"We cherish the power of love<br/>It is the eternal wealth of mankind throughout history<br/>We believe in the magnificence of science and technology<br/>It is the light of civilization that human explore thousands of years<br/>but trust, it is the eternal foundation of human progress and development"
                        ,"The birth of M.A Blockchain<br/>Redefines the value of science and technology with humanities<br/>It will reverse the passing of love<br/>And guide us to remember the proper way to survive"
                        ,"When every time we vote<br/>Adding a touch of smile for struggling people in the hardship <br/>When each of our payments<br/>Lighting the hope of life for the children in cold and hungry <br/>When each of our blessings<br/>To be perceived and praised by more people in the world<br/>You will find that you are no longer just what you think of yourself<br/>You will affect everyone in the world"
                        ,"You will understand<br/>Wisdom and love are the most powerful thing of mankind<br/>You will understand<br/>If there is no love, then there is no value for great science and technology <br/>You will understand<br/>A new world full of trust, sharing, gratitude and freedom"
                        ,"We should do what we are destined to do<br/>We will not be afraid of those skeptical eyes<br/>We will not be afraid of those distant unknown<br/>We will not make any concessions to any difficulty<br/>Because we have faith and ideals<br/>But not just to live"
                        ,"Please cherish our wisdom<br/>It will guide our future<br/>Let it glow, in the place where it is needed<br/>Keeping fighting, keeping your original heart, and staying grateful<br/>It is coming like dawn "
                        ]
                    ];
     var htmltext = "";
     console.log(_lang)
     switch(_lang){
                case "zh":
                    htmltext +="<h2 class='main-title'>《M.A Blockchain宣言》</h2>";
                    for( var i=0; i<maintext[0].length;i++){
                        htmltext += "<p>"+maintext[0][i]+"</p>";
                    };
                    htmltext += "<h3>— —M.A Blockchain志愿者开发团队</h3>"+
                                "<h4>重塑社会信任基础，焕发人性善良光辉</h4>";
                    $(".video-title").html("人文蓝图，致敬初心");
                    break;
                case "tw":
                    htmltext +="<h2 class='main-title'>《M.A Blockchain宣言》</h2>";
                    for( var i=0; i<maintext[1].length;i++){
                        htmltext += "<p>"+maintext[1][i]+"</p>";
                    };
                    htmltext += "<h3>— —M.A Blockchain志願者開發團隊</h3>"+
                                "<h4>重塑社會信任基礎，煥發人性善良光輝</h4>";
                    $(".video-title").html("人文藍圖，致敬初心");
                    break;
                case "en":
                    htmltext +="<h2 class='main-title'>The Declaration of M.A Blockchain</h2>";
                    for( var i=0; i<maintext[2].length;i++){
                        htmltext += "<p>"+maintext[2][i]+"</p>";
                    };
                    htmltext += "<h3>— —M.A Blockchain Volunteer development team</h3>"+
                                "<h4>Rebuilding the foundation of social trust, <br/>and glowing the goodness of human nature</h4>";
                    $(".video-title").html("A humanistic blueprint for<br/> the original intention");
                    $(".en-down-bor").css("top","16px")
                    break;
            }
        $(".main-text").html(htmltext);
        if(navigator.userAgent.match(/(iPhone|iPod|Android|ios)/i)){ //移动端英文字号及行间距进行变化
                    if(_lang == "en"){
                        $(".main .main-text").css({
                            "font-size" : "0.24rem"
                        });
                        $(".main .main-text").find("p").css({
                            "line-height":"0.36rem"
                        });
                        $(".footer-text .text-head li").css({
                            "line-height":"0.20rem"
                        })
                        $(".footer-text .text-head span").css({
                            "top":"0.03rem"
                        })
                    }else{
                        $(".main-text").css("padding-top","3rem");
                    }
        };
        $("#sub-text").on('keyup',function(){
            var subtext = $("#sub-text").val();
            var mynum = 1000 - getByteLen(subtext);
             if(subtext == "" || $.trim(subtext) == ""){
                $(".text-show").show();
                $(".text-hide").hide();
             }
             else{
                $(".text-hide").show();
                $(".text-show").hide();
                $(".text-num").html(mynum);
                if(mynum < 0){
                    $(this).css("color","red");
                    $(".text-num").html("0");
                    //$(".text-hide").html("您输入的字数过多，请删除 "+(-mynum)+" 字");
                }else{
                    $(this).css("color","#000");
                    $(".text-num").html(mynum);
                }
             }
             
        });
        function getByteLen(val) {
          var len = 0;
          for (var i = 0; i < val.length; i++) {
            var a = val.charAt(i);
            if (a.match(/[^\x00-\xff]/ig) != null) {
              len += 1;
            }
            else {
              len += 0.5;
            }
          }
          return Math.ceil(len);
        };
         $("#upbtn").on("click",function(){
            var subtext = $("#sub-text").val();
            html_encode(subtext);
            var mynum = 1000 - getByteLen(subtext);
            var alertHtml = "";
            if( mynum < 0 || mynum == 1000 || $.trim(subtext) == ""){
                alertBoxNew({
                    alertContent: '<@spring.messageText "fund.notice.text15" "输入内容不能为空或者大于1000字"/>',
                    btnType : "sure"
                });
            }
            else{
                $.ajax({
                    url:"/feedback/feedBackSubmit",
                    type:"POST",
                    data:{
                        content:html_encode(subtext)
                    },
                    success:function(data){
                        if(data.status == 0){
                            alertHtml = '<div class="reminder-modal" id="reminderModal">'+
                                            '<div class="reminder-bg"></div>'+
                                            '<div class="reminder">'+
                                                '<h2><@spring.messageText "fund.notice.text12" "您已成功提交申请！"/></h2>'+
                                                '<div class="reminder-text">'+
                                                        '<p><@spring.messageText "fund.notice.text13" "感谢您的参与，“世纪之约”获奖名单将于第四世纪公布，敬请期待！"/></p>'+
                                                '</div>'+
                                                '<div class="okbtn"><@spring.messageText "fund.notice.text14" "确定"/></div>'+
                                                '<span class="close-modal close-img"></span>'+
                                            '</div>'+
                                            '</div>';
                            $("body").append(alertHtml);
                            $(".okbtn").on("click",function(){
                                okbtntext();
                            });
                            $(".close-modal").on("click",function(){
                                okbtntext();
                            });

                        }else{
                                alertBoxNew({
                                    alertContent: data.error.message,
                                    btnType : "sure"
                                });
                        }
                    }
                });
            }
         });
         //字符串转义
 function html_encode(str){   
          var s = "";   
          if (str.length == 0) return "";   
          s = str.replace(/&/g, "&gt;");   
          s = s.replace(/</g, "&lt;");   
          s = s.replace(/>/g, "&gt;");   
          s = s.replace(/ /g, "&nbsp;");   
          s = s.replace(/\'/g, "&#39;");   
          s = s.replace(/\"/g, "&quot;"); 
          return s;   
}
function alertBoxNew(data){
    $('#alertWrap').remove();
    $('#alertbg').remove();
    $('#alertWrap').off();
    /*初始化*/
    var alertWidth = '360px';
    if(data.alertWidth){
        alertWidth = data.alertWidth;
    }
    var alertTitle = 'alertStrTit';
    if(data.alertTitle){
        alertTitle = data.alertTitle;
    }
    var alertContent = data.alertContent;
    var alertType = 'none';
    if(data.alertType){
        alertType = data.alertType;
    }
    var btnType = 'all';
    if(data.btnType){
        btnType = data.btnType;
    }
    var sureText = 'alertStrok';
    if(data.sureText){
        sureText = data.sureText;
    }
    var cancelText = 'alertStrcancel';
    if(data.cancelText){
        cancelText = data.cancelText;
    }
    if(data.sureFunc){
        var sureFunc = data.sureFunc;
    }
    if(data.cancelFunc){
        var cancelFunc = data.cancelFunc;
    }
    var $alertbg=$('<div id="alertbg"></div>');
    var $alertWrap=$('<div id="alertWrap"></div>');
    //国际化
    var _lang=langType();
    $.i18n.properties({
        name : 'strings', //资源文件名称
        path : '/static/i18n/', //资源文件路径https://o5uaa1ha4.qnssl.com
        cache: true,
        mode : 'map', //用Map的方式使用资源文件中的值
        language : _lang,
        callback : function() {
            var _re=/^alertStr/;
            if(_re.test(alertTitle)) 
            {   
                alertTitle = $.i18n.prop(alertTitle);           
            }
            if(_re.test(alertContent))
            {   
                alertContent = $.i18n.prop(alertContent);           
            }
            if(_re.test(sureText)) 
            {   
                sureText = $.i18n.prop(sureText);           
            }
            if(_re.test(cancelText)) 
            {   
                cancelText = $.i18n.prop(cancelText);           
            }
            alertHtml();
        }
    });

    function alertHtml(){
        var _alertBg='<div class="alert-bg">';
        if(btnType=='none'){
            _alertBg += '<i class="alert-closer">X</i>'
        }
        _alertBg += alertTitle+'</div>';

        var btnStr='<div class="alert-box">';
        if (alertType == 'warning') {
            btnStr+='<i class="alert-icon alert-warning"></i>';
        } else if(alertType == 'success'){
            btnStr+='<i class="alert-icon alert-success"></i>';
        };

        var _alertContainer='<div class="alert-text text-center">'+alertContent+'</div>';
        btnStr+=_alertContainer;
        if(btnType=='sure'){
            btnStr+='<div class="text-center top20">'
            btnStr+='<button class="btn-default-black alert-sure">'+sureText+'</button>';
            btnStr+='</div>';
        }else if(btnType=='cancel'){
            btnStr+='<div class="text-center top20">'
            btnStr+='<button class="btn-default-black alert-cancel">'+cancelText+'</button>';
            btnStr+='</div>';
        }else if(btnType=='all'){
            btnStr+='<div text-center class="top20">'
            btnStr+='<button class="btn-default-black right20 alert-sure mid-btn" id="dianji">'+sureText+'</button>';
            btnStr+='<button class="btn-default-black alert-cancel mid-btn mid-btn-cancel-color">'+cancelText+'</button>';
            btnStr+='</div>';
        }

        btnStr+='</div>';

        $alertWrap
            .empty()
            .append(_alertBg)
            .append(btnStr);
        $alertbg.appendTo($('body'));
        $alertWrap.appendTo($('body'));
        var wrap_ht=$alertWrap.height();
        $alertWrap.css({
            // 'marginTop': '-'+parseInt(wrap_ht/2)+'px',
            'width': alertWidth
        });;
    }

    $alertWrap.on('click','.alert-sure',function(){
        $alertWrap.fadeOut(200,function(){
            $(this).remove();
            $alertbg.remove();
        });
        if(sureFunc){
             sureFunc();
        } 
    })

    $alertWrap.on('click','.alert-cancel',function(){
        $alertWrap.fadeOut(200,function(){
            $(this).remove();
            $alertbg.remove();
        });
        if(cancelFunc){
            cancelFunc();
        } 
    })
    $alertWrap.on('click','.alert-closer',function(){
        $alertWrap.fadeOut(200,function(){
            $(this).remove();
            $alertbg.remove();
        });
    })
    $alertbg.on('click',function(){
        $alertWrap.fadeOut(200,function(){
            $(this).remove();
            $alertbg.remove();
        });
    })
}

function getCookie(name){
    var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
    if(arr=document.cookie.match(reg))
        return unescape(arr[2]);
    else
        return null;
}

//判定国际化文字类别
function langType(){
    var locale = getCookie("locale");
    var langObj={'zh_CN':'zh','zh_TW':'tw','en_US':'en'};
    if(locale==null)
        return 'tw';
    else
    {
        return langObj[locale];
    }
}
         function okbtntext(){
            $(".reminder-modal").remove();
            $("#sub-text").val("");
            $(".text-show").show();
            $(".text-hide").hide();
         }
        <#if SS_USERNAME?exists >
            $(".wrap-text").hide();
            $("#sub-text").show();
            $(".text-show").show();
            $("#upbtn").show();
        <#else>
            $(".wrap-text").show();
            $("#sub-text").hide();
            $(".text-show").hide();　
            $("#upbtn").hide();

        </#if>
    </script>
<div style="display: none;">
    <script src="https://s4.cnzz.com/z_stat.php?id=1258113243&web_id=1258113243" language="JavaScript"></script>
</div>
</body>
</html>