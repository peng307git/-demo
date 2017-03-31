define(function(require,exports,module){

	var App=function(callback){
		this.StateListen(callback);
	};
	
	App.prototype={

	    add:function(title,url){//无刷新改变URL
	        if(window.history.pushState){
	            window.history.pushState({title:title,url:url},title,url);
	        }else{
	            //location.href=url;
	        }
	        //document.title=title;
	    },
	    StateListen:function(callback){//监听地址
	    	_self = this;
	        var url=location.href.toString().split("/");
	        window.addEventListener('popstate', function(e){
	            if (history.state){
	            	callback(event);
		        }
	        },false);
	    }
	}

	module.exports = App;

})