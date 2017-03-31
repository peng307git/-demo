<#include "common/base-v2.ftl" />
<#macro title>
	<@spring.messageText "wave.query.text1" "脑波查询"/>
</#macro>
<#macro head>
	<link rel="stylesheet" type="text/css" href="/static/css/myquery.css?v=201609061145">

</#macro>

<#macro body>
	<#assign nav_page="query">
		<div class="wrap">
			<#include "common/header.ftl">
				<div id="bd">
					<div class="bd-inner">
						<div class="page-title">
							<h2 class="tit-center"><@spring.messageText "wave.query.text1" "脑波查询"/></h2>
						</div>
						<div class="query_head">
							<div class="query_head_con">
								<div class="query_head_con_nav">
									<ul class="query_head_con_nav_ul">
										<li><a class="actColor" href="###"><@spring.messageText "wave.query.text2" "我的脑波记录"/></a></li>
										<li><a href="/record/meditation/global/brain/search"><@spring.messageText "wave.query.text4" "全球脑波公布"/></a></li>
										<li><a href="/record/meditation/deduct/brain/search"><@spring.messageText "deduct.query.text1" "脑波扣除公示"/></a></li>
									</ul>
								</div>
								<div class="query_head_con_soso">
									    <span class="query_head_con_tit"><@spring.messageText "wave.query.text3" "脑波编号搜索"/></span>
										<input type="text" id="que_text" value="<@spring.messageText 'wave.query.text42' '请输入脑波编号'/> " />
										<button id="que_btn">.</button>
										<p class="query_head_con_soso_warn"><em>!</em><@spring.messageText 'deduct.query.text2' '脑波编号不存在'/></p>
								</div>
							</div>
						</div>
						<!--<div id="alert"></div>-->
						<div class="que_body">
							<div class="que_body_con">
								<div class="body_bod">
									<span class="body_left">
	                                   <@spring.messageText "wave.query.text2" "我的脑波记录"/> 
	                               </span>
									<div class="body_right">
										<ul class="timebar">
											<li>
												<input id="begin_time" style="width:125px;" class="laydate-icon" onclick="laydate({elem:'#begin_time',istime: true, format: 'YYYY-MM-DD hh:mm:ss'})"> －
												<input id="end_time" style="width:125px;" class="laydate-icon" onclick="laydate({elem:'#end_time',istime: true, format: 'YYYY-MM-DD hh:mm:ss'})">
											</li>
										</ul>
									    <select id="select-btn">
									       	<option value=""><@spring.messageText "account.info.text10" "全部"/></option>
									        <option value="1"><@spring.messageText "deduct.query.text28" "正常"/></option>
									        <option value="-2"><@spring.messageText "deduct.query.text29" "作弊"/></option>
                                             <option value="101"><@spring.messageText "deduct.query.text1001" "待转化"/></option>
									    </select>
									    <button id="body_btn"> <@spring.messageText "wave.query.text5" "确定"/> </button>
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
											<@spring.messageText "wave.query.text8" "放松时间(格林尼治)"/>
										</li>
										<li class="width4">
											<@spring.messageText "wave.query.text9" "放松时长"/>
										</li>
										<li class="width5">
											<@spring.messageText "wave.query.text10" "深度放松时长"/>
										</li>
										<li class="width6">
											<@spring.messageText "wave.query.text11" "获得MG数"/>
										</li>
										<li class="width7">
											<@spring.messageText "wave.query.text13" "操作"/>
										</li>
										<li class="width8">
											<@spring.messageText "deduct.query.text7" "状态"/>
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
					</div>
					<#include "/decorators/footer.ftl">
				</div>
		</div>

