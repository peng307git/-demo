 <#include "common/base-v2.ftl" />
<#macro title>
<@spring.messageText "buy_center" "认购中心"/>
</#macro>
<#macro head>
<link rel="stylesheet" type="text/css" href="/static/css/mod.css" />
<link rel="stylesheet" type="text/css" href="/static/css/buycenter.css" />
</#macro>
<#macro body>
<#assign nav_page="buy" >
<#assign nav_sub_page="buythen" >
 <div class="wrap asset-manager">
  <#include "common/header.ftl" >
  <h3 class="recharge-title text-center"><@spring.messageText "buy_center" "认购中心"/></h3>
  <div class="main main-buycenter ">
    
    <div class="wp-status">
        <div class="wp-status-total">
            <h5><@spring.messageText "century.alternate.text19" "第二世纪智慧包"/></h5>
            <p>
            	   <@spring.messageText "century.alternate.text4" "还可产生"/>：<span class='wp-status-pad' id='marginmpcount'>${marginMpCount}</span>
            	   <@spring.messageText "century.alternate.text5" "可预订"/>：<span id="marginMpBooked">0</span>
            </p>
            <div class="next-cen-total">
            	    <h5><@spring.messageText "century.alternate.text19" "第三世纪智慧包"/></h5>
            	    <@spring.messageText "century.alternate.text6" "已预订"/>：<span id="nextMpBooked">0</span>
            </div>
        </div>
        <div class="wp-status-difficulty">
            <h5><@spring.messageText "buythen.text2" "目前区块难度"/></h5>
            <span>${percentageRiseDifficult}%</span>
        </div>
        <div class="wp-status-user">
            <h5><@spring.messageText "buythen.text5000" "您的智慧包情况"/></h5>
            <p><@spring.messageText "buythen.text5001" "最大持有量"/>&nbsp;:&nbsp;${fwpMaxUsedNum}&nbsp;&nbsp;&nbsp;&nbsp;<@spring.messageText "buythen.text5" "已持有"/>&nbsp;:&nbsp;${fwpUsedNum}&nbsp;&nbsp;&nbsp;&nbsp;<@spring.messageText "buythen.text6" "还可持有"/>&nbsp;:&nbsp;${fwpUnusedNum}</p>
        </div>
    </div>
    <div class="wisdom-package-queue">
        <div class="iframe-box">
        <iframe name="ifrmname" id="ifrmname" src="" frameborder="0" style="width:1080px; height:255px; overflow:hidden"></iframe>
        </div>
    </div>
    <div class="wisdom-package-buy">
      <form id="buy-form" action="/deal/buymp" method="post">
      	 <p>
            <span class="buythen-form-label"><@spring.messageText "buythen.text80" "类别："/></span>
            <span class="buythen-type buythen-type-on"><@spring.messageText "buythen.text81" "尊享包"/></span>
            <#if SS_USERSTATUS != "-90" && SS_USERSTATUS != "-98">
            <span class="buythen-type"><@spring.messageText "buythen.text82" "智慧包"/></span>
            </#if>
        </p>
        <p>
            <span class="buythen-form-label"><@spring.messageText "buythen.text79" "数量："/></span>
            <select name="masaNum" id="masaNum">
                <#list 0..fwpUnusedNum as t>
                    <option value="${t}" <#if t==fwpUnusedNum>selected</#if>>${t}</option>
                </#list>
            </select>
            <i class="buythen-tip">?
                <span class="buythen-count-tip">
                    <@spring.messageText "buythen.text13" "您拥有"/>${coreCount}<@spring.messageText "buythen.text14" "个核心数"/>
                    <br /><@spring.messageText "buythen.text15" "最多可购买"/>${fwpUnusedNum}<@spring.messageText "buythen.text16" "个MP"/>
                </span>
            </i>
        </p>
        <div class="paytype-price">
            <div class="paytype-price-item">
                <p>
                    <span class="buythen-form-label"><@spring.messageText "buythen.text5027" "单价"/></span>
                    <em><span id="text-one-price"> 100 </span></em><@spring.messageText "buythen.text18" "美元"/>
                </p>
                <p>
                    <span class="buythen-form-label"><@spring.messageText "buythen.text17" "总价"/></span>
                    <em><span id="text-total-price"></span></em><@spring.messageText "buythen.text18" "美元"/> ≈ <em><span id="text-total-btc"></span></em>BTC
                </p>
            </div>
            <div class="paytype-price-item" style="display:none;">
                <p>
                    <span class="buythen-form-label"><@spring.messageText "buythen.text5027" "智慧包单价"/></span>
                    <em><span id="text-one-price-bymg"> ${mp_mg_per_price} </span></em>MG
                    <i class="buythen-mgprice-tip">?</i>
                </p>
                <p>
                    <span class="buythen-form-label"><@spring.messageText "buythen.text17" "总认购价"/></span>
                    <em><span id="text-total-price-bymg"></span></em>MG
                </p>
            </div>
            <div class="buythen-mgprice-tip-wrap">
                <div>
                    <@spring.messageText "buythen.text5042" "1、MP价格=智慧包MN含量*兑换比例"/>
                </div>
                <div>
                    <!-- <@spring.messageText "buythen.text5043" "2、兑换比例按MP到账区块位置计算"/> -->
                    <@spring.messageText "buythen.text5047" "2、当前世纪初始时，兑换比例为52%；当前世纪进程每完成20%的区块，兑换比例增加2% 。"/>
                    <table>
                        <tr>
                            <td><@spring.messageText "buythen.text5048" "当前世纪进程" /></td>
                            <td><@spring.messageText "buythen.text5044" "智慧包到账区块位置"/></td>
                            <td><@spring.messageText "buythen.text5045" "兑换比例"/></td>
                            <td><@spring.messageText "buythen.text5046" "智慧包单价（MG）"/></td>
                        </tr>
                        <tr>
                            <td>0%~20%</td>
                            <td>192001-211200</td>
                            <td>52%</td>
                            <td>122.72</td>
                        </tr>
                        <tr>
                            <td>21%~40%</td>
                            <td>211201-230400</td>
                            <td>54%</td>
                            <td>127.44</td>
                        </tr>
                        <tr>
                            <td>41%~60%</td>
                            <td>230401-249600</td>
                            <td>56%</td>
                            <td>132.16</td>
                        </tr>
                        <tr>
                            <td>61%~80%</td>
                            <td>249601-268800</td>
                            <td>58%</td>
                            <td>136.88</td>
                        </tr>
                        <tr>
                            <td>81%~100%</td>
                            <td>268801-288000</td>
                            <td>60%</td>
                            <td>141.6</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div class="clearfix btn-box">
        	      <button type="submit" class="btn-buy">
        	      	<span class="btn-buy-pay1"><@spring.messageText "buythen.text19" "立即兑换尊享包"/></span>
        	      	<span class="btn-buy-pay2"><@spring.messageText "buythen.text1112" "立即兑换智慧包"/></span>
        	      </button>
        	      
        </div>
        <div class="top-mp-buy-detail">
        	    <p class="buy-detail buy-detail-top"><@spring.messageText "buythen.text1114" "当前全球MPS"/>：<span class="current-mps" id="current-mps">${currentMpsNum}</span><@spring.messageText "buythen.text1115" "全球剩余MPS"/>：<span class="remaining-mps" id="remaining-mps">${globalMpsNum - currentMpsNum}</span></p>
            <p class="buy-detail">※ <@spring.messageText "buythen.text1111" "使用BTC兑换MP，在每次解包后可获得1个MPS，并且参与分成奖励。"/><a href="###" id="understand-mps-btn"><@spring.messageText "mps.text7" "不了解MPS"/>？</a></p>
        </div>
            <input type="hidden" name="ishprice" id="ishprice" value="0" />
            <input type="hidden" name="CSRFToken" id="CSRFToken" value="${CSRFToken}" />
            <input type="hidden" name="currBtc" id="currBtc" value="${currBtc}" />
            <input type="hidden" name="currMg" id="currMg" value="${currMg}" />
            <input type="hidden" name="payType" id="payType" value="1" />
      </form>
        
    </div>
    <div class="order-list" id="open">
        <div class="oder-list-title">
            <ul class="order-list-tab clearfix">
              <li class="active"><@spring.messageText "buythen.text20" "订单记录"/><i id="needSuccessNum"></i></li>
              <li><@spring.messageText "buythen.text21" "MP解包"/></li>
              <li><@spring.messageText "buythen.text22" "MP转移"/></li>
            </ul>
        </div>
        <div class="order-list-content">
            <div class="mod-table mod-table-7" id="mod_table_7">
                <div class="list-state"><@spring.messageText "buythen.text.order.status.1" "订单状态"/>: <select>
                  <option value = "-99"><@spring.messageText "buythen.text.order.status.2" "全部"/></option>
                  <option value = "1"><@spring.messageText "buythen.text.order.status.3" "已完成"/></option>
                  <option value = "0"><@spring.messageText "buythen.text.order.status.4" "未到账"/></option>
                </select>
                </div>
                <table>
                    <thead>
                        <tr>
                            <th><@spring.messageText "buythen.text23" "订单号"/></th>
                            <th><@spring.messageText "buythen.text24" "兑换日期"/></th>
                            <th><@spring.messageText "buythen.text5028" "兑换数量"/></th>
                            <th><@spring.messageText "buythen.text29" "MP类型"/></th>
                            <!-- <th><@spring.messageText "buythen.text5006" "预计到账时间"/></th> -->
                            <th><@spring.messageText "buythen.text5007" "当前排队位置"/></th>
                            <th><@spring.messageText "buythen.text26" "支付金额"/></th>
                            <th><@spring.messageText "buythen.text.order.status.1" "订单状态"/></th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
                <div class="table-pager" >
                    <a class="prev" href="####"><@spring.messageText "wave.query.text14" "上一页"/></a><i>1</i><em>/</em><span></span><a class="next" href="####"><@spring.messageText "wave.query.text15" "下一页"/></a>
                </div>
            </div>
            
            <div class="mod-table mod-table-6" id="mod_table_6" style="display:none;">
                <div class="list-state"><@spring.messageText "buythen.text.order.mp.status.2" "MP解包状态"/>：<select>
                  <option value = "-99"><@spring.messageText "buythen.text.order.status.2" "全部"/></option>
                  <option value = "1"><@spring.messageText "buythen.text40" "已解包"/></option>
                  <option value = "0"><@spring.messageText "buythen.text39" "未解包"/></option>
                </select>
                </div>
                <table>
                    <thead>
                        <tr><th><@spring.messageText "buythen.text23" "订单号"/></th>
                            <th><@spring.messageText "buythen.text27" "MP编号"/></th>
                            <th><@spring.messageText "buythen.text100" "更新日期"/></th>
                            <th><@spring.messageText "buythen.text29" "MP类型"/></th>
                            <th><@spring.messageText "buythen.text1001" "MN数量"/></th>
                            <th><@spring.messageText "buythen.text30" "来源"/></th>
                            <th><@spring.messageText "buythen.text31" "状态"/></th>
                            <th><@spring.messageText "buythen.text32" "操作"/></th>
                        </tr>
                    </thead>                        
                    <tbody>
                        
                    </tbody>
                </table>
                <div class="table-pager" >
                    <a class="prev" href="####"><@spring.messageText "wave.query.text14" "上一页"/></a><i>1</i><em>/</em><span></span><a class="next" href="####"><@spring.messageText "wave.query.text15" "下一页"/></a>
                </div>
            </div>
            <div class="mod-table mod-table-5" id="mod_table_5" style="display:none;">
                <div class="list-state"><@spring.messageText "buythen.text.order.mp.status.1" "MP转移状态"/>：<select>
                  <option value = "-99"><@spring.messageText "buythen.text.order.status.2" "全部"/></option>
                  <option value = "1"><@spring.messageText "buythen.text72" "已转移"/></option>
                  <option value = "0"><@spring.messageText "buythen.text51" "未转移"/></option>
                  <option value = "2"><@spring.messageText "buythen.text74" "已接收"/></option>
                </select>
                </div>
                <table>
                    <thead>
                        <tr><th><@spring.messageText "buythen.text23" "订单号"/></th>
                            <th><@spring.messageText "buythen.text42" "MP编号"/></th>
                            <th><@spring.messageText "buythen.text100" "更新日期"/></th>
                            <th><@spring.messageText "buythen.text44" "MP类型"/></th>
                            <th><@spring.messageText "buythen.text1001" "MN数量"/></th>
                            <th><@spring.messageText "buythen.text45" "状态"/></th>
                            <th><@spring.messageText "buythen.text46" "操作"/></th>
                            <th><@spring.messageText "buythen.text71" "备注"/></th>
                        </tr>
                    </thead>
                    <tbody>
                    
                    </tbody>
                </table>
                <div class="table-pager">
                    <a class="prev" href="####"><@spring.messageText "wave.query.text14" "上一页"/></a><i>1</i><em>/</em><span></span><a class="next" href="####"><@spring.messageText "wave.query.text15" "下一页"/></a>
                </div>
            </div>
            <div class="needSuccessHide" id="needSuccessHide" style="display:none">
                <table>
                    <tbody>
                        <#if qorderlist?exists>
                        <#list qorderlist as item>
                        <#if item.issuccess==0>
                         <tr class="needSuccess">
                            <td>${item.orderNo}</td>
                            <td>
                                <#if item.addTime?exists>
                                    ${item.addTime?datetime}
                                </#if>
                            </td>
                            <td>
                                ${item.masanumber}
                            </td>
                            <td>
                                <#if item.packType==1>
                                    <@spring.messageText "buythen.text33" "起航包"/>
                                <#elseif item.packType==2>
                                     <@spring.messageText "buythen.text34" "普通包"/>
                                <#elseif item.packType==3>
                                     <@spring.messageText "buythen.text35" "赠送包"/>
                                <#elseif item.packType==4>
                                    <@spring.messageText "buythen.text36" "高价包"/>
                                </#if>
                            </td>
                            <!-- <td>
                                ${item.arrivalsTime?string("yyyy-MM-dd HH:mm:ss")}
                            </td> -->
                            <td>
                                <span>${item.queuedNumber-preFirstQueueNum}</span>
                                <input type="hidden" name="queuedNumber" value = "${item.queuedNumber}">
                            </td>
                            <td>
                                ${item.amount?string('0.0000000000')}
                            </td>
                            <td>
                                 <i></i><@spring.messageText "buythen.text5017" "未到账"/>
                            </td>   
                        </tr>
                        </#if>
                        </#list>
                        </#if>
                    </tbody>
                </table>
            </div>
        </div>
      </div>
  </div>
  <#include "/decorators/footer.ftl" >
