<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="/static/css/buymp.css" />
<script src="/static/js/jquery-1.11.2.min.js"></script>
</head>
<body>
<div class="boxer">
    <input id="marginBlockTime" type="hidden" value="${marginBlockTime}">
    <input id="msiteBlockCount" type="hidden" value="${msiteBlockCount}">
    <input id="ordinaryMyQueueNumber" type="hidden" value="${ordinaryMyQueueNumber}">
    <input id="ordinaryMyMasanumber" type="hidden" value="${ordinaryMyMasanumber}">
    <!-- <input id="marginBlockTime" type="hidden" value="4000">
    <input id="msiteBlockCount" type="hidden" value="19"> -->
    <div class="left-box">
        
        <p class="msiteBlock"><@spring.messageText "buythen.text5037" "当前区块"/><b id="blockCount">${blockCount}</b></p>
        <p class="blockAvgGenerateTime"><@spring.messageText "buythen.text5033" "平均区块产生时间"/><span id="blockAvgGenerateTime">${(blockAvgGenerateTime/1000)?string(',###.00')}</span><i>?<span>1、<@spring.messageText "century.alternate.text7" "本世纪每区块可产生6个智慧包，每个智慧包有390个MN"/><br/>2、<@spring.messageText "buythen.text5039" "区块链运行初期，系统会以较高的算力难度，对区块速度及稳定性进行自动调整来保证前期系统的安全。随着区块链运行的逐步稳定，未来区块时间将无限接近于90秒。"/></span></i></p>
       <!--  <p><@spring.messageText "buythen.text5034" "本次将产生包数"/><span id="generateMpCount">${generateMpCount}</span></p> -->
    </div>
    <div class="right-box">
        <div id="beformg"><@spring.messageText "buythen.text5023" "前方排队包数"/><span></span></div>
        <div id="youinfo">
            <span id="user">${telephone}</span>
            <div id="buynu"><@spring.messageText "buythen.text5024" "兑换数量"/><span id="buynum">${ordinaryMyMasanumber}</span>
            </div>
            <div class="seat"><@spring.messageText "buythen.text5025" "排队位置"/><span id="myseat"></span>
            </div>
        </div>
        <div id="aftermg"><@spring.messageText "buythen.text5026" "后方增加包数"/><span></span></div>
    </div>
    <div class="center-box" id="center-box">
        <h3><@spring.messageText "buythen.text5021" "目前全球有"/><span></span><@spring.messageText "buythen.text5022" "个智慧包等待购买"/>
    </h3>
    <p><@spring.messageText "century.alternate.text1" "您将预订第二世纪的智慧包，每个智慧包中包含300个MN"/></p>
    <!--<p><@spring.messageText "buythen.text5038" "本世纪每区块可产生"/><b>${generateMpCount}</b><@spring.messageText "buythen.text5030" "个智慧包，每个智慧包有"/><b id="mpMnCount">${mpMnCount}</b> <@spring.messageText "buythen.text5032" "个MN"/></p>-->
    <!-- <p><@spring.messageText "buythen.text5035" "本世纪还可以产生"/> <b id="marginMpCount">${marginMpCount}</b> <@spring.messageText "buythen.text5030" "个智慧包，每个智慧包有"/><b id="mpMnCount">${mpMnCount}</b> <@spring.messageText "buythen.text5032" "个MN"/></p>
        <p><@spring.messageText "buythen.text5035" "本世纪还可以产生"/> <b id="marginMpCount">${marginMpCount}</b>, <@spring.messageText "buythen.text50300" "当前区块数"/>:<b id="blockCount">${blockCount}</b></p> -->
    </div>
