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
            <li class="active">公告列表</li>
        </ul><!-- .breadcrumb -->
    </div>
    <div class="page-content">
        <div class="page-header">
            <h1>
                公告列表
                <small>
                    <i class="icon-double-angle-right"></i>
                    查看
                </small>
                <a href="/admin/notice/add" class="btn btn-success btn-info pull-right"><i
                        class="icon-pencil align-top bigger-125"></i><b>新建公告</b></a>
            </h1>
        </div><!-- /.page-header -->

        <div class="row">
            <div class="col-xs-12">
                <div class="table-responsive">
                    <table id="sample-table-1" class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th>标题</th>
                            <th class="hidden-480">公告时间</th>
                            <th></th>
                        </tr>
                        </thead>

                        <tbody>
                        <#if list?exists >
                            <#list list as notice>
                            <tr>
                                <td>
                                    <a href="/admin/notice/view?id=${notice.id}" target="_blank">${notice.title}</a>
                                </td>
                                <td>
                                    <span class="label label-sm label-warning">${notice.createTime?string('yyyy-MM-dd HH:mm:ss')}</span>
                                </td>

                                <td>
                                    <div class="visible-md visible-lg hidden-sm hidden-xs btn-group">


                                        <a class="btn btn-xs btn-info"
                                           href="/admin/notice/modify?noticeId=${notice.id}">
                                            <i class="icon-edit bigger-120"></i>
                                        </a>

                                        <a class="btn btn-xs btn-danger"
                                           href="/admin/notice/delete?noticeId=${notice.id}">
                                            <i class="icon-trash bigger-120"></i>
                                        </a>


                                    </div>

                                    <div class="visible-xs visible-sm hidden-md hidden-lg">
                                        <div class="inline position-relative">
                                            <button class="btn btn-minier btn-primary dropdown-toggle"
                                                    data-toggle="dropdown">
                                                <i class="icon-cog icon-only bigger-110"></i>
                                            </button>

                                            <ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
                                                <li>
                                                    <a href="/admin/notice/modify?noticeId=${notice.id}"
                                                       class="tooltip-success" data-rel="tooltip" title="Edit">
																				<span class="green">
																					<i class="icon-edit bigger-120"></i>
																				</span>
                                                    </a>
                                                </li>

                                                <li>
                                                    <a href="/admin/notice/delete?noticeId=${notice.id}"
                                                       class="tooltip-error" data-rel="tooltip" title="Delete">
																				<span class="red">
																					<i class="icon-trash bigger-120"></i>
																				</span>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
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

