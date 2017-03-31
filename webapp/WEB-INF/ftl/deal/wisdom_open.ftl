<#include "common/base-v2.ftl" />
<#macro title>
<@spring.messageText "open.mg.text2" "账目公开"/>
</#macro>
<#macro head>
<link rel="stylesheet" type="text/css" href="/static/css/openmg.css">
</#macro>

<#macro body>

<#assign nav_page="open" >
<#assign nav_sub_page="open_wisdom" >
<div class="wrap">
<#include "common/header.ftl" >
    <div id="bd">
        <div class="bd-inner">
            <div class="page-title text-center">
                <h2><@spring.messageText "open.mg.text2" "账目公开"/></h2>
            </div>
            <div class="page-content deal-page-content clearfix">
                <div class="col-m">
                    <div class="m-wrap">
                      
                       <div class="head_img wisdom_img">
                           <h2><@spring.messageText "open.mg.text27" "智慧资产全球发展基金会"/></h2>
                           <p><@spring.messageText "open.mg.text4" "备注：数据更新时间:"/><span class="head_time">${p.addTime?string("yyyy-MM-dd")}</span></p>
                       </div>
                       <div class="divtitle wisdom_title">
                            <strong class="bgtitle"></strong>
                             <span><@spring.messageText "open.mg.text30" "流动资金数据公开"/></span>
                             <div><@spring.messageText "open.mg.text35" " 创世纪区块产生约4.99亿MG,其中1亿目前作为智慧资产系统流动资金，用来保证用户认证的MG可以及时提取，1亿流通资金会随着区块减产比例而随之捐赠，比例为每世纪捐赠剩余流通资金总量的10%给到公益机构，来保持系统的平衡与稳定"/></div>
                        </div>
                         <div class="wisdom_ul wisdombgblack"><div class="wisdom_tab">
                                             <@spring.messageText "open.mg.text31" "发行流动池"/></div>
                                             <div class="wisdom_num1">34,345,546.156</div>
                         </div>
                         <div class="wisdom_ul"><div class="wisdom_tab">
                                             <@spring.messageText "open.mg.text32" "智慧银行地址"/>1:</div>
                                             <div class="wisdom_li">asdasdqwdasdasdasdwasdwdd</div>
                                             <div class="wisdom_color">34.251MG</div>
                         </div>
                         <div class="divtitle wisdom_title1">
                                             <strong class="bgtitle"></strong>
                                             <span><@spring.messageText "open.mg.text33" "开放团队收益数据公开"/></span>
                                             <div><@spring.messageText "open.mg.text36" "创世纪区块产生约4.99亿MG，其中1亿作为智慧资产全球发展基金会开发者团队收益部分，此部分在智慧银行中进行分期锁定"/></div>
                        </div>
                         <div class="wisdom_ul wisdombgblack"> <div class="wisdom_tab">
                                             <@spring.messageText "open.mg.text34" "持有MG总量"/>
                                             </div>  <div class="wisdom_num1">34,345,546.156</div>
                         </div>
                        <div class="wisdom_ul"> <div class="wisdom_tab">
                                             <@spring.messageText "open.mg.text32" "智慧银行地址"/>1:</div>
                                             <div class="wisdom_li">aaaaaaaaaaaaaaaaaaaaaaaaaaaa</div>
                                             <div class="wisdom_color">34.251MG</div>
                        </div>
                        <div class="wisdom_ul wisdombgblack"> <div class="wisdom_tab">
                                             <@spring.messageText "open.mg.text32" "智慧银行地址"/>2:</div>
                                             <div class="wisdom_li">aaaaaaaaaaaaaaaaaaaaaaaaaaaa</div>
                                             <div class="wisdom_color">34.251MG</div>
                        </div>
                        <div class="wisdom_ul"> <div class="wisdom_tab">
                                             <@spring.messageText "open.mg.text32" "智慧银行地址"/>3:</div>
                                             <div class="wisdom_li">aaaaaaaaaaaaaaaaaaaaaaaaaaaa</div>
                                             <div class="wisdom_color">34.251MG</div>
                        </div>
                        <div class="wisdom_ul wisdombgblack"><div class="wisdom_tab">
                                             <@spring.messageText "open.mg.text32" "智慧银行地址"/>4:</div>
                                             <div class="wisdom_li">aaaaaaaaaaaaaaaaaaaaaaaaaaaa</div>
                                             <div class="wisdom_color">34.251MG</div>
                        </div>
                        <div class="wisdom_ul"><div class="wisdom_tab">
                                             <@spring.messageText "open.mg.text32" "智慧银行地址"/>5:</div>
                                             <div class="wisdom_li">aaaaaaaaaaaaaaaaaaaaaaaaaaaa</div>
                                             <div class="wisdom_color">34.251MG</div>
                        </div>
                        <div class="wisdom_ul wisdombgblack"><div class="wisdom_tab">
                                             <@spring.messageText "open.mg.text32" "智慧银行地址"/>6:</div>
                                             <div class="wisdom_li">aaaaaaaaaaaaaaaaaaaaaaaaaaaa</div>
                                             <div class="wisdom_color">34.251MG</div>
                        </div>
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
