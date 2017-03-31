<#include "common/base-v2.ftl" />
<#macro title>
    <@spring.messageText "safety.text1" "账户"/>
</#macro>
<#macro head>
<link rel="stylesheet" type="text/css" href="/static/css/information.css"/>
</#macro>
<#macro body>
    <#assign nav_page="user">
    <#assign nav_sub_page="user_info">
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
                        <div class="info-subcon">
                            <div class="info-box clearfix">
                                <div class="info-images-con">
                                    <img alt="" src="/static/images/user/head_img.png"/>
                                </div>
                                <div class="info-names">
                                	<div class="info-names-posi clearfix" id="info-names-posi">
                                	  	<span class="info-names-span">${currentUser.username}</span>
                                        <input class="info-names-input" type="text" value=""><button class="info-names-button">√</button>
                                        <a id="name-btn" class="name-btn" href="javascript:void(0)"></a>
                                	</div>
                                    <p class="red"></p>
                                </div>
                            </div>
                        </div>
                        <div class="info-subcon">
                            <div class="account-info-top clearfix">
                                <h3><b></b><@spring.messageText "account.info.text2" "账户信息"/></h3>
                                <ul class="account-info-btn">
                                    <li>
                                        <a href="/deal/withdraw/mg"><@spring.messageText "asset.text10" "MG提现"/></a>
                                    </li>
                                    <li>
                                        <a href="/deal/mg_recharge"><@spring.messageText "mg_recharge.text0" "MG充值"/></a>
                                    </li>
                                    <li>
                                        <a href="/deal/withdraw/btc"><@spring.messageText "account.info.text5" "BTC提现"/></a>
                                    </li>
                                    <li>
                                        <a href="/deal/recharge"><@spring.messageText "account.info.text6" "BTC充值"/></a>
                                    </li>
                                </ul>
                            </div>
                            <div class="account-info-bot clearfix">
                                <div class="account-info-bot-left">
                                    <!-- <div class="account-info-bot-left-top">
                                        <h5><@spring.messageText "account.info.text4" "账户资产折合约"/>：</h5>
                                        <span>$${maivo.accountUsdBalance?string('0.0000')}</span>
                                    </div> -->
                                    <div class="account-info-bot-left-bot">
                                        <div class="account-sub-numcon">
                                            <div class="account-sub-num account-sub-num-lg">
                                             	<span>${maivo.currMg?string('0.0000')}</span>
                                                <h5><@spring.messageText "asset.text25" "MG数量"/></h5>
                                            </div>
                                        </div>
                                        <div class="account-sub-numcon">
                                        	    <div class="account-sub-num account-sub-num-line">
                                                <h5><@spring.messageText "account.info.text26" "冻结MG数量"/>：</h5>
                                                <span>${maivo.mgCurrFrozen?string('0.0000')}</span>
                                            </div>
                                            <div class="account-sub-num account-sub-num-line">
                                                <h5><@spring.messageText "deduct.query.text6" "已扣除" />：</h5>
                                                <span>${maivo.cheatMg?string('0.0000')}</span>
                                            </div>
                                        	</div>
                                        <div class="account-sub-numcon">
                                            <div class="account-sub-num account-sub-num-lg">
                                             	<span>${maivo.currBtc?string('0.0000')}</span>
                                                <h5><@spring.messageText "account.info.text27" "BTC数量"/></h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="account-info-bot-right">
                                    <div class="account-info-bot-right-sub">
                                        <h4><@spring.messageText "account.info.text7" "MN数量"/>：</h4>
                                        <span>${maivo.currMn?string('0.0000')}</span>
                                    </div>
                                    <div class="account-info-bot-right-sub">
                                        <h4><@spring.messageText "account.info.text8" "智慧包数量"/>：</h4>
                                        <span class="unpack-the-num">${maivo.mpCount}</span>
                                        <#if maivo.mpCount!=0 >
											  <a class="unpack-the" href="/deal/buy#open"><@spring.messageText "account.info.text9" "去解包"/></a>
										</#if>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="info-subcon">
                            <div class="account-info-top clearfix">
                                <ul class="account-record-list">
                                 	<li class="active"><@spring.messageText "account.info.text3" "交易记录"/></li>
                                 	<li><@spring.messageText "account.frozen.text6" "冻结记录"/></li>
                                </ul>
                                <select calss="account-info-sel" id="select-btn">
                                    <option value="0"><@spring.messageText "account.info.text10" "全部"/></option>
                                    <option value="1"><@spring.messageText "account.info.text31" "MG交易"/></option>
                                    <option value="2"><@spring.messageText "account.info.text32" "BTC交易"/></option>
                                </select>
                            </div>
                            <div class="account-record-box">
                            	    <div class="account-record">
	                                <ul class="table-head">
	                                    <li class="table-th account-tr-time"><@spring.messageText "account.info.text11" "时间"/></li>
	                                    <li class="table-th account-tr-find"><@spring.messageText "account.info.text12" "类别"/></li>
	                                    <li class="table-th account-tr-mon"><@spring.messageText "account.info.text13" "发出金额"/></li>
	                                    <li class="table-th account-tr-note"><@spring.messageText "account.info.text14" "备注"/></li>
	                                </ul>
	                                <div id="record-list">
	                                </div>
	                                <div class="table-pager">
	                                </div>
                                </div>
                                <div class="account-record">
                                	     <table border="" cellspacing="" cellpadding="">
                                	     	<thead>
                                	     		<tr>
                                	     			<th><@spring.messageText "account.frozen.text1" "冻结时间"/></th>
                                	     			<th><@spring.messageText "account.frozen.text2" "解冻时间"/></th>
                                	     			<th><@spring.messageText "account.frozen.text3" "冻结时长"/></th>
                                	     			<th><@spring.messageText "account.frozen.text4" "冻结原因"/></th>
                                	     			<th><@spring.messageText "wave.query.text13" "操作"/></th>
                                	     		</tr>
                                	     	</thead>
                                	     	<tbody id="account-record-frozen">
                                	     		
                                	     	</tbody>
                                	     </table>
                                	     <div class="table-pager-frozen">
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
    <#include "/decorators/footer.ftl">
