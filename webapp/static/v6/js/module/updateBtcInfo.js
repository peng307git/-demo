/**
* @ updateBtcInfo 更新btc价格
* @ author yang
*/
define(function(require, exports, module){
    var Util = require('./util');
    var Widget = require('./widget');
    var updateBtcInfo = Widget({
        Options: {
            Box: ".topbar-price",
            btcBox:".new-btc-price",
            mgBtc:".new-mg-price",
            rate:30*1000
        },
        _init: function(){
            var self = this;
            setInterval(function updatePrice(){
                $.ajax({
                    url:'/deal/getCurrentcoin',
                    type:'GET',
                    success:function(data){
                        if(data.status == 0){
                            var $price=$(self.Box);
                            $price.find(self.btcBox).text(" $ "+parseFloat(data.data['btcUsdPrice']).toFixed(2));
                            $price.find(self.mgBtc).text( " ฿ "+parseFloat(data.data['mg_price']).toFixed(6));
                        }
                        // console.log(self.rate);
                    }
                });
                return updatePrice;
            }(), self.rate);
        }
    });
    module.exports = updateBtcInfo;
});
