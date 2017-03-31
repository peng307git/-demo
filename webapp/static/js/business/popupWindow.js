//  点击添加收货地址
var newtitle = $('.head_h2').html();
function clickfoota(obj){ 
   $(document).on('click', obj, function(event) {
      $(".lileft").show();
      $(".usalileft").show();
        var lang = langType();
      if(lang == "en"){
          $('.countusa').css('display','block');
      }else{
          $('.countchina').css('display','block');
      }
      $('#btncount').css('display','block');
      $('.xiubtn').css('display','none');
      $('#btnusacount').css('display','block');
      $('.usabtn').css('display','none');
      //地址进行切换
      $('.countchina').find('input[type="text"]').val("");
      $('.countusa').find('input[type="text"]').val("");
         switchclick('.btnchina','.btnwai' );
     //input框里面进行逻辑判断  
         inputfun();
      $('.chian86').val("86"); //国家
      //标题改变 
      $('.head_h2').html(newtitle);
   });
}

//点击关闭设置收货地址
closeBlack('.countnone');
closeBlack('.bgblack');
function closeBlack(btn){
    $(document).on('click', btn , function(event) {
        event.preventDefault();
        /* Act on the event */
        $('.countchina').css('display','none');
        $('.countusa').css('display','none');
        $('.countbody').find('input').val('');
        $('.countusabody').find('input').val('');
        $('.baocuo').css('display','none');
        $('.usabaocuo').css('display','none');
        $('.sheng').val('-1');
        $('.shi').html("<option id='chooseCity' value='-1'>请选择您所在城市</option>");
        $('.diqu').html("<option id='chooseCounty' value='-1'>请选择您所在区/县</option>");
    });
}

//地址进行切换
function switchclick(btn,btn1){
        $(".sheng").val("-1");
        $(".shi").val("-1");
        $(".diqu").val("-1");
    $(btn).click(function(){
        $('.countchina').css('display','block');
        $('.countusa').css('display','none');
    })
    $(btn1).click(function(){
        $('.countchina').css('display','none');
        $('.countusa').css('display','block');
    })
}

//添加国内收货地址
function chinaaddto(defaultlistfun){
    $('#btncount').click(function(){
        var chinaname = $('.inputname').val();  //姓名
        var chinasheng = $('.sheng option:selected');   //省$('#testSelect option:selected') .val();
        var chinashi =   $('.shi option:selected');    // 市
        var xian =    $('.diqu option:selected');  //县
        var chinaaddress = $('.inputaddress').val(); //详细地址
        var areacode = $('.inputcode').val();   //邮编
        var chinaohone = $('.inputphone').val();    //电话
        var phonecode = $('#countryCode1').val();//电话编码
        var provincecode=$('.sheng option:selected').val();//省编码
        var citycode=$('.shi option:selected').val();    //市编码
        var areacodes= $('.diqu option:selected').val();  //县编码
        if( chinaname == "" ){
            $('.namecuo').css('display','block');
        }
        else if(chinaaddress == ""){
            $('.addresscuo').css('display','block');
        }
        else if(chinaohone =="" ){
            $('.cuophone').css('display','block');
        }else if(chinasheng.val() == "-1" || chinashi.val() == "-1" || xian.val() == "-1"){
            $('.diqucuo').css('display','block');
        }
        else{
            //$('.countbody').find('span').css('display','none');
            if(areacode == "" || !areacode || areacode == 0 ){
                areacode = "";
            }
            $.ajax({
                url: "/user/userAddressAdd",
                type: "POST",
                data: {
                    'country':'中国',//中文状态下默认为"中国"
                    'name':chinaname,
                    'province':chinasheng.text(),
                    'city':chinashi.text(),
                    'area':xian.text(),
                    'phone':chinaohone,
                    'detailedAddress':chinaaddress,
                    'postCode':areacode,
                    'phoneCode':phonecode,
                    'provinceCode':provincecode,
                    'cityCode':citycode,
                    'areaCode':areacodes,
                    //'defaultAddress':0,
                },
                success : function(data){
                    defaultlistfun(); //默认地址列表
                    $('.baocuo').css('display','none');
                }
            });
            $('.countchina').css('display','none');
        }

    })
}

