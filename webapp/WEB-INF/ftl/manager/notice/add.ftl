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

		<!-- ace styles -->

		<link rel="stylesheet" href="/static/assets/css/ace.min.css" />
		<link rel="stylesheet" href="/static/assets/css/ace-rtl.min.css" />
		<link rel="stylesheet" href="/static/assets/css/ace-skins.min.css" />
		<link rel="stylesheet" href="/static/css/base.css" />
<link href="/static/assets/css/jquery.timepicker.css" rel="stylesheet">
<link href="/static/assets/css/bootstrap-datepicker.css" rel="stylesheet">

 <link rel="stylesheet" type="text/css" href="/static/css/wangeditor/wangEditor.min.css">
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
							<li class="active">公告详情</li>
						</ul><!-- .breadcrumb -->
					</div>
					<div class="page-content">
						<div class="page-header">
							<h1>
								公告详情
								<small>
									<i class="icon-double-angle-right"></i>
									 编辑
								</small>
							</h1>
						</div><!-- /.page-header -->
						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->

								<div class="clearfix">
									<input class="col-xs-10 article_title" type="text" id="article_title_cn" placeholder="请输入中文简体公告标题" value="<#if notice?exists >${notice.title}</#if>">
								</div>
								<div class="hr hr-double dotted"></div>
								<div id="editor1">
						            <p><#if notice?exists >${notice.message}</#if></p></div>
								<p></p>
								<div class="clearfix"><p class="pull-right">
									<button class="btn btn-info" id="preview_cn_btn"><i class="icon-zoom-in bigger-120"></i>预览</button>
									</p>
								</div>
								<div class="hr hr-double dotted"></div>
								<script type="text/javascript">
									var $path_assets = "assets";//this will be used in loading jQuery UI if needed!
								</script>

								<!-- PAGE CONTENT ENDS -->
							</div><!-- /.col -->
						</div><!-- /.row -->
						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->

								<div class="clearfix">
									<input class="col-xs-10 article_title" type="text" id="article_title_tw" placeholder="请输入中文繁体公告标题" value="<#if notice?exists >${notice.titleTw}</#if>">
								</div>
								<div class="hr hr-double dotted"></div>
								<div id="editor2">
						            <p><#if notice?exists >${notice.messageTw}</#if></p>
						        </div>
								<p></p>
								<div class="clearfix"><p class="pull-right">
									<button class="btn btn-info" id="preview_tw_btn"><i class="icon-zoom-in bigger-120"></i>预览</button>
									</p>
								</div>
								<div class="hr hr-double dotted"></div>
								
								<!-- PAGE CONTENT ENDS -->
							</div><!-- /.col -->
						</div><!-- /.row -->
						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->

								<div class="clearfix">
									<input class="col-xs-10 article_title" type="text" id="article_title_us" placeholder="请输入英文公告标题" value="<#if notice?exists >${notice.titleEn}</#if>">
								</div>
								<div class="hr hr-double dotted"></div>
								<div id="editor3">
						            <p><#if notice?exists >${notice.messageEn}</#if></p></div>
								<p></p>
								<div class="clearfix"><p class="pull-right">
									<button class="btn btn-info" id="preview_us_btn"><i class="icon-zoom-in bigger-120"></i>预览</button>
									</p>
								</div>
								<div class="hr hr-double dotted"></div>
								<div class="clearfix">
									<h4 class="pull-left" id="basicExample">
									     固定日期 <input type="text" class="date start" />
									     时间 <input type="text" class="time start" />
									     发布，不选择为立即发布。
									</h4>
									<p class="pull-right">
									<input type="hidden" id="noticeId" value = "<#if notice?exists >${notice.id}</#if>">
									<button class="btn btn-success" id="submit_btn"><i class="icon-ok bigger-120"></i>提交所有</button></p>
								</div>
								<div class="hr hr-double dotted"></div>
								<!-- PAGE CONTENT ENDS -->
							</div><!-- /.col -->
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

		<script src="/static/assets/js/jquery-ui-1.10.3.custom.min.js"></script>
		<script src="/static/assets/js/jquery.ui.touch-punch.min.js"></script>
		<script src="/static/assets/js/markdown/markdown.min.js"></script>
		<script src="/static/assets/js/markdown/bootstrap-markdown.min.js"></script>
		<script src="/static/assets/js/jquery.hotkeys.min.js"></script>
		<!-- <script src="/static/assets/js/bootstrap-wysiwyg.min.js"></script> -->
		<script src="/static/assets/js/bootbox.min.js"></script>

		<script src="/static/js/jquery.i18n.properties-1.0.9.js"></script>
		<!-- ace scripts -->

		<script src="/static/assets/js/ace-elements.min.js"></script>
		<script src="/static/assets/js/ace.min.js"></script>

		<!-- inline scripts related to this page -->
<script type="text/javascript" src="/static/js/manager/wangEditor.js"></script>


<script type="text/javascript" src="/static/assets/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="/static/assets/js/jquery.timepicker.js"></script>

<script src="/static/js/manager/notice.js"></script>
</body>
</html>

