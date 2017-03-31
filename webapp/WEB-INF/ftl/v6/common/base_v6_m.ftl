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
        <link rel="stylesheet" type="text/css" href="/static/v6/css/base_m.css">
        <#if head?exists>
            <@head/>
        </#if>
    </head>
    <body>
        <#if body?exists>
            <@body/>
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