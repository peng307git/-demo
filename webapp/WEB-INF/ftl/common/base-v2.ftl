<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
    <meta name="description" content="des "/>
    <link rel="shortcut icon" href="/static/images/favicon.ico" type="image/x-icon"/>
${NewRelic.getBrowserTimingHeader()}
    <title>
    <#if title?exists>
                <@title/>
            </#if>
    </title>
    <link rel="stylesheet" type="text/css" href="/static/v6/css/iconfont.css">
    <link rel="stylesheet" type="text/css" href="/static/css/base-v2.css">
    <link rel="stylesheet" type="text/css" href="/static/css/common.css">
<#if head?exists>
    <@head/>
</#if>
</head>
<body>
<#if body?exists>
    <@body/>
</#if>

<#if SS_USERNAME?exists >
<div class="app-pop">
    <a class="app-pop-nav" href="javascript:void(0)">
        <em><@spring.messageText "pop.utc.text0" "扫码下载"/></em>
        <i></i>
        <div class="app-pop-box app-pop-tip">
            <b class="apper android  active"><strong>&nbsp;</strong>Android</b><b class="apper ios"><strong>
            &nbsp;</strong>IOS</b>
            <img src='/static/images/APPDownloadAndroid.png'>
            <img src='/static/images/APPDownloadIOS.png' style="display:none">
            <div><@spring.messageText "pop.utc.text1" "扫码下载"/><br/>Infinite Mind APP</div>
            <p><span><@spring.messageText "recharge.opta_mindlink_text" "Mind Link使用说明"/></span></p>
            <!-- <p><a target="_blank" href="<@spring.messageText "recharge.opta_note" "/static/landing_zh_TW.html"/>"><@spring.messageText "recharge.opta_note_text" "點擊查看APP操作說明"/></a></p> -->
        </div>
    </a>
    <a class="app-pop-nav " href="javascript:void(0)">
        <em><@spring.messageText "pop.utc.text2" "当前时区"/></em>
        <i></i>
        <div class="app-pop-box app-pop-time">
            <div>
                <@spring.messageText "pop.utc.text3" "当前时间"/>：
                <b id="time-now"></b>
                <span><@spring.messageText "pop.utc.text4" "格林尼治时间"/><br/> <strong id="time-UTC"></strong></span>
            </div>
            <div>
                <@spring.messageText "pop.utc.text2" "当前时区"/>：
                <b id="UTC"></b>
                <span id="UTC-add"></span>
                <input type="hidden" id="inputUTC" value="">
                <input type="hidden" id="userUtcNumber" value="">
            </div>
            <button id="changeUTC">
                <@spring.messageText "pop.utc.text5" "更换时区"/>
            </button>
        </div>
    </a>
</div>
</#if>

<div class="modal mine-modal" id="videoModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                    aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="exampleModalLabel">Mind Link</h4>
            <video width="100%" height="100%" id="myVideo" poster='/static/images/video-poster-2.jpg' controls>
                <source src="https://o4we6sxpt.qnssl.com/mindlink_course.mp4" type='video/mp4'/>
                <object type="application/x-shockwave-flash" name="player" width="100%" height="100%" id="player"
                        style="visibility: visible;">
                    <param name="allowFullScreen" value="true">
                    <param name="allowScriptAccess" value="always">
                    <param name="bgcolor" value="#000000">
                </object>
            </video>
        </div>
    </div>
</div>


<script src='/static/js/jquery-1.11.2.min.js'></script>
<script src='/static/js/jquery.i18n.properties-1.0.9.js'></script>
<script src='/static/js/bootstrap.min.js'></script>
<script src="/static/js/jsencrypt.js"></script>
<script src="/static/js/old-common.js"></script>
<script>
    var PUBLICKEY = 'MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCW0Cotn0F+d+Qin6T4+eb1LH898XzR15kjS6JOzDyAZy3mrJ5YeUXI9kPcN/6igzHi8n29uObRH2S/lHGuWVXbAHk5QdaPansMfGTPcpNYPGY9vDI6Apz0KfYSkUEDOzCartjH+DUYyd3fU33GyQVZfVrFgePCJ68QWhAfgXg9oQIDAQAB';
    var ENCRYPT = new JSEncrypt();
    ENCRYPT.setPublicKey(PUBLICKEY);

    //login status
    var IS_LOGIN = <#if SS_USERNAME?exists >true<#else>false</#if>;

    //i18n
    var I18N = (function () {
        var LANGS = {
            "ok": "111"
        };
        return {
            addLang: function (lang) {
                $.extend(LANGS, lang);
            },
            prop: function (key) {
                if (typeof LANGS[key] === "undefined") {
                    return key;
                }
                return LANGS[key];
            },
            list: function () {
                console.log(LANGS);
            }
        }
    })();
