<div class="navbar navbar-inverse wrap-shadow visible-nav" role='navigation'>
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#navbar-collapse-btn" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
            </button>
            <a class="navbar-brand" href="/">
                <img alt="Brand" src="https://o5uaa1ha4.qnssl.com/static/images/logo.png">
            </a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="navbar-collapse-btn">
            <ul class="nav navbar-nav navbar-right">

                <li><a href="/"><@spring.messageText "index" "网站首页"/></a></li>
                <li data-page="assets"><a href="/deal/recharge"><@spring.messageText "asset" "资产管理"/></a></li>
                <li data-page="track "><a href="/record/mydata"><@spring.messageText "record" "业绩总览"/></a></li>
                <li data-page='buy'><a href="/deal/buy"><@spring.messageText "buy_cender" "认购中心"/></a></li>
                <li data-page='mine'><a href="/mine/user/v2"><@spring.messageText "mind_mine" "智慧矿场"/></a></li>
                <li data-page='notice'><a href="/notice/"><@spring.messageText "notice.text1" "公告"/> <#if (unReadNoticeNum > 0)><i></i></#if></a></li>
                <li><a href="/user/logout"><@spring.messageText "logout" "退出"/></a></li>

            </ul>
        </div><!-- /.navbar-collapse -->
    </div>
</div>

