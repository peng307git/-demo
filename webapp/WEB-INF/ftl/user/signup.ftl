<!DOCTYPE html>
<html style="height:100%">
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="" lang="" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="" lang="" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<#assign base=request.contextPath />

<title><@spring.messageText "register" "注册"/></title>
 <!-- css -->
    <link rel="stylesheet" type="text/css" href="https://o5uaa1ha4.qnssl.com/static/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://o5uaa1ha4.qnssl.com/static/css/base.css?v=20160422020">
    <link rel="stylesheet" type="text/css" href="https://o5uaa1ha4.qnssl.com/static/css/main.css?v=20160422020">
 <!-- js -->
    <script type="text/javascript" src='https://o5uaa1ha4.qnssl.com/static/js/jquery-1.11.2.min.js?v=201604261834'></script>
    <script type="text/javascript" src='https://o5uaa1ha4.qnssl.com/static/js/bootstrap.min.js?v=201604261834'></script>
    <script type="text/javascript" src='https://o5uaa1ha4.qnssl.com/static/js/common.js?v=201607143213213'></script>
    <script type="text/javascript" src='https://o5uaa1ha4.qnssl.com/static/js/jquery.i18n.properties-1.0.9.js?v=201604261834'></script>
    <script src="/static/js/global.js?v=20160804181840" type="text/javascript"></script>
    <script type="text/javascript" src='/static/js/business/signup.js?v=20160804181613'></script>
<style>
	.tel-tip{
		position: absolute;
	    width: 200px;
	    color: red;
	    height: 46px;
	    line-height: 46px;
	    padding-left: 10px;
	    font-size: 16px;
	    font-weight: 700;
	}
</style>
</head>
<body>

