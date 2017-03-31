<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<title>控制台</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<!-- basic styles -->
		<link href="/static/assets/css/bootstrap.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="/static/assets/css/font-awesome.min.css" />

		<!--[if IE 7]>
		  <link rel="stylesheet" href="/static/assets/css/font-awesome-ie7.min.css" />
		<![endif]-->

		<!-- page specific plugin styles -->

		<!-- fonts -->

		<!-- <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300" /> -->

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
							<li class="active">子节点列表</li>
						</ul><!-- .breadcrumb -->
					</div>
					<div class="page-content">
						<div class="page-header">
							<h1>
								子节点列表
								<small>
									<i class="icon-double-angle-right"></i>
									 查看
								</small>
						</h1>
						</div><!-- /.page-header -->
						<form action="/admin/mindfield/underuserlist" method="GET">
						<div class="page-header clearfix col-xs-8 ">
									<p class="col-xs-4">
									<input class="col-xs-12 article_title" type="text" id="telephone" placeholder="请输入手机号" value="" name="telephone">
									</p>
									<p class="col-xs-4">
									<label class="pull-right">
										<input type="checkbox" class="ace" id = "NeedOrder">
										<span class="lbl"> 是否只需要有订单的账户 </span>
										<input type="hidden" id = "onlyNeedOrder" name = "onlyNeedOrder" value = "0">
									</label>
									
									</p>
									<p class="col-xs-2">
									<input class="btn btn-success btn-sm" type="submit" name="submit" value="查 询">
									</p>
									<p class="col-xs-2">
									<a class="btn btn-info btn-sm" href="/admin/mindfield/underuserlist/loaddate">加载数据</a></p>
								</div>
							<style type="text/css">
								p{ margin: 10px 0;}
							</style>
							<div class="row">
									<div class="col-xs-12">
										<div class="table-responsive">
											<table id="sample-table-1" class="table table-striped table-bordered table-hover">
												<thead>
													<tr>
														<th>节点id</th>
														<th>用户id</th>
														<th>用户名</th>
														<th class="hidden-480">电话号码</th>
														<th>邀请码</th>
														<th>硬件</th>
														<th>mindpackage</th>
														<th>下单地址</th>
														<th>下单时间</th>
													</tr>
												</thead>

												<tbody>
													<#if list?exists >
                           							<#list list as user>
													<tr>
														<td>
															${user.nodeId}
														</td>
														<td>
															${user.id}
														</td>
														<td>
															${user.username}
														</td>
														<td>
															${user.telephone}
														</td>
														<td>
															${user.invitationCode}
														</td>
														<td>
															${user.mindlinknum}
														</td>
														<td>
															${user.masanumber}
														</td>
														<td>
															${user.buyAddress}
														</td>
														<td>
															<#if user.buyTime?exists >
																${user.buyTime?datetime}
															</#if>
														</td>
													</tr>
													</#list>
                        </#if>
												</tbody>
											</table>
										</div><!-- /.table-responsive -->
									</div><!-- /span -->
								</div>
						</form>

						<div class="row">
							 <!-- /.col -->
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div><!-- /.main-content -->

				
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

		<!--[if lte IE 8]>
		  <script src="/static/assets/js/excanvas.min.js"></script>
		<![endif]-->
		<script src="/static/assets/js/jquery-ui-1.10.3.custom.min.js"></script>
		<script src="/static/assets/js/jquery.ui.touch-punch.min.js"></script>
		<script src="/static/assets/js/jquery.slimscroll.min.js"></script>
		<script src="/static/assets/js/jquery.easy-pie-chart.min.js"></script>
		<script src="/static/assets/js/jquery.sparkline.min.js"></script>
		<script src="/static/assets/js/flot/jquery.flot.min.js"></script>
		<script src="/static/assets/js/flot/jquery.flot.pie.min.js"></script>
		<script src="/static/assets/js/flot/jquery.flot.resize.min.js"></script>

		<script src="/static/js/jquery.i18n.properties-1.0.9.js"></script>
		<!-- ace scripts -->

		<script src="/static/assets/js/ace-elements.min.js"></script>
		<script src="/static/assets/js/ace.min.js"></script>

		<!-- inline scripts related to this page -->
<script>
$(document).ready(function () {
  $('#NeedOrder').click(function(){
    var va = $('#onlyNeedOrder').val()
    if (va == 0) {
    	$('#onlyNeedOrder').val(1);
    }else if(va == 1){
		$('#onlyNeedOrder').val(0);
    };
  })
})
</script>
</body>
</html>

