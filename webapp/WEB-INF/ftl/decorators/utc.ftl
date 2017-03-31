<#if SS_USERNAME?exists >
<div class="app-pop">
    <a class="app-pop-nav" href="javascript:void(0)">
        <em><@spring.messageText "pop.utc.text0" "扫码下载"/></em>
        <i></i>
        <div class="app-pop-box app-pop-tip">
            <b class="apper android  active"><strong>&nbsp;</strong>Android</b><b class="apper ios"><strong>
            &nbsp;</strong>IOS</b>
            <img src='/static/images/APPDownloadAndroid.png'>
            <img src='/static/images/APPDownloadIOS.png' style="display:none">
            <div><@spring.messageText "pop.utc.text1" "扫码下载"/><br/>Infinite Mind APP</div>
            <p><span><@spring.messageText "recharge.opta_mindlink_text" "Mind Link使用说明"/></span></p>
            <!-- <p><a target="_blank" href="<@spring.messageText "recharge.opta_note" "/static/landing_zh_TW.html"/>"><@spring.messageText "recharge.opta_note_text" "點擊查看APP操作說明"/></a></p> -->
        </div>
    </a>
    <a class="app-pop-nav " href="javascript:void(0)">
        <em><@spring.messageText "pop.utc.text2" "当前时区"/></em>
        <i></i>
        <div class="app-pop-box app-pop-time">
            <div>
                <@spring.messageText "pop.utc.text3" "当前时间"/>：
                <b id="time-now"></b>
                <span><@spring.messageText "pop.utc.text4" "格林尼治时间"/><br/> <strong id="time-UTC"></strong></span>
            </div>
            <div>
                <@spring.messageText "pop.utc.text2" "当前时区"/>：
                <b id="UTC"></b>
                <span id="UTC-add"></span>
                <input type="hidden" id="inputUTC" value="">
                <input type="hidden" id="userUtcNumber" value="">
            </div>
            <button id="changeUTC">
                <@spring.messageText "pop.utc.text5" "更换时区"/>
            </button>
        </div>
    </a>
</div>
</#if>