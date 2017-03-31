<html>
<head>
    <meta charset="UTF-8"/>

    <style type="text/css">

        table.gridtable {
            font-family: verdana, arial, sans-serif;
            font-size: 12px;
            color: #333333;
            border-width: 1px;
            border-color: #ddd;
            border-collapse: collapse;
        }

        table.gridtable th {
            border-width: 1px;
            padding: 8px;
            border-style: solid;
            border-color: #ddd;
            background-color: #dedede;
        }

        table.gridtable td {
            border-width: 1px;
            padding: 8px;
            border-style: solid;
            border-color: #ddd;
            background-color: #ffffff;
        }
    </style>

</head>

<body>


<table class="gridtable">

<#if foc??>

    <tr>
        <td colspan="5">
            <center style="font-size:16px;">每日-[08:15]-外部对账结果</center>
        </td>
    </tr>

    <tr>
        <td colspan="5">
            <center>${foc.checkBeginStr} -- ${foc.checkEndStr}</center>
        </td>
    </tr>

    <tr>
        <td colspan="5"><b style="font-size:16px;">BTC充值</b>&nbsp;(基于BTC钱包充值记录与主站BTC充值记录进行比对)</td>
    </tr>

    <tr>
        <td>BTC钱包充值.sum(BTC)</td>
        <td>${foc.btcRechargeSum}</td>
        <td>主站充值记录[oc_ma_rechargeitem].sum(BTC)</td>
        <td>${foc.btcRechargeFinanceSum}</td>
        <#if foc.btcRechargeSumCheck == true >
            <td><b style="color:green;">正常</b></td>
        <#else >
            <td><b style="color:red;">错误</b></td>
        </#if>
    </tr>
    <tr>
        <td>BTC钱包充值.count</td>
        <td>${foc.btcRechargeCount}</td>
        <td>主站充值记录[oc_ma_rechargeitem].count</td>
        <td>${foc.btcRechargeFinanceCount}</td>
        <#if foc.btcRechargeCountCheck == true >
            <td><b style="color:green;">正常</b></td>
        <#else >
            <td><b style="color:red;">错误</b></td>
        </#if>
    </tr>


    <tr>
        <td colspan="5"><b style="font-size:16px;">BTC提现</b>&nbsp;(BTC钱包提现记录与财务表BTC提现记录进行比对)</td>
    </tr>
    <tr>
        <td>BTC钱包提现.sum(BTC)</td>
        <td>${foc.btcWithrawalSum}</td>
        <td>主站提现记录[BTC提现表].sum(BTC)</td>
        <td>${foc.btcWithrawalFinanceSum}</td>
        <#if foc.btcWithrawalSumCheck == true >
            <td><b style="color:green;">正常</b></td>
        <#else >
            <td><b style="color:red;">错误</b></td>
        </#if>
    </tr>
    <tr>
        <td>BTC钱包提现.count</td>
        <td>${foc.btcWithrawalCount}</td>
        <td>主站提现记录[BTC提现表].count</td>
        <td>${foc.btcWithrawalFinanceCount}</td>
        <#if foc.btcWithrawalCountCheck == true >
            <td><b style="color:green;">正常</b></td>
        <#else >
            <td><b style="color:red;">错误</b></td>
        </#if>
    </tr>


    <tr>
        <td colspan="5"><b style="font-size:16px;">批量信息</b></td>
    </tr>
    <tr>
        <td>执行服务器HostName</td>
        <td colspan="4">${ebi.hostName}</td>
    </tr>
    <tr>
        <td>执行服务器IP</td>
        <td colspan="4">${ebi.ip}</td>
    </tr>
    <tr>
        <td>开始运行时间</td>
        <td colspan="4">${ebi.beginTimeStr}</td>
    </tr>
    <tr>
        <td>结束运行时间</td>
        <td colspan="4">${ebi.endTimeStr}</td>
    </tr>
    <tr>
        <td>批量执行耗时</td>
        <td colspan="4">${ebi.executeTimeStr}</td>
    </tr>

<#else >
    <tr>
        <td  colspan="2">
            <p>错误：</p>
        </td>
        <td  colspan="2">
            <p>${ebi.errorMessage}</p>
        </td>
    </tr>

    <tr>
        <td colspan="2"><b style="font-size:16px;">批量信息</b></td>
    </tr>
    <tr>
        <td>执行服务器HostName</td>
        <td colspan="2">${ebi.hostName}</td>
    </tr>
    <tr>
        <td>执行服务器IP</td>
        <td colspan="2">${ebi.ip}</td>
    </tr>
    <tr>
        <td>开始运行时间</td>
        <td colspan="2">${ebi.beginTimeStr}</td>
    </tr>


</#if>
</table>
</body>
</html>