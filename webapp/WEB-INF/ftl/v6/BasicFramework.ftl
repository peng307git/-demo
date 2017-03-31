<#include "v6/common/base_v6.ftl" />
<#macro title>
<@spring.messageText "news.title" "最新动态"/>
</#macro>
<#macro head>
    <!-- <link rel="stylesheet" type="text/css" href="/static/v6/css/BasicFramework.css"> -->
</#macro>

<#macro body>
    <#assign nav_page="reports" >
    <#assign nav_sub_page="reports_news" >

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
                <#include "v6/common/header.ftl" >
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

    <#include "v6/common/footer.ftl">
</#macro>


<#macro footerjs>
    <script src="/static/v6/js/lib/require.js"></script>
    <script type="text/javascript">
        require.config({
            baseUrl: '/',
            paths: {
                jquery: '/static/v6/js/lib/jquery-1.11.2.min',
            }
        });
        require(['static/v6/js/page/BasicFramework']);
    </script>
</#macro>