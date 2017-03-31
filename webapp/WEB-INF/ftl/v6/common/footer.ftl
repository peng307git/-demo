<!-- ******FOOTER****** -->
<div class="footer">
    <div class="warper clearfix">
        <div class="footer-moudle footer-links">
            <h4><@spring.messageText "index.text40" "友情链接"/></h4>
            <ul>
                <li>
                    <a href='http://www.mindgene.org/download_<@spring.messageText "index.text39" "CN"/>.html' target="_blank">Mind Bank</a>
                </li>
                <li>
                    <a href='https://www.btc123.com/' target="_blank">BTC123</a>
                </li>
            </ul>
            <div class="language">
                <span></span>
                <i class="arrow-down iconfont icon-littlearrow-right"></i>
                <ul>
                    <li class="enbar">
                            <img src="/static/v6/images/usa_bg.png">
                            <a href="${request.contextPath}?locale=en_US">English</a>
                    </li>
                    <li class="chbar">
                            <img src="/static/v6/images/china_bg.png">
                            <a href="${request.contextPath}?locale=zh_CN">中文简体</a>
                    </li>
                    <li class="hkbar">
                            <img src="/static/v6/images/hk_bg.png">
                            <a href="${request.contextPath}?locale=zh_TW">中文繁體</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="footer-moudle footer-fast">
            <h4><@spring.messageText "FastEntry" "快捷通道"/></h4>
            <ul>
                <li>
                    <a href='/deal/recharge' ><@spring.messageText "asset.text4" "比特币充值"/></a>
                </li>
                <li>
                    <a href='/deal/mg_recharge' ><@spring.messageText "mg_recharge.text0" "MG充值"/></a>
                </li>
                <li>
                    <a href='/deal/buy' > <@spring.messageText "buythen.text95" "兑换"/> MP</a>
                </li>
                <li>
                    <a href='/deal/buy_link' > <@spring.messageText "buythen.text95" "兑换"/> MindLink</a>
                </li>
                <li>
                    <a href='/mine/user/v2' ><@spring.messageText "index.header.text6" "矿场"/></a>
                </li>
            </ul>
        </div>
        <div class="footer-moudle footer-download">
            <h4><@spring.messageText "Download" "下载"/></h4>
            <ul>
                <li>
                    <a href='http://app.mindasset.com/?v=1.0.15' target="_blank">Inifite Mind Android</a>
                </li>
                <li>
                    <a href='<@spring.messageText "iTunesUrl" "iTunesUrl =  https://itunes.apple.com/hk/app/infinite-mind/id1097680754?l=zh"/>' target="_blank">Inifite Mind IOS</a>
                </li>
                <li>
                    <a href='http://www.mindgene.org/download_<@spring.messageText "index.text39" "CN"/>.html' target="_blank">Mind Bank</a>
                </li>
            </ul>
        </div>
        <div class="footer-logo">
            <i class="iconfont icon-mindassetlogo"></i>
            MINDASSET
        </div>
    </div>
    <div class="footer-copyright">Copyright © 2016 Mind Asset. All Rights Reserved</div>
</div>
<div class="modal safe-tip-modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel"><@spring.messageText "safety.text92" "安全提醒"/></h4>
            </div>
            <div class="modal-body">
                <div class="form-group text-center">
                    <div class="index-safe-tip-text">
                    </div>
                    <div class="index-safe-tip-option">
                        <label><input type="checkbox"
                                      id="safe-tip-checkbox"><@spring.messageText "safety.text93" "不再提醒"/></label>
                    </div>
                </div>
                <div class="form-group text-center">
                    <a href="/v2/user/safety/into"
                       class="btn btn-confirm"><@spring.messageText "safety.text95" "进入安全中心"/></a>
                    <button type="button" class="btn btn-confirm"><@spring.messageText "safety.text98" "不，谢谢"/></button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--//footer-->