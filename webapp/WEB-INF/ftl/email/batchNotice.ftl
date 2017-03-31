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
    <tr>
        <td colspan="3">

        <#if ebi.success == true >
            <center style="font-size:16px;color: green;">${ebi.emailSubject}</center>
        <#else >
            <center style="font-size:16px;color: red;">${ebi.emailSubject}</center>
        </#if>

        </td>
    </tr>

<#if ebi.errorMessage??>

    <tr>
        <td colspan="5"><b style="font-size:16px;">批量信息</b></td>
    </tr>

    <tr>
        <td>批量日期</td>
        <td colspan="4">${ebi.batchRunDate}</td>
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
        <td>
            <p>错误：</p>
        </td>
        <td colspan="4">
            <p>${ebi.errorMessage}</p>
        </td>
    </tr>
<#else >
    <tr>
        <td colspan="5"><b style="font-size:16px;">Field-Value</b></td>
    </tr>
    <#list ebi.kfList as kf >
        <tr>
            <td>${kf.field}</td>
            <td colspan="4">${kf.value}</td>
        </tr>
    </#list>


    <tr>
        <td colspan="5"><b style="font-size:16px;">批量信息</b></td>
    </tr>

    <tr>
        <td>批量日期</td>
        <td colspan="4">${ebi.batchRunDate}</td>
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
</#if>



</table>
</body>
</html>