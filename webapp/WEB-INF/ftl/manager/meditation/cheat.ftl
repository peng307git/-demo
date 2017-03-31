<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>控制台</title>
    <script src="/static/assets/js/html5shiv.js"></script>
    <script src="/static/assets/js/respond.min.js"></script>


    <link rel="stylesheet" type="text/css" href="/static/css/myquery.css">

    <link rel="stylesheet" type="text/css" href="/static/easyui_date/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="/static/easyui_date/themes/icon.css">

    <script src="/static/easyui_date/js/jquery.min.js"></script>

    <script src="/static/easyui_date/js/jquery.easyui.min.js"></script>
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
    <link rel="stylesheet" href="/static/css/base.css"/>
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="/static/assets/css/ace-ie.min.css"/>
    <![endif]-->

    <!-- inline styles related to this page -->

    <!-- ace settings handler -->

    <script src="/static/assets/js/ace-extra.min.js"></script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

    <!--[if lt IE 9]>

    <![endif]-->
</head>


<div class="main-content">
    <div class="breadcrumbs" id="breadcrumbs">
        <script type="text/javascript">
            try {
                ace.settings.check('breadcrumbs', 'fixed')
            } catch (e) {
            }
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
                作弊脑波数据
                <small>
                    <i class="icon-double-angle-right"></i>
                    查看
                </small>


                <form action="/admin/meditation/cheat" method="GET">
                    <div class="page-header clearfix col-xs-8 ">
                        <p class="col-xs-4">
                            <input id="startTime" name="startTime" class="easyui-datebox"
                                   data-options="formatter:myformatter,parser:myparser"></input>
                        </p>
                        <p class="col-xs-4">
                            <input id="endTime" name="endTime" class="easyui-datebox"
                                   data-options="formatter:myformatter,parser:myparser"></input>
                        </p>

                        <p class="col-xs-4">
                            <input class="col-xs-12 article_title" type="text" id="mdId" placeholder="请输入脑波编码,非表中id"
                                   value="" name="mdId">
                        </p>
                        <p class="col-xs-4">
                            <input class="col-xs-12 article_title" type="text" id="uid" placeholder="uid"
                                   value="" name="uid">
                        </p>
                    </div>
                    <p class="col-xs-2">
                        <input class="btn btn-success btn-sm" type="submit" name="submit" value="查 询">
                    </p>
                    <style type="text/css">
                        p {
                            margin: 10px 0;
                        }
                    </style>

                    <script type="text/javascript">
                        function myformatter(date) {
                            var y = date.getFullYear();
                            var m = date.getMonth() + 1;
                            var d = date.getDate();
                            return y + '-' + (m < 10 ? ('0' + m) : m) + '-' + (d < 10 ? ('0' + d) : d);
                        }
                        function myparser(s) {
                            if (!s) return new Date();
                            var ss = (s.split('-'));
                            var y = parseInt(ss[0], 10);
                            var m = parseInt(ss[1], 10);
                            var d = parseInt(ss[2], 10);
                            if (!isNaN(y) && !isNaN(m) && !isNaN(d)) {
                                return new Date(y, m - 1, d);
                            } else {
                                return new Date();
                            }
                        }
                    </script>
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
                            <th>手机号</th>
                            <th>脑波id</th>
                            <th>脑波编码</th>
                            <th>add time</th>
                            <th>data</th>
                            <th>冥想时长</th>
                            <th>mg_approved</th>
                            <th>capacity</th>
                            <th>深度放松时长</th>
                            <th>轻度放松时长</th>
                            <th>未放松时长</th>
                            <th>轻度放松获得mg</th>
                            <th>深度放松获得mg</th>
                            <th>脑波举报次数</th>
                            <th></th>
                        </tr>
                        </thead>

                        <tbody>
                        <#if data?exists >
                            <#list data as md>
                            <tr>
                                <td>
                                ${md.uid}
                                </td>
                                <td>
                                ${md.username}
                                </td>
                                <td>
                                ${md.telephone}
                                </td>
                                <td>
                                ${md.id}
                                </td>
                                <td>
                                ${md.mdNo}
                                </td>
                                <td>
                                ${md.addTime?datetime}
                                </td>
                                <td>
                                ${md.data}
                                </td>
                                <td>
                                ${md.elapse}
                                </td>
                                <td>
                                ${md.mgApproved}
                                </td>
                                <td>
                                ${md.capacity}
                                </td>
                                <td>
                                ${md.deepTime}
                                </td>
                                <td>
                                ${md.shallowTime}
                                </td>
                                <td>
                                ${md.noneTime}
                                </td>
                                <td>
                                ${md.shallowMg}
                                </td>
                                <td>
                                ${md.deepMg}
                                </td>
                                <td>
                                ${md.complaintsNum}
                                </td>

                                <td>
                                    <div class="visible-md visible-lg hidden-sm hidden-xs btn-group">
                                        <#if md.status ? exists>
                                            <#if md.status = -90>
                                                号码已经冻结
                                            <#else>
                                                <a class="btn btn-xs btn-info"
                                                   href="/admin/meditation/cheat/freeze?uid=${md.uid}&mdId=${md.id}&startTime=${hi_startTime}&endTime=${hi_endTime}">
                                                    作弊冻结
                                                </a>
                                            </#if>
                                        <#else>
                                            <a class="btn btn-xs btn-info"
                                               href="/admin/meditation/cheat/freeze?uid=${md.uid}&mdId=${md.id}&startTime=${hi_startTime}&endTime=${hi_endTime}">
                                                作弊冻结
                                            </a>
                                        </#if>
                                        &nbsp;
                                        <a class="btn btn-xs btn-info" href="/admin/meditation/new?id=${md.id}"
                                           target="_blank">
                                            查看脑波
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

<script src="/static/js/jquery.i18n.properties-1.0.9.js"></script>
<!-- ace scripts -->

<script src="/static/assets/js/ace-elements.min.js"></script>
<script src="/static/assets/js/ace.min.js"></script>

<!-- inline scripts related to this page -->

