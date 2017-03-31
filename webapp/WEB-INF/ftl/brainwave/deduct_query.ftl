<#include "common/base-v2.ftl" />
<#macro title>
	<@spring.messageText "wave.query.text21" "全球脑波"/>
</#macro>
<#macro head>
	<link rel="stylesheet" type="text/css" href="/static/css/myquery.css?v=201609061145">
	<style type="text/css">
	    .width2{
	    	    width:240px;
	    }
	    .width3,.width4{
	      	width:180px;
	    }
	    .width5{ 
	    	     width:140px;
	   	}
	   	.width6,.width7{
	   		width:140px;
	   	}
	   	.width8{
	   		width:100px;
	   	}
		#foot_div .min_title {
			width: 980px;
			height: 20px;
			padding-left: 80px;
			padding-top: 26px;
			position: relative;
		}
		
		#min_main {
			widows: 100%;
			height: 304px;
			background: #fff;
			position: relative;
			z-index: 999;
		}
		.span1 {
			padding-left: 6px;
			color: #0e8bec;
		}
	</style>
</#macro>
<#macro body>
	<#assign nav_page="query">
		<div class="wrap">
			<#include "common/header.ftl">
				<div id="bd">
					<div class="bd-inner">
						<div class="page-title">
							<h2 class="tit-center"><@spring.messageText "deduct.query.text1" "脑波扣除公示"/></h2>
						</div>
						<div class="query_head">
							<div class="query_head_con">
								<div class="query_head_con_nav">
									<ul class="query_head_con_nav_ul">
										<li><a href="/record/meditation/my/brain/search"><@spring.messageText "wave.query.text2" "我的脑波记录"/></a></li>
										<li><a href="/record/meditation/global/brain/search"><@spring.messageText "wave.query.text4" "全球脑波公布"/></a></li>
										<li><a class="actColor" href="###"><@spring.messageText "deduct.query.text1" "脑波扣除公示"/></a></li>
									</ul>
								</div>
								<div class="query_head_con_soso">
									<span class="query_head_con_tit"><@spring.messageText "wave.query.text3" "脑波编号搜索"/></span>
									<input type="text" id="que_text" value="<@spring.messageText 'wave.query.text42' '请输入脑波编号'/>" />
									<button id="que_btn">.</button>
									<p class="query_head_con_soso_warn"><em>!</em><@spring.messageText 'deduct.query.text2' '脑波编号不存在'/></p>
								</div>
							</div>
						</div>
						<div class="query_notice">
							<div class="query_notice_left">
								  <p class="query_notice_tit"><span id="query_notice_tit"></span></p>
								  <p class="query_notice_state"><@spring.messageText "deduct.query.text9" "本世纪脑波收益没收金额"/></p>
								  <!--<em class="query_notice_remarks"><@spring.messageText "deduct.query.text11" "没收的金额会在本世纪结束后捐赠给公益组织或用于赠送体验券"/></em>-->
							</div>
							<div class="query_notice_right">
								  <p class="query_notice_tit" id="query_notice_address"></p>
								  <p class="query_notice_state"><@spring.messageText "deduct.query.text10" "基金会地址"/></p>
							</div>
						</div>
						<div class="que_body">
							<div class="body_bod">
								<span class="body_left">
                                         <@spring.messageText "deduct.query.text1" "脑波扣除公示"/>
                                </span>
								<div class="body_right" style="left:90%;">
								</div>
							</div>
							<div class="que_body_tab">
								<ul class="tab_title">
									<li class="width1">
										<@spring.messageText "wave.query.text6" "序号"/>
									</li>
									<li class="width2">
										<@spring.messageText "wave.query.text7" "脑波编号"/>
									</li>
									<li class="width3">
										<@spring.messageText "deduct.query.text12" "认证时间"/>
									</li>
									<li class="width4">
										<@spring.messageText "deduct.query.text13" "收益扣除时间"/>
									</li>
									<li class="width5">
										<@spring.messageText "wave.query.text9" "放松时长"/>
									</li>
									<li class="width6">
										<@spring.messageText "wave.query.text66" "扣除MG数"/>
									</li>
									<li class="width8">
										<@spring.messageText "wave.query.text13" "操作"/>
									</li>
								</ul>
							</div>
							<!--  图表内容 -->
							<div class="que_foot" id="table-tbody">
							</div>
							<div class="table-pager">
							</div>
						</div>
					</div>
					<#include "/decorators/footer.ftl">
				</div>
		</div>
		<div id="mywrap"></div>
