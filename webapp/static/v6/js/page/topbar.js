define(function(require, exports, module){
    var $ = require('jquery');
    console.log(IS_LOGIN);
    console.log(window.IS_LOGIN);
    if(IS_LOGIN){
        setInterval(function updateBtcInfo() {
            $.ajax({
                url:'/deal/getCurrentcoin',
                type:'GET',
                success:function(data){
                    if(data.status == 0){
                        var $price=$('.topbar');
                        $price.find('.new-price').text("$ "+data.data['btcUsdPrice']);
                        $price.find('.new-mg-price').text("฿ " + parseFloat(data.data['mg_price']).toFixed(6));
                    }
                }
            });
            return updateBtcInfo;
        }(), 30*1000);
        
        $(".topbar-user").on('mouseenter', function(event) {
	        var htmler="";
	        $.ajax({
	            type:'GET',
	            url:'/deal/user/balance',
	            success:function(msg){
	                if(msg.status == 1){
	                    alertBoxFunc(msg.error.message,'sure');
	                }else{
	                    htmler= '<p>฿ <span class="btc-change">'+ msg.data.balanceBtc +'</span>&nbsp;&nbsp;&nbsp;&nbsp; ≈ &nbsp;&nbsp;&nbsp;&nbsp;$<span class="dollar-change">'+ msg.data.balanceUsd +'</span></p><p>MN:<span class="mn-change">'+msg.data.mn +'</span> MG:<span class="mg-change">'+ msg.data.mg +'</span></p>';
	                    $(".topbar-user-detail-content").html(htmler);
	                    $('.mn-cheated').html(msg.data.cheat_mg.toFixed(4));
	                    $('.mn-deducted').html(msg.data.mg_frozen.toFixed(4));
	                    if(msg.data.user_status && msg.data.user_status == '-98'){
	                        $('#frozen-mn-amount').html(msg.data.freeze_mn);
	                        $('#frozen-mg-amount').html(msg.data.freeze_mg);
	                        $('.topbar-user-frozen').show();
	                    }else{
	                        $('.topbar-user-frozen').hide();
	                    }
	                }
	            },
	            error:function(err){
	                console.log(err);
	            }
	        });
	    });
	    $('.topbar-user-frozen-amount span').on('click', function(){
	        $('.frozen-tip-modal').show();
	    });
	    $('.frozen-tip-modal .btn-confirm').on('click', function(){
	        $('.frozen-tip-modal').hide();
	    });
	    // $('.btn-mg-recharge').on('click', function(){
	    //     $('#mgRechargeModal').modal('show');
	    // });
	    $('.btn-mg-trans').on('click', function(){
	        $('#mgTransModal').modal('show');
	    });
	 }
});
