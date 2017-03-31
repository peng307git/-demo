<!DOCTYPE HTML>
<!--STATUS OK-->
<#assign staticDomain=''>
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
        <link rel="stylesheet" type="text/css" href="/static/css/v6/base.css">
        <link rel="stylesheet" type="text/css" href="/static/css/common.css">

        <#if head?exists>
            <@head/>
        </#if>
    </head>
    <body>
        <#if body?exists>
            <@body/>
        </#if>
        <script src='/static/js/jquery-1.11.2.min.js'></script>
        <script src='/static/js/jquery.i18n.properties-1.0.9.js'></script>
        <script src='/static/js/bootstrap.min.js'></script>
        <script src="/static/js/jsencrypt.js"></script>
        <script src="/static/js/old-common.js"></script>
        <script>
            var PUBLICKEY = 'MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCW0Cotn0F+d+Qin6T4+eb1LH898XzR15kjS6JOzDyAZy3mrJ5YeUXI9kPcN/6igzHi8n29uObRH2S/lHGuWVXbAHk5QdaPansMfGTPcpNYPGY9vDI6Apz0KfYSkUEDOzCartjH+DUYyd3fU33GyQVZfVrFgePCJ68QWhAfgXg9oQIDAQAB';
            var ENCRYPT = new JSEncrypt();
            ENCRYPT.setPublicKey(PUBLICKEY);
        </script>
        <script>
                var ISLOGIN
            <#if SS_USERNAME?exists >
                ISLOGIN = true ;
            <#else>
                ISLOGIN = false ;
            </#if>
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
