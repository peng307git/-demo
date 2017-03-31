define(function(require, exports, module){
    var $ = require('jquery');
    var Util = require('../module/util');
    var Modal = require("../module/modal");

    var appUtc=function(){//右侧悬浮，切换时区。
        $('.app-pop').on('click', '.app-pop-nav', function(event) {
            event.stopPropagation();
            $('.app-pop .app-pop-box').hide()
            $('.app-pop .app-pop-nav').removeClass('active');
            $(this).addClass('active');
            var appPopBox = $(this).find('.app-pop-box');
            appPopBox.show();
        });
        
        $(document).click(function () {
            $('.app-pop .app-pop-box').hide();
            $('.app-pop .app-pop-nav').removeClass('active');
        });
        $('.app-pop-tip span').on('click', function () {
            var content = '<video width="100%" height="100%" id="myVideo" poster="/static/images/video-poster-2.jpg" autoplay="autoplay" controls="controls">'+
                                '<source src="https://o4we6sxpt.qnssl.com/mindlink_course.mp4" type="video/mp4"/>'+
                                '<object type="application/x-shockwave-flash" name="player" width="100%" height="100%" id="player" style="visibility: visible;" >'+
                                    '<param name="allowFullScreen" value="true">'+
                                    '<param name="allowScriptAccess" value="always">'+
                                    '<param name="bgcolor" value="#000000">'+
                                '</object>'+
                            '</video>';
            var boxer = new Modal({
                        title: 'Mind Link',
                        content: content,
                        width: 680,
                        hasClose: true,
                        hasMask: true,
                    })
        });
        $(".modal").click(function (event) {
            event.stopPropagation();
        });
        $(document).on('click', '#alertWrap', function (event) {
            event.stopPropagation();
        });
        $(document).on('click', '.utcStorage', function (event) {
            event.stopPropagation();
        });
        // $.getScript('http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js',function(){
        //     $("#UTC-add").text(remote_ip_info.country+", "+ remote_ip_info.province +", "+remote_ip_info.city)
        // });

        // function calcTime(offset) {
        //     d = new Date();
        //     utc = d.getTime() + (d.getTimezoneOffset() * 60000);
        //     nd = new Date(utc + (3600000*offset));
        //     return nd.toLocaleString();
        // }
        // console.log(calcTime());
        var localUtc = 'UTC ' + getUtc();
        $.ajax({
            url: '/user/info/cache/locale',
            type: 'GET',
            dataType: 'json',
            success:function(data){
                if(data.data&&data.data!=null){
                    utcNow(data.data);
                }else{
                    changeTime();
                    UTCSetStorage();
                }
                
            }
        })
        
        function utcNow(data) {
            var utcAdd = "";
            var _lang = Util.langType();
            //console.log(_lang);
            if (_lang == "en") {
                utcAdd = data.en;
            } else if (_lang == "zh") {
                utcAdd = data.cn;
            } else if (_lang == "tw") {
                utcAdd = data.tw;
            }
            $("#UTC-add").text(utcAdd);
            $("#inputUTC").attr('value', data.utcNu);
            $("#userUtcNumber").attr('value', data.number);
            changeTime();
        }
        function UTCSetStorage(){
            var isUTCSet = localStorage.getItem('isUTCSet') || 0;
            var $htmlUTCSet=$('<div class="utcStorage"></div>');
            if(!isUTCSet){
                $(".app-pop-nav").trigger('click');
                var htmlStorage = [
                    '<img src="/static/v6/images/nomd5/bline.png" >',
                        '<p>'+I18N.prop('pop.utc.text6')+'</p>',
                    '<button class="btn">'+I18N.prop('pop.utc.text9')+'</button>'
                ].join("");
                $htmlUTCSet.empty().append(htmlStorage);
                //console.log($htmlUTCSet.html());
                $htmlUTCSet.appendTo($('body'));
            }
            $(document).on('click', '.utcStorage button', function(event) {
                event.preventDefault();
                /* Act on the event */
                localStorage.setItem('isUTCSet', 1);
                $htmlUTCSet.remove();
                $('.app-pop .app-pop-box').hide()
                $('.app-pop .app-pop-nav').removeClass('active');
            });
        };

        function changeTime() {
            var inputUTC = $("#inputUTC").val().split("UTC")[1];
            updateTime();
            function updateTime() {
                var mydate = new Date();
                var myDateOff = mydate.getTimezoneOffset();
                var utc = mydate.getTime() + (myDateOff * 60000);
                var UTCDate = new Date(utc);
                $("#time-UTC").text(getTheTime(UTCDate));
                if (inputUTC && inputUTC !== "") {
                    var nute = inputUTC.split(":");
                    var mute;
                    if (inputUTC.split("+").length == 2) {
                        mute = Math.abs(nute[0]) + Number(nute[1] / 60);
                    } else if (inputUTC.split("-").length == 2) {
                        mute = -(Math.abs(nute[0]) + Number(nute[1] / 60));
                    }
                    var nd = new Date(utc + (3600000 * mute));
                    $("#time-now").text(getTheTime(nd));
                } else {
                    $("#time-now").text(getTheTime(mydate));
                }
            }

            setInterval(updateTime, 30000);
            if (inputUTC && inputUTC !== "") {
                $("#UTC").text('UTC ' + inputUTC);
            } else {
                $("#UTC").text(localUtc);
            }
        }

        function getTheTime(nS) {
            var d = new Date(nS);
            var date = (d.getFullYear()) + "-" +
                            Double((d.getMonth() + 1)) + "-" +
                            Double(d.getDate()) + " " +
                            Double(d.getHours()) + ":" +
                            Double(d.getMinutes())
            //+ ":"+ Double(d.getSeconds())
                    ;
            return date;
        }

        function Double(nun, jia) {
            if (nun < 10 && nun >= 0) {
                if (jia) {
                    return jia + "0" + Math.abs(nun);
                } else {
                    return "0" + Math.abs(nun);
                }
            } else if (nun < 0 && nun > -10) {
                return "-0" + Math.abs(nun);
            } else {
                return nun;
            }
        }

        //设置时区
        function getUtc() {
            // var myudate = new Date();
            // var myuDateOff = myudate.getTimezoneOffset();
            // console.log(myuDateOff);

            var thisDate = new Date();
            var myDateOff = thisDate.getTimezoneOffset();
            var absNun = Math.abs(myDateOff * 60000);
            var mydate = new Date(absNun);
            //console.log(mydate.toString());
            var utc = mydate.getTime() + (myDateOff * 60000);
            var newDate = new Date(utc);
            //console.log(newDate.toString());
            var date = Double(newDate.getHours()) + ":" +
                    Double(newDate.getMinutes());
            //console.log(date);
            if (myDateOff >= 0) {
                return "-" + date;
            } else {
                return "+" + date;
            }
        }

        var _lang = Util.langType();

        $("#changeUTC").on('click', function (event) {
            event.preventDefault();
            var listU = "";
            var content = "";
            var userUtcNumber = $("#userUtcNumber").val();
            $.ajax({
                url: '/static/js/business/utc.json',
                type: 'GET',
                dataType: 'json',
                data: {},
                success: function (data) {
                    for (var i = 0; i < data.length; i++) {
                        var utcNustr = "";
                        if (_lang == "zh") {
                            utcNustr = data[i].cn;
                        } else if (_lang == "en") {
                            utcNustr = data[i].en;
                        } else if (_lang == "tw") {
                            utcNustr = data[i].tw;
                        }
                        if (!userUtcNumber || userUtcNumber == "") {
                            if (data[i].utcNu == localUtc) {
                                userUtcNumber = data[i].number;
                            }
                        }
                        if (userUtcNumber == data[i].number) {
                            listU += '<option  selected="selected" value="' + data[i].number + '">(' + data[i].utcNu + ') ' + utcNustr + '</option>'
                        } else {
                            listU += '<option value="' + data[i].number + '">(' + data[i].utcNu + ') ' + utcNustr + '</option>'
                        }
                    }
                    ;
                    content = '<div class="changeTimeZone">'+I18N.prop('changeUtc')+'</div><div id="UTCList"><select name="UTCList">' + listU + '</select></div>';

                    var boxer = new Modal({
                        title: I18N.prop('setUtc'),
                        content: content,
                        width: 480,
                        hasClose: true,
                        hasMask: true,
                        btns: [{
                            btnText: '确认',
                            btnClass: 'btn-default-black',
                            clickEvent: function () {
                                var changeUTC = $("#UTCList option:selected").val();
                                $.ajax({
                                    url: '/user/info/cache/locale/set',
                                    type: 'post',
                                    dataType: 'json',
                                    data: {
                                        "localeId": changeUTC
                                    },
                                    success: function () {
                                        window.location.reload();
                                        console.log(changeUTC);
                                    }
                                })
                            }
                        },{
                            btnText: '取消',
                            btnClass: 'btn-default-black mid-btn-cancel-color',
                        }]
                    })
                }
            })
        });
        $('.app-pop-tip b').click(function () {
            var index = $(this).index();
            $('.app-pop-tip b').removeClass('active').eq(index).addClass('active');
            $('.app-pop-tip img').hide().eq(index).show();
        });
    }

    module.exports = appUtc;
});
