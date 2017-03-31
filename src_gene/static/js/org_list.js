$(function(){
    var org = ORG_LIST||{};
    var langs = location.pathname.match(/TW|CN|EN/g)||['CN'];
    var data = [];
    var strArr = [];
    var lang = langtype(langs);
    var lang_en = lang;
    //前三名公益机构跳转
    $(".hover_head_div").on("click",function(){
        var uid = $(this).attr("uid");
         window.location = "topthreorg_"+langs+".html?uid="+uid;
    })
    for(var i in org){
        data.push(org[i]);
    }
    if(lang == 'en'){
        data.sort(function(a, b){
            if(a.en < b.en){
                return -1;
            }else{
                return 1;
            }
        });
        lang_en = "en_US";
    }else{
        data.sort(function(a, b){
            if(a.firstLetter < b.firstLetter){
                return -1;
            }else{
                return 1;
            }
        });
    }
    for(var i = 0, len = data.length; i < len; i++){
        var tmp = [
            '<li uid="'+data[i].uid+'">',
                '<div class="li_div">',
                    '<div class="img_div">',
                        '<img src="./static/images/org/' + data[i].icon + '.png" />',
                    '</div>',
                    '<h4></h4>',
                    '<h5>'+data[i][lang]+'</h5>',
                '</div>',
            '</li>'
        ].join('')
        strArr.push(tmp)
    }
    $('.list_main').html(strArr.join('') + '<div style="clear:both;"></div>');
    //banner
    $.ajax({
        url: '/mindbank/api/banner',
        type: 'GET',
        data: {
            locale: lang_en
        }, 
        success: function (data) {
            var datar =data.data;
            var html="";
            if(data.status == 0 ){
                for(var i=0; i<datar.length; i++){
                    html += '<li class="slide slide-2 flex-active-slide">'+
                                    '<a href="'+datar[i].defaultHref+'">'+
                                        '<img src="'+datar[i].defaultRes+'" draggable="false"/>'+
                                    '</a>'+
                                '</li>';
                }
                $(".flexslider .slides").html(html);
                //轮播图
                $('.bg-slider').flexslider({
                    animation: "fade",
                    slideshow: true,
                    slideshowSpeed: 5000,
                    directionNav: false
                });
            }
        }, 
        error: function (e) {
            console.error(e)
        }
    });
    //公益机构点击查看详情
    $(".list_main li").on("click",function(){
        var ok = "OK";
        if(lang == "zh_CN"){
            ok = "确定";
        }
        if( lang == "zh_TW" ){
            ok = "確定";
        }
        var aindex = $(this).attr("uid");
            org.aindex = aindex;
        var nowDate = org[org.aindex];
        var desc = 'desc_' + lang;
        var address = 'address_' + lang
        var tablehtml = '<div class="org-modal">'+
                        '<div class="org-bg"></div>'+
                        '<section class="org_table">'+
                            '<div class="org_tablehead">'+
                                '<div class="org_img_div">'+
                                    '<img src="./static/images/org/' + nowDate.icon + '.png" />'+
                                '</div>'+
                                '<div class="text_div">'+
                                    '<h2>'+nowDate[lang]+'</h2>'+
                                    '<h3 class="textdiv_hx"><img src="./static/images/org/orglist_1.svg">'+nowDate[address]+'</h3>'+
                                    '<h4 class="textdiv_hx"><img src="./static/images/org/orglist_2.svg"><a target="_blank" href="'+nowDate.link+'">'+nowDate.link+'</a></h4>'+
                                    '<h5 class="textdiv_hx"><img src="./static/images/org/orglist_3.svg">'+nowDate.uid+' </h5>'+
                                '</div>'+
                            '</div>'+
                            '<div class="div_foot_text">'+nowDate[desc]+'</div>'+
                            '<div class="orglist_close orgtable_close">'+ok+'</div>'+
                            '<span class="org_imgclose orgtable_close"></span>'+
                        '</section>'+
                    '</div>';
        $("body").append(tablehtml);
    })
    //前三名鼠标移入
    $(".hover_head_div").hover(function(){
        var $that = $(this).find("footer");
            $that.addClass("foot_active");
            $that.find("h5").hide();
            $that.find("span,i").show();
    },
    function(){
        var $that = $(this).find("footer");
            $that.removeClass("foot_active");
            $that.find("h5").show();
            $that.find("span,i").hide();
    })
//百家公益机构样式
    var org_list_length = $(".org_list ul").find("li");
    for(var i=0; i<org_list_length.length; i++){
        var num = i.toFixed();
        num = num.charAt(num.length - 1);
        if( num == 4 || num == 9){
            org_list_length[i].style.margin=0;;
        }
    };
    $(document).on("click",".orgtable_close",function(){
        $(".org-modal").remove();
    })
    function langtype(data){
            if(data == "CN"){
                data = "zh_CN";
            }else if( data == "TW" ){
                data = "zh_TW";
            }else{
                data = "en";
            }
            return data;
    }
});