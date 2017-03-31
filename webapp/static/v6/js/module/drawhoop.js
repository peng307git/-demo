define(function(require, exports, module){
    
    var Util = require('./util');
    var Widget = require('./widget');
 
    var myCanvas = Widget({
        Options: {
	        boxId: "boxCan",
            elementId: "circleCan",
            width:50,
            rate:0,
            rateWidth:0.72,
            rateColor:"#238BF6",
            tpl:''
        },
        _init: function(){
            this.render();
        },
        render: function(){
            var self = this;
            var canWid = this.width/2;
            var tpl = ['<canvas id="{%elementId%}" width="{%width%}" height="{%width%}"></canvas>'].join("");
            this.tpl = this.tpl||tpl;
            this.trigger('beforeRender');
            var html = Util.format(this.tpl, this.options);
            document.getElementById(this.boxId).innerHTML = html;
            var context = document.getElementById(this.elementId).getContext("2d");
			//画背景圆环
			context.beginPath();
	        context.moveTo(canWid, canWid);  
	        context.arc(canWid, canWid, canWid, 0, Math.PI * 2, false);
	        context.closePath();  
	        context.fillStyle = '#ddd';  
	        context.fill(); 
	        	//画进度环
	        if(this.rate > 0){
				context.beginPath();  
		        context.moveTo(canWid, canWid);  
		        context.arc(canWid, canWid, canWid,1.5*Math.PI, Math.PI * 2 * this.rate / 100 - 0.5*Math.PI, false);  
		        context.closePath();
		        context.fillStyle = this.rateColor;
		        context.fill();
	        }
	        // 画内部空白
	        context.beginPath();  
	        context.moveTo(canWid, canWid);  
	        context.arc(canWid, canWid, canWid*this.rateWidth , 0, Math.PI * 2, true);  
	        context.closePath();  
	        context.fillStyle = 'rgba(255,255,255,1)';  
	        context.fill(); 
	         //在中间写字  
	        context.fillStyle = '#9B9B9B'; 
	        context.font = this.width/50*12 + 'px Arial';
	        context.textAlign = 'center';  
	        context.textBaseline = 'middle';   
	        context.fillText(this.rate+'%', canWid, canWid);  
	        this.trigger('afterRender');
        }
    });
    module.exports = myCanvas;
});


