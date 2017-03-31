$(function (){
        var langs = location.pathname.match(/TW|CN|EN/g)||['CN'];
        var org_text = ORG_TEXT || {};
        langs = langtype(langs);
        $(".submit").on("click",function(){
            var name = $(".username").val();    // 机构名称 
            var chain = $(".chain").val();           //国家
            var address = $(".address").val(); //地址
            var email = $(".eamil").val();    //邮箱
            var brief = $("#sub-text").val();//机构简介
            var isurl = $(".user_url").val();   //网址
            var ipone = $(".user_mobile").val(); //电话
            if( $.trim(name) == "" ){
                alertbox({ text : org_text[langs].orgup_1});
                return;
            }
            if( getByteLen(name) > 50 ){
                alertbox({ text : org_text[langs].orgup_10 + org_text[langs].orgup_5 + org_text[langs].orgup_11 });
                return;
            }
            if( $.trim(chain) == "" ){
                 alertbox({ text : org_text[langs].orgup_17});
                return;
            }
            if( getByteLen(chain) > 30 ){
                alertbox({ text : org_text[langs].orgup_10 + org_text[langs].orgup_18 + org_text[langs].orgup_11 });
                return;
            }
            if(  $.trim(address) == ""  ){
                alertbox({ text : org_text[langs].orgup_2});
                return;
            }
            if( getByteLen(address) > 50 ){
                alertbox({ text : org_text[langs].orgup_10 + org_text[langs].orgup_12 + org_text[langs].orgup_11 });
                return;
            }
            if(  $.trim(email) == ""  ){
                alertbox({ text : org_text[langs].orgup_3});
                return;
            }
            else if( getByteLen(email) > 50 ){
                alertbox({ text : org_text[langs].orgup_10 + org_text[langs].orgup_13 + org_text[langs].orgup_11 });
                return;
            }
            else if( !isEmail(email) ){
                alertbox({text:org_text[langs].orgup_19});
                return;
            }
            if( ipone != "" && ipone.length > 50){
                alertbox({ text : org_text[langs].orgup_10 + org_text[langs].orgup_15 + org_text[langs].orgup_11 });
                return;
            }
            if( isurl != "" && isurl.length > 50 ){
                alertbox({ text : org_text[langs].orgup_10 + org_text[langs].orgup_16 + org_text[langs].orgup_11 });
                return;
            }
            if(  $.trim(brief) == ""  ){
                alertbox({ text : org_text[langs].orgup_4});
                return;
            }
            if( getByteLen(brief) > 500 ){
                alertbox({ text : org_text[langs].orgup_10 + org_text[langs].orgup_14 + org_text[langs].orgup_11 });
                return;
            }
            brief = html_encode(brief);
            $.ajax({
                url: "/mindbank/api/org/application",
                type: 'POST',
                data: {
                    locale: langs,
                    orgName: name,
                    address: chain+address,
                    email: email,
                    site: isurl,
                    info: brief
                }, 
                success: function (data) {
                   alertbox({text:org_text[langs].orgup_7});
                   $(".sing_up_main").find("input").val("");
                   $("#sub-text").val("");
                   $(".text_num").html("0/500");
                }, 
                error: function (e) {
                    if(e.status == 500){
                        alertbox({text:org_text[langs].orgtxt_5});
                    }
                    else{
                        alertbox({text:org_text[langs].orgtxt_6});
                        console.log(e);
                    }
                }
            });
        })
     $("#sub-text").on('keyup',function(){
        var subtext = $("#sub-text").val();
        var mynum = getByteLen(subtext);
        $(".text_num").html(mynum+"/500");
            if(mynum > 500){
                $(this).css("color","red");
                $(".text_num").css("color","#D0021B");
            }else{
                $(this).css("color","#000");
                $(".text_num").css("color","#565A5C")
            }
     });
     $(".text_numb").html();

    function getByteLen(val) {
      var len = 0;
      for (var i = 0; i < val.length; i++) {
        var a = val.charAt(i);
        if (a.match(/[^\x00-\xff]/ig) != null) {
          len += 1;
        }
        else {
          len += 0.5;
        }
      }
      return Math.ceil(len);
    };
})