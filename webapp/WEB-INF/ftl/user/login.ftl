<!DOCTYPE html>
<html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="" lang="" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="" lang="" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><@spring.messageText "login" "登录"/></title>
 <!-- css -->
    <link rel="stylesheet" type="text/css" href="https://o5uaa1ha4.qnssl.com/static/css/bootstrap.min.css?v=201604261834">
    <link rel="stylesheet" type="text/css" href="https://o5uaa1ha4.qnssl.com/static/css/base.css?v=201608300932">
    <link rel="stylesheet" type="text/css" href="https://o5uaa1ha4.qnssl.com/static/css/main.css?v=201604220202">
 <!-- js -->
    <script type="text/javascript" src='https://o5uaa1ha4.qnssl.com/static/js/jquery-1.11.2.min.js?v=201604261834'></script>
    <script type="text/javascript" src='https://o5uaa1ha4.qnssl.com/static/js/bootstrap.min.js?v=201604261834'></script>
    <script type="text/javascript" src='https://o5uaa1ha4.qnssl.com/static/js/common.js?v=201607143213213'></script>
    <script type="text/javascript" src='https://o5uaa1ha4.qnssl.com/static/js/jquery.i18n.properties-1.0.9.js?v=201604261834'></script>
	<script src="https://o5uaa1ha4.qnssl.com/static/js/global.js?v=201604261834" type="text/javascript"></script>
	<script type="text/javascript" src='/static/js/business/login.js?v=20160801161515'></script>
	
</head>
<body>
<div class="warp">
	<div class="warp-container">
		<div class="login-bg"></div>
		<div class="login-header">
			<div class="login-banner"></div>
			<a href='/' class="login-logo"></a>
        </div>
	    <div class="login-container text-center">     
	        <h3 class="login">
	               <a href="/" class="back-home"></a>
	               <span>></span>
<@spring.messageText "login" "登录"/>
		    </h3>
	     
			<!-- <div class="borderdarkgray center  width500 bgwhite"> -->
			<!-- <div class="warp text-center top50"> -->
			<div class="login_box">
			
				<div class="login_box_content">
					<div class="text-center margin20">


						<div class="center text-left">
							<form>
								<div class="input-group input-group-lg" style="z-index:15">
								  <span class='input-group-addon'>
								  	 <i class="diyIcon images-user"></i>
								  </span>
								   <div class="input-group-btn posrel">
	                                  <div class="flag-toggle">
	                                     <button type='button' class='flag-btn' data-flag='flag-menu' id='telphone-type'>
	                                         <img src="https://o5uaa1ha4.qnssl.com/static/images/flags/86.gif" alt="">
	                                         <span class='area-code'></span>
	                                         <span class="caret"></span>
	                                     </button>
	                                     <ul class="flag-menu">
	                                     </ul>
	                                  </div>
	                                  <input type="hidden" id='area-tel-hidden' name='telephone'>
                                  </div>
								  <input type="text" class="form-control" id="telephone" value="" placeholder="<@spring.messageText "telephone" "电话"/>"/>
								</div>
								<div class="input-group input-group-lg top30">
									<span class='input-group-addon'>
										<i class="diyIcon images-key"></i>
									</span>
																	   <input type="password" class="form-control" onpaste="return false" name="password" id="password" placeholder="<@spring.messageText "password" "密码"/>"/>
								</div>
								 <div>
									<div class="form-group text-center top30">
										<button type="button" id='loginBtn' class="btn-default-blue right30"><@spring.messageText "login" "登录"/></button>
										<a href="signup" class="btn-default-black"><@spring.messageText "register" "注册"/></a>
										<a href="/user/forget" type="button" style="margin-left:20px" ><@spring.messageText "forget_password" "忘记密码？"/></a>
									</div>
								</div>
							</form>
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
