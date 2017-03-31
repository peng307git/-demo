<ul class="side-nav">

	<li<#if nav_sub_page=='user_info' > class="active"</#if>>
        <a href="/v2/user/account/info">
            <span class="side-icon-mydata-png"></span>
        <@spring.messageText "account.info.text30" "基本信息"/>
        <span></span>
        </a>
    </li>
    <li<#if nav_sub_page=='user_safety'> class="active"</#if>>
        <a href="/v2/user/safety/into">
            <span class="side-icon-safe"></span>
		<@spring.messageText "asset.text6" "安全中心"/>
        <span></span>
        </a>
    </li>
    <li<#if nav_sub_page=='user_myorder'> class="active"</#if>>
        <a href="/v2/user/safety/myorder">
            <span class="side-icon-order"></span>
        <@spring.messageText "myorder.text1" "我的订单"/>
        <span></span>
        </a>
    </li>
    <li<#if nav_sub_page=='user_mps'> class="active"</#if>>
        <a href="/mps/user/info">
            <span class="side-icon-mps"></span>
                <@spring.messageText "mps.text57" "我的MPS"/>
            <span></span>
        </a>
    </li>
    <!-- <li<#if nav_sub_page=='record_myreco'> class="active"</#if>>
        <a href="/record/myreco">
            <span class="side-icon-myrecord-png"></span>
		<@spring.messageText "record.text5" "推广分配"/>
        </a>
    </li> -->
</ul>
