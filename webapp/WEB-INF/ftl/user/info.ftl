<!DOCTYPE html>
<html style="height:100%">
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html class="ie8"><![endif]-->
<!--[if IE 9 ]><html class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<!--<![endif]-->
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><@spring.messageText "info.text1" "信息修改"/></title>
    <!-- css -->
    <link rel="stylesheet" type="text/css" href="/static/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/static/css/base.css?v=201608300932">
    <link rel="stylesheet" type="text/css" href="/static/css/main.css?v=201604261834">
    <!-- js -->
    <script type="text/javascript" src='/static/js/jquery-1.11.2.min.js?v=201604261834'></script>
    <script type="text/javascript" src='/static/js/bootstrap.min.js?v=201604261834'></script>
    <script type="text/javascript" src='/static/js/common.js?v=201607143213213'></script>
    <script type="text/javascript" src='/static/js/jquery.i18n.properties-1.0.9.js?v=201604261834'></script>
    <script src="/static/js/global.js" type="text/javascript"></script>
    <script type="text/javascript" src='/static/js/business/info.js?v=20160804174760'></script>
</head>
<body>
<div class="warp asset-manager">
<#include "common/header.ftl" >
    <div class="warp-container">
        <div class="container">
            <div class="manager-bar clearfix">
                <div class="text-center">
                <@spring.messageText "info.text2" "核心管理"/>            </div>
                <div class="text-center">
                <@spring.messageText "info.text3" "交易平台"/>            </div>
            </div>
            <div class="manager-container">
                <div class="left-bar">
                    <ul class="left-bar-ul">
                        <li>
                            <a href="/deal/recharge">
                                <span class="manager-icon manager-coin"></span>
                            <@spring.messageText "info.text4" "比特币充值"/>
                            </a>
                        </li>
