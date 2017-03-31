define(function(require,exports,module){
	
	     var $ = require('jquery');
	     var myCanvas = require('../module/drawhoop');
	     var Util = require('../module/util');
	    
	     //时间和全部资金
	     var nowUpdateTime = updateTime.toString();
	     var nowAllNum = Math.floor(allNum/10000000);
	     var langImg = Util.langType();
		 if(langImg == 'en'){
			nowUpdateTime = nowUpdateTime.replace(/(\d{4})(\d{2})(\d{2})/g,"$2-$3-$1");
			$('.all-num').html(nowAllNum*10);
		 }else{
		 	nowUpdateTime = nowUpdateTime.replace(/(\d{4})(\d{2})(\d{2})/g,"$1-$2-$3");
		 	$('.all-num').html(nowAllNum/10);
		 }
		 $('#updateTime').html(nowUpdateTime);
	     //本世纪进度条
	     $('.vote-progress').css('width',centuryTime*590);
	     //内页效果
    	     $('.open-mg-main-bot-link').click(function(){
    	     	   $('.open-mg-main-bot').addClass('pulse').on('animationend',function(){
    	     	   	    $(this).hide();
    	           });
    	     	   $('.open-mg-main-sub').removeClass('bg-color');   
    	     	   $('.open-mg-main-bot2').css({'display':'block','opacity':'0'}).addClass('bounce');
    	     });
    	     //顶部四个点击弹窗
    	     $('.open-mg-nav > li').on('click',function(){
    	     	 var itemIndex = $(this).index()+1;
    	     	 $('#open-mg-nav'+itemIndex).show();
    	     });
    	     //弹窗关闭
    	     $('.close-btn').on('click',function(){
    	     	   $(this).parents('.mg-open').hide();
    	     });
    	     //禁止滚动条滚动
          wheel($('.mg-open'));
          //点击痰喘内容外的黑色部分   弹窗隐藏
    	      $('.mg-open').on('click',function(){
               $(this).hide();
    	     });
    	     $('.modal-content-mg').on('click',function(event){
    	     	   event.stopPropagation();
    	     });
    	     //点击树形图  出现弹窗
    	     $('[class*=tree-node]').on('click',function(event){
    	     	   var modalId = $(this).attr('class').split(' ')[0]; 
    	     	   $('#'+modalId+'').show();
    	     	   event.stopPropagation();
    	     });
    	     //弹窗返回按钮
    	     $('.brn-back').on('click',function(){
    	     	  var $mgOpenModal = $(this).parents('.mg-open');
    	     	  var treeNodeNum = $mgOpenModal.attr('id').substr(11,1);
    	     	  var $backModal = $('#tree-node3-1-'+ treeNodeNum +'');
              $mgOpenModal.hide();
              $backModal.show();
    	     });
    	     //三级弹窗里面的 内容点击跳转
    	     $('.mg-open-link > li').on('click',function(){
    	          var $mgOpenModal = $(this).parents('.mg-open');
    	     	  var treeIndex = $mgOpenModal.attr('id').substr(9,1);
    	     	  var thisIndex = $(this).index() - 0 + 1;
    	     	  var treeSubIndex = $(this).parent().attr('data-index');
    	     	  if(treeIndex == 1){
    	     	  	 treeIndex = treeIndex - 0 + 2;
    	     	  }else{
    	     	  	 treeIndex =treeIndex - 0 + 1;
    	     	  }
    	     	  $mgOpenModal.hide();
    	     	  $('#tree-node'+treeIndex+'-'+treeSubIndex+'-'+thisIndex).show();
    	     });
    	     //画环形进度图

    	     for(var i=0; i < hoopRate.length; i++){
    	     	new myCanvas({
	    	     	boxId: "canvasBox"+(i+1),
	            elementId: "circleCan"+(i+1),
	            rate:hoopRate[i]
	    	    });
    	     }
    	     //弹窗出现时  禁止滚动
    	     function wheel(obj){
		        window.navigator.userAgent.indexOf('Firefox')!=-1 ? obj.on('DOMMouseScroll',fn) : obj.on('mousewheel',fn);
		        function fn(event){
		            event.preventDefault();
		        }
		    }
    	    
});
         
    	     