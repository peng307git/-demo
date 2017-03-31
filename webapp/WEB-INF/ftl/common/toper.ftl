<div class="toper">
    <div class="warper clearfix">
        <div class="topbar-price">
            <span class=""><@spring.messageText "index.new.text1" "最新"/> BTC <@spring.messageText "index.new.text2" "价格"/> : </span>
            <span class='new-btc-price'></span><i>|</i>
            <span class=""><@spring.messageText "index.new.text1" "最新"/> MG <@spring.messageText "index.new.text2" "价格"/> : </span>
            <span class='new-mg-price'></span>
        </div>
        <div class="topbar-logout">
            <a href="/user/logout"><@spring.messageText "logout" "退出"/></a>
        </div>
        <div class="topbar-user">
            <i class="iconfont icon-headphoto"></i>
            <em><#if SS_USERNAME?exists>
                ${SS_USERNAME}
            <#else>
                ${SS_TELEPHONE}
            </#if>
            </em>
            <span class="arrow"><i class="iconfont icon-littlearrow-right"></i></span>
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
    </div>
</div>
