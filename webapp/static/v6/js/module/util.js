/**
 * @fileoverview js底层方法
 * @author zh
 */

define(function(require, exports, module){
    var Util = Util || {};

    Util.isString = function(source) {
        return '[object String]' == Object.prototype.toString.call(source);
    };
    Util.isArray = function(source) {
        return '[object Array]' == Object.prototype.toString.call(source);
    };
    Util.isFunction = function(source) {
        return '[object Function]' == Object.prototype.toString.call(source);
    };

    Util.isElement = function(source) {
        return !!(source && source.nodeName && source.nodeType == 1);
    };

    Util.mix = function(des, src, override) {
        var arg = arguments,
            argLength = arguments.length,
            lastArg = arguments[argLength - 1];
        arguments.slice = function() {
            return [].slice.apply(arg, arguments)
        };
        var srcArr = typeof lastArg == 'boolean' ? arguments.slice(1, argLength - 1) : arguments.slice(1);
        var override = typeof lastArg == 'boolean' ? lastArg : false;
        des = des || {};
        for (var i = 0, len = srcArr.length; i < len; i++) {
            var src = srcArr[i];
            for (var attr in src) {
                if (src.hasOwnProperty(attr)) {
                    if (!des.hasOwnProperty(attr) || override) {
                        des[attr] = src[attr];
                    }
                }
            }
        }
        return des;
    };

    //排除函数作用域链干扰
    Util.blankFunction = function() {};

    //使subClass继承superClass的prototype
    Util.inherits = function(subClass, superClass) {
        var key, proto,
            selfProps = subClass.prototype,
            clazz = new Function();

        clazz.prototype = superClass.prototype;
        proto = subClass.prototype = new clazz();

        for (key in selfProps) {
            proto[key] = selfProps[key];
        }
        subClass.prototype.constructor = subClass;
        subClass.superClass = superClass.prototype;

        subClass.extend = function(json) {
            for (var i in json) proto[i] = json[i];
            return subClass;
        }

        return subClass;
    };

    Util.format = function(tpl, data) {
        var tmpl = 'var __p=[],print=function(){__p.push.apply(__p,arguments);};' + 'with(obj||{}){__p.push(\'' + tpl.replace(/\\/g, '\\\\').replace(/'/g, "\\'").replace(/{%([\s\S]+?)%}/g, function(match, code) {
            return "'," + code.replace(/\\'/g, "'") + ",'";
        }).replace(/<%([\s\S]+?)%>/g, function(match, code) {
            return "');" + code.replace(/\\'/g, "'").replace(/[\r\n\t]/g, ' ') + "__p.push('";
        }).replace(/\r/g, '\\r').replace(/\n/g, '\\n').replace(/\t/g, '\\t') + "');}return __p.join('');";
        var func = new Function('obj', tmpl);
        return data ? func(data) : func;
    };

    Util.Event = function(type, target) {
        this.type = type;
        this.returnValue = true;
        this.target = target || null;
        this.currentTarget = null;
    };
    Util.Class = function() {};

    Util.Class.prototype.dispose = function() {
        for (var property in this) {
            typeof this[property] != "function" && delete this[property];
        }
    };

    Util.Class.prototype.bind = function(type, handler) {
        if (typeof handler != "function") {
            return this;
        }

        !this.__listeners && (this.__listeners = {});

        var i, t = this.__listeners,
            types = type.replace(/(^\s*)|(\s*$)/g, "").split(" ");

        // 支持以空格分割的多个事件绑定
        for (var a = 0, l = types.length; a < l; a++) {

            if (a === "") continue;

            types[a].indexOf("on") && (types[a] = "on" + types[a]);

            typeof t[types[a]] != "object" && (t[types[a]] = []);

            // 避免函数重复注册
            for (i = t[types[a]].length - 1; i >= 0; i--) {
                if (t[types[a]][i] === handler) return this;
            };

            t[types[a]].push(handler);
        }

        return this;
    };
    Util.Class.prototype.once = function(type, handler) {
        var isFirst = true;
        var self = this;
        var once = function() {
            if (isFirst) {
                isFirst = false;
                handler.apply(self, arguments);
            }
        };
        return this.bind(type, once);
    };
    Util.Class.prototype.unbind = function(type, handler) {
        var i,
            t = this.__listeners,
            types = type.replace(/(^\s*)|(\s*$)/g, "").split(" ");

        if (!t) return this;

        // 支持以空格分割的多个事件绑定
        for (var a = 0, l = types.length; a < l; a++) {

            if (a === "") continue;

            // remove all event listener
            if (typeof types[a] == "undefined") {
                for (i in t) {
                    delete t[i];
                }
                return this;
            }

            types[a].indexOf("on") && (types[a] = "on" + types[a]);

            // 移除某类事件监听
            if (typeof handler == "undefined") {
                delete t[types[a]];
            } else if (t[types[a]]) {

                for (i = t[types[a]].length - 1; i >= 0; i--) {
                    if (t[types[a]][i] === handler) {
                        t[types[a]].splice(i, 1);
                    }
                }
            }
        }

        return this;
    };

    Util.Class.prototype.trigger = function(event, options) {

        Util.isString(event) && (event = new Util.Event(event));

        !this.__listeners && (this.__listeners = {});

        // 将 options extend到event中去传递
        options = options || {};
        for (var i in options) {
            event[i] = options[i];
        }

        var i, n, me = this,
            t = me.__listeners,
            p = event.type;
        event.target = event.target || (event.currentTarget = me);

        // 支持非 on 开头的事件名
        p.indexOf("on") && (p = "on" + p);

        typeof me[p] == "function" && me[p].apply(me, arguments);

        if (typeof t[p] == "object") {
            for (i = 0, n = t[p].length; i < n; i++) {
                t[p][i] && t[p][i].apply(me, arguments);
            }
        }
        return this;
    };

    Util.each = function(obj, fn) {
        var returnValue, key, item;
        if ('function' == typeof fn) {
            for (key in obj) {
                if (obj.hasOwnProperty(key)) {
                    item = obj[key];
                    returnValue = fn.call(obj, item, key);

                    if (returnValue === false) {
                        break;
                    }
                }
            }
        }
        return obj;
    };

    Util.some = function(arr, fn, bind) {
        if (Array.prototype.some) {
            return [].some.call(arr, fn, bind);
        }
        for (var i = 0, l = arr.length; i < l; i++) {
            if (fn.call(bind, arr[i], i, arr)) {
                return true;
            }
        }
        return false;
    };
    Util.every = function(arr, fn, bind) {
        if (Array.prototype.every) {
            return [].every.call(arr, fn, bind);
        }
        for (var i = 0, l = arr.length; i < l; i++) {
            if (!fn.call(bind, arr[i], i, arr)) {
                return false;
            }
        }
        return true;
    };

    Util.str2obj = function(str) {
        return (new Function("return (" + str + ")"))();
    };

    Util.getStringLength = function(str){
    	var chineseCharacterPattern = /[\u4E00-\u9FA5]|[\uFE30-\uFFA0]/;
        var character = '';
    	var count = 0;
        for(var i = 0,len = str.length; i<len ; i++){
    		character = str.charAt(i);
    	   if(chineseCharacterPattern.test(character)){
    		   count+=2;
    	   }else{
    		   count+=1;
    	   }
    	}
    	return count;
    };
    Util.encodeHTML = function(str) {
        return str
            .replace(/&/g, '&amp;')
            .replace(/</g, '&lt;')
            .replace(/>/g, '&gt;')
            .replace(/"/g, "&quot;")
            .replace(/'/g, "&#39;");
    };

    Util.accMul = function(arg1, arg2){
        var m = 0, s1 = arg1.toString(), s2 = arg2.toString();
        try {
            m += s1.split(".")[1].length;
        }
        catch (e) {
        }
        try {
            m += s2.split(".")[1].length;
        }
        catch (e) {
        }
        return Number(s1.replace(".", "")) * Number(s2.replace(".", "")) / Math.pow(10, m);
    };

    Util.getCookie = function(name){
        var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
        if(arr=document.cookie.match(reg))
            return unescape(arr[2]);
        else
            return null;
    }

    Util.getURLVar = function(key) {
        var value = [];

        var query = String(document.location).split('?');

        if (query[1]) {
            var part = query[1].split('&');

            for (i = 0; i < part.length; i++) {
                var data = part[i].split('=');

                if (data[0] && data[1]) {
                    value[data[0]] = data[1];
                }
            }

            if (value[key]) {
                return value[key];
            } else {
                return '';
            }
        }
    }
    //判定国际化文字类别
    Util.langType = function(){
        var locale = this.getCookie("locale");
        var langObj={'zh_CN':'zh','zh_TW':'tw','en_US':'en'};
        if(locale==null)
            return 'tw';
        else
        {
            return langObj[locale];
        }
    }
    // 下一屏执行(多用于下屏提前加载)
    Util.nextReadyLoad = function(name,doFuntion){
        var windowHeight = $(window).height();
        var name = $(name);
        var ni = 0;
        var topPx = name.offset().top;
        $(window).scroll(function () {
            if($(window).scrollTop() > (topPx-windowHeight) && ni == 0){
                ni = 1;
                doFuntion();
            }
        })
    }
    Util.timeType = function(time){
        var self = this;
        var _lang=self.langType();
        var chTime="";
        var timer ="";
        var timeArry = time.split(' ');
        if(timeArry[1]){
            timer = timeArry[1]
        }
        var timeArry2 = timeArry[0].split('-');
        if(_lang=="en"){
            chTime = timer+"  "+timeArry2[1]+"-"+timeArry2[2]+"-"+timeArry2[0];
        }else{
            chTime = time ;
        }
        return chTime;
    }
    module.exports = Util;
});