</script>
<#if SS_USERNAME?exists >
<script>

    $(function () {
        //右侧悬浮，切换时区。
        $('.app-pop').on('click', '.app-pop-nav', function(event) {
            event.stopPropagation();
            $('.app-pop .app-pop-box').hide()
            $('.app-pop .app-pop-nav').removeClass('active');
            $(this).addClass('active');
            var appPopBox = $(this).find('.app-pop-box');
            appPopBox.show();
        });
        
        $(document).click(function () {
            $('.app-pop .app-pop-box').hide();
            $('.app-pop .app-pop-nav').removeClass('active');
        });
        $('.app-pop-tip span').on('click', function () {
            $('#videoModal').modal('show');
            $("#myVideo")[0].play();
        });
        $('#videoModal').on('hidden.bs.modal', function () {
            $("#myVideo")[0].pause();
        });
        $(".modal").click(function (event) {
            event.stopPropagation();
        });
        $(document).on('click', '#alertWrap', function (event) {
            event.stopPropagation();
        });
        $(document).on('click', '.utcStorage', function (event) {
            event.stopPropagation();
        });
        // $.getScript('http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js',function(){
        //     $("#UTC-add").text(remote_ip_info.country+", "+ remote_ip_info.province +", "+remote_ip_info.city)
        // });

        // function calcTime(offset) {
        //     d = new Date();
        //     utc = d.getTime() + (d.getTimezoneOffset() * 60000);
        //     nd = new Date(utc + (3600000*offset));
        //     return nd.toLocaleString();
        // }
        // console.log(calcTime());
        var localUtc = 'UTC ' + getUtc();
        $.ajax({
            url: '/user/info/cache/locale',
            type: 'GET',
            dataType: 'json',
            success:function(data){
                if(data.data&&data.data!=null){
                    utcNow(data.data);
                }else{
                    changeTime();
                    UTCSetStorage();
                }
                
            }
        })
        
        function utcNow(data) {
            var utcAdd = "";
            var _lang = langType();
            //console.log(_lang);
            if (_lang == "en") {
                utcAdd = data.en;
            } else if (_lang == "zh") {
                utcAdd = data.cn;
            } else if (_lang == "tw") {
                utcAdd = data.tw;
            }
            $("#UTC-add").text(utcAdd);
            $("#inputUTC").attr('value', data.utcNu);
            $("#userUtcNumber").attr('value', data.number);
            changeTime();
        }
        function UTCSetStorage(){
            var isUTCSet = localStorage.getItem('isUTCSet') || 0;
            var $htmlUTCSet=$('<div class="utcStorage"></div>');
            if(!isUTCSet){
                $(".app-pop-nav").trigger('click');
                var htmlStorage = [
                    '<img src="/static/v6/images/nomd5/bline.png" >',
                        '<p><@spring.messageText "pop.utc.text6" "系统已经为您定位当前时区<br/>您也可以在这里自行更换时区"/></p>',
                    '<button class="btn"><@spring.messageText "pop.utc.text9" "知道了"/></button>'
                ].join("");
                $htmlUTCSet.empty().append(htmlStorage);
                //console.log($htmlUTCSet.html());
                $htmlUTCSet.appendTo($('body'));
            }
            $(document).on('click', '.utcStorage button', function(event) {
                event.preventDefault();
                /* Act on the event */
                localStorage.setItem('isUTCSet', 1);
                $htmlUTCSet.remove();
                $('.app-pop .app-pop-box').hide()
                $('.app-pop .app-pop-nav').removeClass('active');
            });
        };

        function changeTime() {
            var inputUTC = $("#inputUTC").val().split("UTC")[1];
            updateTime();
            function updateTime() {
                var mydate = new Date();
                var myDateOff = mydate.getTimezoneOffset();
                var utc = mydate.getTime() + (myDateOff * 60000);
                var UTCDate = new Date(utc);
                $("#time-UTC").text(getTheTime(UTCDate));
                if (inputUTC && inputUTC !== "") {
                    var nute = inputUTC.split(":");
                    var mute;
                    if (inputUTC.split("+").length == 2) {
                        mute = Math.abs(nute[0]) + Number(nute[1] / 60);
                    } else if (inputUTC.split("-").length == 2) {
                        mute = -(Math.abs(nute[0]) + Number(nute[1] / 60));
                    }
                    var nd = new Date(utc + (3600000 * mute));
                    $("#time-now").text(getTheTime(nd));
                } else {
                    $("#time-now").text(getTheTime(mydate));
                }
            }

            setInterval(updateTime, 30000);
            if (inputUTC && inputUTC !== "") {
                $("#UTC").text('UTC ' + inputUTC);
            } else {
                $("#UTC").text(localUtc);
            }
        }

        function getTheTime(nS) {
            var d = new Date(nS);
            var date = (d.getFullYear()) + "-" +
                            Double((d.getMonth() + 1)) + "-" +
                            Double(d.getDate()) + " " +
                            Double(d.getHours()) + ":" +
                            Double(d.getMinutes())
            //+ ":"+ Double(d.getSeconds())
                    ;
            return date;
        }

        function Double(nun, jia) {
            if (nun < 10 && nun >= 0) {
                if (jia) {
                    return jia + "0" + Math.abs(nun);
                } else {
                    return "0" + Math.abs(nun);
                }
            } else if (nun < 0 && nun > -10) {
                return "-0" + Math.abs(nun);
            } else {
                return nun;
            }
        }

        //设置时区
        function getUtc() {
            // var myudate = new Date();
            // var myuDateOff = myudate.getTimezoneOffset();
            // console.log(myuDateOff);

            var thisDate = new Date();
            var myDateOff = thisDate.getTimezoneOffset();
            var absNun = Math.abs(myDateOff * 60000);
            var mydate = new Date(absNun);
            //console.log(mydate.toString());
            var utc = mydate.getTime() + (myDateOff * 60000);
            var newDate = new Date(utc);
            //console.log(newDate.toString());
            var date = Double(newDate.getHours()) + ":" +
                    Double(newDate.getMinutes());
            //console.log(date);
            if (myDateOff >= 0) {
                return "-" + date;
            } else {
                return "+" + date;
            }
        }

        var _lang = langType();

        $("#changeUTC").on('click', function (event) {
            event.preventDefault();
            var listU = "";
            var content = "";
            var userUtcNumber = $("#userUtcNumber").val();

            $.ajax({
                url: '/static/js/business/utc.json',
                type: 'GET',
                dataType: 'json',
                data: {},
                success: function (data) {
                    for (var i = 0; i < data.length; i++) {
                        var utcNustr = "";
                        if (_lang == "zh") {
                            utcNustr = data[i].cn;
                        } else if (_lang == "en") {
                            utcNustr = data[i].en;
                        } else if (_lang == "tw") {
                            utcNustr = data[i].tw;
                        }
                        if (!userUtcNumber || userUtcNumber == "") {
                            if (data[i].utcNu == localUtc) {
                                userUtcNumber = data[i].number;
                            }
                        }
                        if (userUtcNumber == data[i].number) {
                            listU += '<option  selected="selected" value="' + data[i].number + '">(' + data[i].utcNu + ') ' + utcNustr + '</option>'
                        } else {
                            listU += '<option value="' + data[i].number + '">(' + data[i].utcNu + ') ' + utcNustr + '</option>'
                        }
                    }
                    ;
                    content = '<div class="changeTimeZone"><@spring.messageText "pop.utc.text8" "选择时区"/></div><div id="UTCList"><select name="UTCList">' + listU + '</select></div>';
                    alertBoxNew({
                        alertWidth: "480px",
                        alertTitle: '<@spring.messageText "pop.utc.text7" "设置时区"/>',
                        alertContent: content,
                        btnType: 'all',
                        sureFunc: function () {
                            var changeUTC = $("#UTCList option:selected").val();
                            $.ajax({
                                url: '/user/info/cache/locale/set',
                                type: 'post',
                                dataType: 'json',
                                data: {
                                    "localeId": changeUTC
                                },
                                success: function () {
                                    window.location.reload();
                                    console.log(changeUTC);
                                }
                            })
                        }
                    });
                }
            })
        });
        $('.app-pop-tip b').click(function () {
            var index = $(this).index();
            $('.app-pop-tip b').removeClass('active').eq(index).addClass('active');
            $('.app-pop-tip img').hide().eq(index).show();
        });

        //更新btc价格
        setInterval(
                function updateBtcInfo() {
                    $.ajax({
                        url: '/deal/getCurrentcoin',
                        type: 'GET',
                        success: function (data) {
                            if (data.status == 0) {
                                var $price = $('.topbar');
                                $price.find('.new-price').text("$ " + data.data['btcUsdPrice']);
                                $price.find('.new-mg-price').text("฿ " + parseFloat(data.data['mg_price']).toFixed(6));
                                var $btcAble = $price.find('.btc-able').text("¥ " + data.data['btcRmbPrice']);
                                var $dollarChange = $price.find('.dollar-change').text(data.data['balanceUsd']);
                                var $btcChange = $price.find('.btc-change').text(data.data['balanceBtc']);
                                var $mnChange = $price.find('.mn-change').text(data.data['mn']);
                                $price.find('.mg-change').text(data.data['mg']);
                                $price.find('.username-able').text(data.data['username']);
                            }
                        }
                    });
                    return updateBtcInfo;
                }(), 30 * 1000)

        
    })

</script>
</#if>
<script src="/static/js/topbar.js"></script>
<#if footerjs?exists>
    <@footerjs/>
</#if>
${NewRelic.getBrowserTimingFooter()}
<div style="display: none;">
    <script src="https://s4.cnzz.com/z_stat.php?id=1258113243&web_id=1258113243" language="JavaScript"></script>
</div>
</body>
</html>