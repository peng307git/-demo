<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
</head>
<body>
<h2>尊敬的智慧资产用户您好：</h2>
<h2>
    您的提现操作现已出账，请注意查收，具体明细如下
</h2>
<br/>
<br/>

<table border="1" padding="0" align="center">

    <thead>

    <tr>
        <th style="width: 15%;">
            序号
        </th>
        <th style="width: 15%;;">
            提现时间
        </th>
        <th style="width: 15%;">
            业务类型
        </th>
        <th style="width: 15%;">
            提现账号
        </th>
        <th style="width: 15%;">
            提现金额
        </th>
        <th>
            状态
        </th>
    </tr>
    </thead>

    <tbody>

    <#list notices as n>
    <tr>
        <td  align="center">
        ${n.id}
        </td>
        <td align="center">
        ${n.createdAt ?datetime}
        </td>

    <#--<td align="center">-->
    <#--${n.financeBiz}-->
    <#--</td>-->

        <#if n.financeBiz == 'WITHDRAWAL_MG'>

            <#assign w = finance['WITHDRAWAL_MG'][n.finance] />

            <td align="center">
                MG提现
            </td>

            <td align="center"> 
            ${w.btcAddress}
            </td>

            <td align="center">
            ${w.amount}
            </td>
            <!-- todo 状态要结合后台审核流程 -->
            <td align="center">
                <#switch w.status>
                    <#case 0>
                        审核中
                        <#break>
                    <#case 10>
                        出账中
                        <#break>
                    <#default>
                        未知状态, 请联系客服
                </#switch>
            </td>
        </#if>
        <#if n.financeBiz == 'WITHDRAWAL'>
            <#assign w = finance['WITHDRAWAL'][n.finance] />
            <td align="center">
                BTC提现
            </td>

            <td align="center">
            ${w.btcAddress}
            </td>

            <td align="center">
            ${w.amount}
            </td>
            <td align="center">
                <#switch w.status>
                    <#case 0>
                        审核中
                        <#break >
                    <#case 2>
                        出账中
                        <#break>
                    <#default>
                        未知状态, 请联系客服
                </#switch>
            </td>
        </#if>
    </tr>
    </#list>
    </tbody>
</table>

</body>
</html>
