<#include "common/base-v2.ftl" />
<#macro title>
<@spring.messageText "buy_center" "认购中心"/>
</#macro>

<#macro head>
  <link rel="stylesheet" type="text/css" href="/static/css/buy_order.css">
  <link rel="stylesheet" type="text/css" href="/static/css/shippingAddress.css">
</#macro>

<#macro body>

 <div class="wrap asset-manager">
  <#include "common/header.ftl" >
   <div class="main main-buycenter">
      <div class="text-center">
        <div class="buymain">
          <div class="buytitle"> <@spring.messageText "buylink.text1" "确认订单"/></div>
          <div class="buybody text-center">

               <div class="body_head">
                <input type="hidden" value="${isNewRegister}" id="hideval">
                

                     <div class="body-img">
                     <!-- 设备背景图 -->
                      <!-- <#if isNewRegister == 0>
                       <img class="Package" src="/static/images/buyPackage.png">
                     </#if> -->
                     <!-- <#if isNewRegister == 1>
                        <img class="buy" src="/static/images/buylink.png"> 
                     </#if> -->
                       <img class="buy" src="/static/images/buylink.png"> 

                     </div>
                    <!--  <#if isNewRegister == 0>
                       <h2 class="body_title" >
                         <@spring.messageText "buylink.text2" "起航套餐"/>
                       </h2>
                    <div class="bodyinput" >
                    <@spring.messageText "buylink.text3" "购买数量"/>
                    ：<input type="text" id="text-num" style="border:none; background:#fff; " value="1" disabled="disabled" />  
                            
                     </div> 
                     <div class="buymony">
                     <@spring.messageText "buylink.text4" "价值"/>:&nbsp;&nbsp;<div class="buymonydiv"> <span class="nummony">200</span>$ </div>
                     </div>

                     </#if> -->
                       <h2 class="body_title">MindLink <@spring.messageText "buylink.text5" "设备"/></h2>
                       <div class="bodyinput">
                    <@spring.messageText "buylink.text41" "兑换数量"/>
                    ：<input type="text" onkeyup="this.value=this.value.replace(/[^\d]/g,'')" id="text-num" value="1"/>  
                            <input type="button" id="btnup" value="" >
                            <input type="button" id="btndown" value="" >
                       </div> 
                     <div class="buymony">
                     <@spring.messageText "buylink.text4" "价值"/>：<div class="buymonydiv">$<span class="nummony">${deviceUnitprice}</span>
                     </div>
                     </div>
                     <div class="buy_process text-center">
                        <div class="proheaddiv">
                             <span class="prospan1 prospan">1</span>   
                             <em class="buyem"></em>
                             <span class="prospan3 prospan">2</span> 
                        </div>
                        <div>
                            <strong class="bodystrong"><@spring.messageText "buylink.text6" "设置收件人信息"/> </strong>
                            <strong class="bodystrong1"><@spring.messageText "buylink.text7" "完成"/> </strong>
                        </div>
                     </div>
               </div>
          </div>

         <div class="buyfoot text-center">
              <div class="foot_body text-center">
                     <span><@spring.messageText "buylink.text8" "收件人信息"/></span>
                     <a href="####" class="foot_a" id="addressAdd"> + <@spring.messageText "buylink.text9" "添加收货地址"/> </a>
                     <div class="footwarp">   
                       
                     </div>
                      <div class="table-pager" >
                  
                     </div>   
                     <button id="nextbtn" class="btn"> <@spring.messageText "buylink.text10" "下一步"/> </button>
              </div> 

        </div> 
        <div class="linkok text-center">
             <div class="okbody">
                <h2><@spring.messageText "buylink.text11" "支付成功"/>！</h2>
                <div>
                  <@spring.messageText "buylink.text12" "支付金额"/>：
                  <span class="oknumber">1.33654</span>&nbsp;BTC
               </div>
               <button id="towbtn" class="btn"><@spring.messageText "buylink.text13" "再次兑换"/></button>
             </div>
        </div>
      <!--   获取token -->
     <input type="hidden" name="CSRFToken" id="CSRFToken" value="${CSRFToken}" />
     <!--  购买弹窗   -->    
                  <div class="goumai">
                        <div class="gou_head">&nbsp;&nbsp;&nbsp;&nbsp;<@spring.messageText "buythen.text5008" "订单信息确认"/>
                                <sapn class="head_spanx" style="float: right; margin-right:10px">X</sapn>
                        </div>
                        <div class="gou_body">
                              <h4><@spring.messageText "buylink.text14" "您共购买"/>&nbsp;<span class="spannun"></span>&nbsp;<@spring.messageText "buylink.text42" "个"/><span class="spanname"></span></h4>
                              <h5><@spring.messageText "buylink.text15" "需支付"/><span class="spanmony"></span>BTC</h5>
                              <#if vcodeon?exists >
                              <div id="vcode-box">

                                <span><@spring.messageText "buylink.text16" "手机验证码"/>:</span>

                                <input type="text" id="yanzhen" placeholder="<@spring.messageText "buylink.text16" "手机验证码"/>">
                                <input type="button" id="yanzhenbtn" value='<@spring.messageText "getsmscaptcha" "获取短信验证码"/>'>
                              </div>
                              </#if>
                              <#if googlecodeon?exists >
                              <div id="googlecode-box">
                                <span><@spring.messageText "safety.text108" "谷歌验证码"/>:</span>
                                <input type="text" id="googlecode" placeholder="<@spring.messageText "safety.text108" "谷歌验证码"/>">
                              </div>
                              </#if>
                              
                              <div id="pay-password-box">

                                <span><@spring.messageText "safety.text22" "确认支付密码"/>:</span>

                                <input type="password" class="pay-password"  placeholder="<@spring.messageText "buythen.text5052" "请输入支付密码"/>" />  <a href="/v2/user/safety/into?BTN=set-paypassword"><@spring.messageText "forget_password" "忘记密码？"/></a>
                              </div>
                              <button id="yanzhenok"><@spring.messageText "buylink.text17" "确认支付"/></button>
                        </div>
                  </div>
          
         </div> 
      </div> 


   </div>  

 </div>
 <div class="mywarp"></div>
  <#include "/decorators/footer.ftl" >