</#macro>

<#macro footerjs>
	<script src="https://oepud6a2o.qnssl.com/static/js/echarts.min_afe6ba3.js"></script>
	<script type="text/javascript" src="https://oepud6a2o.qnssl.com/static/js/business/paging_2680b06.js"></script>
	<script>
		$(function() {
			var clickoff = false;
			var onoff = true; //点击文字消失
			$('#que_text').focus(function() {
				var myval = $(this).val();
				if(onoff) {
					$(this).val('');
					onoff = false;
				}
			})

			function formatSeconds(value) {
				var theTime = parseInt(value); // 秒
				var theTime1 = 0; // 分
				var theTime2 = 0; // 小时
				
				if(theTime > 60) {
					theTime1 = parseInt(theTime / 60);
					theTime = parseInt(theTime % 60);
					if(theTime1 > 60) {
						theTime2 = parseInt(theTime1 / 60);
						theTime1 = parseInt(theTime1 % 60);
					}
				}
				var result = "" + parseInt(theTime) + '<@spring.messageText "record.myreco.text92" "秒"/>';
				if(theTime1 > 0) {
					result = "" + parseInt(theTime1) + '<@spring.messageText "record.myreco.text91" "分钟"/>' + result;
				}
				if(theTime2 > 0) {
					result = "" + parseInt(theTime2) + '<@spring.messageText "record.myreco.text90" "小时"/>' + result;
				}
				return result;
			}
			//提现记录分页
			pagingFunc1();

			function pagingFunc1() {
				var paging = new pagingFunc({
					pageBox: ".table-pager",
					ajaxUrl: "/record/meditation/brainFreeze/list",
					type: "Get",
					pageKey: "bf_page",
					sizeKey: "bf_size",
					size: 100,
					mode: "Server",
					intoBox: function(data) {
						var datar = data;
						$('#query_notice_address').html(data.rows[0].mgAddress);
						$('#query_notice_tit').html(data.rows[0].sumFreeze.toFixed(4)+'MG');
						var myhtml = "";
						var bgColor;
						var datatList = data.rows[0].cheats;
						if(datatList) {
							if(datar.total > 0) {
								for(var i = 0; i < datatList.length; i++) {
									var myTime = []; //存放所有的时间
									var theval = []; //存放所有的编号
									var item = datatList[i];
									var eelapse = formatSeconds(item.elapse/ 1000); //放松的时长秒数	
									if(i % 2 == 0) {
										bgColor = '';
									} else {
										bgColor = 'bg_color';
									}
									myhtml += '<div class="foot_tab ' + bgColor + '">' +
										'<ul class="foot_ul">' +
										'<li class="width1">' + (i+1) + '</li>' +
										'<li class="width2">' + item.mdNo + '</li>' +
										'<li class="width3">' + item.startTime + '</li>' +
										'<li class="width4">' + item.addTime + '</li>' +
										'<li class="width5">' + eelapse + '</li>' +
										'<li class="width6">' + item.mgAmount.toFixed(4) + '</li>' +
										'<li class="width8 span1">' + "<@spring.messageText 'wave.query.text16' '详情'/>" + '</li>' +
										'</ul>' +
										'</div>';
									theval.push(item.meditationNo);
									myTime.push(item.approvedTime);
								}
								$('#table-tbody').html(myhtml);
								$('#table-tbody').css('height', 'auto');
								$('.table-pager').show();
								myClick('auto');
								btnspan2();
								myonmou();
								this.clcikno();
								$(window).scrollTop(0);
								$('.table-pager').children().removeClass('noclick');
								$preClick = $('.foot_tab').first();
							}
						}
					}
				})
				pagingFunc.prototype.clcikno = function() {
					var _self = this;
					var pageBoxer = $(_self.pageBox);
					pageBoxer.on('click', 'em', function(event) {
						pageBoxer.children().addClass('noclick');
					});
					pageBoxer.on('click', 'a', function(event) {
						pageBoxer.children().addClass('noclick');
					});
				}
			}
			//点击搜索脑波数据
			var tbody = $("#table-tbody");
			$('#que_text').blur(function() {
				$('#alert').css('color', '#f0f3f5');
			});
			$("#que_btn").click(function() {
					var myval = $.trim($('#que_text').val());
					var mvalert = $('#alert');
					$('.table-pager').off();
					$('.query_head_con_soso_warn').hide();
					if(myval == "") {
						pagingFunc1();
					} else {
						$.ajax({
							type: 'GET',
							url: '/record/meditation/brainFreeze/list',
							dataType: "json",
							data: {
								meditationNo: myval,
								bf_page: 0,
								bf_size:100
							},
							success: function(data) {
								if(data.status == 0) {
									if(data.data.total == 0) {
										$('.query_head_con_soso_warn').show();
									    $('#que_text').val("");
									} else {
										var mytime = data.data.rows[0].cheats[0];
										var eelapse = parseInt(mytime.elapse / 1000); //放松的时长秒数
										var mydeepTime = formatSeconds(eelapse);
										myhtml = '<div class="foot_tab">' +
											'<ul class="foot_ul">' +
											'<li class="width1">' + 1 + '</li>' +
											'<li class="width2 mymed">' + mytime.mdNo + '</li>' +
											'<li class="width3">' + mytime.startTime + '</li>' +
											'<li class="width4">' + mytime.addTime+ '</li>' +
											'<li class="width5">' + mydeepTime + '</li>' +
											'<li class="width6">' + (mytime.mgAmount).toFixed(4) + '</li>' +
									      	'<li class="width8 span1">' + "<@spring.messageText 'wave.query.text16' '详情'/>" + '</li>' +
											'</ul>' +
											'</div>';
										tbody.html(myhtml);
										tbody.css('height', '1320');
										$('.table-pager').hide();
										myClick('1320');
										btnspan2();
										myonmou();
									}
									$preClick = $('.foot_tab').first();
								} else {
									$('.query_head_con_soso_warn').show();
									$('#que_text').val("");
								}
							}
						});
					}
				})
				//鼠标移入变色
			function myonmou() {
				$('.span1').hover(function() {
					$(this).css('color', 'red');
				}, function() {
					$(this).css('color', '#0e8bec');
				})
				$('.span2').hover(function() {
					$(this).css('color', 'red');
				}, function() {
					$(this).css('color', '#0e8bec');
				})
			}
			//点击弹出图表框
			function myClick(myheight) {
				$(".span1").click(function() {
					$('.foot_div').remove();
					$preClick.removeClass('bg_dark');
					var _self = $(this);
					var mymeditationNo = $(this).parent().find('.width2').html();
					if(this.onoff) {
						this.onoff = false;
					} else {
						$.ajax({
							type: "GET",
							url: "/record/meditation/wave/" + mymeditationNo,
							dataType: "json",
							success: function(data) {
								if(data.status != 0) {
									alertBoxFunc(data.error.message, "sure");
								} else {
									var datar = data.data;
									var mynoneTime = formatSeconds(datar.noneTime / 1000); //未放松时间
									var myshal = formatSeconds(datar.shallowTime / 1000); //轻度放松时间
									var mydeep = formatSeconds(datar.deepTime / 1000); //深度放松时间
									var myHtml = '<div id="foot_div" class="foot_div" >' +
												'<div class="min_title">' +
												'<span class= "opt_time_global"></span>' +
												'<span class="opt_med"><@spring.messageText "wave.query.text7" "脑波编号"/>：' + mymeditationNo + '</span>' +
												'</div>' +
												'<div id="min_main"></div>' +
												'</div>';
									_self.offsetParent().after(myHtml);
									tbody.css('height', myheight);
									_self.offsetParent().find('ul').off();
									_self.offsetParent().addClass('bg_dark');
									$preClick = _self.parent().parent();
									btnspan2();
									var myMed = datar.meditationDatas;
									var chartsData = {
										xAxis: [],
										series: {
											name: '<@spring.messageText "wave.query.text19" "放松值"/>',
											type: 'line',
											lineStyle: {
												normal: {
													color: '#6DA9FF',
													width: 1,
												}
											},
											itemStyle: {
												normal: {
													borderColor: '#61a0a8',
													shadowBlur: '#fff',
													shadowColor: 10
												},
											},
											data: []
										}
									};
									if(myMed.length > 3600) {
										myMed.length = 3600;
									}
									if(myMed.length < 1200) {
										var timePercentage = 100;
									} else {
										var timePercentage = (1200 / myMed.length)*100;
									}
									//获取年月日
									var my_ts = _self.offsetParent().find('li').eq(2).html().substr(0, 10);
									$('.opt_time_global').html('<@spring.messageText "wave.query.text63" "日期"/>：' + my_ts);

									function formatDate(now) { //获取时分秒  
										var hour = now.getHours();
										var minute = now.getMinutes();
										var second = now.getSeconds();
										return hour + ":" + minute + ":" + second;
									}
									for(var i = 0; i < myMed.length; i++) {
										chartsData.series.data.push(myMed[i].value);
										var d = new Date(myMed[i].ts);
										chartsData.xAxis.push(formatDate(d));
									}
									var option = {
										tooltip: {
											trigger: 'axis',
											backgroundColor: '#1B2A4B'
										},
										xAxis: {
											name: '<@spring.messageText "wave.query.text20" "时间"/>',
											type: 'category',
											boundaryGap: false,
											data: chartsData.xAxis,
											interval: 10
										},
										yAxis: {
											name: '<@spring.messageText "wave.query.text19" "放松值"/>',
											type: 'value'
										},
										dataZoom: [{
											type: 'inside',
											start: 0,
											end: timePercentage
										}, {
											start: 0,
											end: 10,
											handleIcon: 'M10.7,11.9v-1.3H9.3v1.3c-4.9,0.3-8.8,4.4-8.8,9.4c0,5,3.9,9.1,8.8,9.4v1.3h1.3v-1.3c4.9-0.3,8.8-4.4,8.8-9.4C19.5,16.3,15.6,12.2,10.7,11.9z M13.3,24.4H6.7V23h6.6V24.4z M13.3,19.6H6.7v-1.4h6.6V19.6z',
											handleSize: '80%',
											handleStyle: {
												color: '#fff',
												shadowBlur: 3,
												shadowColor: 'rgba(0,0,0,0.6)',
												shadowOffsetX: 2,
												shadowOffsetY: 2
											}
										}],
										color: ['#fff', '#61a0a8', '#f04880', '#6e0ec0'],
										backgroundColor: '#f0f3f5',
										series: chartsData.series
									};
									var myChart = echarts.init(document.getElementById('min_main'));
									myChart.setOption(option);
								}
							}
						});
						this.onoff = true;
					}
				});
			};
			// 点击有异议投票
			// var span3_onoff = 0;
			function btnspan2() {
				$(".span2").click(function() {
					$('#mywrap').css('display', 'block');
					var _self = $(this);
					// if( span3_onoff > 9 ){
					//      alertBoxFunc('<@spring.messageText "meditation.complaint.exhausted1" "错误：每人每天只有10次投票机会."/>', "sure"); 
					//      var alertSure = $('.alert-sure');
					//         alertSure.click(function() {
					//           $('#mywrap').css('display', 'none');
					//         }); 
					//         return; 
					// }
					if(_self.attr('span2_onoff')) {
						alertBoxFunc('<@spring.messageText "meditation.complaint.exhausted" "错误：每天对一条脑波只能投一次票"/>', "sure");
						var alertSure = $('.alert-sure');
						alertSure.click(function() {
							$('#mywrap').css('display', 'none');
						});
					} else {
						var mymeditationNo = $(this).parent().siblings('.opt_med').html().substr(5);
						var mycount = $('#foot_div').prev().find('.foot_ul > li').eq(4);
						var mynum = parseInt(mycount.html());
						alertBoxFunc('<@spring.messageText "wave.query.text26" "您对该条脑波数据存在异议，是否提交反馈？"/>', "all");
						$('#dianji').css('margin-left', '20');
						var alertSure = $('.alert-sure');
						var alertcan = $('.alert-cancel');
						alertSure.click(function() {
							$.ajax({
								type: "POST",
								dataType: "json",
								url: "/brainwave/complaints/",
								data: {
									mdNo: mymeditationNo
								},
								success: function(data) {
									if(data.status != 0) {
										alertBoxFunc(data.error.message, "sure");
										var alertSure = $('.alert-sure');
										alertSure.click(function() {
											$('#mywrap').css('display', 'none');
										});
									} else {
										alertBoxFunc('<@spring.messageText "wave.query.text27" "您的反馈已经提交成功，感谢您对智慧资产的支持!"/>', "sure");
										var alertSure = $('.alert-sure');
										alertSure.click(function() {
											$('#mywrap').css('display', 'none');
										});
										// span3_onoff++;
										mynum += 1;
										_self.attr('span2_onoff', true);
										mycount.html(mynum);
									}
								}
							})
						});
						alertcan.click(function() {
							$('#mywrap').css('display', 'none');
						})
					}
				});
			};

		});
	</script>
</#macro>