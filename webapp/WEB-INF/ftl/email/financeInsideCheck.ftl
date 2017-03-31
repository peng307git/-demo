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

    <#if fic??>

        <tr>
            <td colspan="5">
                <center style="font-size:16px;">每日-[08:10]-内部对账结果</center>
            </td>
        </tr>

        <tr>
            <td colspan="5">
                <center>${fic.checkBeginStr} -- ${fic.checkEndStr}</center>
            </td>
        </tr>

        <tr>
            <td colspan="5"><b style="font-size:16px;">BTC充值</b>&nbsp;(基于BTC充值记录,汇总财务表中BTC充值记录进行比对)</td>
        </tr>

        <tr>
            <td>oc_ma_rechargeitem.sum(BTC)</td>
            <td>${fic.btcRechargeSum}</td>
            <td>finance.sum(BTC)</td>
            <td>${fic.btcRechargeFinanceSum}</td>
            <#if fic.btcRechargeSumCheck == true >
                <td><b style="color:green;">正常</b></td>
            <#else >
                <td><b style="color:red;">错误</b></td>
            </#if>
        </tr>
        <tr>
            <td>oc_ma_rechargeitem.count</td>
            <td>${fic.btcRechargeCount}</td>
            <td>finance.count</td>
            <td>${fic.btcRechargeFinanceCount}</td>
            <#if fic.btcRechargeCountCheck == true >
                <td><b style="color:green;">正常</b></td>
            <#else >
                <td><b style="color:red;">错误</b></td>
            </#if>
        </tr>


        <tr>
            <td colspan="5"><b style="font-size:16px;">BTC提现</b>&nbsp;(BTC提现记录与财务表BTC提现记录进行比对)</td>
        </tr>
        <tr>
            <td>gaia_withrawal.sum(BTC)</td>
            <td>${fic.btcWithrawalSum}</td>
            <td>finance.sum(BTC)</td>
            <td>${fic.btcWithrawalFinanceSum}</td>
            <#if fic.btcWithrawalSumCheck == true >
                <td><b style="color:green;">正常</b></td>
            <#else >
                <td><b style="color:red;">错误</b></td>
            </#if>
        </tr>
        <tr>
            <td>gaia_withrawal.count</td>
            <td>${fic.btcWithrawalCount}</td>
            <td>finance.count</td>
            <td>${fic.btcWithrawalFinanceCount}</td>
            <#if fic.btcWithrawalCountCheck == true >
                <td><b style="color:green;">正常</b></td>
            <#else >
                <td><b style="color:red;">错误</b></td>
            </#if>
        </tr>


        <tr>
            <td colspan="5"><b style="font-size:16px;">激活子核心</b>&nbsp;(激活记录与财务表激活子核心记录进行比对)</td>
        </tr>
        <tr>
            <td>激活子核心.sum(BTC)</td>
            <td>${fic.btcActivationSubCoreSum}</td>
            <td>finance.sum(BTC)</td>
            <td>${fic.btcActivationSubCoreFinanceSum}</td>
            <#if fic.btcActivationSubCoreSumCheck == true >
                <td><b style="color:green;">正常</b></td>
            <#else >
                <td><b style="color:red;">错误</b></td>
            </#if>
        </tr>
        <tr>
            <td>激活子核心.count</td>
            <td>${fic.btcActivationSubCoreCount}</td>
            <td>finance.count</td>
            <td>${fic.btcActivationSubCoreFinanceCount}</td>
            <#if fic.btcActivationSubCoreCountCheck == true >
                <td><b style="color:green;">正常</b></td>
            <#else >
                <td><b style="color:red;">错误</b></td>
            </#if>
        </tr>

        <tr>
            <td colspan="5"><b style="font-size:16px;">MG出售</b>&nbsp;(MG出售表与财务表MG出售记录进行比对)</td>
        </tr>
        <tr>
            <td>gaia_sale.sum(MG)</td>
            <td>${fic.mgSaleSum}</td>
            <td>finance.sum(MG)</td>
            <td>${fic.mgSaleFinanceSum}</td>
            <#if fic.mgSaleSumCheck == true >
                <td><b style="color:green;">正常</b></td>
            <#else >
                <td><b style="color:red;">错误</b></td>
            </#if>
        </tr>
        <tr>
            <td>gaia_sale.sum(BTC)</td>
            <td>${fic.mgSaleBTCSum}</td>
            <td>finance.sum(BTC)</td>
            <td>${fic.mgSaleBTCFinanceSum}</td>
            <#if fic.mgSaleBTCSumCheck == true >
                <td><b style="color:green;">正常</b></td>
            <#else >
                <td><b style="color:red;">错误</b></td>
            </#if>
        </tr>


        <tr>
            <td>gaia_sale.count</td>
            <td>${fic.mgSaleCount}</td>
            <td>finance.count</td>
            <td>${fic.mgSaleFinanceCount}</td>
            <#if fic.mgSaleCountCheck == true >
                <td><b style="color:green;">正常</b></td>
            <#else >
                <td><b style="color:red;">错误</b></td>
            </#if>
        </tr>

        <tr>
            <td colspan="5"><b style="font-size:16px;">MG提现</b>&nbsp;(MG提现表与财务表MG提现记录进行比对)</td>
        </tr>
        <tr>
            <td>gaia_mg_withrawal.sum(MG)</td>
            <td>${fic.mgWithrawalSum}</td>
            <td>finance.sum(MG)</td>
            <td>${fic.mgWithrawalFinanceSum}</td>
            <#if fic.mgWithrawalSumCheck == true >
                <td><b style="color:green;">正常</b></td>
            <#else >
                <td><b style="color:red;">错误</b></td>
            </#if>
        </tr>
        <tr>
            <td>gaia_mg_withrawal.count</td>
            <td>${fic.mgWithrawalCount}</td>
            <td>finance.count</td>
            <td>${fic.mgWithrawalFinanceCount}</td>
            <#if fic.mgWithrawalCountCheck == true >
                <td><b style="color:green;">正常</b></td>
            <#else >
                <td><b style="color:red;">错误</b></td>
            </#if>
        </tr>



        <tr>
            <td colspan="5"><b style="font-size:16px;">MG充值</b>&nbsp;(MG充值表与财务表MG充值记录进行比对)</td>
        </tr>
        <tr>
            <td>gaia_mg_Recharge.sum(MG)</td>
            <td>${fic.mgRechargeSum}</td>
            <td>finance.sum(MG)</td>
            <td>${fic.mgRechargeFinanceSum}</td>
            <#if fic.mgRechargeSumCheck == true >
                <td><b style="color:green;">正常</b></td>
            <#else >
                <td><b style="color:red;">错误</b></td>
            </#if>
        </tr>
        <tr>
            <td>gaia_mg_recharge.count</td>
            <td>${fic.mgRechargeCount}</td>
            <td>finance.count</td>
            <td>${fic.mgRechargeFinanceCount}</td>
            <#if fic.mgRechargeCountCheck == true >
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