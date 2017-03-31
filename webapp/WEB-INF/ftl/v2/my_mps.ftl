<#include "common/base-v2.ftl" />
<#macro title>
    <@spring.messageText "safety.text1" "账户"/>
</#macro>
<#macro head>
<link rel="stylesheet" type="text/css" href="/static/css/my_mps.css"/>
</#macro>
<#macro body>
    <#assign nav_page="user">
    <#assign nav_sub_page="user_mps">
<div class="wrap">
    <#include "common/header.ftl">
    <div id="bd">
        <div class="bd-inner">
            <div class="page-title">
                <h2 class="text-center"><@spring.messageText "account.info.text1" "个人中心"/></h2>
            </div>
            <div class="page-content deal-page-content clearfix">
                <div class="col-m">
                    <div class="m-wrap need_verification">
                        <div class="mps-boxcon">
                        	     <div class="mps-head">
                                <div class="mps-head-sub mps-color1">
                                	     <h4><@spring.messageText "mps.text1" "今日收益"/></h4>
                                	     <p class="mps-head-sub-num">${userMpsInfo.todayOneselfIncome?string('0.0000')}MG</p>
                                	     <div class="mps-head-sub-bot"><span class="mps-head-sub-bot-tit"><@spring.messageText "mps.text2" "今日全球分配"/></span>${userMpsInfo.todayGlobalInCome?string('0.0000')}MG</div>
                                </div>
                                <div class="mps-head-sub mps-color2">
                                	     <h4><@spring.messageText "mps.text3" "累计收益（截止到今日）"/></h4>
                                	     <p class="mps-head-sub-num">${userMpsInfo.incomeOneselfTotal?string('0.0000')}MG</p>
                                	     <div class="mps-head-sub-bot"><span class="mps-head-sub-bot-tit"><@spring.messageText "mps.text4" "全球累计分配"/></span>${userMpsInfo.incomeGlobalTotal?string('0.0000')}MG</div>
                                </div>
                                <div class="mps-head-sub mps-color3">
                                	     <h4><@spring.messageText "mps.text5" "我的MPS"/></h4>
                                	     <p class="mps-head-sub-num">${userMpsInfo.oneselfMpsNum}</p>
                                	     <div class="mps-head-sub-bot"><span class="mps-head-sub-bot-tit2"><@spring.messageText "mps.text64" "我的MPS占比"/>：<span class="mps-account">${(userMpsInfo.mpsGlobalRatio/100000)?string('0.####')}‰</span></span></div>
                                     <div class="mps-global-num">
                                     	    <span class="border-em"><@spring.messageText "buythen.text1114" "当前全球MPS"/>：${userMpsInfo.globalMpsNum}</span><br />
                                     	    <span><@spring.messageText "buythen.text1115" "全球剩余MPS"/>：${2000000 - userMpsInfo.globalMpsNum}</span>
                                     </div>
                                </div>
                              </div>
                               <p class="understand-mps"><@spring.messageText "mps.text7" "不了解MPS"/>？<a href="###" id="understand-mps-btn"><@spring.messageText "mps.text8" "了解详情"/></a></p>
                        </div>
                        <div class="mps-boxcon">
                            <div class="mps-info-top clearfix">
                                <h3><b></b><@spring.messageText "mps.text9" "收益走势"/></h3>
                                <select calss="account-info-sel" id="mps-boxcon-time">
                                	    <option value=""><@spring.messageText "mps.text62" "天"/></option>
                                    <option value=""><@spring.messageText "mps.text10" "周"/></option>
                                    <option value=""><@spring.messageText "mps.text11" "月"/></option>
                                    <option value=""><@spring.messageText "mps.text12" "年"/></option>
                                </select>
                            </div>
                            <div class="mps-echarts">
                            	     <div id="mps-echarts-form" class="mps-echarts-form">
                            	     	
                            	     </div>
                            	     <div class="mps-echarts-note">
                            	     	  <a href="###" class="shrinkage-btn">&gt;</a>
                            	     	  <div class="mps-echarts-note-head">
                            	     	  	   <h4 class="mps-echarts-note-head-tit"><em></em><@spring.messageText "mps.text13" "我的MPS占比"/></h4>
                            	     	  	   <h4 class="mps-echarts-note-head-tit"><em class="icon-color"></em><@spring.messageText "mps.text14" "我的日收益"/></h4>
                            	     	  </div>
                            	     	  <div class="mps-echarts-note-con">
                            	     	  	   <h4><@spring.messageText "mps.text15" "图表说明"/>：</h4>
                            	     	  	   <p><@spring.messageText "mps.text16" "我的MPS占比 = 我的MPS持有量／全球MPS总量"/></p>
                            	     	  	   <p><@spring.messageText "mps.text17" "我的日收益 = 当日全球分配总量 x 当日MPS占比"/></p>
                            	     	  </div>
                            	     </div>
                            </div>
                        </div>
                        <div class="mps-boxcon">
                        	    <div class="mps-info-top clearfix">
                                <h3><b></b><@spring.messageText "mps.text19" "分配详情"/></h3>
                                <a href="###" class="mps-publish-btn" id="mps-publish-btn"><@spring.messageText "mps.text22" "MPS公布"/></a>
                            </div>
                            <div class="mps-info-top clearfix">
                                 <ul class="mps-info-tab">
                                 	<li class="active-tab"><a href="###"><@spring.messageText "mps.text20" "全部"/></a></li>
                                 	<li><a href="###"><@spring.messageText "mps.text21" "解锁记录"/></a></li>
                                 </ul>
                                 <div class="mps-info-detail">
                                 	 <p><@spring.messageText "mps.text23" "已解锁"/>：${userMpsInfo.unLockMg?string('0.0000')}MG</p>
                                 	 <p><@spring.messageText "mps.text24" "锁定中"/>：${userMpsInfo.frozenMG?string('0.0000')}MG</p>
                                 </div>
                            </div>
                            <div class="mps-info-list">
                            	     <div class="mps-info-sub-list sub-list-mod1">
                            	     	   <table>
						                    <thead>
						                        <tr>
						                            <th><@spring.messageText "mps.text25" "分配日期"/></th>
						                            <th><@spring.messageText "mps.text26" "全球分配总量(MG)"/></th>
						                            <th><@spring.messageText "mps.text27" "我的分配量(MG)"/></th>
						                            <th><@spring.messageText "mps.text28" "累计MPS"/></th>
						                            <th><@spring.messageText "mps.text29" "分配占比"/></th>
						                            <th><@spring.messageText "mps.text30" "锁定中(MG)"/></th>
						                            <th><@spring.messageText "mps.text31" "已解锁(MG)"/></th>
						                            <th></th>
						                        </tr>
						                    </thead>
						                    <tbody id="sub-list-all">
						                    	 
						                    </tbody>
						                </table>
						                <div class="table-pager-allDetail">
	                                    </div>
                            	     </div>
                            	     <div class="mps-info-sub-list sub-list-mod2">
                            	     	   <table>
						                    <thead>
						                        <tr>
						                            <th><@spring.messageText "mps.text32" "解锁日期"/></th>
						                            <th><@spring.messageText "mps.text25" "分配日期"/></th>
						                            <th>Locktime</th>
						                            <th><@spring.messageText "mps.text33" "当日分配占比"/></th>
						                            <th><@spring.messageText "mps.text34" "分配总量(MG)"/></th>
						                            <th><@spring.messageText "mps.text35" "我的分配量(MG)"/></th>
						                            <!--<th><@spring.messageText "mps.text36" "操作"/></th>-->
						                        </tr>
						                    </thead>
						                    <tbody id="sub-list-unlocked">
						                    	    
						                    </tbody>
						                </table>
						                <div class="table-pager-unlockedDetail">
	                                    </div>
                            	     </div>
                            	    
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-s">
                    <#include "common/user_side_nav.ftl">
                </div>
            </div>
        </div>
    </div>
    <div class="mps-publish-con">
    	     
    </div>
    <#include "/decorators/footer.ftl">
