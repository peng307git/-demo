<#include "common/base-v2.ftl" />
<#macro title>
    <@spring.messageText "buy_center" "认购中心"/>
</#macro>

<#macro head>
<style type="text/css">

    .main{  width: 100%;
        height: 1480px;
        background: #1b2a4b url(/static/images/messageWrap.jpg) no-repeat center -145px;
        text-align: center;
    }
    .text-center h2{
        font-size: 30px;
        color: #fff;
        font-weight: bold;
        padding: 20px 0 10px 0;
    }
    .text-center p{
        width: 640px;
        height: 120px;
        line-height: 30px;
        margin-top: 30px;
        text-indent: 30px;
        color:#f6f6f7;
        font-size: 18px;
        text-align: left;
        display: inline-block;
        font-weight: normal;
    }
    .btndiv{
        margin-top: 80px;
        height: 60px;
    }
    .btndiv strong{
        font-size: 18px;
        color: #fff;
    }
    .btndiv span{
        color: yellow;
        font-size: 37px;
    }
    #link_btn{
        display: inline-block;
        height: 80px;
        width: 260px;
        background-color: #008df4;
        color: #fff;
        font-size: 27px;
        border-radius: 35px;
        border:none;
        cursor: pointer;
    }
    .foot_link{
        display: inline-block;
        margin-bottom: 10px;
        width: 1080px;

    }
    .link_head{
        width: 100%;
        height: 50px;
        background:#242f38;
        color: #fff;
        font-size: 14px;
    }
    .link_head ul,.link_body ul{
        width: 1026px;
        height: 50px;
        display: inline-block;
        line-height: 50px;
    }
    .link_head ul li{
        float: left;
    }
    .width1{ width: 298px; }
    .width2{ width: 202px; }
    .width3{ width: 223px; }
    .width4{ width: 97px; }
    .width5{ width: 206px; }
    /*.width6{ width: 104px; }
    .width7{ width: 124px; }
    .width8{ width: 144px; }
    */

    .link_body{
        width: 100%;
        height: auto;
        background: #f8f8f8;
        color: #000;
        font-size: 12px;

    }
    .link_body ul li{
        float: left;

    }
    .link_active{
        background: #d4d4d4 !important;
    }
    .buy_none{
        height: 350px;
        background: #eeeeee url(/static/images/link_icon.png) 510px 96px no-repeat;
    }
    .buy_none_span{
        display: inline-block;
        margin-top: 175px;
        font-size: 16px;
        color: #a6a6a6;
    }
    .table-pager{
        background: #f8f8f8;
    }
    .btnli{
        padding-bottom: 20px;
    }
    .buy-link-note{
        padding-bottom: 90px;
    }
    .buy-link-note p{
        text-align:center;
        line-height:24px;
        color: #A4AAB7;
        font-size: 12px;
    }
    .main-buycenter{
        height: auto;
    }
</style>
</#macro>
<#macro body>

<div class="wrap asset-manager">
    <#include "common/header.ftl" >
    <div class="main main-buycenter">

        <img src="/static/images/img13.png">
        <div class="text-center">
            <h2><@spring.messageText "buy.text1" "意念力穿戴设备"/></h2>
            <p>
                <@spring.messageText "buy.text2" "意念力穿戴设备，又名Mind Link(脑电波头箍)，它通过与移动设备APP进行蓝牙连接来采集人体大脑的生物电波。Mind Asset系统通过评定每个人的放松和专注程度，将未来财富分配给那些心态平静、拥有智慧以及内心充满爱的人。"/>
            </p>
        </div>
        <div class="text-center btndiv">
            <strong><@spring.messageText "buylink.text4" "价值"/></strong> <span>$100</span><br/>

        </div>
        <div class="text-center btnli">
            <button id="link_btn"><@spring.messageText "buythen.text97" "立即兑换"/></button>
        </div>
        <div class="buy-link-note">
            <p><@spring.messageText "buylink.text80" "* IOS支持iphone5及以上手机设备"/></p>
            <p><@spring.messageText "buylink.text81" "Android支持4.1及以上的手机设备"/></p>
        </div>
        <div class="foot_link">
            <div class="link_head">
                <ul class="head_ul">
                    <li class="width1"><@spring.messageText "buythen.text23" "订单号"/></li>
                    <li class="width2"><@spring.messageText "buylink.text39" "订单时间"/> </li>
                    <li class="width3"><@spring.messageText "buylink.text40" "商品名称"/></li>
                    <li class="width4"><@spring.messageText "buylink.text41" "兑换数量"/></li>
                    <li class="width5"><@spring.messageText "buythen.text26" "支付金额（BTC）"/></li>
                    <!--  <li class="width6">当前状态</li>
                     <li class="width7">配货方式</li>
                     <li class="width8">物流信息</li> -->
                </ul>
            </div>
            <div class="link_body">

            </div>
            <div class="table-pager">

            </div>

        </div>

    </div>
