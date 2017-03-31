<head>
    <title>提现审核</title>
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
<div class="main-content">
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
            <th>操作</th>
        </tr>
    <#list list as w>
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
            <td><a href="/admin/adjust?uid=${w.uid}" target="_blank">查看详情</a></td>
        </tr>
    </#list>
    </table>
</div>


</body>
</html>



