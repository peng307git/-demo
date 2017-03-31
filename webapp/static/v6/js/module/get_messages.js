/*****
***joel***
*       
        var box =new getmessages({
                    obj : '#yanzhenbtn',
                    url : '/user/getSmsCodeFromPay',
                    datas : {
                        "name" : "peng"
                    }
        });
        box.bind("requestCheck",function(e,data){ 
            var app = 999;
            data.mobile = app;   //传递请求的参数和值 data 是请求参数，，如果需要在验证的过程中获取具体的值，那么就在这里来改变请求参数
            e.target.judge = false;   //如果验证失败的话就改变judge值。
        })
        box.bind('requestSuccess',function(){
                    console.log('发送成功后绑定的事件: requestSuccess');
        });
        box.bind('requestAborted',function(e,data){
                    console.log('发送失败后绑定的事件: requestAborted');
                    console.log(data);
        });
*
*****/
define(function(require, exports, module){
    var  $ = require('jquery');
    var Util = require('./util');
    var Widget = require('./widget');
    var Modal = require("../module/modal");
    var _lang = Util.langType();   
    var getmessages_text1 ,getmessages_text2 ,getmessages_text3 ,getmessages_text4;  
    var getmessages = Widget({
        Options:{
            obj : "",   
            url  : "",
            type : "POST",
            datas : {},
            alertError : true,
            judge : true
        },
        _init : function(){
            this._action();
        },
        _action : function(){
            var _self = this;
            $(this.obj).on('click',function(){
                    _self.trigger('requestCheck',_self.datas);  //发送之前的校验
                    if( _self.judge ){
                        _self.datachange();
                    }
                    else{
                        console.log("验证失败，不予发送信息");
                    }
            })
        },
        datachange : function(){
            var _self = this;
            $.ajax({
                url  : this.url,
                type : this.type,
                dataType : 'json',
                data : this.datas,
                success : function(data){
                    if( data.status == 0 ){
                        _self.sendTrue();
                    }
                    else{
                        _self.aborted(data);
                    }
                },
                error:function(err){
                    console.log('请求失败，请查看！');
                    console.log(err);
                }
            });
        },
        sendTrue : function(){     //信息发送成功
            var _self = this;
            var _selfObj = $(this.obj);
            var wait  = 60;
            this.langchange();
            this.trigger('requestSuccess');    //发送成功后绑定事件
            this.onoffClick(true);
            _selfObj.val(wait + getmessages_text1);
            var timer = setInterval(function(){
                    if( wait == 0 ){
                        clearInterval(timer);
                        _self.onoffClick(false);
                        _selfObj.val(getmessages_text2);
                    }
                    else{
                        wait --;
                        _selfObj.val(wait + getmessages_text1);
                    }
                },1000);
            _selfObj.parent().find('input[type="text"]').focus();
        },
        aborted : function(data){   //信息发送失败
            if( this.alertError ){
                this.langchange();
                var box = new Modal({
                    width: 500,
                    title: getmessages_text3,
                    content: '<h1>'+data.error.message+'</h1>',
                    hasClose: false,
                    hasMask: true,
                    btns: [
                        {
                            btnText: getmessages_text4,
                            clickEvent: function(){
                                box.destroy();
                            }
                        }
                    ]
                });
                box.render();
            };
            this.trigger('requestAborted',data);         //发送失败后绑定事件
        },
        langchange : function(){
            switch(_lang){
                case "zh":
                        getmessages_text1 = "秒后重新发送";
                        getmessages_text2 = "获取短信验证码";
                        getmessages_text3 = "提示";
                        getmessages_text4 = "确认";
                        break;
                case "en":
                        getmessages_text1 = "Seconds later";
                        getmessages_text2 = "Get SMS Captcha";
                        getmessages_text3 = "Note";
                        getmessages_text4 = "OK";
                        break;
                case "tw":
                        getmessages_text1 = "秒後重新發送";
                        getmessages_text2 = "獲取短信驗證碼";
                        getmessages_text3 = "提示";
                        getmessages_text4 = "確認";
                        break;
            }
        },
        onoffClick : function(myoffClick){
            var myObj = $(this.obj)[0];
            if( myoffClick ){
                myObj.setAttribute("disabled", true);
            }
            else{
                myObj.removeAttribute("disabled"); 
            }
        }
    });
    module.exports = getmessages; 
})