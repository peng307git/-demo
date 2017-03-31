<!DOCTYPE html>
<html>
	<!--[if IE]><![endif]-->
	<!--[if IE 8 ]>
<html dir="" lang="" class="ie8"><![endif]-->
	<!--[if IE 9 ]>
<html dir="" lang="" class="ie9"><![endif]-->
	<!--[if (gt IE 9)|!(IE)]><!-->
	<!--<![endif]-->

	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <meta name="description" content="">
	    <meta name="author" content="">
		<title>
			<@spring.messageText "notice.text1" "公告"/>
		</title>
		<!-- css -->
		<link rel="stylesheet" type="text/css" href="../static/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="../static/v6/css/iconfont.css">
		<link rel="stylesheet" type="text/css" href="../static/css/base.css?v=201608300932">
		<link rel="stylesheet" type="text/css" href="../static/css/main.css">
		<style>
			.header-inner .nav a {
				padding: 37px 5px;
			}
			
			.header-inner .nav i {
				right: -5px;
			}

/*分页*/
.table-pager {
  background: #FFF;
}

    </style>
    <!-- js -->
    <script type="text/javascript" src='/static/js/jquery-1.11.2.min.js'></script>
    <script type="text/javascript" src='/static/js/jquery.kxbdmarquee.js'></script>
    <script type="text/javascript" src='/static/js/bootstrap.min.js'></script>
    <script type="text/javascript" src='/static/js/common.js?v=201607143213213'></script>
    <script type="text/javascript" src='/static/js/jquery.i18n.properties-1.0.9.js'></script>
    <script type="text/javascript" src="/static/js/global.js"></script>
    <script type="text/javascript" src="/static/js/business/paging.js"></script>
    <script type="text/javascript" src='/static/js/business/notice.js?v=201608063213213'></script>
		<script type="text/javascript" src="/static/js/old-common.js"></script>
    <!-- plugin/js -->
    <script type="text/javascript" src="/static/js/plugin/jquery.zclip.min.js"></script>
</head>
<body>
<#assign nav_page="notice" >
<div class="warp asset-manager">
<#include "common/header.ftl" >
    <div class="warp-container">
            <div class='recharge-box2'>
                <div class="container">
                    <h3 class="recharge-title text-center">
                        <!-- <div class="recharge-title-top"></div>
                        <div class="recharge-title-bot"></div> -->
                  	 <@spring.messageText "notice.text1" "网站公告"/>                      </h3>
								<table class="yigouTable" cellpadding="0" cellspacing="0">
									<tr class='order-th'>
										<th>
											<@spring.messageText "notice.text2" "公告主题"/>
										</th>
										<th>
											<@spring.messageText "notice.text3" "公告时间"/>
										</th>
									</tr>
								</table>

								<ul id="lier">
								</ul>
								<div class="table-pager">

								</div>
							</div>
						</div>
						<#include "/decorators/footer.ftl">

					</div>

					<script type="text/javascript">
						/*添加导航栏*/

						nav_hover('#myquery', '#myaquery', '#query_li'); //脑波查询导航
						nav_hover('#mybuy', '#myabuy', '#buy_li'); // 认购导航
						function nav_hover(obj, obj_a, obj_li) {
							var myleft = 0;
							$(obj).hover(function() {
								myleft = $(obj_a).offset().left - 25;
								$(obj_li).css("display", "block");
								$(obj_li).css("left", myleft);
							}, function() {
								$(obj_li).css("display", "none");
							})
							$(obj_li).find('li').hover(function() {
								$(obj_li).css("display", "block");
								$(this).css('color', '#1783e8');
								$(this).css('background', '#e6e6e6');

							}, function() {
								$(obj_li).css("display", "none");
								$(this).css('color', '#777577');
								$(this).css('background', '#fff');
							})
						}
						//脑波查询导航跳转
						$('#myquery_btn').click(function() {
							window.location.href = "/record/meditation/my/brain/search";
						})
						$('#query_btn').click(function() {
								window.location.href = "/record/meditation/global/brain/search";
							})
							//认购界面跳转
						$('#buy_btn').click(function() {
							window.location.href = "/deal/buy";
						})
						$('#buy_link_btn').click(function() {
							window.location.href = "/deal/buy_link";
						})
					</script>

	</body>

</html>
