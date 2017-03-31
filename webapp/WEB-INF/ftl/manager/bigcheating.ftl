<div class="main-content">
    <table class="table table-striped">
        <tr>
            <th>冥想id</th>
            <th>最后作弊时间</th>
            <th>产能</th>
            <th>uid</th>
            <th>手机</th>
            <th>用户名</th>
            <th>地址</th>
            <th>充值地址</th>
        </tr>
    <#list list as l>
        <tr>
            <td><a href="/admin/meditation/show?meditationID=${l.gmId}" target="_blank">${l.gmId}</a></td>
            <td>${l.addTime?string("yyyy-MM-dd HH:mm:ss zzzz")}</td>
            <td>${l.capacity}</td>
            <td>${l.uid}</td>
            <td>${l.telephone}</td>
            <td>${l.username}</td>
            <td>${l.address}</td>
            <td>${l.rechargeAddress}</td>
        </tr>
    </#list>
    </table>
</div>

