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
                    var $btcAble=$price.find('.btc-able').text("¥ "+data.data['btcRmbPrice']);
                    var $dollarChange=$price.find('.dollar-change').text(data.data['balanceUsd']);
                    var $btcChange=$price.find('.btc-change').text(data.data['balanceBtc']);
                    var $mnChange=$price.find('.mn-change').text(data.data['mn']);
                    $price.find('.mg-change').text(data.data['mg']);
                    $price.find('.username-able').text(data.data['username']);
                }
            }
        });
        return updateBtcInfo;
    }(), 30*1000);
}