//添加国际收货地址
function usaaddto(defaultlistfun){
    $('#btnusacount').click(function(){
        var chinaname = $('.usaname').val();  //姓名
        var chinasheng = $('.usasheng').val();   //省
        var chinashi =   $('.usashi').val();    // 市
        var chinaaddress = $('.usaaddress').val(); //详细地址
        var areacode = $('.usacose').val();   //邮编
        var xian = "";
        var chinaohone = $('.usaphone').val();    //电话
        var uascountry = $('#countryCode option:selected').text();   //国家
        var phonecode = $('#countryCode2').val();//电话号码编码
        var countrycode = $('#countryCode').val();//国家编码
        if( chinaname == "" ){
            $('.cuousaname').css('display','block');    //姓名
        }
        else if(chinaaddress == ""){
            $('.cuousaaddress').css('display','block');   // 详细地址

        }else if(chinashi == "" ){
            $('.cuousashi').css('display','block');
        }
        else if(chinasheng == ""){
            $('.cuousasheng').css('display','block');
        }
        else if(chinaohone =="" ){
            $('.agebaocuo').css('display','block');    // 电话 diqucuo
        }
        else if(areacode =="" ){
            $('.cuousacose').css('display','block');    
        }
        else{
            $.ajax({
                url: "/user/userAddressAdd",
                type: "POST",
                data: {
                    'country':uascountry,//中文状态下默认为"中国"
                    'name':chinaname,
                    'province':chinasheng,
                    'city':chinashi,
                    'area':xian,
                    'phone':chinaohone,
                    'detailedAddress':chinaaddress,
                    'postCode':areacode,
                    'phoneCode':phonecode,
                    'countryCode':countrycode,
                    //'defaultAddress':0,

                },
                success : function(data){
                    defaultlistfun();  //默认地址列表
                    $('.usabaocuo').css('display','none');
                }
            });
            $('.countusa').css('display','none');
        }

    })
}


//input框里面进行逻辑判断
function inputfun(){
    // $('.inputaddress').focus(function(){
    //     var countya = $('#county');
    //     console.log(countya.children().length)
    //     if( countya.children().length == 1 ){
    //         $('.diqucuo').css('display','block');
    //     }else{
    //         $('.diqucuo').css('display','none');
    //     }
    // })
    //国内
    myblur($('.my_name'),$('.namecuo'));   //姓名
    myblur($('.inputaddress'),$('.addresscuo'));   // 详细地址
    myblur($('.inputphone'),$('.cuophone'));   // 电话 diqucuo
    var shengval = $('.sheng').val();
    var shival   = $('.shi').val();
    var diquval = $('.diqu').val();
    //国际
    myblur($('.usaname'),$('.cuousaname'));  //姓名
    myblur($('.usaaddress'),$('.cuousaaddress'));   //地址
    myblur($('.usashi'),$('.cuousashi'));     //市
    myblur($('.usasheng'),$('.cuousasheng'));  //州
    myblur($('.usaphone'),$('.agebaocuo'));  //电话
}

function myblur( obj,obj1 ){
    obj.blur(function(){
        if($(this).val() == ""){
            obj1.css('display','block');
            return;
        }else{
            obj1.css('display','none');
            return;
        }
    })
}

