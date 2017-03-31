/**
* 添加修改地址
* var shiper = new shippingAddress({
*    addbtn:"#addressAdd",//添加地址按钮
*    modifybtn:".width_xiu",//修改按钮，必须有自定义addressid标签 addressid="当前地址id"
*    addsuccess:function(){
*        //添加地址成功后执行函数;
*    },
*    modifysuccess:function(){
*        //修改地址成功后执行函数;
*    }
* });
* 20161029 by YangZujian
**/
var shippingAddress=function(data){
    var _self = this;
    _self.addsuccess = data.addsuccess;
    _self.modifysuccess = data.modifysuccess;
    _self.typer = 0;
    _self.aim = 0;
    _self.modifyId = "";
    _self.uid = "";
    if(data.addbtn){
        _self.addressAdd(data.addbtn);
    }
    if(data.modifybtn){
        _self.addressModify(data.modifybtn);
    }
	//国际化资源文件
    _self.language=langType();
    $.i18n.properties({
        name : 'address', //资源文件名称
        path : '/static/i18n/', //资源文件路径https://o5uaa1ha4.qnssl.com
        cache: true,
        mode : 'map', //用Map的方式使用资源文件中的值
        language : _self.language,
        callback : function(){
            _self.ready();
        }
    });
    if (_self.language=="en") {
        _self.typer = 1;
    } else {
        _self.typer = 0;
    };
    //切换到国际地址
    $(document).on('click', '.addressflip .btninter', function(event) {
        event.preventDefault();
        _self.typer = 1;
        _self.changeType();
    });
    //切换到大陆地址
    $(document).on('click', '.addressflip .btnchina', function(event) {
        event.preventDefault();
        _self.typer = 0;
        _self.changeType();
    });
}

var protoAdd = shippingAddress.prototype;