</div>
    <#include "/decorators/footer.ftl" >
</#macro>

<#macro footerjs>
<script type="text/javascript" src="/static/js/business/paging.js"></script>
<script>
    $(function(){
        $(".body_ul:even").css("background","#eee");  //隔行变色
        //鼠标移入变色
        $('.body_ul').hover(function(){
            $('.body_ul').removeClass('link_active')
            $(this).addClass('link_active');
        },function(){
            $(this).removeClass('link_active');
        })

        $('#link_btn').click(function(){
            window.location.href = "/deal/buy_order";
        })


        //提现记录分页

        var paging = new pagingFunc({
            pageBox:".table-pager",
            ajaxUrl:"/user/userBuyOrder",
            type: "Get",
            pageKey:"user_order_page",
            sizeKey:"user_order_size",
            size:10,
            mode:"Server",
            intoBox : function(data){ //因数据和页面DOM结构需求不一样， 有 ajaxUrl 时 必须定义 paging.intoBox ，将数据写入DOM。
                var rows = data.rows;
                var htmlT="";
                if (data.total== 0) {
                    $('.link_body').addClass('buy_none').html('<span class="buy_none_span"><@spring.messageText "buylink.text57" "您当前没有订单记录"/><span>');

                }
                else{
                    for(var i = 0 ; i < rows.length ; i++){
                        var ordernumber = rows[i].txId; //编号
                        var buytime = rows[i].addTime;         //时间
                        var mindlinknum = rows[i].deviceNum; //设备数量
                        var cost = rows[i].cost;   //美元
                        var btcRate = rows[i].btcRate; //btc价格
                        var buymoney = cost/btcRate;  //btc价格
                        var d = new Date(buytime);         //根据时间戳生成的时间对象
                        var date = (d.getFullYear()) + "-" +
                                (d.getMonth() + 1) + "-" +
                                (d.getDate()) + "  " + " "+
                                (timetow(d.getHours())) + ":" +
                                (timetow(d.getMinutes())) + ":" +
                                (timetow(d.getSeconds()));
                        htmlT +=    '<ul class="body_ul">'+
                                '<li class="width1">'+ordernumber+'</li>'+
                                '<li class="width2">'+buytime+'</li>'+
                                '<li class="width3">MindLink<@spring.messageText "buylink.text5" "设备"/></li>'+
                                '<li class="width4">'+mindlinknum+'</li>'+
                                '<li class="width5">'+buymoney.toFixed(4)+'</li>'+
                                    // '<li class="width6"> － </li>'+
                                    // '<li class="width7"> － </li>'+
                                    // '<li class="width8"> － </li>'+
                                '</ul>'

                    }
                    $(".link_body").html(htmlT);
                };

            }
        });
        function timetow(obj){
              if( obj < 10 ){
                  obj = "0"+obj;
              }
              else{
                  obj = ""+obj;
              }
              return obj;
        }

    })
</script>
</#macro>