<#if SS_USERSTATUS != "-90" && SS_USERSTATUS != "-98">
                        <li><a href="/deal/withdraw/btc" class="getcash">
                            <span class="manager-icon manager-cash"></span>
                        <@spring.messageText "info.text5" "比特币提现"/></a></li>
                        <li<#if nav_sub_page=='assets_withdrawmg'> class="active"</#if>>
                            <a href="/deal/withdraw/mg">
                                <span class="manager-icon manager-cash"></span>
                            <@spring.messageText "asset.text10" "MG提现"/>
                            </a>
                        </li>
                        <li><a href="/deal/soldmg" class="getcash">
                            <span class="manager-icon manager-cash"></span>
                        <@spring.messageText "asset.text9" "出售MG"/></a></li>
    </#if>
                        <!--<li><a href="/user/preinfo">
                            <span class="manager-icon manager-secure"></span>
                        <@spring.messageText "info.text6" "安全中心"/></a></li>
                         <li><a href="javascript:void(0)">
                        <span class="manager-icon manager-trade"></span>
                            <@spring.messageText "info.text7" "BTC交易服务推荐"/></a></li> -->
                    </ul>
                </div>
                <div class="right-bar" style='min-height:600px;padding:40px 0 26px;'>
                    <div class="manager-changeInfo-box bgwhite wrap-shadow" style="">
                        <div class="title-bg"></div>
                        <h3 class='text-center top30'><@spring.messageText "info.text8" "修改用户信息"/></h3>

                        <form action="" method="post" class="form-horizontal" id="editform">
                            <label for="input-telephone" style='padding-left:40px;position:relative; top:20px;'><@spring.messageText "info.text9" "电话："/></label>
                            <div class="input-group width420 center top20">
                                <div class="input-group-btn change-pass-flag">
                                    <div class="flag-toggle">
                                        <button type='button' class='flag-btn' data-flag='flag-menu' id='telphone-type'>
                                            <img src="https://o5uaa1ha4.qnssl.com/static/images/flags/86.gif" alt="">
                                            <span class='area-code'> + 86</span>
                                            <span class="caret"></span>
                                        </button>
                                        <ul class="flag-menu">
                                        </ul>
                                    </div>
                                    <input type="hidden" id='area-tel-hidden' name='telephone' value='${customer.telephone}'>
                                </div>
                                <input type="text" value="" placeholder="<@spring.messageText "info.text10" "手机号码"/>" id="input-telephone" class="form-control" />
                            </div>
                            <div class="input-group center width420 top20 valid-img-box" style="display:none">
                                <label for="input-captcha" class=""><@spring.messageText "info.text11" "图片验证："/></label>
                                <div class="row">

                                    <div class="col-md-7">
                                        <input type="text" class="form-control" name="captcha" placeholder="<@spring.messageText "captcha" "图片验证码"/>" id="input-captcha" />
                                    </div>
                                    <div class="col-md-5">
                                        <a href="javascript:changeImg();">
                                            <img id="captcha" src="/user/vaildatecode?ctoken=${ctoken}">
                                            <input type="hidden" id="ctoken" value="${ctoken}" />
                                        </a>
                                    </div>
                                </div>
                            </div>


                            <div class="input-group voice center width420 top20" style="display:none">
                                <label for="sendcode" class=""><@spring.messageText "info.text100" "当前短信验证："/></label><br /><input type="text" class="form-control width200 fl" name="telephonecode_old" placeholder="<@spring.messageText "sms_captcha" "手机短信验证码"/>" id="input-telephonecode_old"  />
                                <label for="sendcode" class=""><@spring.messageText "info.text101" "变更短信验证："/></label><br /><input type="text" class="form-control width200 fl" name="telephonecode_new" placeholder="<@spring.messageText "sms_captcha" "手机短信验证码"/>" id="input-telephonecode_new"  />
                                <p>&nbsp</p>
                                <input type="button" name="sendcode" id="sendcode" value="<@spring.messageText "get_smscaptcha" "获取短信验证码"/>" class="btn btn-success" />
                                <input type="hidden" id="trans_telephonecode">
                            </div>
                            <input type="hidden" id="valid-flg">
                            <div class="input-group center width420 top20">
                                <label for="input-password"><@spring.messageText "info.text13" "新密码："/></label>
                                <input type="password" name="password" placeholder="<@spring.messageText "password" "密码"/>" id="input-password" class="form-control" value=""/>
                            </div>

                            <div class="input-group center width420 top20">
                                <label for="input-con-password"><@spring.messageText "info.text14" "确认新密码："/></label>
                                <input type="password" name="con_password" placeholder="<@spring.messageText "password" "密码"/>" id="input-con-password" class="form-control" value=""/>
                            </div>

                            <div class="input-group center width420 top20">
                                <label for="input-username"><@spring.messageText "info.text15" "姓名："/></label>
                                <input type="text" class="form-control" name="username" placeholder="<@spring.messageText "info.text16" "您的姓名"/>" id="input-username" value="${customer.username}"/>
                            </div>
                            <div class="input-group center width420 top20">
                                <label for="input-nickname"><@spring.messageText "info.text17" "昵称："/></label>
                            <#if ext.nickName?length == 0>
                                <input type="text" class="form-control" name="nickname" id="input-nickname" value="${ext.nickName}"/>
                            <#else>
                                <input type="text" class="form-control" name="nickname" id="input-nickname" value="${ext.nickName}" readonly='readonly'/>
                            </#if>
                            </div>
                            <div class="input-group center width420 top20">
                                <label for="input-email">E-mail:</label>
                            <#if !ext.email?matches("^(\\w)+(\\.\\w+)*@(\\w)+((\\.\\w+)+)$")>
                                <input type="text" class="form-control" name="email" id="input-email" value="${ext.email}"/>
                            <#else>
                                <input type="text" class="form-control" name="email" id="input-email" value="${ext.email}" readonly='readonly'/>
                            </#if>
                            </div>
                            <div class="input-group center width420 top20">

                                <label ><@spring.messageText "gender" "性别"/>:</label>
                                <br>

                            <#if customer.sex == 0 >
                                <label class="radio-inline">
                                    <input type="radio" name="sex" value="0" checked /><@spring.messageText "male" "男"/>                                  </label>
                                <label class="radio-inline">
                                    <input type="radio" name="sex" value="1" /><@spring.messageText "female" "女"/>                                  </label>

                            <#else>
                                <label class="radio-inline">
                                    <input type="radio" name="sex" value="0"  /><@spring.messageText "male" "男"/>                                  </label>
                                <label class="radio-inline">
                                    <input type="radio" name="sex" value="1" checked /><@spring.messageText "female" "女"/>                                  </label>
                            </#if>
                            </div>
                            <div class="input-group center width420 top20">
                                <label for="input-address"><@spring.messageText "goods_address" "收货地址"/>:</label>
                                <input type="text" name="address"  placeholder="<@spring.messageText "goods_address" "收货地址"/>" id="input-address" class="form-control" value="${customer.address}"/>
                            </div>
                            <input type="hidden" name="recharge_address" value="${customer.rechargeAddress}">
                            <input type="hidden" name="total" value="${customer.total}">
                            <input type="hidden" name="add_time" value="">
                            <input type="hidden" name="invitation_code" value="${customer.invitationCode}">
                            <input type="hidden" id="old_telephone" name="old_telephone" value="${customer.telephone}">
                            <input type="hidden" id="uid" name="uid" value="${customer.id}">

                            <input type="hidden" id="alert_text1" name="alert_text1" value="<@spring.messageText "user.info.ftl.alerttext1" "对不起，两次输入的密码不一致"/>">
                            <input type="hidden" id="alert_text2" name="alert_text2" value="<@spring.messageText "user.telephone.not.null" "请输入手机号"/>">

                            <div>
                                <div class="text-center top40">
                                    <button type="button" class="btn-default-black right30" id='changeBtn'><@spring.messageText "modify" "修改"/></button>
                                    <button type="button" class="btn-default-black" onclick="javascript:history.back()"><@spring.messageText "cancel" "取消"/></button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
<#include "/decorators/footer.ftl" >
</div>
</body>
</html>
