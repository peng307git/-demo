<ul class="side-nav">
    <li<#if nav_sub_page=='record_mydata'> class="active"</#if>>
        <a href="/record/mydata">
            <span class="side-icon-mydata-png"></span>
		<@spring.messageText "record.text4" "我的数据"/>
        </a>
    </li>
    <li<#if nav_sub_page=='record_myreco'> class="active"</#if>>
        <a href="/record/myreco">
            <span class="side-icon-myrecord-png"></span>
		<@spring.messageText "record.text5" "推广分配"/>
        </a>
    </li>
</ul>
