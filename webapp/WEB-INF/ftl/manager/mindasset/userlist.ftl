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
							<li class="active">mindasset 用户</li>
						</ul><!-- .breadcrumb -->
					</div>
					<div class="page-content">
						<div class="page-header">
							<h1>
								mindasset 用户
								<small>
									<i class="icon-double-angle-right"></i>
									 查看
								</small>



                                <form action="/admin/md/user/search" method="GET">
                                    <div class="page-header clearfix col-xs-8 ">
                                        <p class="col-xs-4">
                                            <input class="col-xs-12 article_title" type="text" id="uid" placeholder="请输入uid" value="" name="uid">
                                        </p>
                                        <p class="col-xs-4">
                                            <input class="col-xs-12 article_title" type="text" id="mobile" placeholder="请输入手机号" value="" name="mobile">
                                        </p>
                                    </div>
                                    <p class="col-xs-2">
                                        <input class="btn btn-success btn-sm" type="submit" name="submit" value="查 询">
                                    </p>
                                    <style type="text/css">
                                        p{ margin: 10px 0;}
                                    </style>
									</form>
						</h1>
						</div><!-- /.page-header -->

<div class="row">
									<div class="col-xs-12">
										<div class="table-responsive">
											<table id="sample-table-1" class="table table-striped table-bordered table-hover">
												<thead>
													<tr>
                                                        <th>用户id</th>
														<th>用户名称</th>
                                                        <th>状态</th>
														<th>手机号</th>
                                                        <th>住址</th>
														<th></th>
													</tr>
												</thead>

												<tbody>
													<#if userList?exists >
                           							<#list userList as user>
													<tr>
														<td>
															${user.id}
														</td>
														<td>
															${user.username}
														</td>
                                                        <td>
															<#if user.status=='-99'>
																禁用
															<#elseif user.status=='-90'>
																作弊冻结
															<#else>
																正常
															</#if>
                                                        </td>
                                                        <td>
															${user.telephone}
                                                        </td>
                                                        <td>
															${user.address}
                                                        </td>

														<td>
															<div class="visible-md visible-lg hidden-sm hidden-xs btn-group">


																<a class="btn btn-xs btn-info" href="/admin/md/user/inuse?uid=${user.id}&mobile=${user.telephone}">
																	启用
																</a>

																<a class="btn btn-xs btn-danger" href="/admin/md/user/forbidden?uid=${user.id}&mobile=${user.telephone}">
																	禁用
																</a>
															</div>
														</td>
													</tr>
													</#list>
                        </#if>
												</tbody>
											</table>
										</div><!-- /.table-responsive -->
									</div><!-- /span -->
								</div>


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

</body>
</html>

