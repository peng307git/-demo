<#include "common/base-v2.ftl" />
<#macro title>
    <@spring.messageText "mind_mine" "智慧矿场"/>
</#macro>
<#macro head>
    <link rel="stylesheet" type="text/css" href="/static/css/mine.css" />
</#macro>
<#macro body>
    <#assign nav_page="mine">
        <div class="wrap">
            <#include "common/header.ftl">
                <div id="bd">
                    <div class="bd-inner">
                        <div class="page-content mine-content">
                            <div class="g-line clearfix">
                                <div class="col-m">
                                    <div class="m-wrap">
                                        <div class="mine-title-wrap">
                                            <#--<a href="/mine/user">
                                                <@spring.messageText "mine.text27" "返回旧版"/>
                                                </a>
                                                <h1 class="mine-title"><@spring.messageText "mine.text10" "能量核心"/></h1>-->
                                        </div>
                                        <div class="mine-status">
                                        </div>
                                        <div class="mine-chart">
                                            <svg id="mine-svg"></svg>
                                        </div>
                                        <div class="mine-desc clearfix">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-s">
                                    <div class="mine-side-search">
                                        <input type="input" placeholder="<@spring.messageText "mine.text28" "子核心号码，如:001" />" />
                                    </div>
                                    <ul class="mine-side-bar">
                                        <#list core_list as item>
                                            <#if item?index==0>
                                                <li class="mine-side-core active" data-nodeid="${item.id}" data-index="${item?index}">
                                                    <h5><@spring.messageText "mine.text10" "能量核心"/></h5>
                                                    <p><span class="outer"><span class="inner" style="width:${(item.personPercent*100)?floor}%;"></span></span>&nbsp;${(item.personPercent*100)?floor}%</p>
                                                </li>
                                                <#else>
                                                    <li class="mine-side-subcore-${item.activeSubCore}" data-nodeid="${item.id}" data-index="${item?index}">
                                                        <h5>G${item.coreIndexNum}</h5>
                                                        <p><span class="outer"><span class="inner" style="width:${(item.personPercent*100)?floor}%;"></span></span>&nbsp;${(item.personPercent*100)?floor}%</p>
                                                    </li>
                                            </#if>
                                        </#list>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <#include "/decorators/footer.ftl">
        </div>
        <#if isPayPassword ?exists>
            <input type="hidden" val="1" id="isPayPassword">
            <#else>
                <input type="hidden" val="0" id="isPayPassword">
        </#if>
        <input type="hidden" id="topLevelNodeId" value="${topLevelNodeId}">
        <input type="hidden" id="curNodeId" value="">
        <input type="hidden" id="CSRFToken" value="${CSRFToken}" />
        <input type="hidden" id="userid" value="" />
        <input type="hidden" id="userAllCapacity" value="" />
        <div class="modal mine-modal mine-modal-activate fade" id="activateSubCoreModal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel"><@spring.messageText "mine.text29" "激活子核心" /></h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group text-left">
                            <@spring.messageText "mine.text30" "激活子核心需要消费 1 BTC，是否激活？" />
                        </div>
                        <div class="form-group" id="pay-password-box">
                            <span><@spring.messageText "enter.paypassword" "请输入支付密码:"/></span>
                            <input type="password" class="form-input" id="input-payPassword" name="input-Paypassword" />
                              <a href="/v2/user/safety/into?BTN=set-paypassword"><@spring.messageText "forget_password" "忘记密码？"/></a>
                        </div>

                        <#if vcodeon?exists >

                        <div class="form-group mine-activate-mobile-tip vcode-box text-left">
                            <!--<span><@spring.messageText "mine.text31" "手机验证码：" /></span>-->
                            <@spring.messageText "mine.text99" "使用" /><em>${mobile}</em>
                            <@spring.messageText "mine.text100" "接收验证码" />
                        </div>
                        <div class="form-group  vcode-box"  id="vcode-box">
                            <span><@spring.messageText "mine.text31" "手机验证码：" /></span>
                            <input type="text" class="input-vcode" placeholder="<@spring.messageText "buythen.text5050" "手机验证码"/>" /><input type="button" value="<@spring.messageText "getsmscaptcha" "获取短信验证码"/>" class="btn-get-vcode " />
                        </div>
                        </#if>
                        <#if googlecodeon?exists >
                        <div class="form-group googlecode-box" id="googlecode-box">
                            <span><@spring.messageText "safety.text108" "谷歌验证码"/>：</span>
                            <input type="text" class="input-googlecode" placeholder="<@spring.messageText "safety.text108" "谷歌验证码"/>">
                        </div>
                        </#if>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-confirm"><@spring.messageText "mine.text33" "激活" /></button>
                        <button type="button" class="btn btn-cancel" data-dismiss="modal"><@spring.messageText "mine.text34" "取消" /></button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal mine-modal mine-modal-create fade" id="createSubCoreModal" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-dialog-mid" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel"><@spring.messageText "mine.text35" "创建子核心" /></h4>
                    </div>
                    <div class="modal-body">
                        <div class="from-group-cap">
                            <p><@spring.messageText "mine.text200" "当前产能" />：</p>
                            <span id="moadlCapacity"></span>
                        </div>
                        <div class="from-group-cap">
                            <p><@spring.messageText "mine.text201" "已创建子核心数" />：</p>
                            <span id="modalSeedCore"></span>
                        </div>
                        <div class="from-group-cap">
                            <p><@spring.messageText "mine.text202" "还可以创建子核心数" />：</p>
                            <span id="moadlStayCore"></span>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-confirm"><@spring.messageText "mine.text37" "创建" /></button>
                        <button type="button" class="btn btn-cancel" data-dismiss="modal"><@spring.messageText "mine.text34" "取消" /></button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal mine-modal mine-modal-remove fade" id="removeUserModal" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-dialog-sm" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel"><@spring.messageText "mine.text38" "清空点位" /></h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group text-center">
                            <@spring.messageText "mine.text39" "请确认是否清空该点位的用户？" />
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-confirm"><@spring.messageText "mine.text40" "确认" /></button>
                        <button type="button" class="btn btn-cancel" data-dismiss="modal"><@spring.messageText "mine.text34" "取消" /></button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal mine-modal mine-modal-popularize" id="createUserModal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel"><@spring.messageText "mine.text41" "我要推广" /></h4>
                    </div>
                    <div class="text-center clearfix">
                        <div class="clearfix">
                            <i class="success"></i><span><@spring.messageText "mine.text105" "您已成功获取了邀请码，" /><br><@spring.messageText "mine.text106" "快分享给好友吧！" /></span>
                        </div>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <div  class="clearfix"><span><@spring.messageText "mine.text43" "邀请码" />:</span><em class="invite-code"></em></div>
                            <div  class="clearfix"><span><@spring.messageText "mine.text107" "注册链接" />:</span><a class="invite-code-url" href="######" target="new"></a>
                            </div>
                            <div  class="clearfix">
                            <input type="button" class="btn btn-confirm copy-btn" value="<@spring.messageText "mine.text44" "复制邀请码" />" />
                            </div>
                        </div>
                        <div class="form-group popularize-copy-tip text-center" style="opacity:0;">
                            <@spring.messageText "mine.text45" "复制成功" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal mine-modal mine-modal-recharge" id="rechargeModal" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-dialog-sm" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel"><@spring.messageText "mine.text46" "温馨提示"/></h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group text-center">
                            <@spring.messageText "mine.text47" "余额不足，是否前往充值？"/>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <a class="btn btn-confirm" href="/deal/recharge">
                            <@spring.messageText "mine.text48" "立即充值"/>
                        </a>
                        <button type="button" class="btn btn-cancel" data-dismiss="modal"><@spring.messageText "mine.text34" "取消" /></button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal mine-modal mine-modal-prize" id="prizeModal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel"><@spring.messageText "mine.text49" "主核心"/></h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group text-center">
                            <p>
                                <@spring.messageText "mine.text50" "点位利用率达到100%可领取MP"/>
                            </p>
                            <p>
                                <@spring.messageText "mine.text51" "当前利用率为"/><span id="prizeModalPercent"></span>%</p>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-confirm"><@spring.messageText "mine.text52" "领取" /></button>
                    </div>
                    <input type="hidden" id="mpPrizeNodeId" value='' />
                </div>
            </div>
        </div>
        <div id="documentAlertMark"></div>