</div>
<!-- <div class="app-pop">
    <div class="app-pop-nav">
        <a class="app-pop-nav-android" href="javascript:void(0)"></a>
        <a class="app-pop-nav-ios" href="javascript:void(0)"></a>
    </div>
    
    <div class="app-pop-content">
        <div class="app-pop-img">
            <img src="/static/images/down_android.png?v=1.0.5" />
        </div>
        <div class="app-pop-img" style="display:none;">
            <img src="/static/images/down_ios.png?v=1.0.5" />
        </div>
    </div>
    <div class="app-pop-tip">
        <p><span><@spring.messageText "recharge.opta_mindlink_text" "点击查看Mind Link使用说明"/></span></p>
        <p><a target="_blank" href="<@spring.messageText "recharge.opta_note" "/static/landing_zh_TW.html"/>"><@spring.messageText "recharge.opta_note_text" "點擊查看APP操作說明"/></a></p>
    </div>
</div> -->
<div class="modal mine-modal" id="videoModal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span class="color-black" aria-hidden="true">&times;</span></button>
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
<div class="modal fade" id="transMpModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
    <div class="modal-dialog modal-mid" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="exampleModalLabel"><@spring.messageText "buythen.text58" "MP转移:"/></h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group form-group-mid">
                        <@spring.messageText "buythen.text59" "转移MP编号为:"/>
                    </div>
                    <div class="form-group form-group-mid">
                        <span id="trans-mpuuid"></span>
                    </div>
                    <div class="form-group form-group-mobile form-group-mid">
                        <@spring.messageText "buythen.text76" "转移到:"/>&nbsp;
                        <span class="btn-country-code">
                          <img src="https://o5uaa1ha4.qnssl.com/static/images/flags/86.gif" class="country-code-img">
                            <span id="country-code">+86</span>
                                <span class="caret"></span>
                            </span>
                        </span>
                        <input placeholder="<@spring.messageText "buythen.text61" "请输入转移用户手机号"/>" class="user-mobile" id="user-mobile" type="input" />
                        <span id="btn-search-user" class="glyphicon glyphicon-search"></span>
                    </div>
                    <div class="form-group" id="user-name">
                    </div>
                    <div class="form-group form-group-mid">
                        <@spring.messageText "buythen.text60" "转移手续费："/>
                        <span id="trans-fee" class="trans-fee">0MG</span>
                    </div>
                    <#if vcodeon?exists >
                    <div class="form-group" id="vcode-box">

                        <span><@spring.messageText "buylink.text16" "手机验证码"/>:</span>

                        <input type="text" class="input-vcode" placeholder="<@spring.messageText "mine.text31" "手机验证码："/>"/>
                        <input type="button" class="btn-get-vcode" value='<@spring.messageText "get_smscaptcha" "获取验证码"/>' />
                    </div>
                    </#if>
                    <#if googlecodeon?exists >
                    <div class="form-group" id="googlecode-box">
                        <span><@spring.messageText "safety.text108" "谷歌验证码"/>:</span>
                        <input type="text" class="input-googlecode" placeholder="<@spring.messageText "safety.text108" "谷歌验证码"/>">
                    </div>
                    </#if>
                    <div class="form-group" id="pay-password-box">
                            <input type="password" class="pay-password"  placeholder="<@spring.messageText "buythen.text5052" "请输入支付密码"/>" />
                            <a href="/v2/user/safety/into?BTN=set-paypassword"><@spring.messageText "forget_password" "忘记密码？"/></a>
                    </div>
                    <div class="form-group btn-open-wrap">
                        <a class="btn-trans-package" href="###"><@spring.messageText "buythen.text62" "确认转移"/></a>
                    </div>
                    <div class="form-group form-group-mid-martop">
                        <@spring.messageText "buythen.text63" "温馨提示：亲爱的用户，请仔细检查转移用户的手机号码，每人只限转移一次"/>
                    </div>
                    <input id="user-uuid" type="hidden" />
                    <input id="mp-uuid" type="hidden" value="" />
                </form>
            </div>
        </div>
    </div>
