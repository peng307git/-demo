<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>
        <sitemesh:write property='title'/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <!-- basic styles -->
    <link href="/static/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="/static/assets/css/font-awesome.min.css"/>

    <!--[if IE 7]>
    <link rel="stylesheet" href="/static/assets/css/font-awesome-ie7.min.css"/>
    <![endif]-->

    <!-- page specific plugin styles -->

    <!-- fonts -->

    <!-- <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300" /> -->

    <!-- ace styles -->

    <link rel="stylesheet" href="/static/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="/static/assets/css/ace-rtl.min.css"/>
    <link rel="stylesheet" href="/static/assets/css/ace-skins.min.css"/>

    <!--[if lte IE 8]>
    <link rel="stylesheet" href="/static/assets/css/ace-ie.min.css"/>
    <![endif]-->

    <!-- inline styles related to this page -->

    <!-- ace settings handler -->

    <script src="/static/assets/js/ace-extra.min.js"></script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

    <!--[if lt IE 9]>
    <script src="/static/assets/js/html5shiv.js"></script>
    <script src="/static/assets/js/respond.min.js"></script>
    <![endif]-->

    <sitemesh:write property='head'/>
</head>

<body>
<#include "manager/mainftl/header.ftl" >

<div class="main-container" id="main-container">
    <script type="text/javascript">
        try {
            ace.settings.check('main-container', 'fixed')
        } catch (e) {
        }
    </script>

    <div class="main-container-inner">
        <a class="menu-toggler" id="menu-toggler" href="#">
            <span class="menu-text"></span>
        </a>

    <#include "manager/mainftl/leftside.ftl" >
        <sitemesh:write property='body'/>

    </div><!-- /.main-container-inner -->

    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="icon-double-angle-up icon-only bigger-110"></i>
    </a>
</div><!-- /.main-container -->

<!-- basic scripts -->

<!--[if !IE]> -->

<script type="text/javascript">
    window.jQuery || document.write("<script src='/static/assets/js/jquery-2.0.3.min.js'>" + "<" + "script>");
</script>

<!-- <![endif]-->

<!--[if IE]>
<script type="text/javascript">
    window.jQuery || document.write("<script src='/static/assets/js/jquery-1.10.2.min.js'>" + "<" + "script>");
</script>
<![endif]-->

<script type="text/javascript">
    if ("ontouchend" in document) document.write("<script src='/static/assets/js/jquery.mobile.custom.min.js'>" + "<" + "script>");
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
<!-- ace scripts -->

<script src="/static/assets/js/ace-elements.min.js"></script>
<script src="/static/assets/js/ace.min.js"></script>


</body>
</html>