protoAdd.ready=function(){
    var _self = this;
    //关闭
    $(document).on('click', '.addressflip .bgblack', function(event) {
        event.preventDefault();
        _self.closeFlip();
    });
    $(document).on('click', '.addressflip .countnone', function(event) {
        event.preventDefault();
        _self.closeFlip();
    });
    //保存/提交
    $(document).on('click', '.addressflip #savebtn', function(event) {
        event.preventDefault();
        _self.submitData();
    });
}
//添加地址
protoAdd.addressAdd=function(id){
    var _self = this;
    $(document).on('click',id, function(event) {
        event.preventDefault();
        $(".addressflip").remove();
        _self.aim = 0;
        _self.readyHtml();
    });
}
//修改地址
protoAdd.addressModify=function(id){
    var _self = this;
    $(document).on('click',id, function(event) {
        event.preventDefault();
        $(".addressflip").remove();
        var addressId = $(this).attr('addressid');
        _self.aim = 1;
        _self.modifyId = addressId;
        _self.getdate(addressId);
    });
    $(document).on("dblclick",id, function() { //双击事件 
       event.preventDefault();
       return false;
    })
}
//HTML写入
protoAdd.readyHtml=function(oldData){
    var _self = this;
    var title = ""
    if(!oldData){
        title = $.i18n.prop('address.text2');
    }else{
        title = $.i18n.prop('address.text1');
        
        if(oldData.country=='中国'){
            _self.typer = 0;
        }else{
            _self.typer = 1;
        }
    }
    var htmler = [
        '<div class="addressflip">',
            '<div class="bgblack"></div> <div  class="countmain">',
                '<h2><span class="head_h2">'+title+'</span> <span class="countnone">X</span> </h2>',
                '<div class="countbody">',
                    '<div class="china">',
                        '<ul>',
                            '<li class="lileft">'+$.i18n.prop('address.text3')+'  <a href="####" class="btninter">'+$.i18n.prop('address.text4')+'</a>',
                               '（'+$.i18n.prop('address.text5')+'）',
                            '</li>',
                            '<li class="clearfix"><span class="textindent">'+$.i18n.prop('address.text6')+'</span>',
                                '<input maxlength="25" type="text" placeholder="'+$.i18n.prop('address.text7')+'" class="widthinput inputname my_name" >',
                                '<span class="error" id="china-name-error"> </span>',
                            '</li>',
                            '<li class="clearfix">',
                                '<span class="textindent">'+$.i18n.prop('address.text8')+'</span>',
                                    '<div class="parent">',
                                        '<select class="sheng" id="province" name="province" >',
                                      　　　　'<option id="choosePro" value="-1">请选择您所在省份</option>',
                                        '</select>',
                                    '</div>',
                                    '<div class="parent">',
                                        '<select id="citys"  class="shi" name="city" >',
                                            '<option id="chooseCity" value="-1">请选择您所在城市</option>',
                                        '</select>',
                                    '</div>',
                                    '<div class="parent">',
                                        '<select id="county"  class="diqu" name="county">',
                                            '<option id="chooseCounty" value="-1">请选择您所在区/县</option>',
                                        '</select> ',
                                    '</div>',
                                '<span class="error" id="diqu-error"> </span>',
                            '</li>',
                            '<li class="clearfix"><span class="textindent">'+$.i18n.prop('address.text9')+'</span>',
                                '<input type="text" class="widthinput chinaaddress" placeholder="'+$.i18n.prop('address.text10')+'"> ',
                                '<span class="error" id="addres-error"> </span>',
                            '</li>',
                            '<li class="clearfix"><span class="textindent">'+$.i18n.prop('address.text11')+'</span>',
                                '<input type="text" class="widthinput chinacode NamberInput" placeholder="'+$.i18n.prop('address.text12')+'0">',
                                '<span class="error"> </span>',
                            '</li>',
                            '<li class="clearfix"><span class="textindent">'+$.i18n.prop('address.text13')+'</span>',
                                '<select  class="countryCode"  id="countryCode1"></select>',
                                '<input type="text" class="inputphone NamberInput" id="chinaphone" placeholder="'+$.i18n.prop('address.text14')+'">',
                                '<span class="error" id="chinaphone-error"></span>',
                            '</li>',
                        '</ul>',
                    '</div>',
                    '<div class="internation">',
                        '<ul>',
                            '<li class="lileft">'+$.i18n.prop('address.text15')+'<a href="####" class="btnchina">'+$.i18n.prop('address.text4')+'</a>',
                            '</li>',
                            '<li  class="clearfix"><span class="textindent">'+$.i18n.prop('address.text6')+'</span>',
                                '<input maxlength="25" type="text" class="widthinput intername" >',
                                '<span class="error" id="intername-error"></span> ',
                            '</li>',
                            '<li class="clearfix"><span class="textindent">'+$.i18n.prop('address.text16')+'</span>',
                                '<input type="text" class="widthinput interaddress"> ',
                                '<span class="error" id="interaddress-error"> </span>',
                            '</li>',
                            '<li class="clearfix"><span class="textindent">'+$.i18n.prop('address.text17')+'</span>',
                                '<input type="text" class="widthinput intershi" > ',
                                '<span class="error" id="intershi-error"></span>',
                            '</li>',
                            '<li class="clearfix"><span class="textindent">'+$.i18n.prop('address.text18')+'</span>',
                                '<input type="text" class="widthinput intersheng" >',
                                '<span class="error" id="intersheng-error"></span>',
                            '</li> ',
                            '<li  class="clearfix"><span class="textindent">'+$.i18n.prop('address.text11')+'</span>',
                                '<input  type="text" class="widthinput intercose NamberInput" >',
                                '<span class="error" id="intercose-error"> </span>',
                            '</li>',
                            '<li class="clearfix"><span class="textindent">'+$.i18n.prop('address.text19')+'</span>',
                                '<select class="countryCode" id="countryCode2" ></select>',
                                '<span class="error" id="countryCode-error"></span>',
                            '</li>',
                            '<li class="interright clearfix"><span class="textindent">'+$.i18n.prop('address.text13')+'</span>',
                                '<select  class="countryCode" id="countryCode3"></select>',
                                '<input type="text"  class="inputphone NamberInput" id="interphone" placeholder="'+$.i18n.prop('address.text14')+'">',
                                '<span class="error" id="interphone-error"></span>',
                            '</li>',
                        '</ul>',
                    '</div>',
                    '<button class="btn" id="savebtn">'+$.i18n.prop('address.text20')+'</button>',
                '</div>',
            '</div>',
        '</div>'
    ].join("");
    $('body').append(htmler);
    $(".error").text('');
    $(document).find('.addressflip .countmain').animate({"top": "50%"}, 300);
    var phonecode1 = $(document).find('.addressflip .countmain #countryCode1');
    var login1= new addressCountry({id:"#countryCode1",showId:true});

    var phonecode2 = $(document).find('.addressflip .countmain #countryCode2');
    var login2= new addressCountry({id:"#countryCode2",showId:false});

    var phonecode3 = $(document).find('.addressflip .countmain #countryCode3');
    var login3= new addressCountry({id:"#countryCode3",showId:true});

    var choosePro = $(document).find(".addressflip .china ")
    citychange(choosePro);
    choosePro.find('#province').on('change', function(event) {
        event.preventDefault();
        console.log("doProvAndCityRelation");
        choosePro.find('#citys').trigger('focus');
        doProvAndCityRelation();
        doCityAndCountyRelation();
    });
    choosePro.find('#citys').on('change', function(event) {
        event.preventDefault();
        choosePro.find('#county').trigger('focus');
        doCityAndCountyRelation();
    });
    choosePro.find('#citys').on('focus', function(event) {
        event.preventDefault();
        $(this).html("");
        doProvAndCityRelation();
    });
    choosePro.find('#county').on('focus', function(event) {
        event.preventDefault();
        $(this).html("");
        doCityAndCountyRelation();
    });
    _self.changeType();
    if(oldData){
        $(document).find(".addressflip .lileft").hide();
        _self.ModifyUpdate(oldData);
    }
    $("#countryCode2").change(function(event) {
        var valer = $(this).val();
        if(valer==86){
            $("#countryCode-error").html($.i18n.prop('address.text15')+'<a href="####" class="btnchina">'+$.i18n.prop('address.text4')+'</a>');
        }else{
            $("#countryCode-error").html("");
        }
    });
    ifblur( '.intername',$.i18n.prop('address.text21'));
    ifblur( '.interaddress',$.i18n.prop('address.text10'));
    ifblur( '#interphone',$.i18n.prop('address.text23'));
    ifblur( '.intershi',$.i18n.prop('address.text24'));
    ifblur( '.intersheng',$.i18n.prop('address.text24'));
    ifblur( '.intercose',$.i18n.prop('address.text25'));
    ifblur( '.inputname',$.i18n.prop('address.text21'));
    ifblur( '.chinaaddress',$.i18n.prop('address.text22'));
    ifblur( '#chinaphone',$.i18n.prop('address.text23'));
}
//根据地址id获取地址详情
protoAdd.getdate = function(id){
    var _self = this;
    $.ajax({
        url:"/user/defaultAddress",
        type:"GET",
        data:{'addressId':id},
        success:function(data){
            var datar = data.data;
            _self.readyHtml(datar);
        }
    });
}
//html数据更新
protoAdd.ModifyUpdate = function(datar){
    var _self = this;
    var myname =  datar.name; //姓名
    var myaddress = datar.detailedAddress;  //详细地址
    var myphone = datar.phone;   //电话
    var mysheng = datar.province;  //省
    var myshi = datar.city;    //市
    var myxian = datar.area;   //县
    var mycountry = datar.country; //国家
    var mycountrycode = datar.countryCode; //国家编码
    var myphonecode =datar.phoneCode; //电话区号
    _self.uid = datar.uid;
    var myareacode = datar.postCode;   //邮编
    var myprovince = datar.provinceCode;//省编码
    var mycitycode = datar.cityCode;    //市编码
    var myareacodes = datar.areaCode;   // 县编码

    if(myareacode==null || myareacode == 0 || myareacode ==""){
        myareacode = "000000";
    }
    if( mycountry == '中国'){
        $('.my_name').val(myname); //姓名
        $('.chinaaddress').val(myaddress);  // 详细地址
        $('#chinaphone').val(myphone); // 电话 diqucuo
        $("#countryCode1").val(myphonecode); //电话区号编码
        $('.sheng').val(myprovince);
        $('.shi').html("<option id='chooseCitymy_1' value="+mycitycode+">"+myshi+"</option>");
        $('.diqu').html("<option id='chooseCountymy' value="+myareacodes+">"+myxian+"</option>");
        $('.chinacode').val(myareacode);//邮编
    }else{     
        $('#countryCode2').val(mycountrycode); //国家地区编码
        $('#countryCode3').val(myphonecode); //  电话区号编码
        $('.intername').val(myname);
        $('.interaddress').val(myaddress);
        $('.intershi').val(myshi);
        $('.intersheng').val(mysheng);
        $('.intercose').val(myareacode);
        $('#interphone').val(myphone);
    }
}
//切换地址格式 大陆地址 / 国际地址
protoAdd.changeType = function(){
    var _self = this;
	if(_self.typer==1){
        $(document).find('.addressflip .china').hide();
        $(document).find('.addressflip .internation').show();
    }else if(_self.typer==0){
        $(document).find('.addressflip .china').show();
        $(document).find('.addressflip .internation').hide();
    }
}
//关闭
protoAdd.closeFlip= function(){
    $(document).find('.addressflip .countmain').animate({"top": "120%"},300, function() {
        $(".addressflip").remove();
    });
}
//提交数据
protoAdd.submitData = function(){
    var _self = this;
    var useName = "";
    var country = "";
    var sheng = " ";
    var shi = " ";
    var xian =" ";
    var countryCode ="86";
    var provincecode = " ";
    var citycode = " ";
    var areacodes = " ";
    var address = "";
    var areacode = " ";
    var phonecode ="";
    var phoneNumber = "";

    if(_self.typer == 0){
        useName = $.trim($('.inputname').val());  //姓名
        country = '中国';
        countryCode ="86";
        areacode = $.trim($('.chinacode').val());   //邮编
        var chinasheng = $('.sheng option:selected'); 
        sheng = chinasheng.text();//省
        var chinashi =   $('.shi option:selected');
        shi = chinashi.text();   //市
        var chinaxian = $('.diqu option:selected');
        xian =  chinaxian.text(); //县
        var chinaaddress = $.trim($('.chinaaddress').val()); 
        address = chinaaddress;//详细地址
        phonecode = $.trim($('#countryCode1').val());//电话编码
        phoneNumber = $.trim($('#chinaphone').val());    //电话
        provincecode=$('.sheng option:selected').val();//省编码
        citycode=$('.shi option:selected').val();    //市编码
        areacodes= $('.diqu option:selected').val();  //县编码
        if( useName == "" ){
            $("#china-name-error").text($.i18n.prop('address.text21'));
            return false;
        } else {
            $("#china-name-error").text('');
        }

        if(chinasheng.val() == "-1" || chinashi.val() == "-1" || chinaxian.val() == "-1"){
            $("#diqu-error").text($.i18n.prop('address.text26'));
            return false;
        } else {
            $("#diqu-error").text('');
        }

        if(chinaaddress == ""){
            $("#addres-error").text($.i18n.prop('address.text22'));
            return false;
        } else {
            $("#addres-error").text('');
        }

        if(phoneNumber =="" ){
            $("#chinaphone-error").text($.i18n.prop('address.text23'));
            return false;
        } else {
            $("#chinaphone-error").text('');
        }

        if(areacode == "" || !areacode || areacode == 0 ){
            areacode = "000000";
        }
    } else if(_self.typer == 1){
        useName = $.trim($('.intername').val());  //姓名
        country = $.trim($('#countryCode2 option:selected').text());
        countryCode = $.trim($('#countryCode2').val());
        areacode = $.trim($('.intercose').val());   //邮编
        var intersheng = $.trim($('.intersheng').val()); 
        sheng = intersheng;//省
        var intershi = $.trim($('.intershi').val());
        shi = intershi;   //市
        var interaddress = $.trim($('.interaddress').val()); 
        address = interaddress;//详细地址
        phonecode = $.trim($('#countryCode3').val());//电话编码
        phoneNumber = $.trim($('#interphone').val());//电话

        if( useName == "" ){
            $("#intername-error").text($.i18n.prop('address.text21'));
            return false;
        } else {
            $("#intername-error").text('');
        }

        if(interaddress == ""){
            $("#interaddress-error").text($.i18n.prop('address.text22'));
            return false;
        } else {
            $("#interaddress-error").text('');
        }

        if(intershi == ""){
            $("#intershi-error").text($.i18n.prop('address.text24'));
            return false;
        } else {
            $("#intershi-error").text('');
        }

        if(intersheng == ""){
            $("#intersheng-error").text($.i18n.prop('address.text24'));
            return false;
        } else {
            $("#intersheng-error").text('');
        }

        if( areacode == "" ){
            $("#intercose-error").text($.i18n.prop('address.text25'));
            return false;
        } else {
            $("#intercose-error").text('');
        }

        if(countryCode=="86"){
            $("#countryCode-error").html($.i18n.prop('address.text15')+'<a href="####" class="btnchina">'+$.i18n.prop('address.text4')+'</a>');
            return false;
        }

        if(phoneNumber =="" ){
            $("#interphone-error").text($.i18n.prop('address.text23'));
            return false;
        } else {
            $("#interphone-error").text('');
        }
    }
    if(phonecode == "86" && phoneNumber.length != 11){
        if(_self.typer == 1){
            $("#interphone-error").text($.i18n.prop('address.text27'));
        }else if(_self.typer == 0){
            $("#chinaphone-error").text($.i18n.prop('address.text27'));
        }
        return false;
    }
    if (_self.aim == 0) {
        $.ajax({
            url: "/user/userAddressAdd",
            type: "POST",
            data: {
                country:country,
                name:useName,
                province:sheng,
                city:shi,
                area:xian,
                phone:phoneNumber,
                detailedAddress:address,
                postCode:areacode,
                phoneCode:phonecode,
                countryCode:countryCode,
                provinceCode:provincecode,
                cityCode:citycode,
                areaCode:areacodes
            },
            success : function(data){
                if( data.status == 0 ){
                    _self.addsuccess();
                    _self.closeFlip();
                }else{
                    alertBoxFunc(data.error.message,'sure');
                }
            }
        });
    } else if(_self.aim == 1){
        $.ajax({
            url : "/user/userAddressEdit",
            type : "POST",
            data: {
                uid:_self.uid,
                id:_self.modifyId,
                country:country,
                name:useName,
                province:sheng,
                city:shi,
                area:xian,
                phone:phoneNumber,
                detailedAddress:address,
                postCode:areacode,
                phoneCode:phonecode,
                countryCode:countryCode,
                provinceCode:provincecode,
                cityCode:citycode,
                areaCode:areacodes
            },
            success: function (data) {
                _self.modifysuccess(_self.modifyId);
                _self.closeFlip();
            }
        })
    };
}
function ifblur( obj,str ){
    $(document).find(obj).blur(function(){
        var _self = $(this)
        if($.trim(_self.val()) == ""){
            _self.parent().find('.error').text(str);
            return;
        }else{
            _self.parent().find('.error').text("");
            return;
        }
    })
}
//只允许输入数字
$(document).on('keypress','.NamberInput',function(event) {
    var eventObj = event || e;
    var keyCode = eventObj.keyCode || eventObj.which;
    if (keyCode == 46  || ((keyCode >= 48 && keyCode <= 57)|| keyCode == 8||keyCode==0)) {
        return true;
    }else{
        return false;
    }
});
$(document).on('keyup','.NamberInput',function(event) {
    var val = $(this).val();
    if (!/^\d?\d{0,20}$/.test()){
        $(this).val(/^\d?\d{0,20}/.exec(val));
    }
});
