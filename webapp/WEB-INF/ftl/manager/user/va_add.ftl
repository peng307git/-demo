<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<title>创建虚拟帐号</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<!-- basic styles -->
		<link href="/static/assets/css/bootstrap.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="/static/assets/css/font-awesome.min.css" />

		<!--[if IE 7]>
		  <link rel="stylesheet" href="/static/assets/css/font-awesome-ie7.min.css" />
		<![endif]-->

		<!-- page specific plugin styles -->

		<!-- fonts -->

		<!-- ace styles -->

		<link rel="stylesheet" href="/static/assets/css/ace.min.css" />
		<link rel="stylesheet" href="/static/assets/css/ace-rtl.min.css" />
		<link rel="stylesheet" href="/static/assets/css/ace-skins.min.css" />
<link rel="stylesheet" href="/static/css/base.css" />
		<!--[if lte IE 8]>
		  <link rel="stylesheet" href="/static/assets/css/ace-ie.min.css" />
		<![endif]-->

		<!-- inline styles related to this page -->

		<!-- ace settings handler -->

		<script src="/static/assets/js/ace-extra.min.js"></script>

		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

		<!--[if lt IE 9]>
		<script src="/static/assets/js/html5shiv.js"></script>
		<script src="/static/assets/js/respond.min.js"></script>
		<![endif]-->
	</head>

	<body>
		<#include "manager/mainftl/header.ftl" >

		<div class="main-container" id="main-container">
			<script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
			</script>

			<div class="main-container-inner">
				<a class="menu-toggler" id="menu-toggler" href="#">
					<span class="menu-text"></span>
				</a>

				<#include "manager/mainftl/leftside.ftl" >

				<div class="main-content">
					<div class="breadcrumbs" id="breadcrumbs">
						<script type="text/javascript">
							try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
						</script>

						<ul class="breadcrumb">
							<li>
								<i class="icon-home home-icon"></i>
								<a href="#">首页</a>
							</li>
							<li class="active">虚拟帐号</li>
						</ul><!-- .breadcrumb -->
					</div>
					<div class="page-content">
						<div class="page-header">
							<h1>
								创建虚拟帐号
								<small>
									<i class="icon-double-angle-right"></i>
									 创建
								</small>
							</h1>
						</div><!-- /.page-header -->
						<div class="row">
							<div class="col-xs-12 col-sm-6 ">
								<!-- PAGE CONTENT BEGINS -->
								<h3>创建虚拟帐号</h3>
								<p class="clearfix">
									<b  class="col-xs-3 text-right">手机号：</b><input class="col-xs-9" type="text" id="mobile" placeholder="手机号">
								</p>
								<p class="clearfix">
									<b  class="col-xs-3 text-right">用户名：</b><input class="col-xs-9" type="text" id="username" placeholder="用户名">
								</p>

								<p class="clearfix">
									<b  class="col-xs-3 text-right">邀请码：</b><input class="col-xs-9" type="text" id="invCode" placeholder="邀请码">
								</p>
								<p class="clearfix">
									<b  class="col-xs-3 text-right">密码：</b><input class="col-xs-9" type="password" id="password" placeholder="密码">
								</p>
								<p class="clearfix">
									<b  class="col-xs-3 text-right">请确认密码：</b><input class="col-xs-9" type="password" id="recheckpassword" placeholder="请确认密码">
								</p>
								
								<label class="pull-right">
									<input type="checkbox" class="ace" id = "needNoCreateAccount" value = "1">
									<span class="lbl"> 是否不需要创建帐号 </span>
								</label>
								<div class="clearfix visible-xs-block"></div>
								<p class="pull-right">
									<button class="btn btn-success" id="submit_btn"><i class="icon-ok bigger-120"></i>提交</button>
								</p>
								
								
							</div><!-- /.col -->
							<div class="col-xs-12 col-sm-6">
								<!-- PAGE CONTENT BEGINS -->
								<h3>创建子核心</h3>
								<p class="clearfix">
									<b  class="col-xs-3 text-right">手机号：</b><input class="col-xs-9" type="text" id="mobile_1" placeholder="手机号">
								</p>
								<p class="clearfix">
									<b  class="col-xs-3 text-right">比特币美金价格：</b><input class="col-xs-9" type="text" id="btcUsdPrice" placeholder="比特币美金价格">
								</p>
								<p class="clearfix">
									<b  class="col-xs-3 text-right">美元人民币汇率：</b><input class="col-xs-9" type="text" id="usd2cnyRate" placeholder="美元人民币汇率">
								</p>
								<p class="clearfix">
									<b  class="col-xs-3 text-right">时间：</b><input class="col-xs-9" type="text" id="buyTime" placeholder="yyyy-MM-dd hh:mm:ss">
								</p>
								<label class="pull-right">
									<input type="checkbox" class="ace" id = "needVirtualBuy" value = "1">
									<span class="lbl"> 是否需要虚拟购买 </span>
								</label>
								<div class="clearfix visible-xs-block"></div>
								<p class="pull-right">
									<button class="btn btn-success" id="submit_btn_1"><i class="icon-ok bigger-120"></i>创建子核心</button>
								</p>
								
							</div><!-- /.col -->
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div><!-- /.main-content -->
				<style type="text/css">
					p{ margin: 10px 0;}
				</style>

			</div><!-- /.main-container-inner -->

			<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
				<i class="icon-double-angle-up icon-only bigger-110"></i>
			</a>
		</div><!-- /.main-container -->

		<!-- basic scripts -->

		<!--[if IE]>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<![endif]-->

		<!--[if !IE]> -->

		<script type="text/javascript">
			window.jQuery || document.write("<script src='/static/assets/js/jquery-2.0.3.min.js'>"+"<"+"script>");
		</script>

		<!-- <![endif]-->

		<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='/static/assets/js/jquery-1.10.2.min.js'>"+"<"+"script>");