<div class="warp">
  <div class="warp-container">
       <div class="login-bg"></div>
       <div class="login-header">
         <div class="login-banner"></div>
         <a href="/" class="login-logo"></a>
       </div>
        <div class="res_bg text-center">
             <!--  <br />
              <br /> -->
             
               <h3 class="login">
                     <a href="/" class="back-home"></a>
                     <span>></span>
                    <@spring.messageText "register" "注册"/>
               </h3>
                <div class="res_box">

                  <div class="res_box_content">
                      <div class="text-center margin20 ">
                        <form action="" method="post" id="registerform">
                          <div class="center text-left">
                              <div class="hidebox1">
                                  <div class="input-group input-group-lg" style="z-index:15">
                                      <span class="input-group-addon">
                                        <i class="diyIcon images-phone"></i>
                                      </span>
                                                                             <div class="input-group-btn posrel">
                                            <div class="flag-toggle">
                                               <button type='button' class='flag-btn' data-flag='flag-menu' id='telphone-type'>
                                                   <img src="https://o5uaa1ha4.qnssl.com/static/images/flags/86.gif" alt="">
                                                   <span class='area-code'> + 86</span>
                                                   <span class="caret"></span>
                                               </button>
                                               <ul class="flag-menu">
                                               </ul>
                                            </div>
                                            <input type="hidden" id='area-tel-hidden' name='telephone'>
                                      </div>
                                      <input type="text"  value="" placeholder="<@spring.messageText "mobile" "手机号码"/>" id="input-telephone" class="form-control" />
                                      <span id="tel-tip" class="tel-tip"></span>
                                  </div>
                                  <div class="input-group input-group-lg top30">
                                      <span class="input-group-addon">
                                       <i class="diyIcon images-key"></i>
                                      </span>
                                     
                                                                              <input type="password" name="password" placeholder="<@spring.messageText "password" "密码"/>" id="input-password" class="form-control" />
                                  </div>
                                  <div class="input-group input-group-lg top30">
                                      <span class="input-group-addon">
                                       <i class="diyIcon images-key"></i>
                                      </span>
                                     
                                                                             <input type="password" name="password" placeholder="<@spring.messageText "confirm_password" "再次输入密码"/>" id="passAgain" class="form-control" />
                                  </div>
                                  <div class="input-group input-group-lg top30">
                                      <span class="input-group-addon">
                                        <i class="diyIcon images-avint"></i>
                                      </span>
                                                                             <input type="text" class="form-control" id="invitation_code" name="invitationcode" value="${invitationcode}" placeholder="<@spring.messageText "invite_code" "邀请码"/>" />
                                  </div>
                                  <div class="row">
                                    <div class="col-md-8">
                                       <div class="input-group input-group-lg  top30">
                                          <span class="input-group-addon">
                                            <i class="valicode"></i>
                                          </span>
                                          <input type="text" class="form-control" name="captcha" placeholder="<@spring.messageText "captcha" "图片验证码"/>" id="input-captcha" />
                                       </div>
                                    </div>
                                     <div class="col-md-4 top30">
                                        <a href="javascript:changeImg();">
                                            <img id="captcha"  src="/user/vaildatecode?ctoken=${ctoken}">
                                            <input type="hidden" id="ctoken" value="${ctoken}" />
                                       </a>
                                     </div>
                                  </div>
                                  <div class="row top30">
                                         <div class="col-md-8">
                                            <div class="input-group input-group-lg">
                                               <span class="input-group-addon">
                                                 <i class="diyIcon images-voice"></i>
                                               </span>
                                             <input type="text" class="form-control width200 fl" name="telephonecode" placeholder="<@spring.messageText "sms_captcha" "手机短信验证码"/>" id="input-telephonecode"  />
                                             </div>
                                         </div>
                                                                                   <div class="col-md-4">
                                            <input type="button" name="sendcode" id="sendcode" value="<@spring.messageText "getsmscaptcha" "获取短信验证码"/>" class="btn btn-lg btn-success"/>
                                         </div>
                                     
                                      <input type="hidden" id="trans_telephonecode">
                                  </div>
                                  <div>
                               <div class="top45 text-center">
                                 <buton type="button" class="btn-default-blue" id="nextBtn"/><@spring.messageText "next" "下一步"/></button>
                               </div>
                                  </div>
                              </div>
                              <div class="hidebox2">
                                 <div class="input-group input-group-lg top30">
                                            <span class="input-group-addon">
                                              <i class="diyIcon images-name"></i>
                                            </span>
                                                                                 <input type="text" class="form-control" name="username" value="" placeholder="<@spring.messageText "name" "姓名"/>" id="input-username" />
                                           
                                 </div>
                                 <div class="input-group input-group-lg top30">
                                            <span class="input-group-addon">
                                              <i class="diyIcon images-name"></i>
                                            </span>
                                                                                 <input type="text" class="form-control" name="nickname" value="" placeholder="昵称" id="input-nickname" />
                                           
                                 </div>
                                 <div class="input-group input-group-lg top30">
                                            <span class="input-group-addon">
                                              <i class="diyIcon images-name"></i>
                                            </span>
                                                                                 <input type="text" class="form-control" name="email" value="" placeholder="邮箱" id="input-email" />
                                           
                                 </div>
                                  <div class="top30 clearfix"> 
                                      <div class="input-group input-group-lg" style="width:26%; float:left">
                                              <span class="input-group-addon">
                                                 <i class="diyIcon images-gander"></i>
                                                </span>
                                                <input type="text" class="form-control sex-text" placeholder='<@spring.messageText "male" "男"/>' style="border-radius:0;" disabled>
                                      </div>
                                       <div style='width:37%;float:left;' class='text-center sex-box sex-box1 sex-box-active'>
                                          <i class="diyIcon sex-male" ></i>
                                       </div>
                                       <div style='width:37%;float:left;' class='text-center sex-box  sex-box2' >
                                          <i class="diyIcon sex-female"></i>
                                       </div>
                                       <input type="hidden" name="sex" class='sex-hidden' value="1"/>
                                  </div>
                                  <div class="input-group input-group-lg top30">
                                     <span class="input-group-addon">
                                        <i class="diyIcon images-address"></i>
                                      </span>
                                                                             <input type="text" name="address" value="" placeholder="<@spring.messageText "goods_address" "收货地址"/>" id="input-address" class="form-control" />
                                  </div>
                                   <div>
                                  <div class="form-group text-center top50">
                                    <button type="button" class="btn-default-blue right30" id='preBtn'/><@spring.messageText "previous" "上一步"/></button>
                                      <button type="button" class="btn-default-black" id="signupBtn"><@spring.messageText "register" "注册"/></button>
                                      </div>
                                  </div>
                              </div> <!--hidebox2 end -->
                          </div>
                          <input id="canMobileUse" value="1" type="hidden" />
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
