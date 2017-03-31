$(function(){
    var pageNum = 0;
    var org_text = ORG_TEXT || {};
    var langs = location.pathname.match(/TW|CN|EN/g)||['CN'];
    var newsId = GetQueryString("uid");
    langs = langtype(langs);
        //获取新闻详情
        $.ajax({
            url: '/mindbank/api/news_info/'+newsId,
            type: "GET",
            data:{
                locale: langs
            },
            success:function(data){
                var datar = data.data;
                if( data.status == 0 ){
                    var times = datar.pushAt;
                    if( langs == 'en_US' ){
                            times = times.substring(0,10);
                            times = times.split('-');
                            times = times[1]+'-'+times[2]+'-'+times[0]; 
                    }
                    $(".new_deta_title").html(datar.title);
                    $(".time").html(times);
                    $(".new_deta_text").html(datar.content);
                }
            },
            error:function(err){
                console.log(err)
            }
            
        })
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
                    url: "/mindbank/api/news/comment",
                    type: 'POST',
                    data: {
                        newsId: newsId,
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
        //获取新闻评论列表
        next_ajax();
        $(".next_now").on("click",function(){
            pageNum ++;
            next_ajax();
        })
        function next_ajax(){
            $.ajax({
                url: "/mindbank/api/news/comments",
                type: 'GET',
                data:{
                    locale:langs,
                    newsId: newsId,  // 新闻id
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
                        var comment = get_html_encode(noeRows[i].comment)
                        commentsHtml += '<div class="book_main">'+
                                            '<div>'+
                                                '<span>'+noeRows[i].username+'</span>'+
                                                '<i>'+noeRows[i].reviewedAt+'</i>'+
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
})