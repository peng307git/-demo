<#include "common/base-v2.ftl" />
<#macro title>
<@spring.messageText "open.mg.text2" "账目公开"/>
</#macro>
<#macro head>
<link rel="stylesheet" type="text/css" href="/static/css/openmg.css">
</#macro>

<#macro body>

<#assign nav_page="open" >
<#assign nav_sub_page="open_mind" >
<div class="wrap">
<#include "common/header.ftl" >
    <div id="bd">
        <div class="bd-inner">
            <div class="page-title text-center">
                <h2><@spring.messageText "open.mg.text2" "账目公开"/></h2>
            </div>
            <div class="page-content deal-page-content clearfix">
                <div class="col-m">
                    <div class="m-wrap mind_wrap">
                         <div class="head_img">
                           <h2><@spring.messageText "open.mg.text3" "其他持有者账目公开"/></h2>
                           <p><@spring.messageText "open.mg.text4" "备注：数据更新时间:"/><span class="head_time">${p.addTime?string("yyyy-MM-dd")}</span></p>
                        </div>
                       <table class="mind_table">
                              <tr>
                                <td>MN<@spring.messageText "open.mg.text5" "总发行量"/></td>
                                <td class="towtd">${p.mnTotal}</td>
                              </tr>
                              <tr>
                                <td><@spring.messageText "open.mg.text6" "认证MG总量"/></td>
                               
                                <td class="towtd">${p.mgApprovedTotal}</td>
                              </tr>
                              <tr>
                                <td><@spring.messageText "open.mg.text7" "提出"/>MG</td>
                                <td class="towtd">${p.mgExtractTotal}</td>
                              </tr>
                              <tr>
                                <td><@spring.messageText "open.mg.text10" "收购MG总量"/></td>
                              
                                <td class="towtd">${p.mgPurchaseTotal}</td>
                              </tr>
                      </table>
                  </div>
                </div>
                <div class="col-s">
                    <#include "common/mg_side_nav.ftl" >
                </div>
            </div>
        </div>
    </div>
<#include "/decorators/footer.ftl" >
</div>
</#macro>

<#macro footerjs>

</script>
</#macro>