</div>
</#macro>
<#macro footerjs>      
<script type="text/javascript" src="/static/js/business/useralert.js"></script>
<script type="text/javascript" src="/static/js/business/paging.js"></script>
<script type="text/javascript">
    $(function () {
        var htmlT = "";
        var typeData = 0;
        tradeRecord();
        $('#select-btn').on('change', function () {
            $('.table-pager').off();
            typeData = $('#select-btn').val();
            tradeRecord();
        });
        function tradeRecord() {
           var  paging = new pagingFunc({
                pageBox: ".table-pager",
                ajaxUrl: "/v2/user/account/tx/list",
                pageKey: "account_tx_page",
                sizeKey: "account_tx_size",
                type: "GET",
                size: 10,
                mode: "Server",
                otherData: 'type=' + typeData,
                intoBox: function (data) { //因数据和页面DOM结构需求不一样， 有 ajaxUrl 时 必须定义 paging.intoBox ，将数据写入DOM。     
                    var datar = data.rows;//
                    var unit;
                    htmlT = "";
                    if(datar==null || datar.length <= 0){
                    	          htmlT+='<div class="account-info-no"><@spring.messageText "account.info.text33" "用户暂无交易记录"/></div>';
                    	          $('.table-pager').hide();
                    }else{
	                    	for (var i = 0; i < datar.length; i++){
		                        if (datar[i].mg && !datar[i].btc) {
		                            unit = 'MG';
		                            createHtml(datar[i], datar[i].mg, unit);
		                        }
		                        if (!datar[i].mg && datar[i].btc) {
		                            unit = 'BTC';
		                            createHtml(datar[i], datar[i].btc, unit);
		                        }
		                        if (datar[i].mg && datar[i].btc) {
		                            if (datar[i].btc > 0) {
		                                datar[i].btc = '+' + datar[i].btc;
		                            }
		                            if (datar[i].mg > 0) {
		                                datar[i].mg = '+' + datar[i].mg;
		                            }
		                            htmlT += '<ul class="clearfix">' +
		                                     '<li class="table-th account-tr-time"> ' + datar[i].txDate + '</li>' +
		                                     '<li class="table-th account-tr-find"> ' + datar[i].txType + '</li>' +
		                                     '<li class="table-th account-tr-mon"><p class="table-color0">' + datar[i].mg + 'MG</p><p class="table-color1">' + datar[i].btc + 'BTC</p></li>' +
		                                     '<li class="table-th account-tr-note account-tr-remark" title=""></li></ul>'
		                        }
		                 }
                        $('.table-pager').show();

                    }
                    $("#record-list").html(htmlT);
                    htmlT = "";
                }
            });
        };
        function createHtml(obj, objMon, objUnit) {
            var num;
            if (objMon > 0) {
                num = 1;
                objMon = '+' + objMon;
            } else {
                num = 0;
            }
            htmlT += '<ul class="clearfix">' +
                    '<li class="table-th account-tr-time"> ' + obj.txDate + '</li>' +
                    '<li class="table-th account-tr-find"> ' + obj.txType+ '</li>' +
                    '<li class="table-th account-tr-mon tab-color' + num + '"> ' + objMon + objUnit + '</li>'+
                    '<li class="table-th account-tr-note account-tr-remark" title=""></li></ul>'
        }
         //交易 冻结 记录tab切换
	    var frozenBtn = true;
	    $('.account-record-list > li').on('click',function(){
	    	     var $thisIndex = $(this).index();
	    	     $(this).addClass('active').siblings().removeClass('active');
	    	     $(".account-record").eq($thisIndex).show().siblings().hide();
	    	     if($thisIndex == 0){
	    	     	$("#select-btn").show();
	    	     }else{
	    	     	$("#select-btn").hide();
	    	     }
	    	     if($thisIndex == 1 && frozenBtn){
	    	     	frozenList();
	    	     	frozenBtn = false;
	    	     }
	    });
	    //冻结记录 列表信息
	    function frozenList(){
	    	     var paging2 = new pagingFunc({
			 	     pageBox: ".table-pager-frozen",
			 	     ajaxUrl: "/user/forbidden/list",
	                 type: "GET",
	                 size: 10, 
			         mode:"Server",
			         intoBox : function(data){
			         	var datar = data.rows;
			         	var htmlT = '';
			         	var frozenDetailArr = [];
			         	if (datar==null || datar.length <= 0) {
	                         htmlT='<div class="table-tr clearfix"><em></em><@spring.messageText "mps.text61" "暂无记录"/></div>';
	                         $('.table-pager-unlockedDetail').hide();
	                     } else{
	                     	for(var i = 0;i < datar.length;i++){
	                     		var listType = datar[i].type == 2? "<@spring.messageText "deduct.query.text29" "作弊"/>":"<@spring.messageText "account.frozen.text13" "其他"/>";
	                     		var unfreDay = datar[i].un_forbidden_time? datar[i].un_forbidden_time : " - ";
	                     		htmlT +='<tr>'+
                         	               '<td>'+datar[i].created_at+'</td>'+
                         	               '<td>'+unfreDay+'</td>'+
                         	               '<td>'+datar[i].time_limit+'<@spring.messageText "account.frozen.text12" "天"/></td>'+
                         	               '<td>'+listType+'</td>'+
                         	               '<td><span class="btnDetail"><@spring.messageText "wave.query.text16" "详情"/></span></td>'+
                         	            '</tr>';
                         	   frozenDetailArr.push(datar[i].meditation_id) ;
	                     	}
	                     	$('.table-pager-unlockedDetail').show();
	                     }
	                     $("#account-record-frozen").html(htmlT);
	                     subBtnDetail(frozenDetailArr);
			         }
	    	     })
	    }
        //详情按钮函数
        function subBtnDetail(arr){
        	      $('.btnDetail').on('click',function(){
        	      	    var nowIndex = $(this).index();
        	      	    var presentArr = arr[nowIndex];
        	      	    var frozenNUm = '';
        	      	    for(var i=0;i<presentArr.length;i++){
		        	      	   if(i == 6) break;
        	      	    	    	   frozenNUm += '<li>'+presentArr[i].toUpperCase()+'</li>';
        	      	    };
        	      	    if(presentArr.length >= 6){
        	      	    	    frozenNUm += '<li><a class="link-more" href="/record/meditation/deduct/brain/search"><@spring.messageText "account.frozen.text14" "查看更多"/></a></li>';
        	      	    };
	        	      	var htmlFrozenDetail = [
		                '<div class="modal fade " id="rechargeModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">',
		                  '<div class="modal-dialog modal-mps" role="document">',
		                    '<div class="modal-content mps-list-con">',
		                      '<div class="modal-header">',
		                        '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>',
		                        '<h4 class="modal-title" id="exampleModalLabel"><@spring.messageText "account.frozen.text7" "账号冻结详情"/></h4>',
		                      '</div>',
		                      '<div class="modal-body">',
	                               '<div class="frozen-detail-con">'+
	                                        '<div class="frozen-detail-group">',
	    	      	                            '<p><@spring.messageText "account.frozen.text8" "作弊脑波数量"/>：</p>',
	    	      	                                '<span>',
	    	      	                                    presentArr.length,
	    	      	                                '</span>',
	    	      	                            '</div>',
	    	      	                            '<div class="frozen-detail-con-bot">',
	    	      	                                 '<p><@spring.messageText "account.frozen.text9" "作弊脑波编号"/>：</p>',
	    	      	                                 '<ul>',
	    	      	                                    frozenNUm,
	    	      	                                 '</ul>',
	    	      	                            '</div>',
	    	      	                            '<a class="btn-sure" href="###"><@spring.messageText "safety.text3" "确定"/></a>',
	    	      	                            '<div class="div-clearfix">',
	    	      	                               '<p class="forzen-rote"><@spring.messageText "account.frozen.text10" "冻结期间无法继续认证"/></p>',
	    	      	                            '</div>',
	    	      	                   '</div>',
		                      '</div>',
		                    '</div>',
		                  '</div>',
		                '</div>'
		             ].join('');
		             $(document.body).append(htmlFrozenDetail);
	                 $('#rechargeModal').modal('show');
                     $('#rechargeModal').on('hidden.bs.modal', function (e) {
                                $(this).remove();
                     });
                     $('#rechargeModal .btn-sure').on('click', function(){
                                $('#rechargeModal').modal('hide');
                     });
        	      })
        }
        (function editName(){
            $(".info-names-span").show();
            $(".info-names-input").hide();
            $(".info-names-button").hide();
            $(".info-names p.red").hide();
            $("#name-btn").on('click', function(event) {
                event.preventDefault();

                $(this).hide();
                var nameN = $(".info-names-span").text();
                $(".info-names-span").hide();
                $(".info-names-input").val(nameN).show();
                $(".info-names-button").show();
            });
            $(document).bind('click',function(e){ 
                var e = e || window.event; 
                var elem = e.target || e.srcElement; 
                while (elem) { 
                    if (elem.id && elem.id=='info-names-posi') { 
                        return; 
                    } 
                    elem = elem.parentNode; 
                }
                $("#name-btn").show();
                $(".info-names-span").show();
                $(".info-names-input").hide();
                $(".info-names-button").hide();
                $(".info-names p.red").hide(); //点击的不是div或其子元素 
            }); 
            $(".info-names-button").on('click', function(event) {
                event.preventDefault();

                var namer = $(".info-names-input").val();
                if(namer.length>=2&&namer.length<=16){
                    var _self = $(this)
                    $.ajax({
                        url: '/v2/user/username',
                        type: 'POST',
                        dataType: 'json',
                        data: {username: namer},
                        success:function(data){
                            if(0 == data.status){
                                _self.hide();
                                $(".info-names p.red").hide();
                                $(".info-names-input").hide();
                                $(".info-names-span").text(namer).show();
                                $("#name-btn").show();
                            }else{
                                  alertBoxFunc(data.error.message,'sure');
                            }
                        }
                    })
                }else if(namer.length <= 0){
                    $(".info-names p.red").text('<@spring.messageText "nickname.empty" "昵称不能为空"/>').show();
                }else{
                    $(".info-names p.red").text('<@spring.messageText "nickname.rule" "请输入2~16个中文、英文或数字"/>').show();
                }
            });
        })();
    });
</script>
</#macro>