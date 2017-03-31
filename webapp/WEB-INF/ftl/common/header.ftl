<div class="topbar">
    <div class="topbar-inner clearfix">
        <div class="topbar-app">
        <@spring.messageText "topbar.download" "app 下载"/>
            <span class="icon-androidor">
                <div class="pop-download-android">
                    <h5><@spring.messageText "topbar.android_download" "安卓 APP下载"/></h5>
                    <p><img src="/static/images/down_android.png?v=1.0.5" /></p>
                    <!-- <p><a target="_blank" href="<@spring.messageText "recharge.opta_note" "/static/landing_zh_TW.html"/>"><@spring.messageText "recharge.opta_note_text" "點擊查看APP操作說明"/></a></p> -->
                </div>
            </span>
            <span class="icon-iosor">
                <div class="pop-download-ios">
                    <h5><@spring.messageText "topbar.ios_download" "IOS APP下载"/></h5>
                    <p><img src="/static/images/down_ios.png?v=1.0.5" /></p>
                    <!-- <p><a target="_blank" href="<@spring.messageText "recharge.opta_note" "/static/landing_zh_TW.html"/>"><@spring.messageText "recharge.opta_note_text" "點擊查看APP操作說明"/></a></p> -->
                </div>
            </span>
            <span class="icon-wechator">
                <div class="pop-wechat">
                    <h5><@spring.messageText "topbar.wechat" "Mindasset官方微信"/></h5>
                    <p><img src="/static/images/qr-wechat.jpg" /></p>
                    <p><@spring.messageText "topbar.scan_wechat" "扫码关注官方微信"/></p>
                </div>
            </span>
        </div>
        <div class="topbar-price">
            <span class="pdr30"><@spring.messageText "topbar.text2" "最新BTC价格"/> </span>
            <span class='new-price pdr30'></span>
            <span class="pdr30"><@spring.messageText "topbar.mg_price" "最新MG价格"/> </span>
            <span class='new-mg-price pdr30'></span>
        </div>
        <div class="topbar-user">
        <!-- <@spring.messageText "topbar.username" "用户名" />:${SS_USERNAME} -->
            <#if SS_TELEPHONE ?exists>
                ${SS_TELEPHONE}
            <#else>
                ${SS_USERNAME}
            </#if>
            <span class="arrow"></span>
            <div class="topbar-user-detail topbar-user-detail-padnone">
                <div class="topbar-user-detail-available clearfix">
                	    <div class="topbar-user-detail-top">
                	    	    <div class="topbar-user-detail-title">
	                        <span><@spring.messageText "topbar.balance" "可用" /></span>
	                    </div>
	                    <div class="topbar-user-detail-content">
	                        <p>฿ <span class="btc-change"></span>&nbsp;&nbsp;&nbsp;&nbsp; ≈ &nbsp;&nbsp;&nbsp;&nbsp;$<span class="dollar-change"></span></p>
	                        <p>MN:<span class="mn-change"></span> MG:<span class="mg-change"></span></p>
	                    </div>
                	    </div>
                    <div class="topbar-user-detail-bot">
                    	     <div class="topbar-user-detail-deducted">
                    	     	  <div class="topbar-user-detail-title"> 
		                           <span><@spring.messageText "deduct.query.text6" "已扣除" /></span>
		                      </div>
		                      <div class="topbar-user-detail-content2">
			                        <p>MG:<span class="mn-cheated"></span></p>
			                        <div class="opt-tips">
			                        	   ?
			                        	   <div class="opt-tips-modal">
			                        	       <em class="opt-tips-modal-icon"></em>
			                        	   	   <p><@spring.messageText "record.mydata.text28" "说明："/></p>
			                        	   	   <p><@spring.messageText "deduct.query.text27" "已扣除的MG是由于脑波作弊而对该脑波产生的MG收益的扣除数量。" /></p>
			                        	   </div>
			                        </div>
			                  </div>
                    	     </div> 
                    	      <div class="topbar-user-detail-deducted">
                    	     	  <div class="topbar-user-detail-title"> 
		                           <span><@spring.messageText "deduct.query.text15" "冻结中" /></span>
		                      </div>
		                      <div class="topbar-user-detail-content2">
			                        <p>MG:<span class="mn-deducted"></span></p>
			                        <div class="opt-tips">
			                        	   ?
			                        	   <div class="opt-tips-modal">
			                        	       <em class="opt-tips-modal-icon"></em>
			                        	   	   <p><@spring.messageText "record.mydata.text28" "说明："/></p>
			                        	   	   <p><@spring.messageText "deduct.query.text33" "冻结中的MG包含根据MPS的拥有量分配的MG每日收益（Lock Time结束之后即可解冻），以及15分钟体验券认证的MG(获得智慧包之后即可解冻)。" /></p>
			                        	   </div>
			                        </div>
			                  </div>
                    	     </div> 
                    </div>
                </div>
                <div class="topbar-user-frozen">
                    <div class="topbar-user-frozen-tip">
                    <@spring.messageText "topbar.frozenmg9" "不可用" />
                    </div>
                    <div class="topbar-user-frozen-info clearfix">
                        <div class="topbar-user-frozen-info-title"><@spring.messageText "topbar.frozenmg1" "恢复正常条件：" /></div>
                        <div class="topbar-user-frozen-info-content"><@spring.messageText "topbar.frozenmg2" "当以下MN、MG为0时，即可解除不可用状态。" />
                        </div>
                    </div>
                    <div class="topbar-user-frozen-amount">
                        MN:<em id="frozen-mn-amount">0</em> MG:<em id="frozen-mg-amount">0</em><span></span>
                    </div>
                </div>
            </div>
        </div>
        <div class="topbar-logout">
            <a href="/user/logout"><@spring.messageText "logout" "退出"/></a>
        </div>
        <div class="topbar-language">
        <@spring.messageText "language" "语言"/>
            <span class="arrow"></span>
            <div class="topbar-lang-detail">
                <p><a href="${request.contextPath}?locale=en_US" >English</a></p>
                <p><a href="${request.contextPath}?locale=zh_CN" >中文简体</a></p>
                <p><a href="${request.contextPath}?locale=zh_TW" >中文繁體</a></p>
            </div>
        </div>
    </div>