</div>
</#macro>
<#macro footerjs>
<!-- <script type="text/javascript">
//  setInterval(function(){
//      document.getElementById('ifrmname').contentWindow.location.reload(true);
//  },360000)
</script> -->
<script src="/static/js/country-code.js"></script>
<#if isPayPassword ?exists >
<input type="hidden" val="1" id="isPayPassword">
<#else>
<input type="hidden" val="0" id="isPayPassword">
</#if>
<script>
    function changeMarginMpCount(marginMpCount){
        $("#marginmpcount").html(marginMpCount);
    }
    function bookedMarginMpCount(marginMpCount,allNum){
    	        var bookedMpCount = marginMpCount - allNum;
            $('#bookedmpcount').html(Math.abs(bookedMpCount));
            if(bookedMpCount > 0){
                    $("#marginMpBooked").html(bookedMpCount);
                    $('.wp-status-total').removeClass('last-day-total');
                    $('.next-cen-total').hide();
            }else{
                    $("#marginMpBooked").html('0');
                    $('.wp-status-total').addClass('last-day-total');
                    $('.next-cen-total').show();
                    $('#nextMpBooked').html(allNum-marginMpCount);
            }
    }
    function changeNum2(firstQueueNum){
        //console.log(firstQueueNum);
        if (firstQueueNum) {
            changeList(".mod-table-7");
            changeList(".needSuccessHide");
        }
        function changeList(box){
            var needSuccessList = $(box).find('.needSuccess');
            needSuccessList.each(function(index, el) {
                var self = $(this);
                var queueNumTd = self.find('td').eq(4);
                var queueNum = queueNumTd.find('input').val();
                var newQueueNum = queueNum -firstQueueNum;
                if (newQueueNum<=0) {
                    newQueueNum=0;
                    queueNumTd.find('span').html("-");
                    self.find('td').eq(6).html("<@spring.messageText "buythen.text5018" "已完成"/>")
                    self.removeClass('needSuccess');
                    self.find('td').eq(4).html("-");
                }else{
                    queueNumTd.find('span').html(newQueueNum);
                }
            });
        }
        var number = $("#needSuccessHide").find('.needSuccess').length;
        if (number>0) {
            $("#needSuccessNum").html(number);
        } else{
            $("#needSuccessNum").html("");
        };
    }
    $(function(){
        function getLocalTime(nS) { 
            var d = new Date(nS);    //根据时间戳生成的时间对象
            var date = (d.getFullYear()) + "-" + 
                       setDouble((d.getMonth() + 1)) + "-" +
                       setDouble(d.getDate()) + " " + 
                       setDouble(d.getHours()) + ":" + 
                       setDouble(d.getMinutes()) + ":" + 
                       setDouble(d.getSeconds());
            return date;
        } 
        function setDouble(nun){
            if(nun<10 && nun>=0){
                return "0"+nun;
            }else{
                return nun;
            }
        }
        $('#ifrmname').attr('src', '/deal/showbom');
        changeNum2();
        
        changeOrderInt("mod_table_7");
        changeOrderInt("mod_table_6");
        changeOrderInt("mod_table_5");
        function changeOrderInt(box){
            var tbody = $("#"+box);
            var pagerBox = tbody.find(".table-pager");
            var pagerNowNum = 1;
            var pagersize = 10;
            var dataUrl = "";
            var select = tbody.find('.list-state').find('select');
            pagerBox.find('.prev').off();
            pagerBox.find('.next').off();
            switch (box)
            {
                case "mod_table_7":
                    dataUrl = "order/mp/list?";
                    break;
                case "mod_table_6":
                    dataUrl = "solve/mp/list?";
                    break;
                case "mod_table_5":
                    dataUrl = "trans/mp/list?";
                    break;
            }
            changePage();
            pagerBox.find('.prev').on('click', function() {
                pagerNowNum --;
                changePage();
            });
            pagerBox.find('.next').on('click', function() {
                pagerNowNum ++;
                changePage();
            });
            select.change(function(){
                pagerNowNum =1;
                changePage();
            });
            function changePage(){
                var statuer = select.val();
                var dataBox ="";
                switch (box)
                {
                    case "mod_table_7":
                        dataBox ='order_mp_page='+(pagerNowNum-1)+'&order_mp_size='+pagersize+'&order_mp_sort=issuccess,ASC&order_mp_sort=add_time,DESC&status='+statuer ;
                        break;
                    case "mod_table_6":
                        dataBox ='solve_mp_page='+(pagerNowNum-1)+'&solve_mp_size='+pagersize+'&solve_mp_sort=status,ASC&solve_mp_sort=add_time,DESC&status='+statuer ;
                        break;
                    case "mod_table_5":
                        dataBox =
                        'trans_mp_page='+(pagerNowNum-1)+'&trans_mp_size='+pagersize+'&trans_mp_sort=status,ASC&trans_mp_sort=add_time,DESC&status='+statuer ;
                        break;
                }
                $.ajax({
                url: dataUrl + dataBox ,              //请求地址
                type: "Get",                       //请求方式
                //data: dataBox,        //请求参数
                dataType: "json",
                success: function (data) {
                    // 此处放成功后执行的代码
                  var datar = data.data
                  switch (box)
                    {
                        case "mod_table_7":
                             upData(datar.pageable.total,datar.pageable.rows,datar.firstQueueNum);
                            break;
                        case "mod_table_6":
                             upData(datar.total,datar.rows);
                            break;
                        case "mod_table_5":
                             upData(datar.total,datar.rows);
                            break;
                    }
                 
                },
                fail: function (status) {
                    location.reload();
                }
              });
                function upData(total,rows,preFirstQueueNum){
                    var htmlT=""
                    switch (box)
                    {
                        case "mod_table_7":
                            for(var i = 0 ; i < rows.length ; i++){
                                if (rows[i].issuccess==0){
                                    htmlT += '<tr class="needSuccess">';
                                }else if(rows[i].issuccess==1){
                                    htmlT += '<tr>';
                                }
                                htmlT += '<td>'+rows[i].orderNo+'</td>';
                                htmlT += '<td>'+rows[i].addTime+'</td>';
                                // htmlT += '<td>'+rows[i].arrivalMpTime+'</td>';
                                htmlT += '<td>'+rows[i].masanumber+'</td>';
                                switch (rows[i].payType)
                                {
                                    case 1:
                                        htmlT += '<td class="gold-color"><@spring.messageText "buythen.text81" "尊享包"/></td>';
                                        break;
                                    case 2:
                                        htmlT += '<td><@spring.messageText "buythen.text82" "智慧包"/></td>';
                                        break;
                                    case 3:
                                        htmlT += '<td><@spring.messageText "buythen.text35" "奖励包"/></td>';
                                        break;
                                    default:
                                        htmlT += '<td> - </td>';
                                }
                                if (rows[i].issuccess==0){
                                    // htmlT += '<td>'+rows[i].arrivalsTime+'</td>'
                                    htmlT += '<td><span>'+(rows[i].queuedNumber-preFirstQueueNum)+'</span><input type="hidden" name="queuedNumber" value = "'+rows[i].queuedNumber+'"></td>';
                                }else if(rows[i].issuccess==1){
                                    // htmlT += '<td> - </td>';
                                    htmlT += '<td> - </td>';
                                }
                                if(2 == rows[i].payType){
                                    htmlT += '<td>'+rows[i].amount.toFixed(10)+'MG</td>';
                                }else{
                                    htmlT += '<td>'+rows[i].amount.toFixed(10)+'BTC</td>';
                                }
                                if (rows[i].issuccess==0){
                                        htmlT += '<td><i></i><@spring.messageText "buythen.text5017" "未到账"/></td>';
                                    }else if(rows[i].issuccess==1){
                                        htmlT += '<td><@spring.messageText "buythen.text5018" "已完成"/></td>';
                                    }
                                htmlT += '</tr>';
                            }
                            break;
                        case "mod_table_6":
                            for(var i = 0 ; i < rows.length ; i++){
                                htmlT += '<tr><td>'+rows[i].txid+'</td><td>'+rows[i].uuid+'</td>';
                                // if (rows[i].addTime){
                                // htmlT += '<td>'+rows[i].addTime+'</td>';
                                
                                if(rows[i].decodeMpTime){
                                    htmlT += '<td>'+getLocalTime(rows[i].decodeMpTime)+'</td>';
                                }else{
                                    if (rows[i].arrivalMpTime){
                                        htmlT += '<td>'+getLocalTime(rows[i].arrivalMpTime)+'</td>';
                                    }else{
                                        if (rows[i].addTime){
                                            htmlT += '<td>'+rows[i].addTime+'</td>';
                                        }else{
                                            htmlT += '<td> - </td>';
                                        }
                                    } 
                                }
                                switch (rows[i].packType)
                                {
                                    case 1:
                                        htmlT += '<td class="gold-color"><@spring.messageText "buythen.text81" "尊享包"/></td>';
                                        break;
                                    case 2:
                                        htmlT += '<td><@spring.messageText "buythen.text82" "智慧包"/></td>';
                                        break;
                                    case 3:
                                        htmlT += '<td><@spring.messageText "buythen.text35" "赠送包"/></td>';
                                        break;
                                    case 4:
                                        htmlT += '<td class="gold-color"><@spring.messageText "buythen.text81" "尊享包"/></td>';
                                        break;
                                    case 5:
                                        htmlT += '<td class="gold-color"><@spring.messageText "buythen.text81" "尊享包"/></td>';
                                        break;
                                    default:
                                        htmlT += '<td> - </td>';
                                }
                                if(rows[i].mn){
                                  	htmlT += '<td>'+ rows[i].mn +'</td>';
                                }else{
                                	    htmlT += '<td>-</td>';
                                }
                                if (rows[i].transFromUid){
                                    htmlT += '<td>'+'<@spring.messageText "buythen.text37" "他人转移"/>'+'</td>';
                                }else{
                                    htmlT += '<td>'+'<@spring.messageText "buythen.text95" "兑换"/>'+'</td>';
                                }
                                if (rows[i].status==0){
                                    htmlT += '<td>'+'<@spring.messageText "buythen.text39" "未解包"/>'+'</td>';
                                    htmlT += '<td>'+'<a href="###" class="btn-open-mp" data-uuid="'+rows[i].uuid+'" data-packtype="'+rows[i].packType+'"><@spring.messageText "buythen.text41" "手动解包"/></a>'+'</td>';
                                }else{
                                    htmlT += '<td>'+'<@spring.messageText "buythen.text40" "已解包"/>'+'</td>';
                                    htmlT += '<td> - </td>';
                                }
                                htmlT += '</tr>' ;
                            }
                            break;
                        case "mod_table_5":
                            for(var i = 0 ; i < rows.length ; i++){
                                htmlT += '<tr><td>'+rows[i].txid+'</td><td>'+rows[i].uuid+'</td>';
                                // if (rows[i].addTime){
                                //     htmlT += '<td>'+rows[i].addTime+'</td>';
                                
                                if(rows[i].transTime){
                                    htmlT += '<td>'+getLocalTime(rows[i].transTime)+'</td>';
                                }else{
                                    if (rows[i].arrivalMpTime){
                                        htmlT += '<td>'+getLocalTime(rows[i].arrivalMpTime)+'</td>';
                                    }else{
                                         if (rows[i].addTime){
                                            htmlT += '<td>'+rows[i].addTime+'</td>';
                                        }else{
                                            htmlT += '<td> - </td>';
                                        }
                                    }
                                }
                                switch (rows[i].packType)
                                {
                                    case 1:
                                        htmlT += '<td class="gold-color"><@spring.messageText "buythen.text81" "尊享包"/></td>';
                                        break;
                                    case 2:
                                        htmlT += '<td><@spring.messageText "buythen.text82" "智慧包"/></td>';
                                        break;
                                    case 3:
                                        htmlT += '<td><@spring.messageText "buythen.text35" "赠送包"/></td>';
                                        break;
                                    case 4:
                                        htmlT += '<td class="gold-color"><@spring.messageText "buythen.text81" "尊享包"/></td>';
                                        break;
                                    case 5:
                                        htmlT += '<td class="gold-color"><@spring.messageText "buythen.text81" "尊享包"/></td>';
                                        break;
                                    default:
                                        htmlT += '<td> - </td>';
                                }
                                if(rows[i].mn){
                                  	htmlT += '<td>'+ rows[i].mn +'</td>';
                                }else{
                                	    htmlT += '<td>-</td>';
                                }
                                switch (rows[i].status)
                                {
                                    case 0:
                                        htmlT += '<td>'+'<@spring.messageText "buythen.text51" "未转移"/>'+'</td>';
                                        if (rows[i].deStatus==1) {
                                            htmlT += '<td> - </td>';
                                            htmlT += '<td>'+'<@spring.messageText "buythen.text40" "已解包"/>'+'</td>';
                                        } else {
                                            if(rows[i].packType == 1 || rows[i].firstMp){
                                                htmlT += '<td> - </td>';
                                            }else{
                                                htmlT += '<td>'+'<a href="###" class="btn-trans-mp" data-uuid="'+rows[i].uuid+'"><@spring.messageText "buythen.text52" "MP转移"/></a>'+'</td>';
                                            }
                                            htmlT += '<td> - </td>';
                                        };
                                        
                                        
                                        break;
                                    case 1:
                                        htmlT += '<td>'+'<@spring.messageText "buythen.text72" "已转移"/>'+'</td>';
                                        htmlT += '<td> - </td>';
                                        htmlT += '<td><@spring.messageText "buythen.text73" "转移到"/>'+rows[i].transFromTelephone+' </td>';
                                        break;
                                    case 2:
                                        htmlT += '<td>'+'<@spring.messageText "buythen.text74" "已接收"/>'+'</td>';
                                        htmlT += '<td> - </td>';
                                        htmlT += '<td><@spring.messageText "buythen.text75" "发送人"/>'+rows[i].transFromTelephone+' </td>';
                                        break;
                                }
                                htmlT += '</tr>' ;
                            }
                            break;
                    }
                    //console.log(htmlT);
                    tbody.find('tbody').html(htmlT);
                    pagerBox.find('span').html(Math.ceil(total/pagersize));
                    pagerBox.find('a').show();
                    if (pagerNowNum <= 1) {
                        pagerBox.find('.prev').hide();
                    }
                    if(pagerNowNum >= Math.ceil(total/pagersize)){
                        pagerBox.find('.next').hide();
                    };
                    pagerBox.find('i').html(pagerNowNum);
                }
            }
        }
        var queueMode = 1;
        var fwpUnitHighprice = parseFloat('${fwpUnitHighprice}');
        var fwpUnitprice = parseFloat('${fwpUnitprice}');
        var btcUsdPrice = parseFloat('${btcUsdPrice}');
        var currentByMgPrice = parseFloat('${mp_mg_per_price}');
        var currentUnitPrice = fwpUnitprice;
        var isPayPassword = $("#isPayPassword").attr('val');
        var csrfToken = '${CSRFToken}';
        var canBtnBuyClick = 1;
        var canBtnOpenMpClick = 1;
        //初始化价格
        var count = $('#masaNum').val();
        var totalPrice = count*currentUnitPrice;
        var totalByMgPrice = count*currentByMgPrice;
        var totalBtc = (totalPrice/btcUsdPrice).toFixed(4);
        var totalHighBtc = (count*fwpUnitHighprice/btcUsdPrice).toFixed(4);
        $('#text-unit-price').html(currentUnitPrice);
        $('#text-total-price').html(totalPrice);
        $('#text-total-btc').html(totalBtc);
        $('#text-one-price').html(currentUnitPrice);
        $('#text-one-btc').html(btcUsdPrice);
        $('#text-one-price-bymg').html(currentByMgPrice);
        $('#text-total-price-bymg').html(totalByMgPrice);
        //切换是否排队
        $('#btn-toggle-normal').on('click', function(){
            var count = $('#masaNum').val();
            $('.wp-price-emergency').hide();
            $('.wp-price-normal').show();
            var totalPrice = count*fwpUnitprice;
            currentUnitPrice = fwpUnitprice;
            totalBtc = (totalPrice/btcUsdPrice).toFixed(4);
            $('#text-total-price').html(totalPrice);
            $('#text-total-btc').html(totalBtc);
            $('#ishprice').val(0);
        });
        $('#btn-toggle-emergency').on('click', function(){
            var count = $('#masaNum').val();
            $('.wp-price-emergency').show();
            $('.wp-price-normal').hide();
            var totalPrice = count*fwpUnitHighprice;
            currentUnitPrice = fwpUnitHighprice;
            totalBtc = (totalPrice/btcUsdPrice).toFixed(4);
            $('#text-total-price').html(totalPrice);
            $('#text-total-btc').html(totalBtc);
            $('#ishprice').val(1);
        });
        //购买方式，btc或者mg
        $('.buythen-type').on('click', function(){
            var index = $(this).index();
            $('#payType').val(index);
            $('.paytype-price-item').hide().eq(index-1).show();
            $('.buythen-type').removeClass('buythen-type-on');
            $(this).addClass('buythen-type-on');
            if(index == 1){
            	   $('.btn-buy').find('.btn-buy-pay1').show().siblings('.btn-buy-pay2').hide();
            	   $('.top-mp-buy-detail').show();
            	   $('#ifrmname').contents().find("#center-box").removeClass('center-box-mp');
            }else if(index == 2){
            	   $('.btn-buy').find('.btn-buy-pay2').show().siblings('.btn-buy-pay1').hide();
            	   $('.top-mp-buy-detail').hide();
            	   $('#ifrmname').contents().find("#center-box").addClass('center-box-mp');
            }
        });
        //选择购买数量
        $('#masaNum').on('change', function(){
            var count = $(this).val();
            var totalPrice = count*currentUnitPrice;
            totalBtc = (totalPrice/btcUsdPrice).toFixed(4);
            totalByMgPrice = count*currentByMgPrice;
            totalHighBtc = (count*fwpUnitHighprice/btcUsdPrice).toFixed(4);
            $('#text-total-price').html(totalPrice);
            $('#text-total-btc').html(totalBtc);
            $('#text-one-price').html(currentUnitPrice);
            $('#text-one-btc').html(btcUsdPrice);
            $('#text-one-price-bymg').html(currentByMgPrice);
            $('#text-total-price-bymg').html(totalByMgPrice);
        });
        
        //提交购买
        $('#buy-form').on('submit', function(e){
            e.preventDefault();
            var payType = $('#payType').val();
            var currBtc = parseFloat($('#currBtc').val());
            var currMg = parseFloat($('#currMg').val());
            var payTypeTit = '';
            if(1 == payType && currBtc < totalBtc){
                var html = [
                    '<div class="modal fade" id="rechargeModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">',
                      '<div class="modal-dialog modal-sm" role="document">',
                        '<div class="modal-content">',
                          '<div class="modal-header">',
                            '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>',
                            '<h4 class="modal-title" id="exampleModalLabel"><@spring.messageText "record.myreco.text29" "温馨提示"/></h4>',
                          '</div>',
                          '<div class="modal-body">',
                            '<form>',
                              '<div class="form-group text-center min-height">',
                                '<@spring.messageText "record.myreco.text34" "余额不足，是否前往充值？"/>',
                              '</div>',
                              '<div class="form-group text-center">',
                                '<a class="btn-dialog-confirm" href="/deal/recharge"><@spring.messageText "record.myreco.text78" "立即充值"/></a>',
                                '<a class="btn-dialog-cancel" href="###"><@spring.messageText "record.myreco.text79" "取消"/></a>',
                              '</div>',
                            '</form>',
                          '</div>',
                        '</div>',
                      '</div>',
                    '</div>'
                ].join('');
                $(document.body).append(html);
                $('#rechargeModal').modal('show');
                $('#rechargeModal').on('hidden.bs.modal', function (e) {
                    $(this).remove();
                });
                $('#rechargeModal .btn-dialog-cancel').on('click', function(){
                    $('#rechargeModal').modal('hide');
                });
                
                console.log(payTypeTit);
                return false;
            }
            if(2 == payType && currMg < totalByMgPrice){
                var html = [
                    '<div class="modal fade" id="rechargeMgModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">',
                      '<div class="modal-dialog modal-sm" role="document">',
                        '<div class="modal-content">',
                          '<div class="modal-header">',
                            '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>',
                            '<h4 class="modal-title" id="exampleModalLabel"><@spring.messageText "record.myreco.text29" "温馨提示"/></h4>',
                          '</div>',
                          '<div class="modal-body">',
                            '<form>',
                              '<div class="form-group text-center min-height">',
                                'MG <@spring.messageText "buythen.text5040" "余额不足"/>',
                              '</div>',
                              '<div class="form-group text-center">',
                                '<a class="btn-dialog-confirm" href="javascript:void(0)"><@spring.messageText "asset.text15" "确定"/></a>',
                              '</div>',
                            '</form>',
                          '</div>',
                        '</div>',
                      '</div>',
                    '</div>'
                ].join('');
                $(document.body).append(html);
                $('#rechargeMgModal').modal('show');
                $('#rechargeMgModal').on('hidden.bs.modal', function (e) {
                    $(this).remove();
                });
                $('#rechargeMgModal .btn-dialog-confirm').on('click', function(){
                    $('#rechargeMgModal').modal('hide');
                });
                return false;
            }
            if ($('#masaNum').val()==0) {
                alertBoxFunc('<@spring.messageText "buythen.text5041" "兑换数量不能为0"/>', "sure");
                return false;
            };
            if(payType == 1){
            	     payTypeTit = '<@spring.messageText "buythen.text81" "尊享包"/>';
            }else if(payType == 2){
            	     payTypeTit = '<@spring.messageText "buythen.text82" "智慧包"/>';
            }
            var html = [
                '<div class="modal fade" id="buyModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">',
                  '<div class="modal-dialog modal-mid" role="document">',
                    '<div class="modal-content">',
                      '<div class="modal-header">',
                        '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>',
                        '<h4 class="modal-title" id="exampleModalLabel"><@spring.messageText "buythen.text5008" "订单信息确认"/></h4>',
                      '</div>',
                      '<div class="modal-body">',
                        '<form>',
                          '<div class="form-group form-group-mid  form-group-mid-center form-group-mid-one">',
                            '<@spring.messageText "buythen.text5009" "您共兑换"/>',
                            $('#masaNum').val(),
                            '<@spring.messageText "buythen.text5010" "个"/>',
                             payTypeTit,
                          '</div>',
                          '<div class="form-group form-group-mid form-group-mid-center form-group-mid-two">',
                            '（<@spring.messageText "buythen.text6001" "属于第二世纪包，内包含300MN"/>）',
                          '</div>',
                          '<div class="form-group form-group-mid form-group-mid-marbot form-group-mid-center form-group-mid-thr">',
                            '<@spring.messageText "buythen.text5011" "需支付"/>'
                ];
                if(1 == payType){
                    html.push('<em>' + $('#text-total-btc').html() + '</em>',
                            '<@spring.messageText "buythen.text5012" "BTC"/>'
                    );
                }else{
                    html.push('<em>' + $('#text-total-price-bymg').html() + '</em>MG');
                }
                    html.push(
                          '</div>',
                          <#if vcodeon?exists >
                          '<div class="form-group" id="vcode-box">',
                            '<span><@spring.messageText "buythen.text5050" "手机验证码"/>:</span>',
                            '<input type="text" class="input-vcode" placeholder="<@spring.messageText "buythen.text5050" "手机验证码"/>" />',
                            '<input type="button" class="btn-get-vcode" value="<@spring.messageText "getsmscaptcha" "获取短信验证码"/>" />',
                          '</div>',
                          </#if>
                          <#if googlecodeon?exists >
                          '<div class="form-group" id="googlecode-box">',
                                '<span><@spring.messageText "safety.text108" "谷歌验证码"/>:</span>',
                                '<input type="text" class="input-googlecode" placeholder="<@spring.messageText "safety.text108" "谷歌验证码"/>">',
                          '</div>',
                          </#if>
                          '<div class="form-group" id="pay-password-box">',
                            '<input type="password" class="pay-password"  placeholder="<@spring.messageText "buythen.text5052" "请输入支付密码"/>" />',
                            ' <a href="/v2/user/safety/into?BTN=set-paypassword"><@spring.messageText "forget_password" "忘记密码？"/></a>',
                          '</div>',
                          '<div class="form-group btn-open-wrap">',
                            '<a class="btn-buy-mp" href="###"><@spring.messageText "buythen.text5013" "确认支付"/></a>',
                          '</div>',
                        '</form>',
                      '</div>',
                    '</div>',
                  '</div>',
                '</div>');
            html = html.join('');
            $(document.body).append(html);
            $('#buyModal').modal('show');
            $('#buyModal').on('hidden.bs.modal', function(){
                $(this).remove();
            });
            if(isPayPassword==0){
                $("#buyModal #vcode-box").show();
                $("#buyModal #googlecode-box").show();
                $("#buyModal #pay-password-box").hide();
            }else if(isPayPassword==1){
                $("#buyModal #vcode-box").hide();
                $("#buyModal #googlecode-box").hide();
                $("#buyModal #pay-password-box").show();
            }
            $('#buyModal .btn-get-vcode').on('click', function(){
                var self = $(this);
                self[0].setAttribute("disabled", true);
                $.get('/user/getSmsCodeConsume/1', function(data){
                    if(0 == data.status){
                        var wait = 60;
                        self.val(wait + "<@spring.messageText "withdrawal.text20" "秒后重新发送"/>");
                        var timer = setInterval(function(){
                            if(0 == wait){
                                clearInterval(timer);
                                self[0].removeAttribute("disabled");
                                self.val('<@spring.messageText "getsmscaptcha" "获取短信验证码"/>');
                            }else{
                                self.val(wait + " <@spring.messageText "withdrawal.text20" "秒后重新发送"/>");
                                wait--;
                            }
                        }, 1000);
                        self.parent().find('input[type="text"]').focus();
                    }else{
                        self[0].removeAttribute("disabled");
                        alertBoxFunc(data.error.message, "sure");
                    }
                });
            });
            $('.btn-buy-mp').on('click', function(){
                if(!canBtnBuyClick) return;
                if(isPayPassword==0){
                    if ($('#buyModal .input-vcode').val()=="") {
                        alertBoxFunc('<@spring.messageText "safety.text27" "手机验证码不能为空。"/>','sure');
                        return;
                    }
                    if ($('#buyModal .input-googlecode').val()=="") {
                        alertBoxFunc('<@spring.messageText "safety.text111" "请输入谷歌验证码"/>','sure');
                        return;
                    }
                }else if(isPayPassword==1){
                    if ($('#buyModal .pay-password').val()=="") {
                        alertBoxFunc('支付密码不能为空！','sure')
                        return;
                    }
                }
                if ($('#masaNum').val()==0) return;
                canBtnBuyClick = 0;
                var payPasswordVal = $('#buyModal .pay-password').val();
                payPasswordVal = encodeURIComponent(ENCRYPT.encrypt(payPasswordVal));

                $.ajax({
                    type: 'POST',
                    url: '/deal/buymp',
                    data: {
                        masaNum: $('#masaNum').val(),
                        ishprice: $('#ishprice').val(),
                        payType: $('#payType').val(),
                        CSRFToken: csrfToken,
                        vcode: $('#buyModal .input-vcode').val(),
                        payPassword: payPasswordVal,
                        googlecode:$('#buyModal .input-googlecode').val()
                    },
                    success: function(data){
                        canBtnBuyClick = 1;
                        $('#buyModal').modal('hide');
                        if(0 == data.status){
                            var info = data['data'];
                            var arriveTime = info['expected.arrival.time'];
                            var amount = info['mp.count'];
                            var queue = info['line.count'];
                            if(payType == 1){
                            	    var mpTit = '<@spring.messageText "buythen.text94" "兑换成功,请耐心等待尊享包到账！"/>'
                              	var mpName = '<@spring.messageText "century.alternate.text20" "兑换尊享包数量"/>';
                            }else if(payType == 2){
                            	    var mpTit = data.data.message;
                            	    var mpName = '<@spring.messageText "century.alternate.text16" "兑换智慧包数量"/>';
                            }
                            var alertCon = '<div class="alertcon-title"><h5>'+mpTit+'</h5><p>'+ mpName +'：'+amount+'</p><p><@spring.messageText "century.alternate.text17" "您的排队位置是"/>：'+queue+'</p></div>';
                            //$('#result-time').html(arriveTime.getFullYear() + '-' + (arriveTime.getMonth()+1) + '-' + arriveTime.getDate());
                            alertBoxNew({
                                     alertTitle:'<@spring.messageText "century.alternate.text18" "温馨提示" />',
                                     alertContent:alertCon,
                                     btnType:'sure',
                                     sureFunc:function(){
                                         window.location.href = "/deal/buy?type=result&amount=" + amount + "&queue=" + queue + "&arriveTime=" + arriveTime;
                                     }
                            });
                        }else{
                            alertBoxFunc(data.error.message,'sure');
                        }
                    }
                });
            });     
        });
        //订单tab切换
        $('.oder-list-title li').on('click', function(){
            var index = $(this).index();
            //console.log(index);
            $(this).addClass('active').siblings().removeClass('active')
            $('.order-list-content').children().hide().eq(index).show();
        });
        
        //mp操作，解包
        $(document).on('click','.btn-open-mp', function(){
            var mpUuid = $(this).attr('data-uuid');
            var packType = $(this).attr('data-packtype');
            var html = [
                '<div class="modal fade" id="openMpModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">',
                  '<div class="modal-dialog modal-mid" role="document">',
                    '<div class="modal-content">',
                      '<div class="modal-header">',
                        '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>',
                        '<h4 class="modal-title" id="exampleModalLabel"><@spring.messageText "buythen.text55" "手动解包"/></h4>',
                      '</div>',
                      '<div class="modal-body">',
                        '<form>',
                          '<div class="form-group form-group-mid">',
                            '<@spring.messageText "buythen.text56" "确认解开MP编号为:"/>',
                          '</div>',
                          '<div class="form-group form-group-mid">',
                            mpUuid,
                          '</div>',
                          <#if vcodeon?exists >
                          '<div class="form-group" id="vcode-box" >',
                            '<span><@spring.messageText "buythen.text5050" "手机验证码"/>:</span>',
                            '<input type="text" class="input-vcode" placehlder="<@spring.messageText "buythen.text5050" "手机验证码"/>" />',
                            '<input type="button" class="btn-get-vcode" value="<@spring.messageText "getsmscaptcha" "获取短信验证码"/>" />',
                          '</div>',
                          </#if>
                          <#if googlecodeon?exists >
                           '<div class="form-group" id="googlecode-box">',
                                '<span><@spring.messageText "safety.text108" "谷歌验证码"/>:</span>',
                                '<input type="text" class="input-googlecode" placeholder="<@spring.messageText "safety.text108" "谷歌验证码"/>">',
                          '</div>',
                          </#if>
                          '<div class="form-group" id="pay-password-box">',
                            '<input type="password" class="pay-password"  placeholder="<@spring.messageText "buythen.text5052" "请输入支付密码"/>" />',
                            ' <a href="/v2/user/safety/into?BTN=set-paypassword"><@spring.messageText "forget_password" "忘记密码？"/></a>',
                          '</div>',
                          '<div class="form-group btn-open-wrap">',
                            '<a class="btn-open-package" href="###"><@spring.messageText "buythen.text96" "确认解包"/></a>',
                          '</div>',
                          '<div class="form-group form-group-mid-martop">',
                            '<@spring.messageText "buythen.text57" "温馨提示：亲爱的用户，解开的智慧包将转化为MN，将不能进行MP转移，请视需要进行操作"/>',
                          '</div>',
                          '<input id="mpuuid" type="hidden" value="' + mpUuid + '" />',
                        '</form>',
                      '</div>',
                    '</div>',
                  '</div>',
                '</div>'
            ].join('');
            $(document.body).append(html);
            $('#openMpModal').modal('show');
            $('#openMpModal').on('hidden.bs.modal', function(){
                $(this).remove();
            });
            if(isPayPassword==0){
                $("#openMpModal #vcode-box").show();
                $("#openMpModal #googlecode-box").show();
                $("#openMpModal #pay-password-box").hide();
            }else if(isPayPassword==1){
                $("#openMpModal #vcode-box").hide();
                $("#openMpModal #googlecode-box").hide();
                $("#openMpModal #pay-password-box").show();
            }
            $('#openMpModal .btn-get-vcode').on('click', function(){
                var self = $(this);
                self[0].setAttribute("disabled", true);
                $.get('/user/getSmsCodeConsume/4', function(data){
                    if(0 == data.status){
                        var wait = 60;
                        self.val(wait + "<@spring.messageText "withdrawal.text20" "秒后重新发送"/>");
                        var timer = setInterval(function(){
                            if(0 == wait){
                                clearInterval(timer);
                                self[0].removeAttribute("disabled");
                                self.val('<@spring.messageText "getsmscaptcha" "获取短信验证码"/>');
                            }else{
                                self.val(wait + "<@spring.messageText "withdrawal.text20" "秒后重新发送"/>");
                                wait--;
                            }
                        }, 1000);
                        self.parent().find('input[type="text"]').focus();
                    }else{
                        self[0].removeAttribute("disabled");
                        alertBoxFunc(data.error.message, "sure");
                    }
                });
            });
            $('.btn-open-package').on('click', function(){
                if(!canBtnOpenMpClick){
                    return false;
                }
                if(isPayPassword==0){
                    if ($('#openMpModal .input-vcode').val()=="") {
                        alertBoxFunc('<@spring.messageText "safety.text27" "手机验证码不能为空。"/>','sure');
                        return;
                    }
                    if ($('#openMpModal .input-googlecode').val()=="") {
                        alertBoxFunc('<@spring.messageText "safety.text111" "请输入谷歌验证码"/>','sure');
                        return;
                    }
                }else if(isPayPassword==1){
                    if ($('#openMpModal .pay-password').val()=="") {
                        alertBoxFunc('支付密码不能为空！','sure')
                        return;
                    }
                }
                canBtnOpenMpClick = 0;
                var payPasswordVal = $('#openMpModal .pay-password').val();
                payPasswordVal = encodeURIComponent(ENCRYPT.encrypt(payPasswordVal));
                $.ajax({
                    type: 'POST',
                    url: '/deal/decodemp',
                    data: {
                        mpuuid: $('#mpuuid').val(),
                        CSRFToken: csrfToken,
                        vcode: $('#openMpModal .input-vcode').val(),
                        payPassword: payPasswordVal,
                        googlecode:$('#openMpModal .input-googlecode').val()
                    },
                    success: function(data){
                        canBtnOpenMpClick = 1;
                        if(0 == data.status){
                            if(packType == 5){
                            	        var topMpNum = $('#current-mps').html()-0;
                            	        var surplusMp = $('#remaining-mps').html()-0;
                            	        if(topMpNum < 2000000){
                            	        	    $('#current-mps').html(topMpNum+1);
                            	        	    $('#remaining-mps').html(surplusMp-1);
                            	        }
	                        	       var mpsNum = data.data.mpsNum;
		                            var alertContent = '<div class="alert-mps-kings">'+
			                                               '<h3><@spring.messageText "buythen.text90" "尊享包解包成功！"/><h3>'+
			                                               '<p><@spring.messageText "buythen.text91" "恭喜您获得1个MPS股份，次日起您将获得MPS收益。"/></p>'+
			                                               '<p><@spring.messageText "buythen.text92" "您当前拥有"/>'+mpsNum+'<@spring.messageText "buythen.text93" "个MPS"/></p>'+
		                                               '</div>';
		                            alertBoxNew({
		                            	    alertWidth:'400px',
		                            	    alertContent:alertContent,
		                            	    btnType:'sure',
		                            	    sureFunc:function(){
		                            	    	    csrfToken =  data.data.CSRFToken;
			                                changeOrderInt("mod_table_6");
			                                changeOrderInt("mod_table_5");  
			                                $("#CSRFToken").val(data.data.CSRFToken);
			                                
		                            	    }
		                            });
                            }else{
                            	        alertBoxFunc(data.data.message,'sure', function(){
		                                csrfToken =  data.data.CSRFToken;
		                                changeOrderInt("mod_table_6");
		                                changeOrderInt("mod_table_5");  
		                                $("#CSRFToken").val(data.data.CSRFToken);
		                                //window.location.reload();
		                            });
                            }
                        }else{
                            alertBoxFunc(data.error.message,'sure');
                        }
                    }
                });
                $('#openMpModal').modal('hide');
            });
        });
        
        //mp操作，转移
        var countryCode = new CountryCode({
            dom: $('.btn-country-code'),
            afterCountrySelected: function(country_code, flag_code){
                $('.btn-country-code img').attr('src', 'https://o5uaa1ha4.qnssl.com/static/images/flags/'+flag_code+'.gif');
                $('#country-code').html('+' + country_code);
            }
        });
        $('#transMpModal').on('hidden.bs.modal', function (e) {
            $('#user-mobile').val('');
            $('#transMpModal .input-vcode').val('');
            $('#transMpModal .input-googlecode').val('');
            $('#user-name').hide();
            $('#trans-fee').html('0MG');
            $("#transMpModal .input-vcode").val("");
            $("#transMpModal .pay-password").val("");
        });
        $('#transMpModal .btn-get-vcode').on('click', function(){
            var self = $(this);
            self[0].setAttribute("disabled", true);
            $.get('/user/getSmsCodeConsume/2', function(data){
                if(0 == data.status){
                    var wait = 60;
                    
                    self.val(wait + "<@spring.messageText "withdrawal.text20" "秒后重新发送"/>");
                    var timer = setInterval(function(){
                        if(0 == wait){
                            clearInterval(timer);
                            self[0].removeAttribute("disabled");
                            self.val('<@spring.messageText "getsmscaptcha" "获取短信验证码"/>');
                        }else{
                            self.val(wait + "<@spring.messageText "withdrawal.text20" "秒后重新发送"/>");
                            wait--;
                        }
                    }, 1000);
                    self.parent().find('input[type="text"]').focus();
                }else{
                    self[0].removeAttribute("disabled");
                    alertBoxFunc(data.error.message, "sure");
                }
            });
        });
        $('#btn-search-user').on('click', function(){
            var mobile = $('#user-mobile').val();
            var currentCountryCode = countryCode.currentCountryCode;
            if(86 != currentCountryCode){
                mobile = '+' + currentCountryCode + ' ' + mobile;
            }
            $.ajax({
                type: 'POST',
                url: '/user/findUserByMobile',
                data: {
                    mobileNo: mobile
                },
                success: function(data){
                    if(0 == data.status){

                        if(!data.data){
                            $('#user-name').html('<@spring.messageText "buythen.text65" "用户不存在"/>');
                        }else{
                            $('#user-name').html('<@spring.messageText "buythen.text66" "用户名称："/><b>' + data.data.username)+'</b>';
                            $('#user-uuid').val(data.data.id);
                        }
                        $('#user-name').show();
                    }else{
                        alertBoxFunc(data.error.message,'sure');
                    }
                }
            });
        });
        var canBtnTransMpClick = 1;
        $('.btn-trans-package').on('click', function(){
            if(!canBtnTransMpClick){
                return false;
            }
            if(!$("#user-mobile").val()){
                alertBoxFunc('<@spring.messageText "buythen.text77" "请输入用户手机号"/>','sure');
                return false;
            }
            if(isPayPassword==0){
                if ($('#transMpModal .input-vcode').val()=="") {
                     alertBoxFunc('<@spring.messageText "buythen.text78" "请输入手机验证码"/>','sure');
                    return false;
                }
                if ($('#transMpModal .input-googlecode').val()=="") {
                  alertBoxFunc('<@spring.messageText "safety.text111" "请输入谷歌验证码"/>','sure');
                  return;
              }
            }else if(isPayPassword==1){
                if ($('#transMpModal .pay-password').val()=="") {
                    alertBoxFunc('支付密码不能为空！','sure')
                    return false;
                }
            }
            
            canBtnTransMpClick = 0;
            
            var mobile = $('#user-mobile').val();
            var currentCountryCode = countryCode.currentCountryCode;
            if(86 != currentCountryCode){
                mobile = '+' + currentCountryCode + ' ' + mobile;
            }
            $.ajax({
                type: 'POST',
                url: '/user/findUserByMobile',
                data: {
                    mobileNo: mobile
                },
                success: function(data){            
                    if(0 == data.status){
                        if(!data.data){
                            canBtnTransMpClick = 1;
                            alertBoxFunc('<@spring.messageText "buythen.text68" "用户不存在!"/>','sure');
                        }else{
                            $('#user-name').html('<@spring.messageText "buythen.text69" "用户昵称："/><b>' + data.data.username)+'</b>';
                            $('#user-uuid').val(data.data.id);

                            var payPasswordVal = $('#transMpModal .pay-password').val();
                            payPasswordVal = encodeURIComponent(ENCRYPT.encrypt(payPasswordVal));
                            $.ajax({
                                type: 'POST',
                                url: '/deal/transmp',
                                data: {
                                    touid: $('#user-uuid').val(),
                                    mpuuid: $('#mp-uuid').val(),
                                    CSRFToken: csrfToken,
                                    vcode: $('#transMpModal .input-vcode').val(),
                                    payPassword: payPasswordVal,
                                    googlecode:$('#transMpModal .input-googlecode').val()
                                },
                                success: function(data){
                                    canBtnTransMpClick = 1;
                                    if(0 == data.status){
                                        alertBoxFunc(data.data,'sure', function(){
                                            changeOrderInt("mod_table_5");
                                            changeOrderInt("mod_table_6");
                                            //window.location.reload();
                                        }); 
                                    }else{
                                        alertBoxFunc(data.error.message,'sure');
                                    }
                                }
                            });
                            $('#transMpModal').modal('hide');
                        }
                    }else{
                        canBtnTransMpClick = 1;
                        alertBoxFunc(data.error.message,'sure');
                    }
                }
            });
        });
        $('#user-mobile').on('blur', function(){
            var mobile = $('#user-mobile').val();
            var currentCountryCode = countryCode.currentCountryCode;
            if(86 != currentCountryCode){
                mobile = '+' + currentCountryCode + ' ' + mobile;
            }
            $('#user-name').hide();
            $.ajax({
                type: 'GET',
                url: '/deal/getCommission',
                data: {
                    phone: mobile,
                    mpuuid: $('#mp-uuid').val()
                },
                success: function(data){
                    if(data.status == 0){
                        $('#trans-fee').html(data.data + 'MG');
                    }else{
                        $('#trans-fee').html('0MG');
                    }
                }
            });
        });
        
        //mp操作，转移
        $(document).on('click','.btn-trans-mp', function(){
            var mpUuid = $(this).attr('data-uuid');
            $('#mp-uuid').val(mpUuid);
            $('#trans-mpuuid').html(mpUuid);

            $('#transMpModal').modal('show');
            
            if(isPayPassword==0){
                $("#transMpModal #vcode-box").show();
                $("#transMpModal #googlecode-box").show();
                $("#transMpModal #pay-password-box").hide();
            }else if(isPayPassword==1){
                $("#transMpModal #vcode-box").hide();
                $("#transMpModal #googlecode-box").hide();
                $("#transMpModal #pay-password-box").show();
            }
        });

        $('.app-pop-nav a').click(function(){
            var index = $(this).index();
            $('.app-pop-img').hide().eq(index).show();
        });
        var urlHash = window.location.hash.substr(1);
        if(urlHash && urlHash == 'open'){
            $('.oder-list-title li').eq(1).click();
        }
        
        $('.app-pop-tip span').on('click', function(){
            $('#videoModal').modal('show');
            $("#myVideo")[0].play();
        });
        $('#videoModal').on('hidden.bs.modal', function(){
            $("#myVideo")[0].pause();
        });
        $('.buythen-mgprice-tip').on('mouseenter', function(){
            $('.buythen-mgprice-tip-wrap').show();
        });
        $('.buythen-mgprice-tip').on('mouseleave', function(){
            $('.buythen-mgprice-tip-wrap').hide();
        });
        
        //  了解详情按钮
	    $('#understand-mps-btn').on('click',function(){
	    	    var alertContent = '<div class="mps-explain">'+
	    	                       '<h3><@spring.messageText "mps.text45" "1.什么是MPS?"/></h3><p><@spring.messageText "mps.text46" "MPS（Mind Pack Stake）是智慧资产的收益尊享权，即用户通过使用BTC兑换智慧包（MP）所获得的MG分配份额。"/></p>'+
	    	                       '<h3><@spring.messageText "mps.text47" "2.如何获得MPS？"/></h3><p><@spring.messageText "mps.text48" "智慧资产系统共设定200万个MPS，每个通过BTC兑换的智慧包（MP）对应一个MPS，在该智慧包成功解包后，其对应的 MPS则由解包账户所持有。"/></p>'+
	    	                       '<h3><@spring.messageText "mps.text49" "3.MPS收益如何分配？"/></h3><p><@spring.messageText "mps.text50" "全球用户每天所有兑换智慧包的MG，将全部分配给持有MPS的账户。系统根据各账户持有的MPS份额，在全球MPS总份额中的占比进行分配。"/></p>'+
	    	                       '</div>'
	    	    alertBoxNew({
	    	    	    alertWidth:'650px',
	    	    	    alertTitle:'<@spring.messageText "mps.text51" "说明"/>',
	    	    	    alertContent:alertContent,
	    	    	    btnType:'sure',
	    	    	    sureText:'<@spring.messageText "mps.text52" "我已了解"/>'
	        });
	    });
    });
</script>
</#macro>