</#macro>
<#macro footerjs>
	<script type="text/javascript" src="/static/js/laydate/js/laydate.js?v=201609051048"></script>
	<script src="/static/js/echarts.min.js"></script>
	<script type="text/javascript" src="/static/js/business/paging.js"></script>
	<script>
		$(function() {
			var onoff = true; //点击文字消失
			var $preClick = null;
			$('#que_text').focus(function() {
					var myval = $(this).val();
					if(onoff) {
						$(this).val('');
						onoff = false;
					}
				})
			//时间
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
			var myTime = []; //存放所有的时间
			var theval = []; //存放所有的编号
			var status='';
			//提现记录分页
			pagingFunc1();
			$('#select-btn').on('change', function () {
				    $('.table-pager').off();
		            status = $('#select-btn').val();
            });
			function pagingFunc1() {
				var paging1 = new pagingFunc({
					pageBox: ".table-pager",
					ajaxUrl: "/record/meditation/history/list",
					type: "Get",
					pageKey: "mhl_page_page",
					sizeKey: "mhl_page_size",
					size: 100,
					otherData:"status="+status,
					mode: "Server",
					intoBox: function(data) {
						    	pageDataList(data);
					}
				})
			};
			//点击搜索脑波数据
			var tbody = $("#table-tbody");
			$("#que_btn").click(function() {
					$('.table-pager').off();
					var myval = $.trim($('#que_text').val());
					var myhtml = "";
					$('.query_head_con_soso_warn').hide();
					if(myval == "") {
						$('.table-pager').html('');
						pagingFunc1();
					} else {
						$.ajax({
							type: 'GET',
							url: '/record/meditation/history/list',
							dataType: "json",
							data: {
								meditationNo: myval,
								mhl_page_page: 0,
								status:''
							},
							success: function(data) {
							  if(data.data){
							  	pageDataList(data.data);
							  }else{
							  	$('.query_head_con_soso_warn').show();
							  }
							}
						});
					}
				})
			//点击弹出图表框
			function myClick(){
				$(".span1").click(function() {
					$('.foot_div').remove();
					$preClick.removeClass('bg_dark');
					var mymeditationNo = $(this).siblings('.width2').html();
					var _self = $(this);
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
												'<@spring.messageText "wave.query.text23" "深度放松"/>：<span class="s_m">'+ mydeep+'</' + 'span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +
												'<@spring.messageText "wave.query.text24" "轻度放松"/>：<span class="z_m">'+myshal+'</' + 'span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +
												'<@spring.messageText "wave.query.text25" "未放松"/>：<span class="q_m">'+ mynoneTime+'</span>' +
												'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +
												'<span class= "opt_time"></span>' +
												'</div>' +
												'<div id="min_main" style="height: 100%"></div>' +
												'</div>';
									_self.offsetParent().after(myHtml);
									_self.offsetParent().find('ul').off();
									_self.offsetParent().addClass('bg_dark');
									$preClick  = _self.parent().parent();
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
											data: [],
											animation:false
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
									$('.opt_time').html('<@spring.messageText "wave.query.text63" "日期"/>：' + my_ts);

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
											//boundaryGap: false,
											data: chartsData.xAxis,
											minInterval: 5
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
												shadowColor: 'rgba(0, 0, 0, 0.6)',
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
			//点击筛选时间
			$('#body_btn').click(function() {
				var my1 = $('#begin_time').val();
				var my2 = $("#end_time").val();
				$('.table-pager').off();
				if(parseInt(my1.split('-').join('')) > parseInt(my2.split('-').join(''))) {
					pagingFunc1();
					myClick();
					alertBoxFunc('<@spring.messageText "wave.query.text41" "输入日期有误"/>', "sure");
				} else {
						my1 = $('#begin_time').val();
						my2 = $("#end_time").val();
						var paging2 = new pagingFunc({
							pageBox: ".table-pager",
							ajaxUrl: "/record/meditation/history/list",
							type: "Get",
							pageKey: "mhl_page_page",
							sizeKey: "mhl_page_size",
							otherData: 'status=' + status +"&begin=" + my1 + "&end=" + my2,
							size: 100,
							mode: "Server",
							intoBox: function(data){
								pageDataList(data);
							}
						})
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

			! function() {
				laydate.skin('danlan'); //切换时间控件皮肤，
			}();
			//分页插件请求成功时，遍历数据
			function pageDataList(data){
				var datar = data;
				var myhtml = "";
				var bgColor;
				$('.table-pager').html(' ');
				if(datar.rows && datar.rows.length > 0) {
					for(var i = 0; i < datar.rows.length; i++) {
						var item = datar.rows[i];
						var eelapse = parseInt(item.elapse / 1000); //放松的时长秒数
						var edeepTime = parseInt(item.deepTime / 1000); //深度放松的时长
						var myelapse = formatSeconds(eelapse);
						var mydeepTime = formatSeconds(edeepTime);
						var status= item.status;
						var statusDetail;
						var borderJiao;
						if(i % 2 == 0) {
							bgColor = '';
						} else {
							bgColor = 'bg_color';
						}
						if(status == 1){
							 statusDetail = '<@spring.messageText "deduct.query.text28" "正常"/>';
							 borderJiao='';
						}else if(status == -2){
							 statusDetail = '<@spring.messageText "deduct.query.text29" "作弊"/>';
							 borderJiao='<em class="border_jiao"></em>';
						}else if(status == 101){
                            statusDetail = '<@spring.messageText "deduct.query.text1001" "待转化"/>';
                            borderJiao='';
						}
						myhtml +=   '<div class="foot_tab ' + bgColor + '">' +
									'<ul class="foot_ul">' +
									'<li class="width1">'+borderJiao+ item.dataNo + '</li>' +
									'<li class="width2 mymed">' + item.meditationNo + '</li>' +
									'<li class="width3">' + item.approvedTime + '</li>' +
									'<li class="width4">' + myelapse + '</li>' +
									'<li class="width5">' + mydeepTime + '</li>' +
									'<li class="width6">' + item.mgApproved + '</li>' +
									'<li class="width7 span1">' + '<@spring.messageText "wave.query.text16" "详情"/>' + '</li>' +
									'<li class="width8">'+statusDetail+'</li>' +
									'</ul>' +
									'</div>';
					}
					$('.table-pager').show();
					$preClick = $('.foot_tab').first();
				}else{
					myhtml='<div class="table-tr data-no"><em></em><@spring.messageText "wave.query.text80" "暂无脑波记录"/></div>';
					$('.table-pager').hide();
				}
				$("#table-tbody").html(myhtml);
				myClick();
			}
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			//立即申诉提交事件
			$('#table-tbody').on('click','.complaint_btn',function(){
				//申诉弹框
				   var html = [
				                  '<div class="modal fade" id="rechargeModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">',
				                      '<div class="modal-dialog modal-dialog-mid" role="document">',
				                        '<div class="modal-content">',
				                          '<div class="modal-header">',
				                            '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>',
				                            '<h4 class="modal-title" id="exampleModalLabel"><@spring.messageText "deduct.query.text25" "立即申诉"/></h4>',
				                          '</div>',
				                          '<div class="modal-body modal-body-mid">',
				                            '<form>',
				                              '<div class="form-group text-left">',
				                                '<@spring.messageText "deduct.query.text21" "您的脑波："/>',
				                                     $(this).parent().siblings('.width2').text(),
				                                '<@spring.messageText "deduct.query.text22" "未通过审核，自判定之日起7天可提交申诉请在下方输入框内填写申诉理由并提交"/>',
				                              '</div>',
				                              '<div class="form-group">',
				                                  '<textarea id="textCon" placeholder="<@spring.messageText "deduct.query.text23" "请输入申诉理由"/>">',
			
			                                      '</textarea>',
				                              '</div>',
				                              '<div class="form-group text-center btn-marg">',
				                                '<a class="btn-dialog-confirm btn-lg btn-lg-color" href="###"><@spring.messageText "deduct.query.text19" "提交"/></a>',
				                              '</div>',
				                            '</form>',
				                          '</div>',
				                        '</div>',
				                      '</div>',
				                    '</div>'
				                ].join('');
				     //申诉成功后的弹框
	                var html2 = [					                   
			                      '<div class="modal-dialog modal-dialog-sml" role="document">',
			                        '<div class="modal-content">',
			                          '<div class="modal-header">',
			                            '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>',
			                            '<h4 class="modal-title" id="exampleModalLabel"><@spring.messageText "record.myreco.text29" "温馨提示"/></h4>',
			                          '</div>',
			                          '<div class="modal-body modal-body-mid">',
			                            '<form>',
			                              '<div class="form-group text-left">',
		                                      '<b class="icon-succeed"></b>',
		                                      '<p class="text-succeed"><@spring.messageText "deduct.query.text24" "申诉提交成功"/></p>',
		                                      '<p class="notes-succeed"><@spring.messageText "deduct.query.text26" "请耐心等待申诉结果，申诉结果会以短信的形式发送至您的手机。"/></p>',
			                              '</div>',
			                              '<div class="form-group text-center btn-marg">',
			                                '<a class="btn-dialog-cancel btn-mid-color" href="###"><@spring.messageText "deduct.query.text20" "完成"/></a>',
			                              '</div>',
			                            '</form>',
			                          '</div>',
			                        '</div>',
			                      '</div>'					                   
			                ].join('');
	                $(document.body).append(html);
	                $('#rechargeModal').modal('show');
	                $('#rechargeModal').on('hidden.bs.modal', function (e) {
	                    $(this).remove();
	                });
	                $('#textCon').on('keyup',function(){
	                	      var textVal = $(this).val();
	                	      var emojiIndex = isEmojiCharacter(textVal);
	                	      if(emojiIndex){
	                	      	 textVal = textVal.substring(0,emojiIndex);
	                	      	 $(this).val(textVal);
	                	      }
	                	      checkWord($(this)[0],textVal);
	                	      if(textVal){
	                	      	   $('.btn-dialog-confirm').removeClass('btn-lg-color');
	                	      }else{
	                	      	   $('.btn-dialog-confirm').addClass('btn-lg-color');
	                	      }
	                });

	                $('#rechargeModal .btn-dialog-confirm').on('click', function(){
	                    //$('#rechargeModal').modal('hide');
	                    if(!$(this).hasClass('btn-lg-color')){
	                    	    $('#rechargeModal .modal-dialog').remove();
	                         $('#rechargeModal').append(html2);
		                     $('#rechargeModal .btn-dialog-cancel').on('click', function(){
		                     	   $('#rechargeModal').modal('hide');
		                     })
	                       }
	                   });
	                return false;
			});
			//判断输入字符的长度
		   var maxstrlen = 20;   
           function checkWord(c,val){  
	            len = maxstrlen;
	            myLen = getStrleng(val);  
	            var wck = $('#textCon')[0]; 
	            if (myLen > len * 2) {  
	                wck.value = val.substring(0, i + 1);  
	            }else {  
	                wck.innerHTML = Math.floor((len * 2 - myLen) / 2);  
	            }  
	            return myLen;
	        } 
	        function getStrleng(str) {  
	            myLen = 0;  
	            i = 0;  
	            for (; (i < str.length) && (myLen <= maxstrlen * 2); i++) {  
	                if (str.charCodeAt(i) > 0 && str.charCodeAt(i) < 128)  
	                    myLen++;  
	                else  
	                    myLen += 2;  
	            }  
	            return myLen;  
	        }  
	        //判断是否输入表情度
	        function isEmojiCharacter(substring) {
				for(var i = 0; i < substring.length; i++) {
					var hs = substring.charCodeAt(i);
					if(0xd800 <= hs && hs <= 0xdbff) {
						if(substring.length > 1) {
							var ls = substring.charCodeAt(i + 1);
							var uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
							if(0x1d000 <= uc && uc <= 0x1f77f) {
								return i;
							}
						}
					} else if(substring.length > 1) {
						var ls = substring.charCodeAt(i + 1);
						if(ls == 0x20e3) {
							return i;
						}
					} else {
						if(0x2100 <= hs && hs <= 0x27ff) {
							return i;
						} else if(0x2B05 <= hs && hs <= 0x2b07) {
							return i;
						} else if(0x2934 <= hs && hs <= 0x2935) {
							return i;
						} else if(0x3297 <= hs && hs <= 0x3299) {
							return i;
						} else if(hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
							return i;
						}
					}
				}
			}
		});
	</script>
</#macro>