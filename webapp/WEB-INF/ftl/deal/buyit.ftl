<!DOCTYPE html>
<html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="" lang="" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="" lang="" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><@spring.messageText "buy_center" "认购中心"/></title>
 <!-- css -->
    <link rel="stylesheet" type="text/css" href="/static/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/static/css/base.css?v=201608300932">
    <link rel="stylesheet" type="text/css" href="/static/css/main.css">
<style>
.app-pop{
	background:#fdfdfd;
	padding: 10px;
	z-index:99;position: fixed; right:50px; top:150px;
}
.app-pop-nav{
    text-align: center;
}
.app-pop-nav a{
    background: url('/static/images/app-pop-nav.png') no-repeat;
    display: inline-block;
    width: 92px;
    height: 35px;
}
.app-pop-nav .app-pop-nav-android:hover{
    background-position: 0 -37px;
}
.app-pop-nav .app-pop-nav-ios{
    background-position: -94px -1px;
    margin-left: 10px;
    height: 34px;
}
.app-pop-nav .app-pop-nav-ios:hover{
    background-position: -94px -37px;
}
.app-pop-content{
	padding: 30px 0;
}
.app-pop-img{
	background: #fff;
	margin: 0 auto;
	padding: 10px;
	width: 120px;
	height: 120px;
    text-align: center;
}
.app-pop-img img{
    width: 100px;
}
.app-pop-tip {
	text-align: center;
}
.app-pop-tip a{
	display: inline-block;
	background: url('/static/images/app-pop-tip.png') no-repeat right center;
	margin: 0 auto;
	width: 170px;
	height: 23px;
	line-height: 23px;
	vertical-align: middle;
	color: #4f4f4f;
}
/*#payconfirm{
  display: inline-block;
  position: relative;
  left: 400px;

}*/

</style>
 <!-- js -->
    <script type="text/javascript" src='/static/js/jquery-1.11.2.min.js'></script>
    <script type="text/javascript" src='/static/js/bootstrap.min.js'></script>
    <script type="text/javascript" src='/static/js/common.js?v=201607143213213'></script>
    <script type="text/javascript" src='/static/js/jquery.i18n.properties-1.0.9.js'></script>
    <script type="text/javascript" src="/static/js/global.js" ></script>
    <script type="text/javascript" src='/static/js/business/buy.js'></script>
</head>
<body>
<div class="app-pop">
    <div class="app-pop-nav">
        <a class="app-pop-nav-android" href="javascript:void(0)"></a>
        <a class="app-pop-nav-ios" href="javascript:void(0)"></a>
    </div>
    
    <div class="app-pop-content">
        <div class="app-pop-img">
            <img src="/static/images/down_android.png" />
        </div>
        <div class="app-pop-img" style="display:none;">
            <img src="/static/images/down_ios.png?v=1.0.5" />
        </div>
    </div>
    <div class="app-pop-tip">	
    	<!-- <a target="_blank" href="<@spring.messageText "recharge.opta_note" "/static/landing_zh_TW.html"/>"><@spring.messageText "recharge.opta_note_text" "點擊查看APP操作說明"/></a> -->
	</div>
