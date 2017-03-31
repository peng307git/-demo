<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>提现审核</title>
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
    <script src="/static/assets/js/html5shiv.js"></script>
    <script src="/static/assets/js/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript" src="http://cdn.hcharts.cn/jquery/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="http://cdn.hcharts.cn/highcharts/highcharts.js"></script>
<#--<script type="text/javascript" src="http://cdn.hcharts.cn/highcharts/exporting.js"></script>-->
    <style type="text/css">
        table.gridtable {
            font-family: verdana, arial, sans-serif;
            font-size: 11px;
            color: #333333;
            border-width: 1px;
            border-color: #666666;
            border-collapse: collapse;
        }

        table.gridtable th {
            border-width: 1px;
            padding: 8px;
            border-style: solid;
            border-color: #666666;
            background-color: #dedede;
        }

        table.gridtable td {
            border-width: 1px;
            padding: 8px;
            border-style: solid;
            border-color: #666666;
            background-color: #ffffff;
        }
    </style>
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
        <div class="main-content">


            用户信息      subCoreNum= ${subCoreNum}

            <table class="gridtable">
                <tr>
                    <th>id</th>
                    <td>${user.id}</td>
                </tr>
                <tr>
                    <th>telephone</th>
                    <td>${user.telephone}</td>
                </tr>
                <tr>
                    <th>username</th>
                    <td>${user.username}</td>
                </tr>
                <tr>
                    <th>sex</th>
                    <td>${user.sex}</td>
                </tr>
                <tr>
                    <th>address</th>
                    <td>${user.address}</td>
                </tr>
                <tr>
                    <th>add_time</th>
                    <td>${user.addTime?string('yyyy-MM-dd HH:mm:ss')}</td>
                </tr>
                <tr>
                    <th>invitation_code</th>
                    <td>${user.invitationCode}</td>
                </tr>
                <tr>
                    <th>recharge_address</th>
                    <td>${user.rechargeAddress}</td>
                </tr>
                <tr>
                    <th>status</th>
                    <td>${user.status}</td>
                </tr>

            </table>

            <hr/>
            财务信息
            <table class="gridtable">
                <tr>
                    <th>id</th>
                    <th>uid</th>
                    <th>txid</th>
                    <th>reason</th>
                    <th>add_time</th>
                    <th>mg</th>
                    <th>mn</th>
                    <th>mg_frozen</th>
                    <th>mn_share</th>
                    <th>mg_share_frozen</th>
                    <th>curr_mg</th>
                    <th>curr_mn</th>
                    <th>curr_mg_frozen</th>
                    <th>curr_mn_share</th>
                    <th>curr_mg_share_frozen</th>
                    <th>total_mg</th>
                    <th>total_mn</th>
                    <th>memo</th>
                    <th>action</th>
                    <th>refer</th>
                    <th>btc</th>
                    <th>curr_btc</th>
                </tr>
            <#list financeList as f>
                <tr>
                    <td>${f.id}</td>
                    <td>${f.uid}</td>
                    <td>${f.txid}</td>
                    <td>${f.reason}</td>
                    <td>${f.addTime?string('yyyy-MM-dd HH:mm:ss')}</td>
                    <td>${f.mg}</td>
                    <td>${f.mn}</td>
                    <td>${f.mgFrozen}</td>
                    <td>${f.mnShare}</td>
                    <td>${f.mgShareFrozen}</td>
                    <td>${f.currMg}</td>
                    <td>${f.currMn}</td>
                    <td>${f.currMgFrozen}</td>
                    <td>${f.currMnShare}</td>
                    <td>${f.currMgShareFrozen}</td>
                    <td>${f.totalMg}</td>
                    <td>${f.totalMn}</td>
                    <td>${f.memo}</td>
                    <td>${f.action}</td>
                    <td>${f.refer}</td>
                    <td>${f.btc}</td>
                    <td>${f.currBtc}</td>
                </tr>
            </#list>

            </table>

            <hr/>
            提现信息
            <table class="gridtable">
                <tr>
                    <th>uuid</th>
                    <th>uid</th>
                    <th>add_time</th>
                    <th>tx_id</th>
                    <th>amount</th>
                    <th>status</th>
                    <th>accounted</th>
                    <th>confirm</th>
                    <th>btc_address</th>
                    <th>service_charge</th>
                    <th>success_time</th>
                </tr>
            <#list withdrawList as w>
                <tr>
                    <td>${w.uuid}</td>
                    <td>${w.uid}</td>
                    <td>${w.addTime?string('yyyy-MM-dd HH:mm:ss')}</td>
                    <td>${w.txId}</td>
                    <td>${w.amount}</td>
                    <td>${w.status}</td>
                    <td>${w.accounted}</td>
                    <td>${w.confirm}</td>
                    <td>${w.btcAddress}</td>
                    <td>${w.serviceCharge}</td>
                    <td><#if w.successTime??>${w.successTime?string('yyyy-MM-dd HH:mm:ss')}</#if></td>
                </tr>
            </#list>
            </table>
        </div>
    </div>
</div>

</body>
</html>



