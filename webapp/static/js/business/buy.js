/**
**
*/
var buyFunc=function(){
	this.ready();
}

var proto=buyFunc.prototype;

proto.page='buy';

proto.ready=function(){
    var page=this.page;
    $('.navbar-nav')
   .find('li[data-page='+page+']')
   .addClass('active')
   .siblings()
   .removeClass('active');
	//信息栏每30s更新
    firRequest();
    window.setInterval("firRequest()",1000*30); 
    //事件绑定
    $(".jian").click(function () {
                var $numText= $(".numText");
                var $numText2=$(".numText2");
                var $price = $(".price");
                var $price2 = $(".price2");
                //这里是单价
                var danjia = 100;
                var num1=$numText.val()-0;
                var num2=$numText2.val()-0;
                if (num1>0) {
                    var newNum=num1-1;
                    var price= newNum* danjia-0;
                    var price2=num2*danjia;
                    var total=price+price2;
                    $numText.val(newNum);
                    $price.text(price);
                    $(".hejiText").val(total);
                    $(".hejiLable").text(total);
                    $("#mindlinknum").val(newNum);
                    $("#total").val(total);
                }
            })
    $(".jia").click(function () {
        var $numText= $(".numText");
        var $numText2= $(".numText2");
        var $price = $(".price");
        var $price2 = $(".price2");
       
        //这里是单价
        var danjia = 100;
        var num1=$numText.val()-0;
        var num2=$numText2.val()-0;
        var devicenum=$('#devicenum').val()-0;
        if(devicenum<1 && num1<1)
        {
            var newNum=num1+1;
            var price= newNum* danjia-0;
            var price2=num2*danjia;
            var total=price+price2;
            $numText.val(newNum);
            $price.text(price);
            $(".hejiText").val(total);
            $(".hejiLable").text(total);
            $("#mindlinknum").val(newNum);
            $("#total").val(total);
        }
        else{
            alertBoxFunc('alertStr2','sure');   
        }
    })

    $(".jian2").click(function () {

        var $numText= $(".numText");
        var $numText2=$(".numText2");
        var $price = $(".price");
        var $price2 = $(".price2");
       
        //这里是单价
        var danjia = 100;
        var num1=$numText.val()-0;
        var num2=$numText2.val()-0;
        if (num2>0) {
            var newNum=num2-1;
            var price= num1*danjia;
            var price2=newNum* danjia;
            var total=price+price2;
            $numText2.val(newNum);
            $price2.text(price2);
            $(".hejiText").val(total);
            $(".hejiLable").text(total);
            $("#masalinknum").val(newNum);
            $("#total").val(total);
        }
    })

    $(".jia2").click(function () {
        var $numText= $(".numText");
        var $numText2= $(".numText2");
        var $price = $(".price");
        var $price2 = $(".price2");
        var mpnum = $("#mpnum").val()-0;
        //这里是单价
        var danjia = 100;
        var num1=$numText.val()-0;
        var num2=$numText2.val()-0;

         if (num2< 7-mpnum) {
            var newNum=num2+1;
            var price= num1 * danjia;
            var price2=newNum* danjia;
            var total=price+price2;
            $numText2.val(newNum);
            $price2.text(price2);
            $(".hejiText").val(total);
            $(".hejiLable").text(total);
            $("#masalinknum").val(newNum);
            $("#total").val(total);
        }else{
            alertBoxFunc('alertStr3','sure');
        }
    })

	$(".querenzhifu").click(function () {
//	            if($("#total").val()-0==0)
//	            {
//                    alertBoxFunc('alertStr4','sure'); 
//	            }
//	            else
//                {
           //gaia-833
           window.location = "/deal/buy_order";

                    // alertBoxFunc('alertStr5','all',function(){
                    //      if(parseFloat($("#total").val()) > parseFloat($("#userdollor").val()))
                    //      {
                    //          console.log(parseFloat($("#total").val()));
                    //          console.log( parseFloat($("#userdollor").val()));
                    //         alertBoxFunc('alertStr6','sure');
                    //      }
                    //      else
                    //      {
                    //     	//按钮置灰
                    //     	$(".querenzhifu").attr('disabled',"true");
                    //          //var dev_num=$('#mindlinknum').val();
                    //          //var pack_num=$('#masalinknum').val();
                    //          var dev_num=$("#mindlinknum_num").text();//优惠认购时间过了之后固定1台设备1个智慧包
                    //          var pack_num=$("#masalinknum_num").text();
                    //          var csrfToken = $("#CSRFToken").val();
                    //          $.ajax({
                    //              type:'post',
                    //              url:'/deal/buy',
                    //              data:{'mindlinknum':dev_num,'masalinknum':pack_num,CSRFToken: csrfToken},
                    //              success:function(msg){
                                	
                    //             	 if(msg.status == 0){
                    //             		 alertBoxFunc(msg.data,"sure",function(){
                    //             			 window.location = '/deal/buy';
                    //      				});
                                		 
                    //             	 }else{
                    //             		 if(-1 == msg.status){
                    //             			 alertBoxFunc(msg.error.message,'sure'); 
                    //             			 $('<p class="alertBoxRechargeBtn"><a href="/deal/recharge">'+$.i18n.prop('quick_recharge')+'</a></p>').insertBefore($('.alert-sure').parent());
                    //             		 }else{
                    //             			 alertBoxFunc(msg.error.message,'sure');
                    //             		 }
                                		
                    //             		 $(".querenzhifu").removeAttr("disabled");
                    //             	 }
                    //              },
                    //              error:function(err){
                    //             	 $(".querenzhifu").removeAttr("disabled");
                    //                 console.log(err);
                    //              }
                    //          });
                    //      }
                    // });
//                }      
	})
}

$(function(){
	var buy=new buyFunc();
})
