$(function(){
        var pageNum = 0;
        var org = ORG_LIST||{};
        var org_text = ORG_TEXT || {};
        var aindex = GetQueryString("uid");
        var langs = location.pathname.match(/TW|CN|EN/g)||['CN'];
        langs = langtype(langs);
        toptext();//公益机构详情
        function toptext(){
            var aindex = GetQueryString("uid");
            org.aindex = aindex;
            var nowDate = org[org.aindex];
            var title,text,address;
            if(langs == "zh_CN"){
                title = nowDate.zh_CN;
                text = nowDate.desc_zh_CN;
                address = nowDate.address_zh_CN;
            }else if( langs == "zh_TW" ){
                address = nowDate.address_zh_TW
                title = nowDate.zh_TW;
                text = nowDate.desc_zh_TW;
            }else{
                title = nowDate.en;
                text = nowDate.desc_en;
                address = nowDate.address_en
            }
            var html = '<div class="img_div_wrap">'+
                            '<div class="img_div"><img src="./static/images/org/' + nowDate.icon + '.png" /></div>'+
                        '</div>'+
                        '<div class="topthre_text">'+
                            '<h2>'+title+'</h2>'+
                            '<h3 class="textdiv_hx"><img src="./static/images/org/orglist_1.svg">'+address+'</h3>'+
                            '<h4 class="textdiv_hx"><img src="./static/images/org/orglist_2.svg"><a target="_blank" href="'+nowDate.link+'">'+nowDate.link+'</a></h4>'+
                            '<h5 class="textdiv_hx"><img src="./static/images/org/orglist_3.svg">'+nowDate.uid+' </h5>'+
                        '</div>';
            $(".topthre_head").html(html);
            $(".topthre_text_footer").html(text);
        }
        //提交留言
        $(".submit").on("click",function(){
            var usename = $(".username");
            var subText = $("#sub-text");
            var subTextVal = $("#sub-text").val();
            var usenameVal = usename.val();
            var usenameNum = getByteLen(usenameVal);
            var subTextNum = getByteLen(subTextVal);
            if( $.trim(usenameVal) == "" ){
                alertbox({text:org_text[langs].orgtxt_1});
            }
            else if( usenameVal.length < 2 || usenameVal.length > 16){
                alertbox({text:org_text[langs].orgtxt_2});
            }
            else if(!isChinaOrNumbOrLett(usenameVal)){
                alertbox({text:org_text[langs].orgtxt_2});
            }
            else if( $.trim(subTextVal) == "" ){
                alertbox({text:org_text[langs].orgtxt_3});
            }
            else if ( subTextNum > 500 ){
                alertbox({text:org_text[langs].orgtxt_9});
            }
            else{
                subTextVal = html_encode(subTextVal);
                $.ajax({
                    url: "/mindbank/api/org/comment",
                    type: 'POST',
                    data: {
                        orgId: aindex,
                        username: usenameVal,
                        comment: subTextVal,
                        locale:langs
                    },
                    success: function (data) {
                        if( data.status == 0 ){
                            alertbox({text:org_text[langs].orgtxt_4});
                            usename.val("");
                            subText.val("");
                            $(".text_num").html("0/500");
                        }
                        else{
                            alertbox({text:org_text[langs].orgtxt_6});
                        }
                    },
                    error: function (e) {
                        if( e.status == 500 ){
                            alertbox({text:org_text[langs].orgtxt_5});
                        }
                        else{
                            alertbox({text:org_text[langs].orgtxt_6});
                        }
                    }
                })
            }
        });
        $("#sub-text").on('keyup',function(){
            var subtext = $("#sub-text").val();
            var mynum = getByteLen(subtext);
            $(".text_num").html(mynum+"/500");
            if(mynum > 500){
                $(this).css("color","red");
                $(".text_num").css("color","#D0021B");
            }else{
                $(this).css("color","#000");
                $(".text_num").css("color","#565A5C")
            }
         });
        //获取留言
        next_ajax();
        function next_ajax(){
            $.ajax({
                url: "/mindbank/api/org/comments",
                type: 'GET',
                data:{
                    locale:langs,
                    orgId: aindex,
                    page : pageNum,
                    size : 10
                },
                success: function (data) {
                    var datar = data.data;
                    var noeRows = datar.rows;
                    var commentsHtml = "";
                    if( datar.total > 0 ){
                        $(".guest_book").find("h2").show();
                    }
                    if( datar.total > 10  ){
                        $(".next_now").show();
                    }
                    for(var i=0; i<noeRows.length; i++){
                        var comment = get_html_encode(noeRows[i].comment);
                        var times = noeRows[i].reviewedAt;
                        commentsHtml += '<div class="book_main">'+
                                            '<div>'+
                                                '<span>'+noeRows[i].username+'</span>'+
                                                '<i>'+times+'</i>'+
                                             '</div>'+
                                             '<p> '+comment+'</p>'+
                                         '</div>';
                    }
                    $(".guest_book").append(commentsHtml);
                    if( datar.total == $(".book_main").length ){
                            $(".next_now").hide();
                    }
                },
                error: function (e) {
                    console.log(e)
                }
            })
        }
        $(".next_now").on("click",function(){
            pageNum ++;
            next_ajax();
        })

})