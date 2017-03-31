$(function(){
    changeHeight();
    function changeHeight(){
        var windowHight = $(window).height();
        $(".donwloadwarp section").height(windowHight)
    }
    $(window).scroll(function(){
        var toper = $(window).scrollTop();
        if(!navigator.userAgent.match(/(iPhone|iPod|Android|ios)/i)){
            if(toper>=110){
                $(".topheader").addClass('minitoper');
            }else{
                $(".topheader").removeClass('minitoper');
            }
        }
    })
    //公告详情
    $('.tablediv').on('click',function(e){
        e.preventDefault();
        $(this).find('div').show();
        $('.notice-bgblack').show();
        $(document.body).css('overflow','hidden');
    })
    $('.tablediv').hover(function(){
        $('.tablediv').css('background','#fff')
        $(this).css('background','#f3f5f7');
        $(this).find('.active1').css('color','#00c4b1');
    },function(){
        $(this).css('background','#fff');
        $(this).find('.active1').css('color','#333');
    })
    $(document).on('click','.tablediv_div_btn',function(){
          $('.tablediv_div').hide();
          $('.notice-bgblack').hide();
          $(document.body).css('overflow','auto');
    })
    $(document).on('click','.tablediv_div_on_span',function(){
          $('.tablediv_div').hide();
          $('.notice-bgblack').hide();
          $(document.body).css('overflow','auto');
    })
    $('.notice-bgblack').height($(document).height());

   //支持我们
    $('.across-listmove').hover(function(){
        $(this).find('.across-main').stop(true,true).show('normal');
    },function(){
        $(this).find('.across-main').stop(true,true).hide('normal');
    })
    // 首页弹窗点击下载
    var download_exe = " ";
    $(".windownload").on('click touchend', function(event){
        event.preventDefault();
        appDownloadTable();
        download_exe = $(".windownload").attr("href");
    });
    $(".macdownload").on('click touchend', function(event) {
        event.preventDefault();
        appDownloadTable();
        download_exe = $(".macdownload").attr("href");
    });
    
    $(document).on('click','.typecheck',function(){
        if( $(".typecheck").is(':checked') ){
            $('.checkbox-btn').removeAttr("disabled");
            $('.checkbox-btn').addClass('downhover');
        }
        else{
            $('.checkbox-btn').attr("disabled",true);
            $('.checkbox-btn').removeClass('downhover');
        }
    })
    $(document).on('click','.checkbox-btn',function(){
            window.location.href = download_exe;
        //银行下载量统计
            var downtype = download_exe.substr(download_exe.length -1);
            if( downtype == "g" ){
                downtype = 0;
            }
            else{
                downtype = 1;
            }
            $.ajax({
                url:"https://www.mindasset.com/openapi/dataAnalysis/downloadAnalysis?downType="+downtype,
                type:"GET",
                dataType: 'jsonp'
             })
    });
    //移动端端下载弹窗
    function appDownloadTable(){
            $(".reminder-modal").show();
        if(navigator.userAgent.match(/(iPhone|iPod|Android|ios)/i)){
            $('.reminder').css('height','3.92rem');
            $('.reminder h2').css('text-align','left');
            $('.height156').hide();
            $('.ckeck-warp').hide();
            $('.checkbox-btn').hide();
            $('.app-text').addClass('app-download-text');
            $('.app-okbtn').addClass('appp-download-btn');
        }
    }
   
    //导航高亮处理
    var urlKeywords = ['download_', 'org_list_', 'guide_', 'notice_1_', 'white_','support_us_','download_FAQ_','newslist_','vote_','orgsignup_','topthreorg_','newdetails_'];
    var navKey = location.pathname.match(/\w*_/g);
    var activeNavIndex = 0;
    var activeNavKey = 0;
    if(navKey){
        activeNavKey = activeNavIndex = urlKeywords.indexOf(navKey[0])||0;
    }
    if(activeNavIndex == 6){
        activeNavIndex = 2;
    }
    if( activeNavIndex > 6){
        activeNavIndex = 1;
    }
    $('.activeNav').eq(activeNavIndex).addClass('active');
    //写cookies
    function setCookie(name,value){
        var Days = 30*12;
        var exp = new Date(); 
        exp.setTime(exp.getTime() + Days*24*60*60*1000);
        document.cookie = name + '='+ escape (value) + ';expires=' + exp.toGMTString();
    }
    //语言切换
    var lans = ['EN', 'CN', 'TW'];
    $('.language li').on('click', function(e){
        e.preventDefault();
        var index = $(this).index();
        if(urlKeywords[activeNavKey] == 'download_FAQ_'){  
            var action = GetQueryString("action"); 
            window.location.href = '/' + urlKeywords[activeNavKey] + lans[index] + '.html?action='+action;
        }
        if( urlKeywords[activeNavKey] == "topthreorg_" || urlKeywords[activeNavKey] == "newdetails_" ){
            var uid = GetQueryString("uid");
            window.location.href = '/' + urlKeywords[activeNavKey] + lans[index] + '.html?uid='+uid;
        }
        else{
            window.location.href = '/' + urlKeywords[activeNavKey] + lans[index] + '.html';
        }
        setCookie('langName',lans[index]);
    });
    $('.topheader-logo').on('click', function(e){
        e.preventDefault();
        var lan = location.pathname.match(/TW|CN|EN/g)||['CN'];
        window.location.href = '/' + urlKeywords[0] + lan + '.html';
    });
    function GetQueryString(name){   //取url后面参数的值
        var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if(r!=null)return  unescape(r[2]); return null;
    }
    //首页下载按钮跳转
   $('.scroll0').on('click',function(){
        $(document).scrollTop(0);
   })
   //语言切换相关
   $('.language').hover(function(){
        $(this).find('ul').show();
   },function(){
        $(this).find('ul').hide();
   })
   $('.language').find('ul').hover(function(){
        $(this).show();
   },function(){
        $(this).hide();
   })
   //公益社区导航条
   $(".orghead").hover(function(){
        $(this).find(".org_ahref").show();
   },function(){
        $(this).find(".org_ahref").hide();
   })
    //捐赠弹窗
    !function(){
         var copylan = location.pathname.match(/TW|CN|EN/g)||['CN'];
         var alertcopy = "";
             if(copylan == 'TW'){
                alertcopy = '復制成功';
             }
             else if(copylan == 'CN'){
                alertcopy = '复制成功';
             }else{
                alertcopy = 'Copy success';
             }
            $('#copy_btn').zclip({ 
                    path: '/static/js/ZeroClipboard.swf', 
                    copy: function(){//复制内容 
                        return $('#addresstext').val(); 
                    }, 
                    afterCopy: function(){//复制成功 
                       alert(alertcopy); 
                    } 
            });
            $('.donate').click(function(){
                 $('.support-box').show();
                 $('.support-box').css({
                        'visibility':'visible',
                        'zIndex':'66'
                 })
            })
            $(document).on('click','.popup-no',function(){
                 $('.support-box').hide();
            }) 
    }();
    //关闭下载弹窗
    $(document).on('click', '#reminderModal .reminder-bg', function(event) {
            reminderModalNone();
    });
    $(document).on('click', '#reminderModal .close-modal', function(event) {
            reminderModalNone();
    });
    $('.app-close-okbtn').on('click', function(event) {
            reminderModalNone();
    });
    function reminderModalNone(){
            $(".reminder-modal").hide();
            $(".typecheck").attr("checked",false);
            $('.checkbox-btn').attr("disabled",true);
            $('.checkbox-btn').removeClass('downhover');
    }
    
    //移动端导航显示
    // $('.app_nav').on('touchstart',function(){
    //     $(this).parent().addClass('app-warp');
    //     $('.clearfix-none').show();
    //     $('.app-nav-close').show();
    //     $(this).hide();
    // })
    // $('.app-nav-close').on('touchstart',function(){
    //     $(this).parent().removeClass('app-warp');
    //     $('.clearfix-none').hide();
    //     $('.app_nav').show();
    //     $(this).hide();
    // })
})