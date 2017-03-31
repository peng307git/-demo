<#include "common/base-v2.ftl" />
<#macro title>
    <@spring.messageText "safety.text1" "安全中心"/>
</#macro>
<#macro head>
<link rel="stylesheet" type="text/css" href="/static/css/safety.css" />
</#macro>

<#macro body>
    <#assign nav_page="user" >
    <#assign nav_sub_page="user_safety" >
<div class="wrap">
    <#include "common/header.ftl" >
    <div id="bd">
        <div class="bd-inner">
            <div class="page-title">
                <h2><@spring.messageText "index.header.text2" "首页"/> / 账户</h2>
            </div>
            <div class="page-content deal-page-content clearfix">
                <div class="col-m">
                    <div class="m-wrap">
                        <div class="detail">
                            <h3>提交新的密保问题</h3>
                            <div class="title">您正在为<span class="blue">${user.telephone}</span>修改密保问题</div>

                            <form method="post" action="#">

                                <label for="q1"></label>

                                <input name="question[0]">
                            </form>

                        </div>
                    </div>
                </div>
                <div class="col-s">
                    <#include "common/user_side_nav.ftl" >
                </div>
            </div>
        </div>
    </div>
    <#include "/decorators/footer.ftl" >
</div>
</#macro>
<#macro footerjs>
<script type="text/javascript" src="/static/js/business/paging.js"></script>
<script>
    $(function(){

    });
</script>
</#macro>