</div>
<div class="warp asset-manager">
  <#include "common/header.ftl" >
    <input type="hidden" value="${userdollor}" id="userdollor">    
     <div class="warp-container overh">
               <div class="container-bg authentication-container">
               <div class="container">
            <div class="overh">
                    <div class="height10"></div>
                    <div class="wrap-center">
                         <div class="authentication-block">
                             <div class="height388">
                                 <img src="/static/images/img13.png" />
                             </div>
                             <div class="text-center">
                                  <div class="thought-btn wrap-shadow top45"><@spring.messageText "buy.text1" "意念力穿戴设备"/></div>
                             </div>
                              <p>
                                  <@spring.messageText "buy.text2" "意念力穿戴设备，它叫做Mind Link(大脑连接)，可以通过移动设备APP进行蓝牙连接，采集人体大脑生物电波，评定每个人的放松和专注程度，Mind Asset系统通过这样的方式，公平，透明的把未来的财富分配给心态平静充满爱，以及拥有智慧的人。"/>                              </p>
                             <div class="device-buy-box">
                                  <div class="price wrap-shadow" id="mindlinknum_num">1</div>
                                  <div class="jisuan-text"><@spring.messageText "set" "台"/></div>
                                 <div class="price wrap-shadow">100</div>
                                 <div class="jisuan-text"><@spring.messageText "usd" "美金"/></div>
                             </div>
                         </div>
                         <div class="coin-img height388">
                                 <img src="/static/images/img19.png" />
                         </div>
                         <div class="authentication-block">
                             <div class="height388">
                                 <img src="/static/images/img18.png" />
                             </div>
                             <div class="text-center">
                             <div class="smartPackage-btn top45 wrap-shadow"><@spring.messageText "buy.text4" "智慧包"/></div>
                               <p>
                                   <@spring.messageText "buy.text5" "智慧包，Mind Pack 缩写M.P.，是锁定智慧资产全球区块链系统的公开资产认购合约，每天全球一共会生产4800个M.P.，用户的购买行为，等于买断了区块链中的智慧资产份额，再通过个人的脑波认证，向全球公开脑力证明发行结果，将Mind Gene变为真正全球公认的交易资产。"/>                              </p>
                             </div>
                             <div class="device-buy-box">
                                        <div class="price2 wrap-shadow" id="masalinknum_num">1</div>
                                        <div class="jisuan-text"><@spring.messageText "set2" "台"/></div>
                                        <div class="price2 wrap-shadow">100</div>
                                        <div class="jisuan-text"><@spring.messageText "usd" "美金"/></div>
                            </div>
                         </div>
                    </div>
            </div>
            <div class="hejibox">
                <div class="hejiText-box">
                    <!-- 合计的值，取得 下面这个隐藏的文本框的值，表现用 label表现-->
                <@spring.messageText "buy.text6" "总价："/>                        <div class="total-mark">
                            <span class="hejiLable">200</span>
                            $
                        </div>
                    <input type="text" class="hejiText " value="" style="display: none;" />
                </div>
                <!-- <form action="/deal/buy" method="post" id="payform" class='text-center top30'> -->
                <form action="/deal/buy_order" method="post" id="payform" class='text-center top30'>
                    <input type="hidden" name="mindlinknum" id="mindlinknum" value="0">
                    <input type="hidden" name="masalinknum" id="masalinknum" value="0">
                    <input type="hidden" name="total" id="total" value="0">
                    <input type="hidden" name="CSRFToken" id="CSRFToken" value="${CSRFToken}" />
                <button type="button" class="querenzhifu" id="payconfirm" ><@spring.messageText "buy.text7" "确认支付"/></button>
                 </form>
                <!--   <button type="button" class="querenzhifu" id="payconfirm" ><@spring.messageText "buy.text7" "确认支付"/></button> -->

            </div>
            <div class='order-info'><@spring.messageText "buy.text8" "订单信息"/></div>
            <input type="hidden" id="mpnum" value="${mpMaxNum}">
                   <input type="hidden" id="devicenum" value="${deviceMaxNum}">
                <table class="yigouTable" cellpadding="0" cellspacing="0">
                    <tr class='order-th'>
                        <th><@spring.messageText "buy.text9" "订单单号"/></th>
                        <th>Mind Link(<@spring.messageText "set" "台"/>)</th>
                        <th>M.P(<@spring.messageText "buy.text10" "份"/>)</th>
                        <th><@spring.messageText "buy.text11" "购买时间(国际标准时间)"/></th>
                        <th><@spring.messageText "buy.text12" "支付金额"/>($)</th>
                        <th><@spring.messageText "buy.text13" "详情"/></th>

                    </tr>
                    
                    <#if orderList?exists >
                       <#list orderList as order>  
                      				 <tr>
                                         <td>${order.ordernumber}  </td>
                                          <td>${order.mindlinknum}  </td>
                                          <td>${order.masanumber}</td>
                                           <td>${order.buytime?datetime}</td>
                                            <td>$ ${order.buymoney?string(',###.00')}</td>
                                          <td>${order.address}</td>
                                      </tr>
						</#list>  
                       </#if>
                                    </table>
        </div>
         </div>
    <#include "/decorators/footer.ftl" >
</div>
<script>
$(function(){
    $('.app-pop-nav a').click(function(){
        var index = $(this).index();
        $('.app-pop-img').hide().eq(index).show();    
    });
    (function hideTabe(){
        var tdLength= $('.yigouTable tr td').length;
        if ( tdLength <= 0) {
           $('.yigouTable').hide();
           $(".order-info").text(" ");
        };
    })()
      //导航添加
          var myleft = 0;
           $("#myquery").hover(function(){
                  myleft = $('#myaquery').offset().left - 25;
                  $("#query_li").css("display","block");
                  $("#query_li").css("left",myleft);
             },function(){
                   $("#query_li").css("display","none");  
           })
           $("#query_li").find('li').hover(function(){
                  $("#query_li").css("display","block");
                  $(this).css('color','#1783e8');
                  $(this).css('background','#e6e6e6');
               
           },function(){
                   $("#query_li").css("display","none");
                    $(this).css('color','#777577');
                   $(this).css('background','#fff');
           })

           $('#myquery_btn').click(function(){
                    window.location.href = "/record/meditation/my/brain/search";
           })
           $('#query_btn').click(function(){
                    window.location.href = "/record/meditation/global/brain/search";
           })
        
    
});
</script>
</body>
</html>
