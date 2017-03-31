/*
*
*/
var infoFunc=function(){
	this.ready();
}

var proto=infoFunc.prototype;

proto.page='assets';

proto.wait=60;

proto.flags_data={86:'中国'
        ,60:'马来西亚'
        ,91:'印度'
        ,62:'印尼'
        ,84:'越南'
        ,886:'台湾'
        ,850:'朝鲜'
        ,82:'韩国'
        ,63:'菲律宾'
        ,66:'泰国'
        ,855:'柬埔寨'
        ,65:'新加坡'
        ,81:'日本'
        ,93:'阿富汗'
        ,54:'阿根廷'
        ,61:'澳大利亚'
        ,43:'奥地利'
        ,880:'孟加拉国'
        ,375:'白俄罗斯'
        ,32:'比利时'
        ,55:'巴西'
        ,95:'缅甸'
        ,01:'加拿大'
        ,1345:'开曼群岛'
        ,56:'智利'
        ,57:'哥伦比亚'
        ,242:'刚果'
        ,53:'古巴'
        ,357:'塞浦路斯'
        ,420:'捷克'
        ,45:'丹麦'
        ,593:'厄瓜多尔'
        ,20:'埃及'
        ,251:'埃塞俄比亚'
        ,679:'斐济'
        ,358:'芬兰'
        ,33:'法国'
        ,241:'加蓬'
        ,49:'德国'
        ,233:'加纳'
        ,30:'希腊'
        ,224:'几内亚'
        ,509:'海地'
        ,852:'香港'
        ,36:'匈牙利'
        ,354:'冰岛'
        ,98:'伊朗'
        ,353:'爱尔兰'
        ,972:'以色列'
        ,39:'意大利'
        ,1876:'牙买加'
        ,327:'哈萨克斯坦'
        ,254:'肯尼亚'
        ,965:'科威特'
        ,331:'吉尔吉斯坦'
        ,856:'老挝'
        ,371:'拉脱维亚'
        ,961:'黎巴嫩'
        ,231:'利比里亚'
        ,370:'立陶宛'
        ,261:'马达加斯加'
        ,960:'马尔代夫'
        ,52:'墨西哥'
        ,377:'摩纳哥'
        ,976:'蒙古'
        ,212:'摩洛哥'
        ,674:'瑙鲁'
        ,977:'尼泊尔'
        ,31:'荷兰'
        ,64:'新西兰'
        ,227:'尼日尔'
        ,234:'尼日利亚'
        ,47:'挪威'
        ,968:'阿曼'
        ,92:'巴基斯坦'
        ,507:'巴拿马'
        ,51:'秘鲁'
        ,48:'波兰'
        ,351:'葡萄牙'
        ,1787:'波多黎各'
        ,974:'卡塔尔'
        ,40:'罗马尼亚'
        ,7:'俄罗斯'
        ,966:'沙特阿拉伯'
        ,27:'南非'
        ,34:'西班牙'
        ,94:'斯里兰卡'
        ,46:'瑞典'
        ,41:'瑞士'
        ,992:'塔吉克斯坦'
        ,255:'坦桑尼亚'
        ,90:'土耳其'
        ,993:'土库曼斯坦'
        ,256:'乌干达'
        ,380:'乌克兰'
        ,233:'阿拉伯联合酋长国'
        ,44:'英国'
        ,1:'美国'
        ,598:'乌拉圭'
        ,998:'乌兹别克斯坦'
        ,260:'赞比亚'
        ,853:'澳门'
};

