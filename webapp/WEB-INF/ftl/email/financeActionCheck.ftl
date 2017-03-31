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

<#if fac??>
    <tr>
        <td colspan="3">
            <center style="font-size:16px;">每日-[08:12]-财务Action校验结果</center>
        </td>
    </tr>

    <tr>
        <td colspan="3">
            <center>${fac.checkBeginStr} -- ${fac.checkEndStr}</center>
        </td>
    </tr>

    <tr>
        <td colspan="3"><b style="font-size:16px;">Action</b>&nbsp;(SUBTRACT=减少,ADD=增加 例:BTC_SUBTRACT就表示BTC减少)</td>
    </tr>


    <#list fac.checkItems as checkItem >
        <tr>
            <td>${checkItem.financeAction.value}:${checkItem.financeAction}(${checkItem.actionName})[<#if checkItem.financeAction.fccItems?size!=0 ><#list checkItem.financeAction.fccItems as fccItem >${fccItem}<#if fccItem_has_next==true>
                    ,</#if></#list><#else ><font color="#6495ed">没设置检查项目<font></#if>]
            </td>
            <td>${checkItem.itemCount}</td>
            <#if checkItem.check == true >
                <td><b style="color:green;">正常</b></td>
            <#else >
                <td><b style="color:red;">错误</b></td>
            </#if>
        </tr>
    </#list>


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
        <td colspan="2">
            <p>错误：</p>
        </td>
        <td colspan="2">
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

