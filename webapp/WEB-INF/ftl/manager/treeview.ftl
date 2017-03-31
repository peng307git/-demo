<html>
<head>
    <link rel="stylesheet" href="/static/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <style>
        body {
            background-color: white;
            margin: 0;
            padding: 0;
            text-align: center;
        }

        div, p, table, th, td {
            list-style: none;
            margin: 0;
            padding: 0;
            color: #333;
            font-size: 12px;
            font-family: dotum, Verdana, Arial, Helvetica, AppleGothic, sans-serif;
        }

        #testIframe {
            margin-left: 10px;
        }
    </style>
    <script type="text/javascript" src="/static/js/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="/static/js/jquery.ztree.core.min.js"></script>
    <SCRIPT type="text/javascript">
        <!--
        var zTree;
        var demoIframe;

        var setting = {
            view: {
                dblClickExpand: false,
                showLine: true,
                selectedMulti: false
            },
            data: {
                simpleData: {
                    enable: true,
                    idKey: "id",
                    pIdKey: "pid",
                    rootPId: ""
                }
            },
            callback: {
                beforeClick: function (treeId, treeNode) {
                    var zTree = $.fn.zTree.getZTreeObj("tree");
                    if (treeNode.isParent) {
                        zTree.expandNode(treeNode);
                        return false;
                    } else {
                        demoIframe.attr("src", treeNode.file + ".html");
                        return true;
                    }
                }
            }
        };

        var zNodes = ${nodeList};

        $(document).ready(function () {
            var t = $("#tree");
            t = $.fn.zTree.init(t, setting, zNodes);
            demoIframe = $("#testIframe");
            demoIframe.bind("load", loadReady);
            var zTree = $.fn.zTree.getZTreeObj("tree");
            zTree.selectNode(zTree.getNodeByParam("id", 101));

        });

        function loadReady() {
            var bodyH = demoIframe.contents().find("body").get(0).scrollHeight,
                    htmlH = demoIframe.contents().find("html").get(0).scrollHeight,
                    maxH = Math.max(bodyH, htmlH), minH = Math.min(bodyH, htmlH),
                    h = demoIframe.height() >= maxH ? minH : maxH;
            if (h < 530) h = 530;
            demoIframe.height(h);
        }

        //-->
    </SCRIPT>
</HEAD>

<BODY>
直接邀请人数:${direct} <br/>
间接邀请人数:${inDirect}

<div class="main-content">

    <div id="tree" class="ztree" style="width:660px;"></div>

</div>


</BODY>
</HTML>
