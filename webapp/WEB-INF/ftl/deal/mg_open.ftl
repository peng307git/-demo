<#include "common/base-v2.ftl" />
<#macro title>
    <@spring.messageText "open.mg.text2" "账目公开"/>
</#macro>
<#macro head>
    <link rel="stylesheet" type="text/css" href="/static/css/openmg.css">
</#macro>
<#macro body>
    <#assign nav_page="open">
        <#assign nav_sub_page="open_mg">
            <div class="wrap">
                <#include "common/header.ftl">
                    <div id="bd">
                        <div class="bd-inner">
                            <div class="page-title text-center">
                                <h2><@spring.messageText "open.mg.text2" "账目公开"/></h2>
                            </div>
                            <div class="accounts-publish">
                                <h3><@spring.messageText "open.account.text1" "M.A Blockchain全球MG账目公开"/></h3>
                                <div class="accounts-publish-date"><@spring.messageText "open.account.text2" "数据更新时间："/>${p.addTime?string("yyyy-MM-dd")}(<@spring.messageText "pop.utc.text4" "格林尼治时间"/>)</div>
                                <div class="accounts-publish-item accounts-publish-mnTotal">
                                    <h4><@spring.messageText "open.account.text3" "MN总发行量"/></h4>
                                    <p>${p.mnTotal?string(",###")}</p>
                                </div>
                                <div class="accounts-publish-item accounts-publish-mgExtractTotal">
                                    <h4><@spring.messageText "open.account.text4" "未认证MG总量"/></h4>
                                    <p>${p.mgExtractTotal?string(",###.0000")}</p>
                                </div>
                                <div class="accounts-publish-item accounts-publish-mgApprovedTotal">
                                    <h4><@spring.messageText "open.account.text5" "已认证MG总量"/></h4>
                                    <p>${p.mgApprovedTotal?string(",###.0000")}</p>
                                </div>
                                <div class="accounts-publish-item accounts-publish-mgMindassetTotal">
                                    <h4><@spring.messageText "open.account.text6" "开发者团队持有资金"/></h4>
                                    <p>${p.mgMindassetTotal?string(",###")}</p>
                                </div>
                                <div class="accounts-publish-item accounts-publish-mgExtractCirculateProportion">
                                    <h4><@spring.messageText "open.account.text7" "Mind Asset系统流通资金"/></h4>
                                    <p>${p.mgExtractCirculateProportion?string(",###")}</p>
                                </div>
                                <div class="accounts-publish-item accounts-publish-mgGlobalTotal">
                                    <h4><@spring.messageText "open.account.text8" "MG总持有量"/></h4>
                                    <p>${p.mgGlobalTotal?string(",###.0000")}</p>
                                </div>
                                <div class="accounts-publish-item accounts-publish-firstCBlockInterval">
                                    <h4><@spring.messageText "open.account.text9" "MG总locktime量"/></h4>
                                    <p>${p.firstCBlockInterval?string(",###.0000")}</p>
                                </div>
                                <div class="accounts-publish-item accounts-publish-mgCirculateTotal">
                                    <h4><@spring.messageText "open.account.text10" "MG剩余可交易流通量"/></h4>
                                    <p>${p.mgCirculateTotal?string(",###.0000")}</p>
                                </div>
                                <div class="accounts-publish-item accounts-publish-mgCirculateTotal2">
                                    <h4><@spring.messageText "open.account.text10" "MG剩余可交易流通量"/></h4>
                                    <p class="accounts-publish-mgCirculateTotal2-percent">${(p.mgCirculateTotal/p.mnTotal*100)?string(".00")}%</p>
                                    <p>${p.mgCirculateTotal?string(",###.0000")}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <#include "/decorators/footer.ftl">
            </div>
</#macro>
<#macro footerjs>
    </script>
</#macro>