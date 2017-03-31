<#include "common/base-v2.ftl" />
<#macro title>
<@spring.messageText "record.text1" "业绩总览"/>
</#macro>
<#macro head>
<link rel="stylesheet" type="text/css" href="/static/css/record-reco.css" />
</#macro>

<#macro body>
<#assign nav_page="record" >
<#assign endday = "10月14日" />
<#assign nav_sub_page="record_myreco" >
<div class="wrap">
<#include "common/header.ftl" >
    <div id="bd">
        <div class="bd-inner">
            <div class="page-title">
                <h2><@spring.messageText "record.text1" "业绩总览"/></h2>
            </div>
            <div class="page-content deal-page-content clearfix">
                
                <div class="col-m">
                    <div class="m-wrap">
                        <#if  (surplusBlockCount > 960)>
                            <div class="distribute-countdown distribute-countdown-1">
                                    <p><@spring.messageText "record.myreco.text41" "智慧资产全球推广分配"/></p>
                                <p class="distribute-countdown-tip"><@spring.messageText "record.myreco.text108" "将在"/>  ${surplusBlockCount} <@spring.messageText "record.myreco.text101" "个区块后分配，平均区块产生时间"/>  ${(blockAvgGenerateTime/1000)?string(',###.00')} <@spring.messageText "record.mydata.text60" "秒"/></p>
                                <p class="distribute-countdown-bottom"><@spring.messageText "record.myreco.text102" "距离下一世纪还剩"/> <b>${surplusDayCount?string(',###.00')}</b> <@spring.messageText "record.myreco.text103" "区块天"/>
                                    <i>?<span class="explain"><@spring.messageText "record.myreco.text96" "说明"/> ：<br/>
                                    1.<@spring.messageText "record.myreco.text104" "每产生960个区块定义为一个区块天"/>  <br/>
                                    2.<@spring.messageText "record.myreco.text105" "距下世纪剩余区块天数"/>=<@spring.messageText "record.myreco.text107" "剩余区块数量"/>/960<br/>
                                    3.<@spring.messageText "record.myreco.text106" "区块链运行初期，系统会以较高的算力难度，对区块速度及稳定性进行自动调整来保证前期系统的安全。随着区块链运行的逐步稳定，未来区块时间将无限接近于90秒。"/>
                                </span></i></p>
                            </div>
                        <#else>
                            <div class="distribute-countdown-box">
                                 <div class="distribute-countdown-alternation">
                                      <p class="distribute-detail"><@spring.messageText "century.alternate.text8" "距离第三世纪到来"/></p>
                                      <p class="distribute-detail-lg">
                                        <b><@spring.messageText "century.alternate.text9" "还剩"/></b><span id="BlockCountNow">${surplusBlockCount}</span><b><@spring.messageText "century.alternate.text10" "区块"/></b>
                                        <em class="opt-tip">?
                                            <i>
                                                <@spring.messageText "record.myreco.text96" "说明"/>：<br/>
                                                1.<@spring.messageText "century.alternate.text11" "当前平均区块产生时间为"/>${(blockAvgGenerateTime/1000)?string(',###.00')}<@spring.messageText "century.alternate.text14" "秒"/><br/>
                                                2.<@spring.messageText "century.alternate.text12" "区块链运行初期，系统会以较高的算力难度，对区块速度及稳定性进行自动调整来保证前期系统的安全。随着区块链运行的逐步稳定，未来区块时间将无限接近于90秒。"/>
                                            </i>
                                        </em>
                                      </p>
                                      <p class="distribute-detail-bot"><@spring.messageText "century.alternate.text13" "第三世纪开始后，用户可领取自己的矿工贡献和世纪积分奖励"/></p>
                                      <em class="triangle-icon"></em>
                                 </div>
                              </div>
                          </#if>
                             <div class="distribute-nav clearfix">
                                <div class="distribute-nav-item  distribute-nav-active">
                                    <h5><@spring.messageText "record.myreco.text47" "我的世纪矿工贡献"/></h5>
                                    <p><span><@spring.messageText "record.myreco.text48" "可领取贡献量累计"/></span><em>${rmi.unReceiveMinerMG}</em>MG<#if (rmi.unReceiveMinerMG > 0)><a href="###" class="all-reward-detail"><@spring.messageText "century.reward.text17" "领取"/></a></#if></p>
                                </div>
                                <div class="distribute-nav-item">
                                    <h5><@spring.messageText "record.myreco.text51" "我的世纪分享积分"/></h5>
                                    <!-- hide code
                                     <p  class="showData" showData="1" style="font-size:20px;text-align:center;"><@spring.messageText "record.myreco.text100" "数据正在校验中，敬请期待" /></p>
                                    -->
                                    <!-- show code  -->
                                    <p class="showData" showData="0"><span><@spring.messageText "record.myreco.text52" "可分配分享奖金"/></span><em>${rmi.shareMg}</em>MG</p>
                                </div>
                             </div>
                        <div class="distribute-content">
                            <div class="distribute-content-item" id="distribute-one">
                                <div class="distribute-table clearfix">
                                
                                        <ul class="table_head">
                                            <li><@spring.messageText "record.myreco.text55" "时间"/>(<@spring.messageText "pop.utc.text4" "格林尼治时间"/>)</li>
                                                <li><@spring.messageText "record.myreco.text56" "我的认证产值"/></li>
                                                <li><@spring.messageText "record.myreco.text57" "矿工贡献(MG)"/></li>
                                                <li><@spring.messageText "record.myreco.text58" "贡献日浮动"/></li>
                                                <li><@spring.messageText "record.myreco.text83" "操作"/></li>     
                                        </ul>  
                                    
                                    <div class="table_body">
                                        
                                         <#list rmi.recoMinereList as item>
                                        <div class="tbody_body">
                                             <div class="act_div">
                                                 <ul class="body_ul">
                                                      <li>${item.txdate}</li>
                                                      <li>${item.mg}</li>
                                                      <li>${item.minerMG}</li>
                                                      <li>
                                                      <#--${item.scale}-->
                                                          <#if item.scale?eval==0>
                                                            -
                                                           <#else>
                                                        <#if item.scale gt 0>
                                                            <span class="arrow-up"></span>
                                                        <#else>
                                                            <span class="arrow-down"></span>
                                                        </#if>
                                                            ${item.scale?abs*100}%
                                                         </#if>
                                                        </li>
                                                       <li class="li_btn">
                                                             <a href="javascript:;"><@spring.messageText "record.myreco.text84" "详情"/></a>
                                                             <#if item.hasReceive == true>
                                                                <#if item.minerMG != 0>
                                                                   <a href="###"  class="sub-reward-obtained"><@spring.messageText "century.reward.text16" "已领取"/></a>
                                                                </#if>
                                                             <#else>
                                                                 <a href="###"  class="sub-reward-detail"><@spring.messageText "century.reward.text17" "领取"/></a>
                                                             </#if>
                                                       </li>
                                                </ul>
                                            </div>  
                                              <div class="popup">

                                             </div>
                                         </div>  <!--  tbody_body    --> 
                                         </#list>
                                    </div>     <!--  table_body -->
                                </div>           <!--   distribute-table -->
                                <div class="table-pager" id="paging1">
                                
                                </div>
                            </div>            <!-- distribute-content-item -->

                            <div class="distribute-content-item distribute-content-item-active"  id="distribute-two" style="display:none;">
                                <div class="distribute-data">
                                    <@spring.messageText "record.myreco.text59" "全球奖金"/>
                                    <span>${rmi.fundsTotal} MG</span> 
                                    <@spring.messageText "record.myreco.text60" "我的分配占比"/>
                                    <span>${(rmi.globalAccounting*100)?string('#.###############')}%</span> 
                                    <em class="opt-tip opt-tip-inline">?
                                            <i>
                                                <@spring.messageText "record.myreco.text96" "说明"/>：<br/>
                                                <@spring.messageText "century.alternate.text15" "第一世纪分享积分最高占比1%，每个世纪分享积分最高占比比上世纪减少10%，即第二世纪分享积分最高占比0.9%，第三世纪分享积分最高占比0.81%，以此类推。"/>
                                            </i>
                                        </em>
                                    <@spring.messageText "record.myreco.text61" "我的积分"/>
                                    <span>${rmi.totalScores}</span> 
                                    <@spring.messageText "record.myreco.text62" "日占比浮动"/>
                                    <span>
                                        <#if rmi.dailyUp?eval==0>
                                            -
                                        <#else>
                                            ${rmi.dailyUp*100}%
                                        </#if>

                                        <#--<#if shareRose?eval==0 || shareRose?eval==1 || shareRose==-1>-->
                                            <#----->
                                        <#--<#else>-->
                                            <#--<#if shareRose gt 0>-->
                                                <#--<span class="arrow-up"></span>-->
                                            <#--<#else>-->
                                                <#--<span class="arrow-down"></span>-->
                                            <#--</#if>-->
                                            <#--${shareRose*100}%-->
                                        <#--</#if>-->
                                    </span>
                                </div>
                                <div class="distribute-table clearfix">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th><@spring.messageText "record.myreco.text63" "时间"/>(<@spring.messageText "pop.utc.text4" "格林尼治时间"/>)</th>
                                                <th><@spring.messageText "record.myreco.text64" "所属核心"/></th>
                                                <th><@spring.messageText "record.myreco.text65" "核心状态"/></th>
                                                <th><@spring.messageText "record.myreco.text66" "实际积分"/><span><img src="/static/images/exclamation.png" /><div><p><@spring.messageText "record.myreco.text80" "说明：获得积分包含能量核心获取的所有矿工贡献的世纪积分数量与子核心获取的所有矿工贡献的积分数量。"/></p></div></span></th>
                                                <th><@spring.messageText "record.myreco.text67" "流失积分"/><span><img src="/static/images/exclamation.png" /><div><p><@spring.messageText "record.myreco.text82" "说明：流失积分是未激活子核心所流失的积分。"/></p></div></span></th>
                                                <!-- <th><@spring.messageText "record.myreco.text68" "操作"/></th> -->
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <#list rmi.scoreHisVOList as item1>
                                            <tr class="listBoxTr">
                                                <td>${item1.txdate}</td>
                                                <td>${item1.onode}</td>
                                                <td>${item1.nodeStatus}</td>
                                                <td>${item1.tScore}</td>
                                                <td class="ascore">${item1.aScore}</td>
                                                <!-- <td><a href="###" class="btn-record-detail"><@spring.messageText "record.myreco.text69" "详情"/></a></td> -->
                                            </tr>
                                            <!-- <tr class="tabBoxTr" ><td  colspan="6" valign="top"><div style="overflow: hidden;background:#666;color:#FFF"></div></td></tr> -->
                                            </#list>



                                        </tbody>
                                        <#--<tbody style="display:none;">-->
                                            <#--<#if rsis?exists>-->
                                            <#--<#list rsis as item>-->
                                                <#--<tr>-->
                                                    <#--<td>${item.add_time?date}</td>-->
                                                    <#--<td>-->
                                                        <#--<#if item.stype==1>-->
                                                            <#--能量核心-->
                                                        <#--<#else>-->
                                                            <#--子核心${item.node_index}-->
                                                        <#--</#if>-->
                                                    <#--</td>-->
                                                    <#--<td>-->
                                                        <#--<#if item.stype==1 || item.status==4>-->
                                                            <#--已激活-->
                                                        <#--<#else>-->
                                                            <#--未激活-->
                                                        <#--</#if>-->
                                                    <#--</td>-->
                                                    <#--<td>${item.score}</td>-->
                                                    <#--<td>-->
                                                        <#--${item.virtual_score}-->
                                                    <#--</td>-->
                                                    <#--<td>-->
                                                        <#--<#if item.stype==1 || item.status==4>-->
                                                            <#----->
                                                        <#--<#else>-->
                                                            <#--<a href="###" class="btn-activate-core" data-cid="${item.node_id}">激活</a>-->
                                                        <#--</#if>-->
                                                    <#--</td>-->
                                                <#--</tr>-->
                                            <#--</#list>-->
                                            <#--</#if>-->
                                        <#--</tbody>-->
                                    </table>
                                </div>
                                <div class="table-pager" id="paging2">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-s">
                    <#include "common/record_side_nav.ftl" >
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
        var csrfToken = '${CSRFToken}';
        var receiveVal = '${cbi.receiveBonus}';
        //记录分页
        var paging1 = new pagingFunc({
            pageBox:"#paging1",//分页数标签的父级
            size:10, //ajax 参数 单页容量 默认10
            //mode:"Server", //分页方法 Server or FE (注意大小写),默认FE
            centerBox:"#distribute-one .table_body",//被分页内容的父级元素 mode:"FE" 时必选 
            centerSelf:".tbody_body"//本分页内容本元素 mode:"FE" 时必选 
        });
        var paging2 = new pagingFunc({
            pageBox:"#paging2",//分页数标签的父级
            size:10, //ajax 参数 单页容量 默认10
            //mode:"Server", //分页方法 Server or FE (注意大小写),默认FE
            centerBox:"#distribute-two tbody",//被分页内容的父级元素 mode:"FE" 时必选 
            centerSelf:"tr"//本分页内容本元素 mode:"FE" 时必选 
        });
        //小于960区块的时候动态的倒计时  ${surplusBlockCount}
        if(${surplusBlockCount} <= 960){
               var BlockCountTimer = setInterval(function(){
                      var nowSurplusBlockCount = ${surplusBlockCount};
                      if(nowSurplusBlockCount > 0){
                          $('#BlockCountNow').html(nowSurplusBlockCount);
                      }else{
                          clearInterval(BlockCountTimer);
                          $('#BlockCountNow').html(0);
                      }
               },2000);
        }
        var sh = $('.distribute-nav-item').find(".showData").attr('showData');
        if(sh==0){
            $('.distribute-nav-item').on('click', function(){
                var index = $(this).index();
                $('.distribute-nav-item').removeClass('distribute-nav-active').eq(index).addClass('distribute-nav-active')
                $('.distribute-content-item').hide().eq(index).show();
            });
        }
        var timeDiff =  parseInt('${rmi.golbalAssetAllocationTime}');
        
        var beginDate = new Date().getTime();
        
        function time2date(time){
            if(time < 0){
                return [0, 0, 0, 0];
            }
            var day = Math.floor(time/(1000*60*60*24));
            var hour = Math.floor((time%(1000*60*60*24))/(1000*60*60));
            var minute = Math.floor(time%(1000*60*60)/(1000*60));
            var second = Math.floor(time%(1000*60)/1000);
            
            return [day, hour, minute, second];
        }
        //var countdownTimer = setInterval(time2update,1000);
        //time2update();
        function time2update(){
            var time = new Date().getTime();
            var realTimeDiff = timeDiff - (time - beginDate);
            var count = time2date(realTimeDiff);
            var countdownBox =$("#countdown");
            var countdownHtml ="";
            // if( count[0] <=0 ){
                
            //  countdownHtml = '<fieldset>'+
      //                            '<legend><@spring.messageText "record.myreco.text111" "和我们一起迎接" />${rmi.golbalAssetAllocationTimeYYYY}<@spring.messageText "receive.century.year" "年" />${rmi.golbalAssetAllocationTimeMM}<@spring.messageText "receive.century.month" "月"/>${rmi.golbalAssetAllocationTimeDD}<@spring.messageText "receive.century.day" "日"/><@spring.messageText "record.myreco.text110" "新世纪" /></legend>'+
      //                            '<p><@spring.messageText "record.myreco.text42" "距格林尼治时间"/> ${rmi.golbalAssetAllocationTimeYYYY}<@spring.messageText "receive.century.year" "年" />${rmi.golbalAssetAllocationTimeMM}<@spring.messageText "receive.century.month" "月"/> ${rmi.golbalAssetAllocationTimeDD}<@spring.messageText "receive.century.day" "日"/> <@spring.messageText "receive.century.ld" "零点"/></p>'+
      //                            '<b id="countdown">'+time2Zero(count[1])+' : '+time2Zero(count[2])+' : '+time2Zero(count[3])+'</b>'+
      //                        '</fieldset>'+
      //                        '<div>'+
      //                            '<p><@spring.messageText "record.myreco.text112" "新世纪开始后可领取上世纪的 矿工贡献 和 世纪积分分享奖金" /></p>'+
      //                        '</div>'
      //        countdownBox.removeClass('distribute-countdown-1').addClass('distribute-countdown-2');
            // }else{
                countdownHtml = '<span id="countdown-day">'+count[0]+'</span><@spring.messageText "record.myreco.text43" "天"/><span id="countdown-hour">'+count[1]+'</span><@spring.messageText "record.myreco.text44" "时"/><span id="countdown-minute">'+count[2]+'</span><@spring.messageText "record.myreco.text45" "分"/><span id="countdown-second">'+count[3]+'</span><@spring.messageText "record.myreco.text46" "秒"/>';
                countdownBox.parent().removeClass('distribute-countdown-2').addClass('distribute-countdown-1');
            // }
            countdownBox.html(countdownHtml)
        }

        function time2Zero(time){
            if(time < 10){
                return "0"+time;
            }else{
                return time;
            }
        }
        //      世界分享弹窗
        shareModal();
        function shareModal(){
             if(receiveVal && ${cbi.sumBonusMg}>0){
                var changeHtmlTit= '<ul class="modal-con-detail-list-items modal-con-detail-list-items-title">'+
                                        '<li><@spring.messageText "century.reward.text3" "所属世纪"/></li>'+
                                        '<li><@spring.messageText "century.reward.text4" "矿工贡献奖励"/></li>'+
                                        '<li><@spring.messageText "century.reward.text5" "世纪积分奖励"/></li>'+
                                        '<li><@spring.messageText "century.reward.text6" "小计"/></li>'+
                                    '</ul>';
                var changeHtml= <#list cbi.ubList as item>
                                      '<ul class="modal-con-detail-list-items">'+
                                        '<li>${item.centuryCountStr}</li>'+
                                        '<li>${item.minersMg}</li>'+
                                        '<li>${item.shareMg}</li>'+
                                        '<li>${item.sumMg}</li>'+
                                     '</ul>' 
                                     <#if (cbi.ubList?size > (item_index+1)) > 
                                         + 
                                     </#if>
                                 </#list>
                                 <#if !cbi.ubList??>
                                      0
                                 </#if>;
                 var totalNum= ${cbi.sumBonusMg};
                 var modalTit = '<@spring.messageText "century.reward.text1" "请领取您的世纪奖励"/>';
                 var mgAddress = '/century/receive/bonus';
                 var isAmount = 0;
                receiveModal(changeHtmlTit,changeHtml,totalNum,mgAddress,isAmount,modalTit);//receiveModal(领取状态)，false = 已领取 , true = 未领取;
            }
        }
        //      领取全部按钮事件
        $('.all-reward-detail').on('click',function(){
            changeHtmlTit= '<ul class="modal-con-detail-list-items modal-con-detail-list-items-sm modal-con-detail-list-items-title">'+
                                    '<li><@spring.messageText "century.reward.text15" "日期"/></li>'+
                                    '<li><@spring.messageText "century.reward.text4" "矿工贡献奖励"/></li>'+
                                '</ul>'+
                                '<ul class="modal-con-detail-list-items modal-con-detail-list-items-sm modal-con-detail-list-items-title">'+
                                    '<li><@spring.messageText "century.reward.text15" "日期"/></li>'+
                                    '<li><@spring.messageText "century.reward.text4" "矿工贡献奖励"/></li>'+
                                '</ul>';

            var changeHtml = '';
            $.ajax({
                type:"get",
                url:"/record/myreco/miner/unreceive",
                dataType : "json",
                success:function(data){
                    if(data.status == 0){
                         var minerDetail = data.data.miner_detail;
                         var boxNum=0;
                         for(var i=0;i<minerDetail.length;i++){
                            if(minerDetail[i].mg){
                                changeHtml+='<ul class="modal-con-detail-list-items modal-con-detail-list-items-sm"><li>'+minerDetail[i].statisTime+'</li><li>'+minerDetail[i].mg.toFixed(4)+'</li></ul>';
                                boxNum++;
                            }
                         }
                         if(boxNum%2 !=0 && changeHtml != ''){
                              changeHtml +='<ul class="modal-con-detail-list-items modal-con-detail-list-items-sm modal-con-detail-list-items-sm-height"></ul>';
                         }
                         var totalNum= ${rmi.unReceiveMinerMG};
                         var modalTit = '<@spring.messageText "century.reward.text18" "请领取您的矿工贡献奖励"/>';
                         var mgAddress = '/deal/miner/receive/mg';
                         var isAmount = 1;
                         if(changeHtml != ''){
                            receiveModal(changeHtmlTit,changeHtml,totalNum,mgAddress,isAmount,modalTit);
                         }
                    }else{
                        alertBoxFunc(data.error.message, "sure");
                    }
                }
            });
        });
       //       当日的矿工贡献奖励领取按钮事件
        $('.sub-reward-detail').on('click',function(e){
            var changeHtmlTit= '<ul class="modal-con-detail-list-items modal-con-detail-list-items-big modal-con-detail-list-items-title">'+
                                    '<li><@spring.messageText "century.reward.text15" "日期"/></li>'+
                                    '<li><@spring.messageText "century.reward.text4" "矿工贡献奖励"/></li>'+
                                '</ul>';
            var changeHtml =        '<ul class="modal-con-detail-list-items modal-con-detail-list-items-big"><li id="paramTime">'+ $(this).parent().parent().find('li:eq(0)').html() +'</li><li>'+ $(this).parent().parent().find('li:eq(2)').html() +'</li></ul>';    
            var totalNum= $(this).parent().parent().find('li:eq(2)').html();
            var mgAddress = '/deal/miner/receive/mg';
            var modalTit = '<@spring.messageText "century.reward.text18" "请领取您的矿工贡献奖励"/>';
            var isAmount = 2;               
            receiveModal(changeHtmlTit,changeHtml,totalNum,mgAddress,isAmount,modalTit);
            e.stopPropagation();
        });
         //     弹窗三个公用
        function receiveModal(changeHtmlTit,changeHtml,totalNum,mgAddress,isAmount,modalTit){
                var receiveModalHtml = [
                    '<div class="modal fade" id="receiveModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">',
                      '<div class="modal-dialog modal-lg" role="document">',
                        '<div class="modal-content">',
                          '<div class="modal-header">',
                            '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>',
                            '<h4 class="modal-title" id="exampleModalLabel">'+modalTit+'</h4>',
                          '</div>',
                          '<div class="modal-body">',
                            '<div class="modal-con-detail">',
                                 '<h5 class="modal-con-detail-title"><@spring.messageText "century.reward.text2" "待领取奖励详情"/></h5>',
                                 '<div class="modal-con-detail-list">',
                                     '<div class="modal-con-detail-listbox-top">',
                                          changeHtmlTit,
                                     '</div>',
                                     '<div class="modal-con-detail-list-con">',
                                          '<div class="modal-con-detail-list-con-wid">',
                                           changeHtml,
                                           '</div>',
                                     '</div>',
                                 '</div>',
                                 '<p class="reward-total"><@spring.messageText "century.reward.text14" "总计"/>：<span class="reward-total-num">'+totalNum+'</span>MG</p>',
                            ' </div>',
                            '<form id="reward">',
                              '<div class="form-group clearfix">',
                                '<label><@spring.messageText "century.reward.text19" "领取到"/>：</label>',
                                '<div class="from-group-con" id="destination">',
                                    '<span class="active"><@spring.messageText "century.reward.text20" "智慧银行"/></span><span><@spring.messageText "century.reward.text21" "账户余额"/></span>',
                                    '<input type="hidden" id="bourn" value="0"/>',
                                '</div>',
                              '</div>',
                              '<div class="form-group clearfix" id="input-address-box">',
                                '<label><@spring.messageText "century.reward.text23" "我的个人银行地址"/>：</label>',
                                '<div class="from-group-con">',
                                    '<input type="text" id="input-address" autocomplete="off"/>',
                                    '<p><@spring.messageText "century.reward.text8" "目前领取的奖励只支持存入银行"/></p>',
                                    '<ul id="address-list">',
                                    <#list address as item>
                                        '<li>${item}</li>',
                                    </#list>
                                    '</ul>',
                                '</div>',
                              '</div>',
                              '<div class="form-group form-group-linehei clearfix" id="poundage-box">',
                                '<label><@spring.messageText "century.reward.text9" "提现手续费"/>：</label>',
                                '<div class="from-group-con">',
                                    '<span>'+ (totalNum*0.001).toFixed(4) +'</span> MG',
                                    '<p><@spring.messageText "century.reward.text10" "提现手续费为"/>0.1%</p>',
                                '</div>',
                              '</div>',
                              '<div class="form-group clearfix" id="vcodeon-group" data-vcodeon="${vcodeon}">',
                                '<label><@spring.messageText "withdrawal.text7" "短信验证码"/>：</label>',
                                '<div class="from-group-con">',
                                    '<input type="text" class="form-input" id="input-smsVCode" name="input-smsVCode" placeholder="<@spring.messageText "withdrawal.text7" "短信验证码"/>" />',
                                    '<input type="button" name="sendcode" id="sendcode" value="<@spring.messageText "getsmscaptcha" "获取短信验证码"/>" class="btn-sendvcode"/>',
                                '</div>',   
                              '</div>',
                               <#if googlecodeon?exists>
                                  '<div class="form-group clearfix googlecode-box'+isAmount+'" id="googlecode-box">',
                                      '<label><@spring.messageText "safety.text108" "谷歌验证码"/>:</label>',
                                      '<div class="from-group-con">',
                                          '<input type="text" class="input-googlecode" id="input-googlecode" placeholder="<@spring.messageText "safety.text108" "谷歌验证码"/>">',
                                      '</div>',
                                  '</div>',
                               </#if>
                              '<div class="form-group form-group-paddnone clearfix">',
                                '<p><a id="withdraw-form" href="###"> <@spring.messageText "century.reward.text24" "确定"/> </a></p>',
                                '<p class="download-address"><@spring.messageText "century.reward.text12" "没有个人银行"/>？<a href="http://www.mindgene.org" target="_blank" ><@spring.messageText "century.reward.text13" "立即下载"/></a></p>',
                              '</div>',
                            '</form>',
                          '</div>',
                        '</div>',
                      '</div>',
                    '</div>'
                ].join('');
                $(document.body).append(receiveModalHtml);
                $('#receiveModal').modal('show');
                setTimeout(function(){
                    if(isAmount==0){
                            if(!$('#vcodeon-group').attr('data-vcodeon')){
                                $('#vcodeon-group').remove();
                            }
                    }else if(isAmount == 1){
                        $('.modal-con-detail-listbox-top').css('padding-right',560-$('.modal-con-detail-list-con-wid').width());
                        }
                },180);
                $('#receiveModal').on('hidden.bs.modal', function(){
                    $(this).remove();
                });
                //发送验证码
                $('#sendcode').on('click', function(){
                    var receiveType = Number($('#bourn').val());
                    var self = $(this);
                    var btcAddress = $("#input-address").val();
                    if(receiveType!=1){
                        if (btcAddress == "" || btcAddress == null) {
                        alertBoxFunc("<@spring.messageText "withdrawal.text17" "提现地址不能为空"/>", "sure");
                        return;
                        }else if(!(/^M+/g).test($.trim(btcAddress))){
                            alertBoxFunc("<@spring.messageText "withdrawal.text30" "MG 地址错误，请重新输入"/>", "sure");
                            return;
                        }
                    }
                    $.ajax({
                        url : '/century/sms/vercode',
                        type : 'POST',
                        success : function(data) {      
                            if (data.status == 0) {
                                var wait = 60;
                                self[0].setAttribute("disabled", true);
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
                                alertBoxFunc(data.error.message, "sure");
                            }
                        },
                        error : function() {
                            alert("函数执行错误！");
                        }
                    });
                });
                //确认提现
                $('#withdraw-form').on('click', function(e){
                    e.preventDefault();
                    var receiveType = Number($('#bourn').val());
                    var btcAddress = $("#input-address").val();
                    
                    if(receiveType!=1){
                        if (btcAddress == "" || btcAddress == null) {
                            alertBoxFunc("<@spring.messageText "withdrawal.text17" "提现地址不能为空"/>", "sure");
                            return;
                        }else if(!(/^M+/g).test($.trim(btcAddress))){
                            alertBoxFunc("<@spring.messageText "withdrawal.text30" "MG 地址错误，请重新输入"/>", "sure");
                            return;
                        }
                    }
                    
                    var smsVCode = $("#input-smsVCode").val();
                    if (smsVCode == "" ) {
                        alertBoxFunc("<@spring.messageText "withdrawal.text21" "短信验证码不能为空"/>", "sure");
                        return;
                    }
                    if(isAmount ==0){
                        var googlecode = $("#input-googlecode").val();
                        if (googlecode == "" ) {
                            alertBoxFunc("<@spring.messageText "safety.text111" "请输入谷歌验证码"/>", "sure");
                            return;
                        }
                    }
                    //按钮置灰
                    $(".form-submit").attr('disabled',"true");
                    $('#withdraw-form').attr('disabled',"true");
                    var paramData={
                            'receiveType':receiveType+1,
                            'smsVCode' : smsVCode,
                            'CSRFToken': csrfToken,
                            //'serviceCharge':servicecharge,
                        }
                    if(receiveType!=1){
                        paramData.mgAddress=btcAddress;
                    }
                    if(isAmount==0){
                        paramData.googlecode=googlecode;
                    }else if(isAmount==1){
                        paramData.amount = totalNum;
                    }else if(isAmount==2){
                        paramData.amount = totalNum;
                        paramData.time = $('#paramTime').html();
                    }
                    $.ajax({
                        type : "post",
                        url : mgAddress,
                        data : paramData,
                        dataType : "json",
                        success : function(msg) {
                            if (msg.status == 0) {
                                if(receiveType!=1){
                                    alertBoxFunc(msg.data, "sure", function() {
                                        window.location = "/deal/withdraw/mg";
                                    });
                                }else{
                                    alertBoxFunc(msg.data, "sure", function() {
                                         window.location.reload();
                                    });
                                }
                            } else {
                                $(".form-submit").removeAttr("disabled");
                                $('#withdraw-form').removeAttr("disabled");
                                alertBoxFunc(msg.error.message, "sure");
                            }
                        },
                        error : function(err) {
                            $(".form-submit").removeAttr("disabled");
                            $('#withdraw-form').removeAttr("disabled");
                            console.log(err);
                        }
                    });
                });
                //领取到：智慧银行、账户余额
                $('#destination').on('click','span', function(){
                    var index = $(this).index();
                    $('#bourn').val(index);
                    if(index==1){
                        $("#input-address-box").hide();
                        $("#poundage-box").hide();
                        $(".download-address").hide();
                    }else{
                        $("#input-address-box").show();
                        $("#poundage-box").show();
                        $(".download-address").show();
                    }
                    $('#destination span').removeClass('active');
                    $(this).addClass('active');
                });
                $('#address-list').hide();
                $('#input-address').focus(function(event) {
                    $('#address-list').show();
                }).blur(function(event) {
                    setTimeout(function(){
                        $('#address-list').hide();
                    },200);
                });
                $('#address-list').on('mousedown','li', function(){
                    $("#input-address").val($(this).text());
                })
        }
        var tabBoxTr = $(".distribute-table").eq(1).find(".tabBoxTr");
        tabBoxTr.toggle(0);

        $(".ascore").each(function() {
            var that = $(this).text();
            if(that==0){$(this).text("<@spring.messageText "no.loss" "无流失"/>")}
        });        
      //最新添加
     $(".li_btn").click(function(){      

                     var andval = $(this).prev();
                     var oneval = andval.prev();
                     var towval = oneval.prev();
                     var _srif = $(this);
                     var str = $(this).parent().children().html();  
            if(this.onoff){
                               $(".popup").hide();
                               _srif.offsetParent().next().hide();
                               this.onoff = false;
            } 
           else {  
                $('.distribute-table').css('height','auto');
                if( oneval.text() == "0" || towval.text() == "0" ) { 
                    alertBoxFunc('<@spring.messageText "record.myreco.text93" "旷工贡献为0,无展示数据"/>','sure');
                    return false;  
                }
                $.ajax({
                       type : "GET",
                       dataType: "json",
                       url : "/record/myreco/minerConDetail/"+ str,
                       success: function(data){
                        var ainhtml = "";     
                        var headHtml = [ '<ul class="popup_head">',
                                             '<li><@spring.messageText "record.myreco.text85" "对我的贡献"/></li>',  
                                               '<li><@spring.messageText "record.myreco.text86" "昵称"/></li>',
                                               '<li><@spring.messageText "record.myreco.text87" "TA的邀请人"/></li>',
                                               '<li><@spring.messageText "record.myreco.text88" "TA的收益"/></li>',
                                               '<li><@spring.messageText "record.myreco.text89" "放松时间"/></li>',
                                        '</ul>'].join('');

                    for(var i =0;i<data.data.length;i++){
                            var item = data.data[i];
                            var secose = parseInt(item.elapse/1000);
                         var myTime = formatSeconds(secose);
                       
                            var rowHtml = [  '<div class="over">',
                                        '<ul class="popup_ul">',
                                             '<li>'+item.result+"MG"+'</li>', 
                                              '<li>'+item.nick_name+'</li>',
                                              '<li>'+item.directly_mobile+'</li>',
                                              '<li>'+item.miner_mg+"MG"
                                              +'</li>',
                                               '<li>'+myTime+'</li>',
                                         '</ul>',
                                         '</div'
                                ].join('');

                                ainhtml +=  rowHtml;
                     }
                
                                 _srif.offsetParent().next().html(headHtml+ainhtml);
                                 $(".popup_ul:odd").find('li').css("background","#5d5d5d");    //隔行变色
                                
                                 $(".popup").hide();  //全部隐藏
                                  _srif.offsetParent().next().show(); //当前显示
                       
                        var past_height = parseInt( _srif.offsetParent().next().find('div ul').siblings().length);
                         
                             if( past_height <= 10 ){
                                   _srif.offsetParent().next().find('div').css("overflow-y","none");
                                   $('.popup_ul li').css('width','173px');
                                   $('.over').css('height','auto');
                                   
                             }else if( past_height > 10){
                                  $('.popup_ul li').css('width','170px');
                                  $('.over').css('height','496px');
                                  _srif.offsetParent().next().find('div').css("overflow-y","auto");
                                      
                             }
                         }
                     });
                   this.onoff = true;   
           }
   });       

                
                   
      
                                    function formatSeconds(value) {
                                            var theTime = parseInt(value);// 秒
                                            var theTime1 = 0;// 分
                                            var theTime2 = 0;// 小时
                                            if(theTime > 60) {
                                                theTime1 = parseInt(theTime/60);
                                                theTime = parseInt(theTime%60);
                                                    if(theTime1 > 60) {
                                                    theTime2 = parseInt(theTime1/60);
                                                    theTime1 = parseInt(theTime1%60);
                                                    }
                                    }

                                                var result = ""+parseInt(theTime)+'<@spring.messageText "record.myreco.text92" "秒"/>';
                                                if(theTime1 > 0) {
                                                result = ""+parseInt(theTime1)+'<@spring.messageText "record.myreco.text91" "分钟"/>'+result;
                                                }
                                                if(theTime2 > 0) {
                                                result = ""+parseInt(theTime2)+'<@spring.messageText "record.myreco.text90" "小时"/>'+result;
                                                }
                                               
                                            return result;
                                        }

                      


    });
</script>
</#macro>
