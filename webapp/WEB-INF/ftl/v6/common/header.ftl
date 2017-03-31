<div class="nav clearfix">
    <ul>
        <li <#if nav_page=='index'> class="active"</#if>><a href="/"><@spring.messageText "index.header.text2" "首页"/></a></li>
        <li<#if nav_page=='assets'> class="active"</#if>><a href="/deal/recharge"><@spring.messageText "index.header.text3" "资产"/></a></li>

        <li<#if nav_page=='record'> class="active"</#if>><a href="/record/mydata"><@spring.messageText "index.header.text4" "业绩"/></a></li>

        <li id="mybuy" <#if nav_page=='buy'> class="active"</#if>><a href="/deal/buy"><@spring.messageText "index.header.text5" "认购"/></a>
            <#if isNewRegister == 1>
                <div class="navigation_bar">
                    <a href="/deal/buy"><@spring.messageText "record.mydata.text7" "购买"/> Mind Package</a>
                    <a href="/deal/buy_link"><@spring.messageText "record.mydata.text7" "购买"/> Mind Link </a>
                </div>
            </#if>
        </li>
        <li<#if nav_page=='mine'> class="active"</#if>><a href="/mine/user/v2"><@spring.messageText "index.header.text6" "矿场"/></a>
        </li>

        <li id="myquery" <#if nav_page=='query'> class="active"</#if>><a id="myaquery" href="/record/meditation/my/brain/search"><@spring.messageText "index.header.text1" "脑波"/></a>
            <div  class="navigation_bar">
                    <a href="/record/meditation/my/brain/search"> <@spring.messageText "wave.query.text45" "我的脑波查询"/></a>
                    <a href="/record/meditation/global/brain/search"><@spring.messageText "wave.query.text46" "全球脑波查询"/> </a>
                    <a href="/record/meditation/deduct/brain/search"><@spring.messageText "deduct.query.text1" "脑波扣除公示"/></a>
            </div>
        </li>
        <li<#if nav_page=='user'> class="active"</#if> ><a href="/v2/user/account/info" class="user" <#if nav_page=='user'> onclick="javascript:return false" </#if> > <@spring.messageText "safety.text1" "账户"/></a></li>
        <li<#if nav_page=='open'> class="active"</#if> ><a href="/deal/mgOpen"><@spring.messageText "open.mg.text1" "公开"/></a></li>
        
        <!-- <li<#if nav_page=='notice'> class="active"</#if>><a href="/notice/"><@spring.messageText "notice.text1" "公告"/> <#if (unReadNoticeNum > 0)><i></i></#if></a></li> -->

        <li id="reports" <#if nav_page=='reports'> class="active"</#if>><a href="/reports/newses/"><@spring.messageText "reports.nav" "生态动态"/><#if (unReadNoticeNum > 0)><i></i></#if></a>
            <div class="navigation_bar">
                <a href="/reports/newses"><@spring.messageText "news.title" "最新动态"/></a>
                <a href="/reports/notices/"><@spring.messageText "notice.text1" "公告"/></a>
            </div>
        </li>
    </ul>
    <i id="ibar"></i>
</div>