</#macro>
<#macro footerjs>
    <script src="/static/js/d3.min.js"></script>
    <script src="/static/js/template.min.js"></script>
    <script src="/static/js/plugin/jquery.zclip.min.js"></script>
    <script id="mine-side-html" type="text/html">
        {{each list as item i}}
	        <li class="mine-side-subcore-{{item.activeSubCore}}{{if item.active==1}} active{{/if}}" data-nodeid="{{item.id}}" data-index="{{item.coreIndex}}">
	            <h5>{{if item.coreIndex == 0}}<@spring.messageText "mine.text10" "能量核心"/>{{else}}G {{item.indexNum}}{{/if}}</h5>
	            <p><span class="outer"><span class="inner" style="width:{{item.personPercent}}%;"></span></span>&nbsp;{{item.personPercent}}%</p>
	        </li>
        {{/each}}
    </script>
    <script id="mine-status-html" type="text/html">
        <table>
            <tr>
                <td>
                    <@spring.messageText "mine.text53" "总产能" />&nbsp;&nbsp;&nbsp;&nbsp;<span>{{capacity}}</span></td>
                <td>
                    <@spring.messageText "mine.text54" "矿场收益" /><span>{{contribution}} MG</span></td>
                <td>
                    <@spring.messageText "mine.text55" "世纪积分" /><span>{{century_integral}}</span></td>
                <td>
                    <@spring.messageText "mine.text56" "邀请人数" /><span>{{person_node_num}}</span></td>
            </tr>
            <tr>
                <td>
                    <@spring.messageText "mine.text57" "子核心数" /><span>{{core_node_num}}</span></td>
                <td>
                    <@spring.messageText "mine.text58" "激活子核心" /><span>{{active_core_node_num}}</span></td>
                <td>
                    <@spring.messageText "mine.text59" "已用点位" /><span>{{inused_node}}</span></td>
                <td>
                    <@spring.messageText "mine.text60" "可用点位" /><span>{{unuse_node}}</span></td>
            </tr>
        </table>
        <div class="mine-desc-info-status">
            {{if status == 3 || status == 4}}
                <div class="mine-desc-info-top">
                    <p><@spring.messageText "mine.text87" "子核心：" /><span class="child-core-name">{{indexNum}}</span></p>
                    <p>
                        {{if status == 3}}
                           <em class="btn btn-act-col" id="btn-active-top"><@spring.messageText "mine.text91" "激活" /></em>
                        {{else}}
                           <em class="btn btn-act-col btn-color"><@spring.messageText "mine.text90" "已激活" /></em>
                        {{/if}}
                    </p>
                </div>
            {{/if}}
        </div>
    </script>
    <script id="mine-desc" type="text/html">
        <div class="mine-desc-detail">
            {{if node_status == 3 || node_status == 4}} 
            {{if is_my_core == 0}}
            <div class="mine-desc-detail-title">
                <ul class="clearfix mine-tab-indirect">
                    <li class="active">
                        <@spring.messageText "mine.text65" "子核心贡献" />
                    </li>
                </ul>
            </div>
            <div class="mine-desc-detail-content mine-desc-detail-content-other">
                <div class="mine-desc-detail-item">
                     <table>
                        <tr>
                            <td>
                                <@spring.messageText "mine.text67" "累计矿场收益：" /><span>{{mine_income_total}} MG</span>
                            </td>
                            <td>
                                <@spring.messageText "mine.text68" "世纪积分："/><span>{{century_integral}}</span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <@spring.messageText "mine.text69" "昨日矿场收益：" /><span>{{mine_income_yestoday}} MG</span>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </div>
            </div>
            {{else}}
            <div class="mine-desc-detail-title">
                {{if node_status == 8888}}<span><@spring.messageText "mine.text64" "提示：由于未激活子核心，在本世纪分享积分中流失" />{{outflow_century_mg}}MG</span>{{/if}}
                <ul class="clearfix">
                    <li class="active">
                        <@spring.messageText "mine.text65" "子核心贡献" />
                    </li>
                    <li>
                        <@spring.messageText "mine.text66" "子核心信息" />
                    </li>
                </ul>
            </div>
            <div class="mine-desc-detail-content">
                <div class="mine-desc-detail-item">
                    <table>
                        <tr>
                            <td>
                                <@spring.messageText "mine.text67" "累计矿场收益：" /><span>{{mine_income_total}} MG</span></td>
                            <td>
                                <@spring.messageText "mine.text68" "世纪积分："/><span>{{century_integral}}</span></td>
                        </tr>
                        <tr>
                            <td>
                                <@spring.messageText "mine.text69" "昨日矿场收益：" /><span>{{mine_income_yestoday}} MG</span></td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </div>
                <div class="mine-desc-detail-item" style="display:none;">
                    <p>
                        <@spring.messageText "mine.text102" "已占用点位" />（
                        <@spring.messageText "mine.text57" "子核心数" />：{{sub_core_num}}&nbsp;&nbsp;&nbsp;&nbsp;
                        <@spring.messageText "mine.text73" "直接邀请人：" />{{direct_num}}&nbsp;&nbsp;&nbsp;&nbsp;
                        <@spring.messageText "mine.text74" "间接邀请人：" />{{indirect_num}}）</p>
                    <p>
                        <@spring.messageText "mine.text72" "空余点位：" />{{unuse_node_num}}</p>
                </div>
            </div>
            {{/if}} {{else if node_status == 1 || node_status == 2}}
            <div class="mine-desc-detail-title">
                <ul class="clearfix">
                    <li class="active">
                        <@spring.messageText "mine.text75" "Ta的信息" />
                    </li>
                    <li>
                        <@spring.messageText "mine.text76" "Ta的贡献" />
                    </li>
                </ul>
            </div>
            <div class="mine-desc-detail-content">
                {{if node_status==1 }}
                <div class="mine-desc-detail-item mine-desc-detail-inactive">
                    <@spring.messageText "mine.text77" "尚未购买" />
                </div>
                <div class="mine-desc-detail-item mine-desc-detail-inactive" style="display:none;">
                    <@spring.messageText "mine.text77" "尚未购买" />
                </div>
                {{else}}
                <div class="mine-desc-detail-item">
                    <table>
                        <tr>
                            <td>
                                <@spring.messageText "record.mydata.text1" "本世纪累计产量"/>: <span>{{output_sum}}MG</span></td>
                            <td>
                                <@spring.messageText "mine.text79" "昨日产量：" /><span>{{output_today}}MG</span></td>
                        </tr>
                    </table>
                    <table class="mine-desc-detail-col3">
                        <tr>
                            <td>
                                <@spring.messageText "mine.text80" "世纪积分：" /><span>{{century_integral}}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <@spring.messageText "mine.text81" "产能：" /><span>{{capacity}}</span></td>
                            <td>
                                <@spring.messageText "mine.text82" "Ta的团队人数：" /><span>{{direct_num}}</span></td>
                        </tr>
                    </table>
                </div>
                <div class="mine-desc-detail-item" style="display:none;">
                    <table>
                        <tr>
                            <td>
                                <@spring.messageText "mine.text83" "累计贡献产量：" />{{contribution_total}}MG</td>
                            <td>
                                <@spring.messageText "mine.text84" "昨日贡献产量：" />{{contribution_yestoday}}MG</td>
                        </tr>
                        <tr>
                            <td>
                                <@spring.messageText "mine.text85" "贡献世纪积分：" />{{century_integral}}</td>
                            <td>
                                <@spring.messageText "mine.text86" "贡献产能：" />{{contribution_output}}</td>
                        </tr>
                    </table>
                </div>
                {{/if}}
            </div>
            {{/if}}
        </div>
        <div class="mine-desc-info">
            {{if status == 3 || status == 4}} 
                {{if is_my_core == 0}}
                <div class="mine-desc-info-main mine-desc-info-main-subcore mine-desc-info-main-indirect">
                    <p>
                        <@spring.messageText "mine.text87" "子核心：" />G {{core_index}}
                    </p>
                    <p>
                        <@spring.messageText "mine.text88" "状态：" /><em>{{if status == 3}}<@spring.messageText "mine.text89" "未激活" />{{else}}<@spring.messageText "mine.text90" "已激活" />{{/if}}</em>
                    </p>
                    <p>
                    	    <@spring.messageText "mine.text62" "创建人：" />{{username}}
                    </p>
                </div>
                <div class="mine-desc-info-op mine-desc-info-op-other">
                    <div class="mine-desc-info-icon mine-desc-info-icon-{{status}}"></div>
                </div>
                {{else}}
                <div class="mine-desc-info-main mine-desc-info-main-subcore">
                    <p>
                        <@spring.messageText "mine.text87" "子核心：" />G {{core_index}}</p>
                    <p>
                        <@spring.messageText "mine.text88" "状态：" /><em>{{if status == 3}}<@spring.messageText "mine.text89" "未激活" />{{else}}<@spring.messageText "mine.text90" "已激活" />{{/if}}</em></p>
                </div>
                <div class="mine-desc-info-op">
                    <div class="mine-desc-info-icon mine-desc-info-icon-{{status}}"></div>
                    {{if outflow_century_integral !=0 && century_integral != 0}} 
                        {{if outflow_century_integral/century_integral > 5 && outflow_century_integral/century_integral< 10}} <div class="mine-desc-info-yellow">
                        </div>
                        {{else if outflow_century_integral/century_integral > 10}}
                        <div class="mine-desc-info-red"></div>
                        {{/if}} 
                    {{/if}} 
                    {{if status == 3}}<span class="btn btn-activate"><@spring.messageText "mine.text91" "激活" /></span>{{/if}}
                </div>
                {{/if}}
            {{else if status == 1 || status == 2 || status == 111}}
            <div class="mine-desc-info-main mine-desc-info-main-user">
                <p>{{username}}</p>
                <p>{{telephone}}</p>
                <p>
                    <@spring.messageText "mine.text88" "状态：" /><em>{{if status == 1}}<@spring.messageText "mine.text92" "未购买" />{{else if status == 111}}<@spring.messageText "mine.text108" "已充值未购买" />{{else}}<@spring.messageText "mine.text93" "已购买" />{{/if}}</em></p>
            </div>
            <div class="mine-desc-info-op">
                <div class="mine-desc-info-icon mine-desc-info-icon-{{status}}"></div>
                {{if status == 1}}
                <div class="mine-user-info">
                    {{if removable == 1}}
                    <span class="btn btn-remove"><@spring.messageText "mine.text94" "移除" /></span> {{else}} {{removable_time}} {{/if}}
                </div>
                {{/if}}
                <div class="mine-user-position">{{node_position}}</div>
            </div>
            {{/if}}
        </div>
    </script>
    <script>
        I18N.addLang({
            "vcodeisnull": '<@spring.messageText "safety.text27" "手机验证码不能为空。"/>',
            "googlecodeisnull": '<@spring.messageText "safety.text111" "请输入谷歌验证码"/>',
            "sendafterseconds": '<@spring.messageText "withdrawal.text20" "秒后重新发送"/>',
            "getsmsvcode": '<@spring.messageText "getsmscaptcha" "获取短信验证码"/>',
            "capacitytip": '<@spring.messageText "mine.text109" "备注：邀请好友可增加您的产能"/>',
            "invitecode": '<@spring.messageText "mine.text43" "邀请码" />',
            "invitelink": '<@spring.messageText "mine.text107" "注册链接" />',
            "congratulationformp": '<@spring.messageText "mine.text101" "恭喜你获得" />',
            "noderemovable": '<@spring.messageText "movable" "可移除" />',
            "emptynodecount": '<@spring.messageText "mine.text97" "空余点位数" />',
            "nodeoccupy": '<@spring.messageText "mine.text98" "点位占有率" />',
            "createsubcore": '<@spring.messageText "mine.text95" "创建子核心"/>',
            "recommend": '<@spring.messageText "mine.text96" "我要推广"/>',
            "energycore": '<@spring.messageText "mine.text10" "能量核心"/>',
            "alertnoticeError": '<@spring.messageText "mine.text110" "你已经领取过MP了,不能再领取"/>'
        });
        var sideListArr = [<#list core_list as item>{
            id: '${item.id}',
            indexNum: '${item.coreIndexNum}',
            personPercent: ${(item.personPercent*100)?floor},
            coreIndex: ${item?index},
            activeSubCore: ${item.activeSubCore}
        },</#list>];
    </script>
    <script src="/static/js/business/mine_v2.js"></script>
</#macro>