</div>
<div class="header">
    <div class="header-inner clearfix">
        <div class="logo">
            <a href="/"><i class="icon iconfont icon-mindassetlogo"></i>MINDASSET</a>
        </div>
        <div class="nav clearfix">
            <ul>
                <li><a href="/"><@spring.messageText "index.header.text2" "首页"/></a></li>
                <li<#if nav_page=='assets'> class="active"</#if>><a href="/deal/recharge"><@spring.messageText "index.header.text3" "资产"/></a></li>

                <li<#if nav_page=='record'> class="active"</#if>><a href="/record/mydata"><@spring.messageText "index.header.text4" "业绩"/></a></li>

                <!-- <li<#if nav_page=='buy'> class="active"</#if>><a href="/deal/buy"><@spring.messageText "index.header.text5" "认购"/></a></li> -->
                <li id="mybuy" <#if nav_page=='buy'> class="active"</#if>><a id="myabuy" href="/deal/buy"><@spring.messageText "index.header.text5" "认购"/></a></li>
            <#if isNewRegister == 1>
                <div id="buy_li" class="navigation_bar">
                    <ul>
                        <li id="buy_btn"><@spring.messageText "record.mydata.text7" "购买"/> Mind Package</li>
                        <li id="buy_link_btn"><@spring.messageText "record.mydata.text7" "购买"/> MindLink </li>
                    </ul>
                </div>
            </#if>

                <!-- <li<#if nav_page=='mine'> class="active"</#if>><a href="/mine/user/v2"><@spring.messageText "mind_mine" "智慧矿场"/></a></li> -->
                <li<#if nav_page=='mine'> class="active"</#if>><a href="/mine/user/v2"><@spring.messageText "index.header.text6" "矿场"/></a></li>

                <li id="myquery" <#if nav_page=='query'> class="active"</#if>><a id="myaquery" href="/record/meditation/my/brain/search"><@spring.messageText "index.header.text1" "脑波"/></a></li>

                <div id="query_li" class="navigation_bar">
                    <ul>
                        <li id="myquery_btn"> <@spring.messageText "wave.query.text45" "我的脑波查询"/></li>
                        <li id="query_btn"><@spring.messageText "wave.query.text46" "全球脑波查询"/> </li>
                        <li id="deduct_btn"><@spring.messageText "deduct.query.text1" "脑波扣除公示"/></li>
                        <!-- <li ><a href="/record/meditation/my/brain/search">我的脑波</a></li>
                        <li ><a href="/record/meditation/global/brain/search">全球脑波</a></li> -->
                    </ul>
                </div>
                <li<#if nav_page=='user'> class="active"</#if> ><a href="/v2/user/account/info" class="user" <#if nav_page=='user'> onclick="javascript:return false" </#if> > <@spring.messageText "safety.text1" "账户"/></a></li>
                <li<#if nav_page=='open'> class="active"</#if>><a href="/deal/mgOpen"><@spring.messageText "open.mg.text1" "公开"/></a></li>
                <!-- <li<#if nav_page=='notice'> class="active"</#if>><a href="/notice/"><@spring.messageText "notice.text1" "公告"/> <#if (unReadNoticeNum > 0)><i></i></#if></a></li> -->
                <li id="reports" <#if nav_page=='notice'> class="active"</#if>><a id="reports_a" href="/reports/newses/"><@spring.messageText "reports.nav" "生态动态"/><#if (unReadNoticeNum > 0)><i></i></#if></a></li>
                    <div id="reports_li" class="navigation_bar">
                        <ul>
                            <li id="reports_news"><@spring.messageText "news.title" "最新动态"/></li>
                            <li id="reports_notice"><@spring.messageText "notice.text1" "公告"/></li>
                        </ul>
                    </div>
            </ul>
        </div>
    </div>
</div>
<div class="modal frozen-tip-modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel"><@spring.messageText "topbar.frozenmg3" "温馨提示" /></h4>
            </div>
            <div class="modal-body">
                <p><@spring.messageText "topbar.frozenmg4" "智慧资产用户您好:" /></p>
                <p><@spring.messageText "topbar.frozenmg5" "1、由于您的违规操作行为，系统已将您账户中的MN数量进行重置，请您重新认证。" /></p>
                <p><@spring.messageText "topbar.frozenmg6" "2、重新认证期间您的资产将显示不可用状态，账号信息下方显示内容为回滚MN数量及需要您重新认证的MG数量。" /></p>
                <p><@spring.messageText "topbar.frozenmg7" "3、重新认证的MG数量回滚至正数后，您账户内MG将可以进行提现、出售等操作。" /></p>
                <div class="form-group text-center">
                    <button type="button" class="btn btn-confirm"><@spring.messageText "topbar.frozenmg8" "确定" /></button>
                </div>
            </div>
        </div>
    </div>
</div>
