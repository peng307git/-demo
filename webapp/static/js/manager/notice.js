jQuery(function($){

 // initialize input widgets first
    $('#basicExample .time').timepicker({
        'showDuration': true,
        'timeFormat': 'g:ia'
    });

    $('#basicExample .date').datepicker({
        'format': 'm/d/yyyy',
        'autoclose': true
    });

    // initialize datepair


	var language = 0
 	var article_detail_cn,article_title_cn,article_detail_tw,article_title_tw,article_detail_us,article_title_us;
	function showErrorAlert (reason, detail) {
		var msg='';
		if (reason==='unsupported-file-type') { msg = "Unsupported format " +detail; }
		else {
			console.log("error uploading file", reason, detail);
		}
		$('<div class="alert"> <button type="button" class="close" data-dismiss="alert">&times;</button>'+ 
		 '<strong>File upload error</strong> '+msg+' </div>').prependTo('#alerts');
	}

	//$('#editor1').ace_wysiwyg();//this will create the default editor will all buttons

	//but we want to change a few buttons colors for the third style
	function addarticle(editor){
		var editor = new wangEditor(editor);

        // 上传图片
        editor.config.uploadImgUrl = '/upload';

        // 表情显示项
        editor.config.emotionsShow = 'value';

        editor.create();
	}
	addarticle('editor1')
	addarticle('editor2')
	addarticle('editor3')
	if ( typeof jQuery.ui !== 'undefined' && /applewebkit/.test(navigator.userAgent.toLowerCase()) ) {
		
		var lastResizableImg = null;
		function destroyResizable() {
			if(lastResizableImg == null) return;
			lastResizableImg.resizable( "destroy" );
			lastResizableImg.removeData('resizable');
			lastResizableImg = null;
		}

		var enableImageResize = function() {
			$('.wysiwyg-editor')
			.on('mousedown', function(e) {
				var target = $(e.target);
				if( e.target instanceof HTMLImageElement ) {
					if( !target.data('resizable') ) {
						target.resizable({
							aspectRatio: e.target.width / e.target.height,
						});
						target.data('resizable', true);
						
						if( lastResizableImg != null ) {//disable previous resizable image
							lastResizableImg.resizable( "destroy" );
							lastResizableImg.removeData('resizable');
						}
						lastResizableImg = target;
					}
				}
			})
			.on('click', function(e) {
				if( lastResizableImg != null && !(e.target instanceof HTMLImageElement) ) {
					destroyResizable();
				}
			})
			.on('keydown', function() {
				destroyResizable();
			});
	    }
		
		enableImageResize();
		
	}
	function previewText(articleDetail,articleTitle){
		var article_detail = $(articleDetail).html();
		var article_title = $(articleTitle).val();
		//console.log( article_detail+" and "+article_title)
		
		//window.location.href = "/admin/notice/preview?title="+article_title+"&content="+article_detail;
		PostSubmit("/admin/notice/preview",article_title,article_detail) 
	}
	function PostSubmit(url, data, msg) {  
		    var postUrl = url;//提交地址  
		    var postTitle = data;//第一个数据  
		    var msgContent = msg;//第二个数据  
		    var ExportForm = document.createElement("FORM");  
		    document.body.appendChild(ExportForm);  
		    ExportForm.method = "POST";  
		    var newElement = document.createElement("input");  
		    newElement.setAttribute("name", "title");  
		    newElement.setAttribute("type", "hidden");  
		    var newElement2 = document.createElement("input");  
		    newElement2.setAttribute("name", "content");  
		    newElement2.setAttribute("type", "hidden");  
		    ExportForm.appendChild(newElement);  
		    ExportForm.appendChild(newElement2);  
		    newElement.value = postTitle;  
		    newElement2.value = msgContent;  
		    ExportForm.action = postUrl;
		    ExportForm.setAttribute('target', '_blank');  
		    ExportForm.submit();  
	};  
	function commitText(noticeId){
		var article_detail_cn = $("#editor1").html();
		var article_title_cn = $("#article_title_cn").val();
		var article_detail_tw = $("#editor2").html();
		var article_title_tw = $("#article_title_tw").val();
		var article_detail_us = $("#editor3").html();
		var article_title_us = $("#article_title_us").val();
		var commitDate = $("#basicExample .date").val();
		var commitTime = $("#basicExample .time").val();
		//console.log("commitDate="+commitDate+"commitTime="+commitTime+"article_detail_cn="+article_detail_cn+"article_title_cn="+article_title_cn+"article_detail_tw="+article_detail_tw+"article_title_tw="+article_title_tw+"article_detail_us="+article_detail_us+"article_title_us="+article_title_us)
		var url = "/admin/notice/add";
		var data = {"content":article_detail_cn,"title":article_title_cn,"contentTW":article_detail_tw,"titleTW":article_title_tw,"contentEN":article_detail_us,"titleEN":article_title_us};
		if(noticeId != undefined && noticeId != ""){
			url = "/admin/notice/modify";
			data = {"content":article_detail_cn,"title":article_title_cn,"contentTW":article_detail_tw,"titleTW":article_title_tw,"contentEN":article_detail_us,"titleEN":article_title_us,"noticeId":noticeId};
		}
		$.ajax({
	        cache: true,
	        type: "POST",
	        url:url,
	        data:data,
	        async: false,
	        error: function(request) {
	        },
	        success: function(data) {
	        	if(data.status == 0){
	        		window.location.href = '/admin/notice/list';
	            }else{
	            	alertBoxFunc(data.error.message,"sure");
	            }
	        }
	   	});
	}
	//commitText(a) a==0 为预览 a==1 为提交
	$("#preview_cn_btn").on('click', function(e) {
		previewText("#editor1","#article_title_cn");	
	})
	$("#preview_tw_btn").on('click', function(e) {
		previewText("#editor2","#article_title_tw");		
	})
	$("#preview_us_btn").on('click', function(e) {
		previewText("#editor3","#article_title_us");	
	})
	$("#submit_btn").on('click', function(e) {
			commitText($("#noticeId").val());
	})
});