</div>
<script>
$(function(){
    var marginBlockTime = $("#marginBlockTime").val();
    var startTime = new Date().getTime();
    var msiteBlock = $("#msiteBlockCount").val();
    var ordinaryMyQueueNumber = $("#ordinaryMyQueueNumber").val();
    var ordinaryMyMasanumber = $("#ordinaryMyMasanumber").val();
    var allNum,marginMpCount=$("#marginmpcount", window.parent.document).html();
    function INIT(){
        var _self = this;
        //console.log(marginBlockTime)
        this.timec = $("#timec")

        // var numTime = setInterval(function(){
        //   _self.setI();
        // },100)

        //_self.leftData();
        var leftDataTime = setInterval(function(){
          //console.log(marginBlockTime)
          _self.leftData();
        },3000)

        _self.rightData();
        var rightDataTime = setInterval(function(){
          _self.rightData();
        },10000)
    };
    INIT.prototype = {
//         setI:function(){
//             var nowTime = new Date().getTime();
//             var timeC = Math.floor((nowTime - startTime)/100);
//             //console.log(timeC);
//             var timeText = (Math.floor((marginBlockTime)/100)+timeC)/10
// //            this.timec.text(timeText.toFixed(1)+"s")  // TODO
//             this.timec.text("90s")
//         },
//         setM:function(){
            
//         },
        leftData: function(){
            var _self = this;
            $.ajax({
                url: "/cycle/sync/block/chain",
                type: "POST",
                //data: { name: "super", age: 20 },
                dataType: "json",
                success: function (data) {
                    var datar = data.data
                    //console.log(data)
                    if (data.status==0) {
                        if(msiteBlock != datar.msiteBlockCount){
                            _self.rightData();
                            marginBlockTime = 0;
                            startTime = new Date().getTime();
                            msiteBlock = datar.msiteBlockCount;
                            //console.log(marginBlockTime)
                            $("#blockAvgGenerateTime").html((datar.blockAvgGenerateTime/1000).toFixed(1));
                            //$("#blockAvgGenerateTime").html("90.0");
                            //$("#generateMpCount").html(datar.generateMpCount);
                            marginMpCount = (datar.centuryEndBlockCount - datar.msiteBlockCount)*datar.generateMpCount;
                            window.parent.changeMarginMpCount(marginMpCount);
                            window.parent.bookedMarginMpCount(marginMpCount,allNum);
                            //$("#marginMpCount").html(marginMpCount);
                            $("#blockCount").html(msiteBlock);
                        }
                    }else{
                        alertBoxFunc(data.error.message,"sure");
                    };
                },
                fail: function (status) {
                        location.reload();
                }
            });
        },
        rightData:function(){
            var _self = this;
            //window.parent.changeNum2();
            $.ajax({
                url: "/cycle/sync/buy/mp/info",
                type: "POST",
                //data: { name: "super", age: 20 },
                dataType: "json",
                success: function (data) {
                    var datar = data.data;
                    var beformg,aftermg,myseat;
                    //console.log("right:"+data)
                    if (data.status==0) {
                        allNum = datar.ordinaryLastNumber - datar.ordinaryFirstNumber;
                        if(ordinaryMyQueueNumber!=0 && ordinaryMyQueueNumber < datar.ordinaryFirstNumber){
                          //console.log(ordinaryMyQueueNumber+":"+datar.ordinaryFirstNumber)
                          _self.findMyOrder();
                        }
                        if(ordinaryMyQueueNumber == 0||!ordinaryMyQueueNumber||ordinaryMyQueueNumber==""||ordinaryMyQueueNumber==null||ordinaryMyQueueNumber < datar.ordinaryFirstNumber ){
                          beformg = allNum ;
                          aftermg = "0";
                          myseat = "-";
                        }else{
                          myseat = ordinaryMyQueueNumber - datar.ordinaryFirstNumber
                          beformg = myseat - ordinaryMyMasanumber;
                          if(beformg < 0){
                            beformg = 0;
                          }
                          aftermg = datar.ordinaryLastNumber - ordinaryMyQueueNumber;
                        }
                        window.parent.changeNum2(datar.ordinaryFirstNumber);
                        if(marginMpCount){
                        	    window.parent.bookedMarginMpCount(marginMpCount,allNum);
                        }
                        // console.log(data)
                        $("#center-box h3").html('<em class="pos-box"><p class="pso-left-tit"><@spring.messageText "buythen.text5021" "目前全球有"/></p>'+ _self.numberToSpan(""+allNum)+'<p class="pso-right-tit"><@spring.messageText "buythen.text5022" "个智慧包等待购买"/></p></em>')
                        $("#beformg span").html(beformg);
                        $("#aftermg span").html(aftermg);
                        $("#myseat").html(myseat);
                        $("#ordinaryMyMasanumber").html(ordinaryMyMasanumber);
                        $("#mpMnCount").html(datar.mpMnCount);
                    }else{
                        alertBoxFunc(data.error.message,"sure");
                    };
                },
                fail: function (status) {
                        location.reload();
                }
            });
        },
        findMyOrder:function(){
            var _self = this;
            $.ajax({
                url: "/cycle/first/queue/order",
                type: "POST",
                //data: { name: "super", age: 20 },
                dataType: "json",
                success: function (data) {
                    var datar = data.data;
                    //console.log("findMyOrder:"+data)
                    if (status==0) {
                        if(datar.queuedNumber||datar.queuedNumber!=null){
                            ordinaryMyQueueNumber = datar.queuedNumber ;
                            $("#buynum").text(datar.masanumber);
                        }else{
                            ordinaryMyQueueNumber = 0 ;
                        }
                        _self.rightData();
                    }else{
                        alertBoxFunc(data.error.message,"sure");
                    };
                },
                fail: function (status) {
                        location.reload();
                }
            });
        },
        numberToSpan:function(num){
            var numer = num.split('');
            var html = "";
            for (var i = 0; i < numer.length; i++) {
              html+="<span>"+numer[i]+"</span>"
            };
            return html;
        }
    }
    var init = new INIT();
});
</script>
</body>