</div>
</#macro>
<#macro footerjs>      
<script src="/static/js/echarts.min.js"></script>
<script type="text/javascript" src="/static/js/business/paging.js"></script>
<script type="text/javascript">  
    $(function () {
    	    console.log();
    	    $('.mps-account').attr('title',(${userMpsInfo.mpsGlobalRatio}/100000)+'‰');
    	    //echarts 图表显示
    	    $.ajax({
	    	    type: "GET",
			dataType: "json",
	    	    	url:"/mps/inComeChating",
	    	    	data:0,
	    	    success:function(data){
	    	    	     var tooltip;
	    	    	     var dataNew = data.data;
	    	    	     var xAxisData = [];
	    	    	     var barData = [];
	    	    	     var lineData = [];
	    	    	     var showNum=0;
	    	    	     for(var i=0;i<dataNew.length;i++){
	    	    	     	   	  xAxisData.push(dataNew[i].addTime.substr(5,5));
		    	    	     	  barData.push(retainFour(dataNew[i].mgAmount,4));
		    	    	     	  lineData.push((dataNew[i].mpsRatio*1000).toFixed(4));
		    	    	 }
	    	    	     if(data.data.length){
	    	    	     	 tooltip={
					        trigger: 'axis',
					        borderWidth:1,
					        borderColor:'#0E8BEC',
					        formatter: '<span class="window-color1">{b0}</span><br /><span class="window-color2">{a0}：{c0}（MG）</span><br /><span class="window-color3">{a1}：{c1}‰</span>',
					        axisPointer:{
					        	    lineStyle:{
					        	    	   color:'#fff'
					        	    }
					        }
					    };
		    	    	     }else{
		    	    	    	    tooltip={
		    	    	     		show:false
		    	    	     	};
		    	    	     	$('.mps-echarts').append('<h2 class="mps-echarts-nodata">暂无数据<h2>');
		    	    	     }
		    	    	     if(data.data.length > 20){
		    	    	     	showNum = 20/data.data.length*100;
		    	    	     }else{
		    	    	     	showNum=100;
		    	    	     }
		    	    	     option = {
					    tooltip:tooltip,
					    xAxis: [
					        {
					            type: 'category',
					            data:xAxisData,
					            axisLine:{
					            	    lineStyle:{
					            	    	    color:'#9B9B9B'
					            	    }
					            },
					            axisTick: {
					                alignWithLabel: true
					            }
					        }
					    ],
					    yAxis: [
					        {
					            type: 'value',
					            name: '<@spring.messageText "mps.text14" "我的日收益"/>(MG)',
					            nameGap:10,
					            nameTextStyle:{
					            	    color:'#0E8BEC'
					            },
					            axisLine:{
					            	    lineStyle:{
					            	    	    color:'#0E8BEC'
					            	    }
					            },
					            splitLine:{
					                show:true,
					                lineStyle:{
					                    color:['#333'],
					                    type:'dotted'
					                }
					            }
					            
					        },
					        {
					            type: 'value',
					            name: '<@spring.messageText "mps.text13" "我的MPS占比"/>(‰)',
			                    nameTextStyle:{
					            	    color:'#F1CC45'
					            },
					            axisLine:{
					            	    lineStyle:{
					            	    	    color:'#F1CC45'
					            	    }
					            },
					            splitLine:{
					                show:false,
					                lineStyle:{
					                    color:['#333'],
					                    type:'dotted'
					                }
					            }
					        }
					    ],
					    series: [
					        {
					            name:'<@spring.messageText "mps.text43" "收益"/>',
					            type:'bar',
					            itemStyle:{
					            	    normal:{
					            	    	    color:'#0E8BEC'
					            	    }
					            },
					            barMaxWidth:'30px',
					            data:barData
					        },
					        {
					            name:'<@spring.messageText "mps.text44" "占比"/>',
					            type:'line',
					            yAxisIndex: 1,
					            itemStyle:{
					            	    normal:{
					            	    	    color:'#F1CC45'
					            	    }
					            },
					            data:lineData
					        }
					    ],
						dataZoom: [{
					        type: 'inside',
					        start: 0,
					        end: showNum
					    }, {
					        start: 0,
					        end: 10,
					        handleSize: '100%',
					        handleStyle: {
					            color: '#0E8BEC',
					            shadowBlur: 3,
					            shadowColor: 'rgba(0, 0, 0, 0.6)',
					        },
					        dataBackground:{
					        	   lineStyle:{
					        	   	    color:'#F1CC45',
					        	   	    width:1
					        	   }
					        },
					        borderColor:'transparent',
					        textStyle:{
					        	   color:'#9B9B9B'
					        }
					    }],
					};
					var myChart = echarts.init(document.getElementById('mps-echarts-form'));
					myChart.setOption(option);
    	    	    }
    	    });
		
	    //  图表说明按钮 收缩功能
		// $('.shrinkage-btn').on('click',function(){
		// 	     $('.mps-echarts-note').addClass('slide-inup');
		// })
	    //全部 和 解锁记录 tab切换时
	    var clickNum = 0;
	    $('.mps-info-tab > li').on('click',function(){
	    	      var $index = $(this).index();
	    	      var $subList = $('.mps-info-list > .mps-info-sub-list');
	    	      $(this).addClass('active-tab').siblings().removeClass('active-tab');
	    	      $subList.eq($index).show().siblings().hide();
	    	      if($index == 1 && clickNum==0){
	    	      	clickNum++;
	    	      	unlockedDetail();
	    	      }
	    });
	    //分配详情  全部 列表
	    publishedRecordAll();
	    function publishedRecordAll(){
	    	      var paging = new pagingFunc({
	   	    	     pageBox: ".table-pager-allDetail",
	             ajaxUrl: "/mps/expirdAll", 
	             pageKey: "expird_page",
	             sizeKey: "expird_size",
	             type: "GET",
			     size:10,
			     mode:"Server",
			     intoBox : function(data){
			         var datar = data.rows;
			         var htmlT="";
			         var titleMpsRatio;
			         if (datar==null || datar.length <= 0) {
			             htmlT='<div class="table-tr clearfix"><em></em><@spring.messageText "mps.text61" "暂无记录"/></div>';
			             $('.table-pager-allDetail').hide();
			         } else{
			             for(var i=0;i<datar.length;i++){
			             	   if(datar[i].oneselfDistributionMg > 0){
			             	   	  var borderBtn = '<span class="border-icon"><@spring.messageText "record.myreco.text84" "详情"/><span>';
			             	   	  htmlT +='<tr calss="trBtn">';
			             	   }else{
			             	   	  var borderBtn = '';
			             	   	  htmlT +='<tr>';
			             	   }
			             	   htmlT +=    '<td>'+datar[i].distributionTime.substr(0,10)+'</td>'+
			             	               '<td>'+retainFour(datar[i].globalDistributionMg,4)+'</td>'+
			             	               '<td>'+retainFour(datar[i].oneselfDistributionMg,4)+'</td>'+
			             	               '<td>'+datar[i].mpsNum+'</td>'+
			             	               '<td title="'+retainFour(datar[i].mpsRatio*1000,8)+'‰">'+(datar[i].mpsRatio*1000).toFixed(4)+'‰</td>'+
			             	               '<td>'+retainFour(datar[i].frozenMg.toFixed(10),4)+'</td>'+
			             	               '<td>'+retainFour(datar[i].unlockMg,4)+'</td>'+
			             	               '<td>'+borderBtn+'</td>'+
			             	            '</tr>';
			             }
			             $('.table-pager-allDetail').show();
			         };
			         $("#sub-list-all").html(htmlT); 
			         subDetail();
			      }
	   	      });
	    }
	    //点击三角图表  出现当日分配详情
	    function subDetail(){
	           var $preEm;
	    	       $('#sub-list-all tr').on('click',function(){
	    	       	    if($(this).find('.border-icon').length > 0){
	    	       	    	    $('.mps-day-publish-box').remove();
		    	       	    $('.mps-day-publish').remove();
		    	       	    var distributionTime = {
		    	       	    	        time:$(this).find('td:first').html()
		    	       	    }
		    	       	    var $that = $(this);
		   	       	    if($(this).hasClass('rotate-180')){
		   	       	    	    $(this).removeClass('rotate-180');   
		   	       	    }else{
		   	       	    	    if($preEm){
		   	       	    	    	   $preEm.removeClass('rotate-180');
		   	       	    	    }
		   	       	    	    $(this).addClass('rotate-180');
		   	       	    	    $.ajax({
			   	       	    	    	type:"GET",
			   	       	    	    	dataType: "json",
			   	       	    	    	url:"/mps/expirdDetailByTime",
			   	       	    	    	data:distributionTime,
			   	       	    	    	success:function(data){
			   	       	    	    		var datar = data.data;
			   	       	    	    		var htmlDetail = '';
			   	       	    	    		var status;
			   	       	    	    		for(var i=0;i<datar.length;i++){
			   	       	    	    			if(datar[i].flag ==0){
			   	       	    	    				status = '<@spring.messageText "mps.text24" "锁定中"/>';
			   	       	    	    			}else{
			   	       	    	    				status = '<@spring.messageText "mps.text23" "已解锁"/>';
			   	       	    	    			}
			   	       	    	    			htmlDetail += '<tr>'+
								                           '<td>'+datar[i].period+'</td>'+
								                           '<td>'+datar[i].lockTime+'</td>'+
								                           '<td>'+ (datar[i].expectUnLockTime ? datar[i].expectUnLockTime.substr(0,10) : '-') +'</td>'+
								                           '<td>'+retainFour(datar[i].oneselfMg,8)+'</td>'+
								                           '<td>'+status+'</td>'+
								                       '</tr>';
			   	       	    	    		}
			   	       	    	    		var DetailHtml = [
									              '<table class="mps-day-publish">',
									                  '<thead>',
									                      '<th>Locktime</th>',
									                      '<th><@spring.messageText "mps.text58" "到账区块"/></th>',
									                      '<th><@spring.messageText "mps.text59" "预计解锁日"/></th>',
									                      '<th><@spring.messageText "mps.text35" "我的分配量(MG)"/></th>',
									                      '<th><@spring.messageText "mps.text60" "状态"/></th>',
									                  '</thead>',
									                  '<tbody>',
									                      htmlDetail,
									                  '</tbody>',
									              '</table>',    
										   ].join('');
								      var psoTop = $that.offset().top-$('.sub-list-mod1').offset().top+60;
									  $that.after('<div class="mps-day-publish-box"></div>');
									  $('.sub-list-mod1').append(DetailHtml);
									  $('.mps-day-publish').css('top',psoTop+'px');
									  $preEm = $that;
			   	       	    	    	}
		   	       	    	    });
		   	       	    }
	    	       	    }
				});
	    }
	    //解锁记录 tab 下面的列表详情
	    function unlockedDetail(){
	      	var paging2 = new pagingFunc({
	   	    	     pageBox: ".table-pager-unlockedDetail",
	             ajaxUrl: "/mps/arriveLog", 
	             pageKey: "arrive_page",
	             sizeKey: "arrive_size",
	             type: "GET",
			     size:10,
			     mode:"Server",
			     intoBox : function(data){
			         var datar = data.rows;
			         var htmlT="";
			         var titleMpsRatio;
			         if (datar==null || datar.length <= 0) {
			             htmlT='<div class="table-tr clearfix"><em></em><@spring.messageText "mps.text61" "暂无记录"/></div>';
			             $('.table-pager-unlockedDetail').hide();
			         } else{
			             for(var i=0;i<datar.length;i++){
			             	   htmlT +='<tr>'+
			             	               '<td>'+datar[i].updateTime.substr(0,10)+'</td>'+
			             	               '<td>'+datar[i].distributionTime.substr(0,10)+'</td>'+
			             	               '<td>'+datar[i].period+'</td>'+
			             	               '<td title="'+retainFour(datar[i].mpsRatio*1000,8)+'‰">'+(datar[i].mpsRatio*1000).toFixed(4)+'‰</td>'+
			             	               '<td>'+retainFour(datar[i].mgCountAmount,4)+'</td>'+
			             	               '<td>'+retainFour(datar[i].mgAmount,8)+'</td>'+
			             	            '</tr>';
			             }
			             $('.table-pager-unlockedDetail').show();
			         };
			         $("#sub-list-unlocked").html(htmlT);
			      }
	   	      });
	    }
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
	   //MPS公布 按钮弹窗
	   $('#mps-publish-btn').on('click',function(){
	   	    var html = [
	            '<div class="modal fade " id="rechargeModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">',
	              '<div class="modal-dialog modal-mps" role="document">',
	                '<div class="modal-content mps-list-con">',
	                  '<div class="modal-header">',
	                    '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>',
	                    '<h4 class="modal-title" id="exampleModalLabel"><@spring.messageText "mps.text22" "MPS公布"/></h4>',
	                  '</div>',
	                  '<div class="modal-body">',
	                        '<table class="mps-publish-table">',
	                             '<thead>',
	                                   '<tr>',
	                                       '<th><@spring.messageText "mps.text37" "使用区块时间"/></th>',
	                                       '<th><@spring.messageText "mps.text56" "locktime地址"/><em class="icon-mark">?<p><@spring.messageText "mps.text53" "该地址是把每日的分配总额进行locktime的地址，并且均分为32、64、128、256、512、1024六档locktime"/></p></em></th>',
	                                   '</tr>',
	                             '</thead>',
	                             '<tbody id="mps-list" class="mps-list">',
	                                    '<tr>',
	                                        '<td>96001~192000</td>',
	                                        '<td>MsWvLwRdDQ9vsQGecisdsJFE1ekP8T4BWb</td>',
	                                    '</tr>',
	                                    '<tr>',
	                                        '<td>192001~<@spring.messageText "mps.text65" "至今"/></td>',
	                                        '<td>MsWvLwRdDQ9vsQGecisdsJFE1ekP8T4BWb</td>',
	                                    '</tr>',
	                             '</tbody>',
	                        '</table>',
	                        '<div class="table-pager-publish">',
	                        '</div>',
	                  '</div>',
	                '</div>',
	              '</div>',
	            '</div>'
	        ].join('');
	        $(document.body).append(html);
	        $('#rechargeModal').modal('show');
      });
       function retainFour(num,figure){
       	     var numString = num.toString();
       	     var reg = eval('/(\\d+)(\\.{0,1}\\d{0,'+figure+'})/');
       	     var newNUm;
       	     numString.replace(reg,function(str){
       	     	if(str == 0){
       	     		newNUm = 0;
       	     	}else{
       	     		newNUm = str;
       	     	}
       	     	 
       	     });
       	     return newNUm;
       } 
    });   
    
</script>
</#macro>