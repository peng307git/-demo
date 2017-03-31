//手机端提示气泡
define(function(require,exports,module){
	var Pop = function(data){
		this.data = {
			'top' : 0,//气泡位置的x坐标
			'left' : 0,//气泡位置的y坐标
			'width' : 'auto',
			'padding' : "10px",
			'font-size' : '14px',
			'position':'fixed',
			'transition': 'opacity .5s',
			'-webkit-transition':'opacity .5s',
			'border-radius': '10px',
			'-webkit-border-radius':'10px',
			'background': '#000',
			'color': '#fff',
			'box-sizing':'border-box',
			//'white-space':'wrap',
			'max-width':'96%',
			//'overflow':'hidden',
			'display':'none',
			'text-align':'center'
		}
		this.showTime = 3500;

		this.init(data);
	}
	Pop.prototype = {

		init:function(data){
			if(data){
				if(data.css){
					this.extend(this.data,data.css);
				}
				this.showTime = data.showTime || 3500;
			}
			
			var div = document.createElement('div');
			this.ele = div;
			var css = '';
			for(i in this.data){
				if(i == 'top' && this.data[i]== 0){
					css+='top:50%;transform:translateY(-50%);';
					css+='-webkit-transform:translateY(-50%);';
				}else if(i == 'left' && this.data[i]== 0){
					css+='left:50%;transform:translateX(-50%);';
					css+='-webkit-transform:translateX(-50%);';
				}else{
					css+=i+":"+this.data[i]+";";
				}
			}

			div.setAttribute('style',css);
			document.body.appendChild(div);
		},
		show:function(text){
			var _self = this;
			_self.ele.innerHTML = text;
			
			var it = setTimeout(function(){
				_self.ele.style.opacity = '0';
				window.clearInterval(it);
			},_self.showTime);
			var its = setTimeout(function(){
				_self.ele.style.display = 'none';
				window.clearInterval(it);
			},_self.showTime+600);

			_self.ele.style.opacity = "1";
			_self.ele.style.display = 'block';
		},
		extend:function(a,b){
			//将b追加到a
			for (i in b) {
				a[i] = b[i];
			}
		}
	}
	module.exports = Pop;
})
