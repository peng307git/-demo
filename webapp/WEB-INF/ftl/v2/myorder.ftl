<#include "common/base-v2.ftl" />
<#macro title>
    <@spring.messageText "safety.text1" "账户"/>
</#macro>
<#macro head>
<link rel="stylesheet" type="text/css" href="/static/css/myorder.css"/>
<link rel="stylesheet" type="text/css" href="/static/css/shippingAddress.css">
</#macro>

<#macro body>
    <#assign nav_page="user" >
    <#assign nav_sub_page="user_myorder" >
<div class="wrap">
    <#include "common/header.ftl" >
    <div id="bd">
        <div class="bd-inner">
            <div class="page-title">
                <h2><@spring.messageText "account.info.text1" "个人中心"/></h2>
            </div>
            <div class="page-content deal-page-content clearfix">
                <div class="col-m">
                    <div class="m-wrap">
                        <div class="order-box">
                            <div class="way-tab clearfix">
                                <span class="active"><@spring.messageText "myorder.text2" "物流订单"/></span><!-- <span><@spring.messageText "myorder.text3" "自取订单"/></span> -->
                            </div>
                            <div class="status-tab" id="status-tab">
                                <span order-status = "-1" ><@spring.messageText "myorder.text4" "全部订单"/></span>
                                <span order-status = "0"><@spring.messageText "myorder.text5" "待发货"/></span>
                                <span order-status = "1"><@spring.messageText "myorder.text6" "已发货"/></span>
                                <span order-status = "3"><@spring.messageText "myorder.text7" "已完成"/></span>
                            </div>
                            <div id="order-list">
                                <ul class="order-list">
                                </ul>
                            </div>
                            <div id="pagebox">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-s">
                    <#include "common/user_side_nav.ftl" >
                </div>
            </div>

        </div>
    </div>
    <#include "/decorators/footer.ftl" >
</div>
</#macro>
<!--   国际地址 -->
</div>
<#macro footerjs>
<script type="text/javascript" src="/static/js/business/useralert.js"></script>
<script type="text/javascript" src="/static/js/business/paging.js"></script>

