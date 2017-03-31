<!DOCTYPE html>
<html style="height:100%">
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<b>Notice</b>: Undefined variable: direction in <b>D:\wamp\phpweb\upload\catalog\view\theme\default\template\account\registertest.tpl</b> on line <b>4</b>" lang="<b>Notice</b>: Undefined variable: lang in <b>D:\wamp\phpweb\upload\catalog\view\theme\default\template\account\registertest.tpl</b> on line <b>4</b>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<b>Notice</b>: Undefined variable: direction in <b>D:\wamp\phpweb\upload\catalog\view\theme\default\template\account\registertest.tpl</b> on line <b>5</b>" lang="<b>Notice</b>: Undefined variable: lang in <b>D:\wamp\phpweb\upload\catalog\view\theme\default\template\account\registertest.tpl</b> on line <b>5</b>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>修改密码</title>
 <!-- css -->
    <link rel="stylesheet" type="text/css" href="https://o5uaa1ha4.qnssl.com/static/css/bootstrap.min.css?v=201604261834">
    <link rel="stylesheet" type="text/css" href="https://o5uaa1ha4.qnssl.com/static/css/base.css?v=201604261834">
    <link rel="stylesheet" type="text/css" href="https://o5uaa1ha4.qnssl.com/static/css/main.css?v=201604261834">
 <!-- js -->
    <script type="text/javascript" src='https://o5uaa1ha4.qnssl.com/static/js/jquery-1.11.2.min.js?v=201604261834'></script>
    <script type="text/javascript" src='https://o5uaa1ha4.qnssl.com/static/js/bootstrap.min.js?v=201604261834'></script>
    <script type="text/javascript" src='https://o5uaa1ha4.qnssl.com/static/js/common.js?v=201607143213213'></script>
    <script src="/static/js/global.js" type="text/javascript"></script>
    <script type="text/javascript" src='https://o5uaa1ha4.qnssl.com/static/js/jquery.i18n.properties-1.0.9.js?v=201604261834'></script>
    <script type="text/javascript" src='/static/js/business/forget.js?v=20160804181613'></script>
</head>
<body>

<header>
  <div class="container">
  </div>
</header>
 <div class="warp">
    <div class="warp-container">
      <div class="login-bg"></div>
      <div class="login-header">
        <div class="login-banner"></div>
        <a href='/' class="login-logo"></a>
      </div>
      <div class="res_bg text-center">     
          <h3 class="login">
                 <a href="/" class="back-home"></a>
                 <span>></span>
              修改密码          </h3>
            <div class="login_box">
                <div class="login_box_content">
                  <div class="text-center margin20">
                   <div class="center text-left">
                    <!-- 修改买吗-->
                       <form action="" method="post" class="" id="forgottenform">
                                       
                                      <div class="input-group input-group-lg" style="z-index:15">
                                          <!-- <label for="exampleInputEmail1">电话<span style="color:red">(*)</span></label> -->
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
                                           <input type="text"  value="" placeholder="手机号码" id="input-telephone" class="form-control" />
                                      </div>
                                      <div class="row">
                                        <div class="col-md-8">
                                           <div class="input-group input-group-lg top30">
                                              <span class="input-group-addon">
                                                <i class="valicode"></i>
                                              </span>
                                              <input type="text" class="form-control" name="captcha" placeholder="图片验证码" id="input-captcha" />
                                           </div>
                                        </div>
                                         <div class="col-md-4 top30">
                                            <a href="javascript:changeImg();">
                                                <img id="captcha" src="/user/vaildatecode?ctoken=${ctoken}">
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
                                                 <input type="text" class="form-control width200 fl" name="telephonecode" placeholder="手机短信验证码" id="input-telephonecode"  />
                                                 </div>
                                             </div>
                                                                                          <div class="col-md-4">
                                                 <input type="button" name="sendcode" id="sendcode" value="获取短信验证码" class="btn btn-lg btn-success" />
                                             </div>
                                         
                                          <input type="hidden" id="trans_telephonecode">
                                      </div>
                                      <div class="input-group input-group-lg top30">
                                          <span class="input-group-addon">
                                           <i class="diyIcon images-key"></i>
                                          </span>
                                                                                    <input type="password" name="password" placeholder="新密码" id="password" class="form-control" />
                                      </div>

                                       <div class="input-group input-group-lg top30">
                                          <span class="input-group-addon">
                                           <i class="diyIcon images-key"></i>
                                          </span>
                                                                                    <input type="password" name="passwordconfirm" placeholder="确认密码" id="passwordconfirm" class="form-control" />
                                      </div>
                                      
                                      <div class="form-group text-center top50">
                                        <button type="button" class="btn-default-blue right30" id='changeBtn'/>确定</button>
                                         <button type="button" class="btn-default-black" onclick="javascript:history.back()">取消</button>
                                      </div>
                              
                       </form>
                    <!-- 修改密码 -->
                   </div>
                  </div>
              </div>
            </div>
      </div>
    </div>

    <#include "/decorators/footer.ftl" >
</div>
</body>
</html>