</script>
<![endif]-->

		<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='/static/assets/js/jquery.mobile.custom.min.js'>"+"<"+"script>");
		</script>
		<script src="/static/assets/js/bootstrap.min.js"></script>
		<script src="/static/assets/js/typeahead-bs2.min.js"></script>

		<!-- page specific plugin scripts -->

		<script src="/static/assets/js/jquery-ui-1.10.3.custom.min.js"></script>
		<script src="/static/assets/js/jquery.ui.touch-punch.min.js"></script>
		<script src="/static/assets/js/markdown/markdown.min.js"></script>
		<script src="/static/assets/js/markdown/bootstrap-markdown.min.js"></script>
		<script src="/static/assets/js/jquery.hotkeys.min.js"></script>
		<script src="/static/assets/js/bootstrap-wysiwyg.min.js"></script>
		<script src="/static/assets/js/bootbox.min.js"></script>
		<script type="text/javascript" src="/static/js/jquery.i18n.properties-1.0.9.js"></script>
		<script type="text/javascript" src="/static/js/global.js"></script>

		<!-- ace scripts -->

		<script src="/static/assets/js/ace-elements.min.js"></script>
		<script src="/static/assets/js/ace.min.js"></script>

		<!-- inline scripts related to this page -->

		<script type="text/javascript">
		jQuery(function($){
			$("#submit_btn").on('click', function(e) {
				if($("#mobile").val() == ""){
					alert("请输入手机号");
					return;
				}
				if($("#invCode").val() == ""){
					alert("请输入验证码");
					return;
				}
				
				if($("#username").val() == ""){
					alert("请输入用户名");
					return;
				}
				
				if($("#password").val() == ""){
					alert("请输入密码");
					return;
				}
				
				if($("#recheckpassword").val() == ""){
					alert("请确认密码");
					return;
				}
				
				if($("#recheckpassword").val() != $("#password").val()){
					alert("两次密码输入不一致");
					return;
				}
				
				if($("#needNoCreateAccount").is(':checked')){
					$("#needNoCreateAccount").val(1);
				}else{
					$("#needNoCreateAccount").val(0);
				}
				
			    //按钮置灰
	            $("#submit_btn").attr('disabled',"true");
				var mobile = $("#mobile").val();
				var invCode = $("#invCode").val();
				var username = $("#username").val();
				var password = $("#password").val();
				var needNoCreateAccount = $("#needNoCreateAccount").val();
				$.ajax({
			        type: "POST",
			        url:"/admin/va",
			        data:{"mobile":mobile,"invCode":invCode,"username":username,"password":password,"needNoCreateAccount":needNoCreateAccount},
			        async: false,
			        error: function(request) {
			        },
			        success: function(data) {
			            if(data.status == 0){
			                alertBoxFunc(data.data,"sure");
			                $("#submit_btn").removeAttr("disabled");
			            }else{
			            	alertBoxFunc(data.error.message,"sure");
			            	$("#submit_btn").removeAttr("disabled");
			            }
			        }
			   	});
			})
			
			
			$("#submit_btn_1").on('click', function(e) {
				if($("#mobile_1").val() == ""){
					alert("请输入手机号");
					return;
				}
			    //按钮置灰
	            $("#submit_btn_1").attr('disabled',"true");
				var mobile = $("#mobile_1").val();
				var btcUsdPrice = $("#btcUsdPrice").val();
				var usd2cnyRate = $("#usd2cnyRate").val();
				var buyTime = $("#buyTime").val();
				var needVirtualBuy = 0;
				if($("#needVirtualBuy").is(':checked')){
					$("#needVirtualBuy").val(1)
					needVirtualBuy = 1;
					console.log(needVirtualBuy)
				}else{
					$("#needVirtualBuy").val(0)
					needVirtualBuy = 0;
					console.log(needVirtualBuy)
				}
				$.ajax({
			        type: "POST",
			        url:"/admin/subcore",
			        data:{"mobile":mobile,"needVirtualBuy":needVirtualBuy,"btcUsdPrice":btcUsdPrice,"usd2cnyRate":usd2cnyRate,"buyTime":buyTime},
			        async: false,
			        error: function(request) {
			        },
			        success: function(data) {
			        	if(data.status == 0){
			                alertBoxFunc(data.data,"sure");
			                $("#submit_btn_1").removeAttr("disabled");
			            }else{
			            	alertBoxFunc(data.error.message,"sure");
			            	$("#submit_btn_1").removeAttr("disabled");
			            }
			        }
			   	});
			})
		});
		</script>
</body>
</html>