<script type="text/javascript" src="/static/js/libin.js"></script>
<script type="text/javascript" src="/static/js/business/addressCountry.js"></script>
<script type="text/javascript" src="/static/js/business/shippingAddress.js"></script>
<script>
	$(function(){
        var expressArry = ['0','<@spring.messageText "myorder.text11" "顺丰快递"/>','<@spring.messageText "myorder.text27" "亚宇速运"/>','EMS']
        var expressURLArry = ['0','0','http://yy566.com','http://www.ems.com.cn']
        function changeStatus(status){
            var paging = new pagingFunc({
                pageBox:"#pagebox",
                ajaxUrl:"/v2/user/safety/myorder/list",
                type: "GET",
                pageKey:"order_page",
                sizeKey:"order_size",
                size:5,
                mode:"Server",
                otherData:"status="+status,
                intoBox : function(data){ 
                    var datar = data.rows; 
                    //var datar = [{"orderId":"1234","txId":"9876","mailNo":"24680","status":"0","deviceType":"orderTitleorderTitleorderTitleorderTitle","deviceNum":"9","addTime":"orderTime","userName":"布鲁斯·李","costUsd":"49999999.99","fastMailType":"1","address":"中国山东省青岛市李沧区中国山东省青岛市李沧区临汾路海怡新城锦绣园4号楼一单元702户","iphone":"18615327858"}];//前端假数据
                    //console.log(datar[1].orderNumber);
                    var htmlT="";
                    if (datar==null || datar.length <= 0) {
                        htmlT='<h3>'+' <@spring.messageText "buylink.text57" "您当前没有订单记录"/> '+'</h3>';
                    } else{
                        htmlT='<ul class="order-list">';
                        for(var i = 0 ; i < datar.length ; i++){
                            var orderId = datar[i].orderId; 
                            var orderNumber = datar[i].txId ;
                            var expressNumber = datar[i].mailNo ;
                            var orderStatus = datar[i].status;
                            //var orderPicture = datar[i].orderPicture;
                            var orderPicture = '/static/images/mindlink.jpg';
                            var orderTitle = "";
                            if(datar[i].deviceType==1){
                                orderTitle = 'Mind Link <@spring.messageText "myorder.text24" "设备"/>';
                            }
                            var quantity = datar[i].deviceNum;
                            var orderTime = datar[i].addTime;
                            var Name = datar[i].userName;
                            var orderAmount = datar[i].costUsd;
                            var fastMailType = datar[i].fastMailType;
                            var orderAddress = datar[i].address;
                            var orderIphone = datar[i].telephone;
                            htmlT += '<li class="order" id="'+orderId+'">'+
                                        '<div class="order-top clearfix">'+
                                            '<span class="check-expressage">';
                            if (orderStatus==0||orderStatus==2) {
                                htmlT +='</span><span class="status wait"><i></i><@spring.messageText "myorder.text5" "待发货"/></span>';
                            } else if(orderStatus==1){
                                if (expressNumber==""||expressNumber == null ) {
                                    htmlT +='</span><span class="status delivery"><i></i><@spring.messageText "myorder.text6" "已发货"/></span>';
                                } else{
                                    htmlT +='<a href="javascript:void(0);"><@spring.messageText "myorder.text8" "查看物流"/></a></span><span class="status delivery"><i></i><@spring.messageText "myorder.text6" "已发货"/></span>';
                                }
                            }else if(orderStatus==3){
                                htmlT +='</span><span class="status complete"><i></i><@spring.messageText "myorder.text7" "已完成"/></span>';
                            };
                            htmlT +='<@spring.messageText "myorder.text9" "订单编号"/>：'+orderNumber+' <em class="line"></em> '
                            if (orderStatus==0||orderStatus==2) {
                                htmlT +='<@spring.messageText "myorder.text10" "暂无物流信息"/>';
                            } else if(orderStatus==1 || orderStatus==3){
                                if (expressNumber==""||expressNumber == null ) {
                                    htmlT +='<@spring.messageText "myorder.text10" "暂无物流信息"/>';
                                } else{
                                    htmlT += expressArry[fastMailType]+'：'+expressNumber;
                                };
                            };
                             
                            htmlT +='</div>'+
                                    '<div class="order-section clearfix"><img src="'+orderPicture+'" alt="">'+
                                        '<div class="order-content">'+
                                            '<p title="'+orderTitle+'">'+orderTitle+'</p>'+
                                            '<p>X '+quantity+'</p>'+
                                            '<em>'+orderTime+'</em>'+
                                        '</div>'+
                                    '<div class="order-info">'+
                                        '<p><@spring.messageText "myorder.text12" "收件人"/>：<span class="spanName">'+Name+'</span></p>'+
                                        '<p><@spring.messageText "safety.text69" "电话"/>：<span class="spanIphone">'+orderIphone+'</span></p>'+
                                        '<p><@spring.messageText "address" "地址"/>：<span class="spanorderAddress">'+orderAddress+'</span></p>';
                            if(orderStatus==0||orderStatus==2){
                                htmlT += '<button><@spring.messageText "myorder.text23" "编辑"/></button>';
                            }
                            htmlT +='</div>'+
                                    '<div class="order-amount"><span><@spring.messageText "myorder.text13" "订单金额"/></span><br/>$'+orderAmount+'</div>'+
                                    '<div class="order-operation">';
                            if(orderStatus==0||orderStatus==2){
                                htmlT +='</div></div><input class="order_number" type="hidden" value="'+orderId+'">';
                            }else if(orderStatus==1){
                                htmlT +='<button class="receipt"><@spring.messageText "myorder.text14" "确认收货"/></button></div></div><input class="order_number" type="hidden" value="'+orderId+'"><input class="express_number" type="hidden" value="'+expressNumber+'"><input class="express_type" type="hidden" value="'+fastMailType+'"><input class="express_address" type="hidden" value="'+orderAddress+'"><input class="express_iphone" type="hidden" value="'+orderIphone+'">';
                            }else if(orderStatus==3){
                                htmlT +='<button class="delete"><@spring.messageText "myorder.text15" "删除订单"/></button></div></div><input class="order_number" type="hidden" value="'+orderId+'"><input class="express_number" type="hidden" value="'+expressNumber+'">';
                            };
                            // htmlT +='<input class="order_number" type="hidden" value="1928682753265"><input class="express_number" type="hidden" value="89676987654">';
                            htmlT += '</li>' ;
                        }
                        htmlT += '</ul>';
                    };
                    $("#order-list").html(htmlT);
                }
            });
        }

        $("#status-tab").on('click', 'span', function(event) {
            $(this).addClass('active').siblings().removeClass('active');
            changeStatus($(this).attr('order-status'));
        });
        $("#status-tab").find('span').eq(0).trigger('click');
        /*查看物流*/
        $("#order-list").on('click', 'li .check-expressage a', function(event) {
            var parent = $(this).parent().parent().parent();
            var orderNumber = parent.find('.order_number').val();
            var expressInfo = parent.find('.express_number').val();
            var expressType = parent.find('.express_type').val();
            var expressAddress = parent.find('.express_address').val();
            console.log(orderNumber);
            $.ajax({
                type : "GET",
                url : '/v2/user/safety/myorder/logisticsInfo',
                data : {
                    'mailNo' : expressInfo,
                    'fastMailType':expressType
                },
                success : function(data) {
                    if (data.status == 0) {
                        var expressData = data.data.routes;
                        var expressHtml = '<div class="logistics_info"><div class="clearfix">'+expressArry[expressType]+'：'+expressInfo+'<em class="destination"><@spring.messageText "myorder.text17" "收货地址"/>：'+expressAddress+ '</em></div>';
                        if(expressType == 2||expressType == 3){
                            expressHtml += '<p> <@spring.messageText "myorder.text26" "本网站暂不提供该物流的运单追踪信息，请复制运单号并前往该物流官网进行查询"/> <a target="_blank" href="'+expressURLArry[expressType]+'">'+expressURLArry[expressType]+'</a></p>';
                        } else{
                            if (expressData.length<=0) {
                                expressHtml += '<h3><@spring.messageText "myorder.text25" "商品已出库，等待快递公司揽件，请耐心等待！"/></h3>';
                            }else{
                                expressHtml += '<ul>';
                                for (var i = 0; i < expressData.length ; i++) {
                                    expressHtml += '<li>'+expressData[i].acceptTime+'  '+expressData[i].remark+'</li>'
                                };
                                expressHtml += '</ul></div>'
                            };
                        }
                        
                        alertBoxNew({
                            alertTitle:'<@spring.messageText "myorder.text16" "物流信息"/>',
                            alertContent:expressHtml,
                            alertWidth:"640px",
                            btnType:'none'
                        });
                     } else {
                        alertBoxFunc(data.error.message, "sure");
                    }
                },
                error : function(err) {
                    alertBoxFunc(err, "sure");
                }
            });
           
        })
        /*确认收货*/
        $("#order-list").on('click', 'li .receipt', function(event) {
            var _self = $(this);
            alertBoxNew({
                alertContent:'<@spring.messageText "myorder.text18" "是否确认收货?"/>',
                alertType:"success",
                sureFunc:function(){
                    var parent = _self.parent().parent().parent()
                    var tabNow = $("#status-tab").find('span.active').index();
                    
                    var orderNumber = parent.find('.order_number').val();
                    $.ajax({
                        type : "get",
                        url : '/v2/user/safety/myorder/completeOrder/'+orderNumber,
                        data : {},
                        success : function(msg) {
                            if (msg.status == 0) {
                                if (tabNow==0) {
                                    parent.find('.order-top .status').removeClass('delivery').addClass('complete').html('<i></i><@spring.messageText "myorder.text7" "已完成"/>');
                                    parent.find('.order-top .check-expressage').html("");
                                    //console.log(orderNumber);
                                    _self.parent().html('<button class="delete"><@spring.messageText "myorder.text15" "删除订单"/></button>');
                                } else {
                                    parent.remove();
                                    //$("#status-tab").find('span').eq(tabNow).trigger('click');
                                };
                            } else {
                                alertBoxFunc(msg.error.message, "sure");
                            }
                           
                        },
                        error : function(err) {
                            alertBoxFunc(err, "sure");
                        }
                    });
                        
                    
                },
            });
        });
        /*删除订单*/
        $("#order-list").on('click', 'li .delete', function(event) {
            var _self = $(this);
            alertBoxNew({
                alertContent:'<@spring.messageText "myorder.text19" "是否删除订单?"/>',
                alertType:"warning",
                sureFunc:function(){
                    var parent = _self.parent().parent().parent();
                    var orderNumber = parent.find('.order_number').val();
                    $.ajax({
                        type : "get",
                        url : '/v2/user/safety/myorder/deleteOrder/'+orderNumber,
                        data : {},
                        success : function(msg) {
                            if (msg.status == 0) {
                                parent.remove();
                                //var tabNow = $("#status-tab").find('span.active').index();
                                //$("#status-tab").find('span').eq(tabNow).trigger('click');
                            } else {
                                alertBoxFunc(msg.error.message, "sure");
                            }
                        },
                        error : function(err) {
                            alertBoxFunc(err, "sure");
                        }
                    });
                }
            })
        });
        /*修改地址*/
        $("#order-list").on('click', 'li .order-info button', function(event) {
            var _this = $(this).parent().parent().parent();
            var orderId = _this.find('.order_number').val();
            var orderIphone = _this.find('.spanIphone').text();
            var orderName = _this.find('.spanName').text();
            var orderAddress = _this.find('.spanorderAddress').text();
            
            var alertHtml = '<div id="changeAddressBox"><ul><li><em class="add" ondblclick="return false;"><@spring.messageText "safety.text64" "新增地址"/></em><i class="thisNow"></i><div><p>'+orderName+'&nbsp;&nbsp;&nbsp;&nbsp;'+orderIphone+'</p><p class="alert-address">'+orderAddress+'</p></div></li></ul>';
            $.ajax({
                url: '/user/userAddress',
                type: 'GET',
                data:{
                    'user_address_page': 0,
                    'user_address_size':200,
                    'orderByRule':1
                },
                success: function(data){
                    alertHtml += '<div class="address-list">'+pinHtml(data)+'</div></div>';
                    alertBoxNew({
                        alertIndex:90,
                        alertWidth:"460px", 
                        alertTitle:'<@spring.messageText "myorder.text20" "修改收货地址"/>', 
                        alertContent:alertHtml, 
                        btnType:'all', 
                        readyFunc:function(){
                            $("#changeAddressBox .address-list").on('click', 'li', function(event) {
                                event.preventDefault();
                                $("#changeAddressBox").find('.warning').text('');
                                $(this).addClass('active').siblings().removeClass('active');
                            });
                        },
                        sureFunc:function(){
                            var addressId = $("#changeAddressBox").find('.address-list li.active').find('.listId').val();
                            if(!addressId||addressId == ""){
                                alertBoxNew({
                                    alertType:"warning",
                                    alertContent:'<@spring.messageText "myorder.text21" "地址未作任何修改！"/>', 
                                    btnType:'sure'
                                })
                            }else{
                                setAddress(orderId,addressId)
                            }
                        }
                    });
                }
            })
        })
        function pinHtml(data){
            var datar = data.data.rows;
            var alertHtml = "";
            alertHtml += '<ul>';
            for (var i = 0; i < datar.length; i++) {
                if(datar[i].countryCode == 86 ){
                    alertHtml += '<li id="'+datar[i].id+'"><em class="edit" addressid="'+datar[i].id+'" ondblclick="return false;" ><@spring.messageText "safety.text10" "修改"/></em><i class="thisNow"></i><div><p>'+datar[i].name +'&nbsp;&nbsp;&nbsp;&nbsp;'+ datar[i].phone +'</p><p class="alert-address">'+ datar[i].country+ datar[i].province + datar[i].city + datar[i].area+ datar[i].detailedAddress +'</p></div><input class="listId" type="hidden" value="'+datar[i].id+'"/></li>';
                }else{
                    alertHtml += '<li id="'+datar[i].id+'"><em class="edit" addressid="'+datar[i].id+'" ondblclick="return false;"><@spring.messageText "safety.text10" "修改"/></em><i class="thisNow"></i><div><p>'+datar[i].name +'&nbsp;&nbsp;&nbsp;&nbsp;'+ datar[i].phone +'</p><p class="alert-address">'+ datar[i].country+ datar[i].province + datar[i].city + datar[i].detailedAddress +'</p></div><input class="listId" type="hidden" value="'+datar[i].id+'"/></li>';
                }
            };
            alertHtml += '</ul>';
            return   alertHtml ;
        }
        /*确定修改地址*/
        function setAddress(orderId,addressId){
            $.ajax({
                url: '/v2/user/safety/myorder/updateOrderInfo',
                type: 'POST',
                data:{
                    'orderId': orderId,
                    'addressId':addressId
                },
                success: function(data){
                    console.log("success"+orderId+":"+addressId);
                    var infoBox = $("#order-list").find('#'+orderId).find('.order-info');
                    infoBox.find('.spanName').text(data.data.username);
                    infoBox.find('.spanIphone').text(data.data.telephone);
                    infoBox.find('.spanorderAddress').text(data.data.address);
                    infoBox.append('<em><@spring.messageText "myorder.text22" "修改成功"/></em>').find('button').remove();
                }
            })
        }
        //地址库插件
        var shiper = new shippingAddress({
            addbtn:"#changeAddressBox li .add",
            modifybtn:"#changeAddressBox .address-list .edit",
            addsuccess:function(){
                //console.log("添加地址成功后执行函数");
                shipping();
            },
            modifysuccess:function(id){
                //console.log("修改地址成功后执行函数"+id);
                shipping(id);
            }
        });
        function shipping(id){
            var alertHtml = "";
            $.ajax({
                url: '/user/userAddress',
                type: 'GET',
                data:{
                    'user_address_page': 0,
                    'user_address_size':200,
                    'orderByRule':1
                },
                success: function(data){
                    alertHtml = pinHtml(data);
                    $("#changeAddressBox").find('.address-list').html(alertHtml);
                    var thatLi = $("#changeAddressBox .address-list").find('li').eq(0);
                    if(id){
                        thatLi = $("#changeAddressBox .address-list").find('#'+id);
                    }
                    thatLi.addClass('active').siblings().removeClass('active');
                }
            })
        }
    })
</script>


</#macro>