</#macro>

<#macro footerjs>
<#if payPassword ?exists >
<input type="hidden" val="1" id="isPayPassword">
<#else>
<input type="hidden" val="0" id="isPayPassword">
</#if>
<script type="text/javascript" src="/static/js/libin.js"></script>
<script type="text/javascript" src="/static/js/business/paging.js"></script>
<!-- <script type="text/javascript" src="/static/js/business/popupWindow.js?v=201608311711"></script> -->
<script type="text/javascript" src="/static/js/business/addressCountry.js"></script>
<script type="text/javascript" src="/static/js/business/shippingAddress.min.js"></script>


<script>
/**************************************/

     var shengnewobj = $('.sheng option:selected').text();
     $('.sheng').focus(function(){
          shengnewobj = $('.sheng option:selected').text();
       })
     $('.sheng').blur(function(){
      var shengtext = $('.sheng option:selected').text();
        if(shengnewobj != shengtext){
             doProvAndCityRelation(); 
             doCityAndCountyRelation(); 
        }
     })
      $('.shi').focus(function(){
             doProvAndCityRelation(); 
             $('#chooseCitymy').remove();
             $('#chooseCitymy_1').remove();
             doCityAndCountyRelation();
       })
      $('.diqu').focus(function(){
            $('#chooseCountymy').remove();
             doCityAndCountyRelation();
       })
