<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
</head>
<body>
<!-- CSS goes in the document HEAD or added to your external stylesheet -->
<style type="text/css">

    table.gridtable {
        font-family: verdana,arial,sans-serif;
        font-size:12px;
        color:#333333;
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
<!-- Table goes in the document BODY -->
<table class="gridtable">
    <#--<tr>-->
        <#--<td colspan="2" ><b style="font-size:15px;">${exceptionTitle}</b></td>-->
    <#--</tr>-->
    <tr>
        <td width="75px;">HostName</td><td>${hostname}</td>
    </tr>
    <tr>
        <td>IP</td><td>${realIp}</td>
    </tr>
    <tr>
        <td>UserID</td><td>${userId}</td>
    </tr>
    <tr>
        <td>UserName</td><td>${userName}</td>
    </tr>
    <tr>
        <td>Mobile</td><td>${mobile}</td>
    </tr>
    <tr>
        <td>URL</td><td>${url}</td>
    </tr>
    <tr>
        <td  colspan="2">
            <p>${exceptionContent}</p>
        </td>
    </tr>
</table>
</body>
</html>