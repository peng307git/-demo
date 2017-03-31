<ul class="side-nav">
    <li<#if nav_sub_page=='assets_recharge'> class="active"</#if>>
        <a href="/deal/recharge">
            <span class="side-icon-recharge"></span>
        <@spring.messageText "asset.text4" "比特币充值"/>
        </a>
    </li>
<#if SS_USERSTATUS != "-90" && SS_USERSTATUS != "-98">
    <li<#if nav_sub_page=='assets_withdraw'> class="active"</#if>>
        <a href="/deal/withdraw/btc">
            <span class="side-icon-btc-withdraw"></span>
        <@spring.messageText "asset.text5" "比特币提现"/>
        </a>
    </li>
    <li<#if nav_sub_page=='assets_withdrawmg'> class="active"</#if>>
        <a href="/deal/withdraw/mg">
            <span class="side-icon-mg-withdraw"></span>
        <@spring.messageText "asset.text10" "MG提现"/>
        </a>
    </li>
</#if>
    <li<#if nav_sub_page=='mg_recharge'> class="active"</#if>>
        <a href="/deal/mg_recharge">
            <span class="side-icon-mg-recharge"></span>
        <@spring.messageText "mg_recharge.text0" "MG充值"/>
        </a>
    </li>
</ul>
<div class="modal mg-recharge-modal fade" id="mgRechargeModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel"><@spring.messageText "mine.text46" "温馨提示"/></h4>
            </div>
            <div class="modal-body">
                <div class="form-group text-center">
                    <@spring.messageText "asset.text13" "MG充值即将上线，敬请期待" />
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-confirm" data-dismiss="modal"><@spring.messageText "asset.text15" "确定" /></button>
            </div>
        </div>
    </div>
</div>