/**************************************/
   //开关 点击下一步
    var addonoff = false;
    //电话号码
    var numbermobile = " ";
    //收货地址ID
    var addressmyId = 0;
    // 购买数量
     var monynum = parseInt($('#text-num').val());
     var  numone = '${deviceUnitprice}';
     //控制购买设备数量 +
     $('#btnup').click(function(){
         var self = $(this);
        if(monynum >= 99){
          monynum = 99;
        }else{
           monynum ++;
       }
       $('#text-num').val(monynum);
         var tmonynum = monynum*numone;  // 购买的价钱（数量＊100）
        $('.nummony').html(tmonynum);
     })
     //控制购买设备数量 __
     $('#btndown').click(function(){
         if(monynum <= 1 ){
            monynum = 1;
         }else{
         monynum --;
       }
         $('#text-num').val(monynum);
         var tmonynum = monynum*numone;  // 购买的价钱（数量＊100）
        $('.nummony').html(tmonynum);
     })
     $('#text-num').blur(function(){
           monynum = parseInt($(this).val());
          var tmonynum = monynum*numone;  // 购买的价钱（数量＊100）
          if(monynum == 0 || monynum == null || monynum == ""){
            $(this).val(1);
            tmonynum=numone;
          }
          if(isNaN(monynum)){
                $(this).val(1);
                tmonynum=numone;
          }
          $('.nummony').html(tmonynum);   
     })
     $(document).on('keyup','#text-num',function(){
         var imonynum = parseInt($(this).val());
          var tmonynum = imonynum*numone;  // 购买的价钱（数量＊100）
          console.log(imonynum);
          if(imonynum == 0 || imonynum == null || imonynum == " "){
               $(this).val(1);
                tmonynum=numone;
          }
          if( imonynum >= 99){
               $(this).val(99); 
          }
          $('.nummony').html(tmonynum);  
     })
    
      //再次购买
      $('#towbtn').click(function(){
         window.location = "/deal/buy_link";
      })
   /*************************************************************************************/
       //  点击添加收货地址
        $(function(){
               //clickfoota('.foot_a');  
          //var login=new addressCountry({id:"#countryCode"});
          //var login1=new addressCountry({id:"#countryCode1",showId:true});
          //var login2=new addressCountry({id:"#countryCode2",showId:true});
          //添加国内收货地址
        //chinaaddto(mypagingfunc);
        //添加国际收货地址
        //usaaddto(mypagingfunc);
          
          })
     /******************************/
     function mypagingfunc() {

          var paging = new pagingFunc({
          pageBox:".table-pager",
          ajaxUrl:"/user/userAddress",
          type: "Get",
          pageKey:"user_address_page",
          sizeKey:"user_address_size",
          size:100, 
          mode:"Server", 
          intoBox : function(data){ //因数据和页面DOM结构需求不一样， 有 ajaxUrl 时 必须定义 paging.intoBox ，将数据写入DOM。
            var rows = data.rows;
            var htmlT="";

            if (rows==null || rows.length <= 0) {

           htmlT = "<h1 class='noname'> <@spring.messageText 'buylink.text58''暂时没有收件人信息，赶快创建吧。'/></h1><a href='###' class='foot_a foot_a_btn'> + <@spring.messageText 'buylink.text9' '添加收货地址'/> </a>"
               $('.footwarp').css('height','300');
            } 
            else{ 
              for(var i = 0 ; i < rows.length ; i++){
                  var age = i ;
                  var province = rows[i].province; //省
                  var city = rows[i].city;        //市
                  var area = rows[i].area;      //区
                  var address = rows[i].detailedAddress;   //详细地址
                  var name = rows[i].name;        //姓名
                  var phone = rows[i].phone;      //电话
                  var defaultAddress = rows[i].defaultAddress;
                  var id = rows[i].id;  //ID
                  var country = rows[i].country;  //国家
                  var addressprove = province+city+area+address;
                  if(defaultAddress){ //判断是否是默认收货地址
                  
                    htmlT += '<div class="footul">'+ 
                              '<ul>'+
                                '<li class="width1 deafli"></li>'+
                                '<li class="width2"><span class="spansheng">'+province+'</span><span class="spanshi">'+city+'</span><span class="spanxian">'+area+'</span><span class="spanadd">'+address+'</span><p class="dizhiadd">'+addressprove+'</p></li>'+
                                '<li class="width3"><span><@spring.messageText "buylink.text36" "收件人"/>:</span><p class="nameaddp">'+ name +'</p></li>'+
                                '<li class="width4"><span class="span1"><@spring.messageText "buylink.text37" "电话"/>:</span><span class="footnum">'+toX(phone)+'</span></li>'+
                                '<li class="width5 width_xiu" addressid="'+id+'"><span class="span65"><@spring.messageText "buylink.text38" "修改地址"/></span></li>'+
                              '</ul>'+
                              '<input class="hiddeninputid" type="hidden" value = '+id+'>'+
                              '<input class="hiddeninputcountry" type="hidden" value = '+country+'>'+
                          '</div>'
                        $('.prospan1').css({
                                        'background' : '#0e8bec',
                                        'color' : '#fff',
                                        'border' : 'none'
                                  })
                     onoff = false;
                     addonoff=true;
                     addressmyId = id;  //默认地址ID
                  }
                  else{
                     htmlT += '<div class="footul">'+ 
                              '<ul>'+
                                '<li class="width1"></li>'+
                                '<li class="width2"><span class="spansheng">'+province+'</span><span class="spanshi">'+city+'</span><span class="spanxian">'+area+'</span><span class="spanadd">'+address+'</span><p class="dizhiadd">'+addressprove+'</p></li>'+
                                '<li class="width3"><span><@spring.messageText "buylink.text36" "收件人"/>:</span><p class="nameaddp">'+ name +'</p></li>'+
                                '<li class="width4"><span class="span1"><@spring.messageText "buylink.text37" "电话"/>:</span><span class="footnum">'+toX(phone)+'</span></li>'+
                                '<li class="width5 width_xiu" addressid="'+id+'"><span class="span65"><@spring.messageText "buylink.text38" "修改地址"/></span></li>'+
                              '</ul>'+
                              '<input class="hiddeninputid" type="hidden" value = '+id+'>'+
                              '<input class="hiddeninputcountry" type="hidden" value = '+country+'>'+
                          '</div>'
                    }

                }
              }
            $('.footwarp').html(htmlT); 
            /*****************************************/
            var footuldiv =  $('.footwarp').find('.footul');
         if( footuldiv.length > 1 ){
            $('.footwarp').find('.footul').find('.width1').removeClass("deafli");
            var footulobj = $('.footwarp').find('.footul').eq(1);
            var mywidth1 = footulobj.find('.width1');
                mywidth1.addClass("deafli");
                onoff = false;
                addonoff=true;
            addressmyId = footulobj.find('.hiddeninputid').val();  //id
          }
            /****************************************/
            var footheight = $('.footwarp').height();
            if( footheight < 300 ){
                $('.footwarp').css('height','300');
            }else{
                $('.footwarp').css('height','406');
            }
            
           //默认选中
           $('.deafli').attr('style','background:url("/static/images/buyclick.png") no-repeat 24px 12px');
           //地址列表鼠标移入移出
             $('.footul').find('ul').hover(function(){
                    $(this).css({'background':'#f0f9ff',
                                 'border':'#0e8bec 1px solid'
                    });
                    $(this).find('.width5').css('display','block');
                  if( onoff ){
                    $(this).find('.width1').attr('style','background:url("/static/images/buymouseover.png") no-repeat 24px 12px');
                  }
              },function(){
                    $(this).find('.width5').css('display','none');
                    $(this).css({'background':'#fff',
                                 'border':'#fff 1px solid'
                    });
                    if( onoff ){
                     $(this).find('.width1').attr('style','background:url("/static/images/buynone.png") no-repeat 24px 12px')
                    }
              })
              //鼠标移入喉点击选中
              spanclick();
             }
         }); 
       
     }
        
    /*************************************************************************************/
    

     //默认地址列表
     pagingfunc();

     function pagingfunc() {

          var paging = new pagingFunc({
          pageBox:".table-pager",
          ajaxUrl:"/user/userAddress",
          type: "Get",
          pageKey:"user_address_page",
          sizeKey:"user_address_size",
          size:100, 
          mode:"Server", 
          intoBox : function(data){ //因数据和页面DOM结构需求不一样， 有 ajaxUrl 时 必须定义 paging.intoBox ，将数据写入DOM。
            var rows = data.rows;
            var htmlT="";

            if (rows==null || rows.length <= 0) {

            htmlT = "<h1 class='noname'> <@spring.messageText 'buylink.text58''暂时没有收件人信息，赶快创建吧。'/></h1><a href='###' class='foot_a foot_a_btn'> + <@spring.messageText 'buylink.text9' '添加收货地址'/> </a>"
               $('.footwarp').css('height','300');
            }else{ 
              for(var i = 0 ; i < rows.length ; i++){
                  var age = i ;
                  var province = rows[i].province; //省
                  var city = rows[i].city;        //市
                  var area = rows[i].area;      //区
                  var address = rows[i].detailedAddress;   //详细地址
                  var name = rows[i].name;        //姓名
                  var phone = rows[i].phone;      //电话
                  var defaultAddress = rows[i].defaultAddress;
                  var id = rows[i].id;  //ID
                  var country = rows[i].country;  //国家
                  var addressprove = province+city+area+address;
                  if(defaultAddress){ //判断是否是默认收货地址
                  
                    htmlT += '<div class="footul">'+ 
                              '<ul>'+
                                '<li class="width1 deafli"></li>'+
                                '<li class="width2"><span class="spansheng">'+province+'</span><span class="spanshi">'+city+'</span><span class="spanxian">'+area+'</span><span class="spanadd">'+address+'</span><p class="dizhiadd">'+addressprove+'</p></li>'+
                                '<li class="width3"><span><@spring.messageText "buylink.text36" "收件人"/>:</span><p class="nameaddp">'+ name +'</p></li>'+
                                '<li class="width4"><span class="span1"><@spring.messageText "buylink.text37" "电话"/>:</span><span class="footnum">'+toX(phone)+'</span></li>'+
                                '<li class="width5 width_xiu" addressid="'+id+'"><span class="span65"><@spring.messageText "buylink.text38" "修改地址"/></span></li>'+
                              '</ul>'+
                              '<input class="hiddeninputid" type="hidden" value = '+id+'>'+
                              '<input class="hiddeninputcountry" type="hidden" value = '+country+'>'+
                          '</div>'
                        $('.prospan1').css({
                                        'background' : '#0e8bec',
                                        'color' : '#fff',
                                        'border' : 'none'
                                  })
                     onoff = false;
                     addonoff=true;
                     addressmyId = id;  //默认地址ID
                  }else{
                     htmlT += '<div class="footul">'+ 
                              '<ul>'+
                                '<li class="width1"></li>'+
                                '<li class="width2"><span class="spansheng">'+province+'</span><span class="spanshi">'+city+'</span><span class="spanxian">'+area+'</span><span class="spanadd">'+address+'</span><p class="dizhiadd">'+addressprove+'</p></li>'+
                                '<li class="width3"><span><@spring.messageText "buylink.text36" "收件人"/>:</span><p class="nameaddp">'+ name +'</p></li>'+
                                '<li class="width4"><span class="span1"><@spring.messageText "buylink.text37" "电话"/>:</span><span class="footnum">'+toX(phone)+'</span></li>'+
                                '<li class="width5 width_xiu" addressid="'+id+'"><span class="span65"><@spring.messageText "buylink.text38" "修改地址"/></span></li>'+
                              '</ul>'+
                              '<input class="hiddeninputid" type="hidden" value = '+id+'>'+
                              '<input class="hiddeninputcountry" type="hidden" value = '+country+'>'+
                          '</div>'
                  }
                }
            }
            $('.footwarp').html(htmlT); 
             var footheight = $('.footwarp').height();
            if( footheight < 300 ){
                $('.footwarp').css('height','300');
            }else{
                $('.footwarp').css('height','406');
            }
            
            //默认选中
            $('.deafli').attr('style','background:url("/static/images/buyclick.png") no-repeat 24px 12px');
            //地址列表鼠标移入移出
             $('.footul').find('ul').hover(function(){
                    $(this).css({'background':'#f0f9ff',
                                 'border':'#0e8bec 1px solid'
                    });
                    $(this).find('.width5').css('display','block');
                  if( onoff ){
                    $(this).find('.width1').attr('style','background:url("/static/images/buymouseover.png") no-repeat 24px 12px');
                  }
              },function(){
                    $(this).find('.width5').css('display','none');
                    $(this).css({'background':'#fff',
                                 'border':'#fff 1px solid'
                    });
                    if( onoff ){
                     $(this).find('.width1').attr('style','background:url("/static/images/buynone.png") no-repeat 24px 12px')
                    }
              })
                  //鼠标移入喉点击选中
                       spanclick();
            }
         }); 
       
     }
     //修改地址
     //  modifyAddress('.width_xiu',pagingfunc);      
     //鼠标移入喉点击选中
      var onoff = true;
      function spanclick(){
          $('.footul').find('.width1').click(function(){
            $('.width1').attr('style','background:url("/static/images/buynone.png") no-repeat 24px 12px');
            $(this).attr('style','background:url("/static/images/buyclick.png") no-repeat 24px 12px');
            onoff = false;
            addonoff = true;
            numbermobile = $(this).parent().find('.footnum').html();//电话号码
             var parent = $(this).parent(); 
             var divparent = parent.parent();
             addressmyId = divparent.find('.hiddeninputid').val();  //id
             
            //点击事圆圈变色
            $('.prospan1').css({
                      'background' : '#0e8bec',
                      'color' : '#fff',
                      'border' : 'none' 
                    })
            });   
      }
      //支付
      //确认购买
      var isPayPassword = $("#isPayPassword").attr('val');
      $('#nextbtn').click(function(){
        $(document).scrollTop(100);
        var totalPrice = $('.nummony').html();
        var btcUsdPrice = parseFloat('${btcUsdPrice}');
        console.log(btcUsdPrice)
        var totalBtc = (totalPrice/btcUsdPrice).toFixed(4);
        var numbermy = $('#text-num').val();
        var namemy = $('.body_title').html();
        if(addonoff){
            $('.goumai').css('display','block');
            $('.mywarp').css('display','block');
            $('.goumai #pay-password-box .pay-password').val("");
            $('.goumai #vcode-box #yanzhen').val("");
            $('.goumai #googlecode-box #googlecode').val("");
            $('.spanmony').html(totalBtc); //比特币
            $('.spannun').html(numbermy); //设备数量
            $('.spanname').html(namemy); //设备名称
            if(isPayPassword==0){
                $("#vcode-box").show();
                $("#googlecode-box").show();
                $("#pay-password-box").hide();
            }else if(isPayPassword==1){
                $("#vcode-box").hide();
                $("#googlecode-box").hide();
                $("#pay-password-box").show();
            }
        }else{
             alertBoxFunc(' <@spring.messageText "buylink.text54" "请选择地址"/>','sure');
        }
      });
        
      //确认支付
      $('#yanzhenok').click(function(){
          var token = $('#CSRFToken').val();
          var  linknum = $('#text-num').val(); //设备个数
          var payPassword = $('.gou_body .pay-password').val(); 
          //验证短信验证码
          var yanzhenval = $('#yanzhen').val();
          var googlecode = $('#googlecode').val();
          if(isPayPassword==0){
              if (yanzhenval=="") {
                  alertBoxFunc('<@spring.messageText "safety.text27" "手机验证码不能为空。"/>','sure');
                  return;
              }
              if (googlecode=="") {
                  alertBoxFunc('<@spring.messageText "safety.text111" "请输入谷歌验证码"/>','sure');
                  return;
              }
          }else if(isPayPassword==1){
              if (payPassword=="") {
                  alertBoxFunc('支付密码不能为空！','sure')
                  return;
              }
          }
        
          // $('#yanzhenok').off();
          payPassword = encodeURIComponent(ENCRYPT.encrypt(payPassword));
          $.ajax({
            url:"/deal/buy",
            type:"POST",
            data:{
                 'mindlinknum':linknum,
                 'CSRFToken':token,
                 'addressId':addressmyId,
                 'code': yanzhenval,
                 'payPassword': payPassword,
                 'googlecode':googlecode
            },
            success:function(data){
                var datar = data.data;
                if( data.status == 0 ){   //支付成功
                     var datar = data.data;
                     var oknummony =  datar.toFixed(4);
                     $('.goumai').css('display','none');
                     $('.mywarp').css('display','none');
                     $('.oknumber').html(oknummony);
                     $('.buyfoot').css('display','none');   //隐藏设置地址页面
                     $('.linkok').css('display','block');   //显示成功页面
                     $('#text-num').css('border','none');  //隐藏text框
                     $('#text-num').attr('disabled',true); // 禁用text框
                     $('#btnup').css('display','none');        // 隐藏input
                     $('#btndown').css('display','none');        // 隐藏input
                     $('.bodyinput').css('margin-left','10px');   //设置样式
                     $('.prospan').html('');
                     $('.buyem').css('background','#0e8bec');
                     $('.prospan').attr('style','background : url("/static/images/buystep.png") no-repeat; border:none');
                }else{
                    if( data.error.code == -1 ){  //帐号余额不足
                          $('.goumai').css('display','none');
                          $('.mywarp').css('display','none');
                          alertBoxFunc(data.error.message,'sure',function(){
                               window.open('/deal/recharge');
                          });
                     }else if( data.error.code == 500 ){
                         alertBoxFunc(data.error.message,'sure');
                         $('.goumai').css('display','none');
                         $('.mywarp').css('display','none');
                    }else{
                      alertBoxFunc(data.error.message,'sure');
                    }
                }
              }
            })
      })
      
      //购买弹窗
      var goutop = document.body.clientHeight/2;
      var gouleft = document.body.clientWidth/2 - 240;
      $('.goumai').css('top',goutop);
      $('.goumai').css('left',gouleft);
      
      $('.head_spanx').click(function(){
           $('.goumai').css('display','none');
           $('.mywarp').css('display','none');
      })
     //遮罩
      var warpwidth = $(document.body).width();
      var warpheight = 1179;
      $('.mywarp').css('width',warpwidth);
      $('.mywarp').css('height',warpheight);
      $('.mywarp').click(function(){
              $(this).css('display','none');
              $('.goumai').css('display','none');
     })
      //点击获取验证码
     
   $('#yanzhenbtn').click(function(){
        var self = $(this);
     
      $.ajax({
        url:"/user/defaultAddress",
        type:"GET",
        data:{'addressId':addressmyId},
        success:function(data){
              var datar = data.data;
              var phonepassrde = datar.phone;   //电话
             self[0].setAttribute("disabled", true);
          $.ajax({
            url:"/user/getSmsCodeFromPay",
            type:"POST",
            data:{
              "mobile":phonepassrde
            },
            success:function(data){
                if( data.status == 0 ){

                    var wait = 60;
                   self.val(wait + '<@spring.messageText "withdrawal.text20" "秒后重新发送"/>');
                   var timer = setInterval(function(){
                    if(0 == wait){
                      clearInterval(timer);
                      self[0].removeAttribute("disabled");
                      self.val('<@spring.messageText "getsmscaptcha" "获取短信验证码"/>');
                    }else{
                      self.val(wait + '<@spring.messageText "withdrawal.text20" "秒后重新发送"/>');
                      wait--;
                    }
                  }, 1000);
                    self.parent().find('input[type="text"]').focus();
                }else{
                  self[0].removeAttribute("disabled");
                  alertBoxFunc(data.error.message,'sure');
                }
            }
          })
        }
      })
    })
   /*电话号码加密*/
       function toX(em){
        var tel = "";
        var length = em.length;
        if(isNamber(em)){
            tel = em.substring(0,3)+"****"+em.substring((length-3),length); 
            return tel;
        }else{
            var emArry = em.split("@");
            length = emArry[0].length;
            tel = emArry[0].substring(0,2)+"****"+emArry[0].substring((length-2),length)+"@"+emArry[1]; 
            return tel;
        }
    }
    function isNamber(s){   
        var patrn=/^[0-9]*$/;   
        if (!patrn.exec(s)) return false 
        return true 
    }

var shiper = new shippingAddress({
  addbtn:".foot_a",
  modifybtn:".width_xiu",
  addsuccess:function(){
    mypagingfunc();
  },
  modifysuccess:function(){
    pagingfunc();
  }
});
</script>
</#macro>