proto.flagEvent=function(){
  var _self=this;
  //country flags select
      var $area_tel_hidden=$('#area-tel-hidden');
      var area_code='';
      if($area_tel_hidden)
      {
            var telNumber=$area_tel_hidden.val();
            if(telNumber)  
            {
              var _tel_arr=telNumber.split(' ');
                if(_tel_arr.length>1)
                {
                  area_code=_tel_arr[0];
                  var telphone_code=_tel_arr[1];
                      $('#input-telephone').val(_tel_arr[1])
                }
                else
                  $('#input-telephone').val(_tel_arr[0]);

            }
          var flags_menu_content='';
          for(var i in _self.flags_data)
          {
            var country=_self.flags_data[i];
            var class_str='';
            if(area_code) //设置默认国家。
            {
              if(area_code==('+'+i))
                class_str='class="active"';
            }
            else if(i==86)
              class_str='class="active"';
            flags_menu_content+='<li '+class_str+' data-flag-code='+i+'>'+'<img src="../static/images/flags/'+i+'.gif" />'+'<span> '+country+' </span>'+'</li>';
          }
              
              var area_str='';
      //去掉加号
      if(area_code!=''){
        area_code = area_code.replace("\+","");
      }
              if(area_code=='')
              {
                area_code=86;
              }



      area_str=' + '+area_code;



          $('.flag-menu')
          .html(flags_menu_content)
              .siblings('.flag-btn')
              .data('flagCode',area_code)
              .find('img')
              .attr('src','https://o5uaa1ha4.qnssl.com/static/images/flags/'+area_code+'.gif')
              .siblings('.area-code')
              .html(area_str);


        $('[data-flag]')
        .on('click',function(){
           var $this=$(this);
           var $forObj=$('.'+$this.data('flag'));
           $forObj.toggle();
        });

        $('.flag-menu').on('click','li',function(){
          var flag_code=$(this).data('flagCode');
          var flagName=$(this).find('span').text();
          var oldarea=$('#telphone-type').data('flatCode');

          if(flag_code!=oldarea)  //更换国家
          { 
             $(".voice").show();
                       $('.valid-img-box').show();
          }
          flagName=$.trim(flagName);
          $(this)
          .addClass('active')
              .siblings()
              .removeClass('active')
              .closest('ul')
              .toggle()
              .siblings('.flag-btn')
              .data('flagCode',flag_code)
              .find('.area-code')
              .html(" + "+flag_code)
              .siblings('img')
              .attr('src','https://o5uaa1ha4.qnssl.com/static/images/flags/'+flag_code+'.gif');
        })
      }
}


proto.time = function (obj) {

	var _self=this;

    if (_self.wait == 0) {
        obj.removeAttribute("disabled");
        //$(o).attr("disabled", false);  jquery
        obj.value = " 获取短信验证码 ";
        _self.wait = 60;
    } else {
        obj.setAttribute("disabled", true);
        obj.value = _self.wait + "秒后重新发送";
        _self.wait--;
        setTimeout(function () {
             _self.time(obj)
        }, 1000)
    }
}
proto.formsub=function(){
    var _mobile=$('#area-tel-hidden').val();
    var _captcha=$('#input-captcha').val();
    var _valid=$('#input-telephonecode').val();
    var _pass=$('#input-password').val();
    
    var _name=$('#input-username').val();
    var _sex=$('input[name=sex]').filter(':checked').val();
    var _address=$('#input-address').val();
    
    //手机号修改标示
    var _validatecode_old=$('#input-telephonecode_old').val();
    var _validatecode_new=$('#input-telephonecode_new').val();
    
    var isChangeMobile = 0;
    if(_mobile != $('#old_telephone').val()){
    	isChangeMobile = 1;
    }
    
    var _nickname=$('#input-nickname').val();
    var _email=$('#input-email').val();
    var _uid=$('#uid').val();
    var _data={'mobile':_mobile,
               'captcha':_captcha,
               'valid':_valid,
               'password':_pass,
               'username':_name,
               'gender':_sex,
               'address':_address,
               'isChangeMobile':isChangeMobile,
               'validatecode_old':_validatecode_old,
               'validatecode_new':_validatecode_new,
               'nickname':_nickname,
               'email':_email,
               'uid': _uid};
  //按钮置灰
	$("#changeBtn").attr('disabled',"true");
    $.ajax({
       type:'post',
       url:'/user/info',
       data:_data,
       success:function(msg){
    	   if(msg.status == 0){
    		   alertBoxFunc(msg.data,'sure',function(){window.location='/user/info';});
    	   }else{
    		   alertBoxFunc(msg.error.message,'sure');
    		   $("#changeBtn").removeAttr("disabled")
    	   }
       },
       error:function(err){
    	   $("#changeBtn").removeAttr("disabled");
           console.log(err);
       }
    });
}

proto.checkout =function(){
     //flag添加
	var alert_text1 = $("#alert_text1").val();
    var _areaCode=$('#telphone-type').data('flagCode');
    var telephone_code='';
    if(_areaCode==86)    //中国
    {
       telephone_code=$('#input-telephone').val();
    }
    else
       telephone_code='+'+$('#telphone-type').data('flagCode')+" "+$('#input-telephone').val();
    $('#area-tel-hidden').val(telephone_code);
    // ---

      var code_input_old = $("#input-telephonecode_old").val();
      var code_input_new = $("#input-telephonecode_new").val();
      var code_trans =  $('#trans_telephonecode').val();
      var $form=$("#editform");
      
      var _pass=$('#input-password').val();
      var _conpass=$('#input-con-password').val();
      
      if(_pass != _conpass){
    	  $("#input-con-password").after('<span class="error input-valid-style" >'+alert_text1+'</span>');
          return false;
      }
      
      if($("#valid-flg").val()==1)
      {
        if(code_input_old == "" || code_input_old == null || code_input_old == "" || code_input_old == null)
        {
          alertBoxFunc('alertStr7','sure');
        }
        else{
           this.formsub();
        }
      }
      else
      {
          this.formsub();
      }
}

