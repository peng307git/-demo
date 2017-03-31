<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
        <meta name="description" content="des "/>
        <link rel="shortcut icon" href="/static/images/favicon.ico" type="image/x-icon" />
        ${NewRelic.getBrowserTimingHeader()}
        <title>
            <#if title?exists>
                <@title/>
            </#if>
        </title>
        <link rel="stylesheet" type="text/css" href="/static/v6/css/base.css">
        <link rel="stylesheet" type="text/css" href="/static/v6/css/iconfont.css">
        <link rel="stylesheet" type="text/css" href="/static/v6/css/main.css">
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
                            <b class="apper marlef10 android  active"><strong>&nbsp;</strong>Android</b><b class="apper ios"><strong>
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
        <script>
            //login status
            var IS_LOGIN = <#if SS_USERNAME?exists >true<#else>false</#if>;
            //i18n
            var I18N = (function(){
                var LANGS = {
                    "ok" : '111',
                    "setUtc":'<@spring.messageText "pop.utc.text7" "设置时区"/>',
                    "changeUtc":'<@spring.messageText "pop.utc.text8" "选择时区"/>',
                    "pop.utc.text6":'<@spring.messageText "pop.utc.text6" "系统已经为您定位当前时区<br/>您也可以在这里自行更换时区"/>',
                    "pop.utc.text9":'<@spring.messageText "pop.utc.text9" "知道了"/>'
                };
                return {
                    addLang: function(langs){
                        for(var i in langs){
                            if(langs.hasOwnProperty(i)){
                                LANGS[i] = langs[i];
                            }
                        }
                    },
                    prop: function(key){
                        if (typeof LANGS[key] === "undefined"){
                            return key;
                        }
                        return LANGS[key];
                    },
                    list: function(){
                        console.log(LANGS);
                    }
                }
            })();
        </script>
        <#if footerjs?exists>
            <@footerjs/>
        </#if>
        ${NewRelic.getBrowserTimingFooter()}
        <div style="display: none;">
            <script src="https://s4.cnzz.com/z_stat.php?id=1258113243&web_id=1258113243" language="JavaScript"></script>
        </div>
    </body>
</html>
