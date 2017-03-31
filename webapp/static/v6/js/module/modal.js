/*
var box = new Alertbox({
    title: '测试',
    content: "<h3>测试</h3><p>新组件</p>",
    hasClose: false,
    hasMask: false,
    btns: [
        {
            btnText: '确认',
            btnClass: 'aaaaa',
            clickEvent: function(){
                alert(123213213);
                box.destroy();
            }
        },
        {
            btnText: '取消'
        }
    ]
});
*/
define(function(require, exports, module){
    var Util = require('./util');
    var Widget = require('./widget');

    var Alertbox = Widget({
        Options: {
            classPrefix: "ui-",
            width: 360,
            title: "",
            content: "",
            hasClose: true,
            hasMask: true,
            maskOpacity: '0.4',
            btns: [],
            tpl: ""
        },
        _init: function(){
            this.render();
            //this._action();
        },
        _action: function(){
            var self = this;
            this.wrap.delegate('.close', 'click', function(){
                self.destroy();
            });
        },
        render: function(){
            var self = this;
            var maskTpl = this.hasMask?'<div class="modal-mask"></div>':'';
            var closeTpl = this.hasClose?'<button type="button" class="close"><span>&times;</span></button>':'';
            var btnTpl = '<button type="button" class="btn {%btnClass%}">{%btnText%}</button>';
            var tpl = [
                '<div class="modal {%classPrefix%}modal">',
                    '{%maskTpl%}',
                    '<div class="modal-dialog modal-dialog-sm">',
                        '<div class="modal-content">',
                            '<div class="modal-header">',
                                '{%closeTpl%}',
                                '<h4 class="modal-title">{%title%}</h4>',
                            '</div>',
                            '<div class="modal-body">',
                            '{%content%}',
                            '</div>',
                        '</div>',
                    '</div>',
                '</div>'
            ].join("");
            this.tpl = this.tpl||tpl;
            this.options = $.extend(this.options, {
                maskTpl: maskTpl,
                closeTpl: closeTpl
            });
            this.trigger('beforeRender');
            var html = Util.format(this.tpl, this.options);
            this.wrap = $(html).appendTo(document.body).show();
            this.wrap.find('.modal-dialog').css({'width': this.width})
            this.wrap.find('.modal-mask').css({
                'width':'100%',
                'height':'100%',
                'background': '#000',
                'opacity': self.maskOpacity
            });
            if(this.btns && this.btns.length > 0){
                var footer = $('<div class="modal-footer"></div>').appendTo(self.wrap.find('.modal-content'));
                $.each(this.btns, function(index, item){

                    var btnHtml = Util.format(btnTpl, {
                        btnText: item.btnText,
                        btnClass: item.btnClass||'btn-default'
                    });
                    var btn = $(btnHtml).appendTo(footer);
                    btn.on('click', function(){
                        if(item.clickEvent){
                            item.clickEvent();
                        }else{
                            self.destroy();
                        }
                    });
                });
            }
            this.trigger('afterRender');
            this._action();
        },
        destroy: function(){
            this.wrap.remove();
        }
    });
    module.exports = Alertbox;
});
