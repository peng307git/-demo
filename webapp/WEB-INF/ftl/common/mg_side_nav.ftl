<ul class="side-nav">
    <li<#if nav_sub_page=='open_mg'> class="active"</#if>>
        <a href="/deal/mgOpen" style="text-align: center">
        <@spring.messageText "open.mg.text28" "账目总览"/>
        </a>
    </li>
    <li<#if nav_sub_page=='open_wisdom'> class="active"</#if>>
        <a href="/deal/wisdomOpen" style="text-align: center">
        <@spring.messageText "open.mg.text29" "智慧资产资金会账目"/>
         </a>
    </li>
    <li<#if nav_sub_page=='open_mind'> class="active"</#if>>
        <a href="/deal/mindOpen" style="text-align: center">
       <@spring.messageText "open.mg.text3" "其他持有者账目公开"/>
         </a>
    </li>
</ul>