proto.getCode =function(obj){
     var _self=this;
     var telephone = $("#input-telephone").val();
     var alert_text2 = $("#alert_text2").val();
     var old_telephone = $("#area-tel-hidden").val();//获取旧手机号
     var _area=$('#telphone-type').data('flagCode');
     var tel_number='';
        if(_area!=86)
            tel_number='+'+_area+' '+telephone;
        else
           tel_number=telephone;
    if(telephone == "" || telephone == null)
    {
        $("#input-telephone").after('<span id="remind" class="error input-valid-style" >'+alert_text2+'</span>');
    }
    else
    {
	    $.ajax({
            url:'/user/getSmsCodeDouPho',
            type:'POST',
            data:{'mobileNew':tel_number,'mobileOld':old_telephone,'validatecode':$('#input-captcha').val(),'biz_type':"CHANGE_MOBI",'ctoken':$("#ctoken").val()},
            dataType:'json',
            success:function(data){
                if(data.status == 0)
                {
              	  _self.time(obj);
                }
                else{
              	  changeImg();
              	  alertBoxFunc(data.error.message,'sure',function(){
                    $('#input-captcha').val("");
                  });
                }
            },
            error:function(){
                alert("函数执行错误！");
            }
        });
    }
}

proto.ready=function(){
	var _self=this;
   //导航栏添加active
   var page=this.page;
   $('.navbar-nav')
   .find('li[data-page='+page+']')
   .addClass('active')
   .siblings()
   .removeClass('active');
	//信息栏每30s刷新
    firRequest();
    window.setInterval("firRequest()",1000*30); 

    //事件绑定
    $('#changeBtn').on('click',function(){
    	_self.checkout();
    })

    $('#sendcode').on('click',function(){
    	_self.getCode(this);
    })

    $("#input-telephone").on('change',function(){
	   $(".voice").show();
	   $('.valid-img-box').show();
	   $("#valid-flg").val(1);  //启动验证码验证
     })

     $("#input-telephone").on('keyup',function(){       //填写手机号输入框时，清除下面的提示信息
       $("#remind").empty();
     });

    $("#input-telephonecode").on('keyup',function(){       //填写手机号输入框时，清除下面的提示信息
        $("#remindcode").empty();
    });


     $(".getcash").on('click',function () {
          //alertBoxFunc('alertStr8','sure');
     })

     _self.flagEvent();
    //flags国际化
    var _lang=langType();
    $.i18n.properties({
            name : 'strings', //资源文件名称
            path : 'https://o5uaa1ha4.qnssl.com/static/i18n/', //资源文件路径
            cache: true,
            mode : 'map', //用Map的方式使用资源文件中的值
            language : _lang,
            callback : function() {//加载成功后设置显示内容
              for(var i in _self.flags_data)
              {
                  $('[data-flag-code='+i+']').find('span').text(' '+$.i18n.prop(''+i));
              }
            }
    });
}

$(function(){
	var info=new infoFunc();
})


$(function(){
   /*添加导航栏*/
          
           nav_hover('#myquery','#myaquery','#query_li'); //脑波查询导航
           nav_hover('#mybuy','#myabuy','#buy_li');       // 认购导航
      function nav_hover(obj,obj_a,obj_li){
            var myleft = 0;
           $(obj).hover(function(){
                  myleft = $(obj_a).offset().left - 25;
                  $(obj_li).css("display","block");
                  $(obj_li).css("left",myleft);
             },function(){
                   $(obj_li).css("display","none");  
           })
           $(obj_li).find('li').hover(function(){
                  $(obj_li).css("display","block");
                  $(this).css('color','#1783e8');
                  $(this).css('background','#e6e6e6');
               
           },function(){
                   $(obj_li).css("display","none");
                    $(this).css('color','#777577');
                   $(this).css('background','#fff');
           })
      }
      //脑波查询导航跳转
           $('#myquery_btn').click(function(){
                    window.location.href = "/record/meditation/my/brain/search";
           })
           $('#query_btn').click(function(){
                    window.location.href = "/record/meditation/global/brain/search";
           })
     //认购界面跳转
          $('#buy_btn').click(function(){
                    window.location.href = "/deal/buy";
           })
           $('#buy_link_btn').click(function(){
                    window.location.href = "/deal/buy_link";
           })
     
})