function modifyAddress( btn,defaultlistfun){
    newtitle = $('.head_h2').html();
    inputfun();
    var myid = 0;
    var myuid=0;
    var mycountry = "";//国家
    var mycountrycode = 0; //国家编码
    var myphonecode = 0;  //电话编码
    $(document).on('click', btn, function(event) {
        event.preventDefault();
        /* Act on the event */
        //标题改变
        $(".lileft").hide();
        $(".usalileft").hide();
        $('.head_h2').html($('.head2_h2').val());
        var parent = $(this).parent();
        var divparent = parent.parent();
        myid = divparent.find('.hiddeninputid').val();  //id
        $.ajax({
            url:"/user/defaultAddress",
            type:"GET",
            data:{'addressId':myid},
            success:function(data){
                var datar = data.data;
                var myname =  datar.name; //姓名
                var myaddress = datar.detailedAddress;  //详细地址
                var myphone = datar.phone;   //电话
                var mysheng = datar.province;  //省
                var myshi = datar.city;    //市
                var myxian = datar.area;   //县
                mycountry = datar.country; //国家
                mycountrycode = datar.countryCode; //国家编码
                myphonecode =datar.phoneCode; //电话区号
                myuid = datar.uid;
                var myareacode = datar.postCode;   //邮编
                var myprovince = datar.provinceCode;//省编码
                var mycitycode = datar.cityCode;    //市编码
                var myareacodes = datar.areaCode;   // 县编码

                if(myareacode==null || myareacode == 0 || myareacode ==""){
                    myareacode = "000000";
                }
                //修改国内地址
                if( mycountry == '中国'){
                    var province_2 = "中国 86";
                    $('.countchina').css('display','block');
                    $('.my_name').val(myname); //姓名
                    $('.inputaddress').val(myaddress);  // 详细地址
                    $('.inputphone').val(myphone); // 电话 diqucuo
                    $("#countryCode1").val(myphonecode); //电话区号编码
                    
                    $('.sheng').val(myprovince);
                    $('.shi').html("<option id='chooseCitymy_1' value="+mycitycode+">"+myshi+"</option>");
                    $('.diqu').html("<option id='chooseCountymy' value="+myareacodes+">"+myxian+"</option>");
                    $('.inputcode').val(myareacode);//邮编
                    $('#btncount').css('display','none');
                    $('.xiubtn').css('display','block')
                }//修改国内地址
                else{     //修改国际地址
                    $('#countryCode').val(mycountrycode); //国家地区编码
                    $('#countryCode2').val(myphonecode); //  电话区号编码
                    //$('#countryCode2 option:selected').text(mycountry+' 1');
                    $('.countusa').css('display','block');
                    $('.usaname').val(myname);
                    $('.usaaddress').val(myaddress);
                    $('.usashi').val(myshi);
                    $('.usasheng').val(mysheng);
                    $('.usacose').val(myareacode);
                    $('.usaphone').val(myphone);
                    $('#btnusacount').css('display','none');
                    $('.usabtn').css('display','block');
                }
            }
        })
    })
//修改地址
    $(document).on('click', '.xiubtn', function(event) {
        var chinaname = $('.inputname').val();  //姓名
        var chinasheng = $('.sheng option:selected');   //省$('#testSelect option:selected') .val();
        var chinashi =   $('.shi option:selected');    // 市
        var xian =    $('.diqu option:selected');  //县
        var chinaaddress = $('.inputaddress').val(); //详细地址
        var areacode = $('.inputcode').val();   //国内邮编
        var chinaohone = $('.inputphone').val();    //电话
        var phonecode = $('#countryCode1').val();//电话编码
        var provincecode=$('.sheng option:selected').val();//省编码
        var citycode=$('.shi option:selected').val();    //市编码
        var areacodes= $('.diqu option:selected').val();  //县编码
        if( chinaname == "" ){
            $('.namecuo').css('display','block');
        }
        else if(chinaaddress == ""){
            $('.addresscuo').css('display','block');
        }
        else if(chinaohone =="" ){
            $('.cuophone').css('display','block');
        }
        else if(chinasheng.val() == "-1" || chinashi.val() == "-1" || xian.val() == "-1"){
            $('.diqucuo').css('display','block');
        }
        else{
            //$('.countbody').find('span').css('display','none');
            if(areacode == "" || !areacode || areacode == 0 ){
                areacode = "";
            }
            //给后端传递参数
            $.ajax({
                url : "/user/userAddressEdit",
                type : "POST",
                data: {
                    'country':'中国',//中文状态下默认为"中国"
                    'name':chinaname,
                    'province':chinasheng.text(),
                    'city':chinashi.text(),
                    'area':xian.text(),
                    'phone':chinaohone,
                    'detailedAddress':chinaaddress,
                    'id':myid,
                    'postCode':areacode,
                    'uid':myuid,
                    'phoneCode':phonecode,
                    'provinceCode':provincecode,
                    'cityCode':citycode,
                    'areaCode':areacodes,

                },
                success: function (data) {
                    defaultlistfun();
                    $('.baocuo').css('display','none');
                   $('.sheng').val('-1');
                   $('.shi').html("<option id='chooseCitymy' value='-1'>请选择您所在城市</option>");
                   $('.diqu').html("<option id='chooseCounty' value='-1'>请选择您所在区/县</option>");
                }
            })
            $('.countchina').css('display','none');
        }
    })
    $(document).on('click', '.usabtn', function(event) {
        var usaname = $('.usaname').val();  //姓名
        var usasheng = $('.usasheng').val();   //省$('#testSelect option:selected') .val();
        var usashi =   $('.usashi').val();    // 市
        var usaaddress = $('.usaaddress').val(); //详细地址
        var usaareacode = $('.usacose').val();   //邮编
        var usacount = $('#countryCode option:selected').text(); //国家
        var usaxian = " ";
        var usachinaohone = $('.usaphone').val();    //电话
        var phonecode = $('#countryCode2').val();//电话号码编码
        var countrycode = $('#countryCode').val();//国家编码
        //console.log(isNaN(usaareacode));
        if( usaname == "" ){
            $('.cuousaname').css('display','block');
        }
        else if(usasheng == ""){
            $('.cuousasheng').css('display','block');
        }
        else if(usashi =="" ){
            $('.cuousashi').css('display','block');
        }
        else if(usaaddress =="" ){
            $('.cuousaaddress').css('display','block');
        }
        else if( usachinaohone == "" ){
            $('.agebaocuo').css('display','block');
        }
        else if(usaareacode =="" ){
            $('.cuousacose').css('display','block');    
        }
        else{
            if(usaareacode == "" || !usaareacode || usaareacode == 0 ){
                usaareacode = "";
            }
            //给后端传递参数
            $.ajax({
                url : "/user/userAddressEdit",
                type : "POST",
                data: {
                    'country':usacount,//中文状态下默认为"中国"
                    'name':usaname,
                    'province':usasheng,
                    'city':usashi,
                    'area':usaxian,
                    'phone':usachinaohone,
                    'detailedAddress':usaaddress,
                    'id':myid,
                    'postCode':usaareacode,
                    'uid':myuid,
                    'phoneCode':phonecode,
                    'countryCode':countrycode,
                },
                success: function (data) {
                    defaultlistfun();

                }
            })
            $('.countusa').css('display','none');
        }
    })
}
