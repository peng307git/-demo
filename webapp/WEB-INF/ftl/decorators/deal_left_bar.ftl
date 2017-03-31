<ul class="left-bar-ul">
    <li<#if deal_page_index==0> class="active"</#if>>
        <a href="/deal/recharge">
            <span class="manager-icon manager-coin"></span>
        <@spring.messageText "asset.text4" "比特币充值"/>
        </a>
    </li>
<#if SS_USERSTATUS != "-90" && SS_USERSTATUS != "-98">
    <li<#if deal_page_index==1> class="active"</#if>><a href="/deal/withdraw/btc" class="getcash">
        <span class="manager-icon manager-cash"></span>
    <@spring.messageText "asset.text5" "比特币提现"/></a></li>
    <li<#if nav_sub_page=='assets_withdrawmg'> class="active"</#if>>
        <a href="/deal/withdraw/mg">
            <span class="manager-icon manager-cash"></span>
        <@spring.messageText "asset.text10" "MG提现"/>
        </a>
    </li>
    <li<#if deal_page_index==2> class="active"</#if>><a href="/deal/soldmg">
        <span class="manager-icon manager-trade"></span>
    <@spring.messageText "asset.text9" "出售MG"/></a>
    </li>
</#if>

    <!--<li<#if deal_page_index==3> class="active"</#if>><a href="/user/preinfo">
        <span class="manager-icon manager-secure"></span>
    <@spring.messageText "asset.text6" "安全中心"/></a></li>
    <li><a href="javascript:void(0)">
        <span class="manager-icon manager-trade"></span>
     	<@spring.messageText "info.text7" "BTC交易服务推荐"/></a>
    </li> -->
</ul>
${req}