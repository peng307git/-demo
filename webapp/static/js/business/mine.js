/**
*
*/
var mineFunc=function(){
	this.ready();
}

var proto=mineFunc.prototype;

proto.page='mine';



//初始背景的
var initData;


proto.createSubCore=function(){
	//按钮置灰
	$("#create_sub_core_but").attr('disabled',"true");
    var nodeId = $('#c_minefield_id').val();
    var mainNodeId = $('#c_main_core_id').val();
	 $.ajax({
		type : "post",
		url:'/mine/createSubCore'
		,data:{
            'coreNodeId':mainNodeId,
            'CSRFToken': $('#CSRFToken').val(),
            'nodeId':nodeId
        },
		dataType : "json"
		,success:function(msg){
			if(msg.status == 0){
				alertBoxFunc(msg.data,"sure",function(){
					window.location = "/mine/user";
				});
			}else{
				alertBoxFunc(msg.error.message,"sure");
				$("#create_sub_core_but").removeAttr("disabled");
			}
		}
		,error:function(err){
			$("#create_sub_core_but").removeAttr("disabled");
        console.log(err);
		}
	});
}


proto.childHref=function(data, mine_list){

    var subCoreTranslate = $('#subcore_translate').val();
	var _self = this;
    var _childStr='';
    for(var i=0;i<data.length;i++)
    {
        var subCoreName = 'NO.'+data[i].index_num+'<br/>'+subCoreTranslate;
       _childStr+='<li>';
       _childStr+='<a href="javascript:mineFunc.prototype.mineInfo('+data[i].id+','+"'"+subCoreName+"'"+')">';
       _childStr+='<span class="mine-icon mine-childHeart"></span><p>';
       _childStr+='NO.'+data[i].index_num+" "+subCoreTranslate;
       console.log(data);
       if(data[i].status == 4){
       		_childStr+='</p><p class="span-active">已激活</p></a>';
       }else{
       		_childStr+='</p><p class="span-no-active">未激活</p></a>';
       }
       
       _childStr+='</li>';
    }
    $('.left-bar-ul')
    .empty()
    .html(_childStr);
}

proto.mineInfo=function(nodeId,subCoreName){
    var mine=new mineFunc();
    $('#topLevelNodeId').val(nodeId);
    $('.tu').html(initData);
    mine.tu(nodeId,subCoreName, 'sub');
    $('#core-id').html(nodeId);
}

proto.ready=function(){
    //导航栏添加active
   var page=this.page;
   $('.navbar-nav')
   .find('li[data-page='+page+']')
   .addClass('active')
   .siblings()
   .removeClass('active');
   //信息栏每30s刷新
   
   
    
   //第二层
   
    $(".fen1").wheelmenu({
        animation: "fly",
        animationSpeed: "medium"
    });
    $(".fen2").wheelmenu({
        animation: "fly",
        animationSpeed: "medium"
    });
    $(".fen3").wheelmenu({
        animation: "fly",
        animationSpeed: "medium"
    });
    $(".fen4").wheelmenu({
        animation: "fly",
        animationSpeed: "medium"
    });
    $(".fen5").wheelmenu({
        animation: "fly",
        animationSpeed: "medium"
    });
    $(".fen6").wheelmenu({
        animation: "fly",
        animationSpeed: "medium"
    });
  /***********鼠标经过，左边出现信息*********/
	    $(".zhu").on('mouseover', (function () {
	        // 取得一些该显示的数据
	        $('.xinxi1').html($(this).children(".centerimg").attr("username"));
	        $('.xinxi2').html($(this).children(".centerimg").attr("telephone"));
	        $('.xinxi3').html("");
	        $('.xinxi4').html("");
	    }))
	    $(".fen").on('mouseover', (function () {
	        // 取得一些该显示的数据
	        $('.xinxi1').html($(this).children(".chlidimg").attr("username"));
	        $('.xinxi2').html($(this).children(".chlidimg").attr("telephone"));
	        $('.xinxi3').html("");
	        $('.xinxi4').html("");
	    }))
        $(".yi").on('mouseover', (function () {
            // 取得一些该显示的数据
            $('.xinxi1').html($(this).children(".chlidimg").attr("username"));
            $('.xinxi2').html($(this).children(".chlidimg").attr("telephone"));
            $('.xinxi3').html("");
            $('.xinxi4').html("");
        }))
        $(".er").on('mouseover', (function () {
            // 取得一些该显示的数据
            $('.xinxi1').html($(this).children(".chlidimg").attr("username"));
            $('.xinxi2').html($(this).children(".chlidimg").attr("telephone"));
            $('.xinxi3').html("");
            $('.xinxi4').html("");
        }))
        $(".san li").on('mouseover', (function () {
            // 取得一些该显示的数据
            $('.xinxi1').html($(this).children("a").children(".chlidimg").attr("username"));
            $('.xinxi2').html($(this).children("a").children(".chlidimg").attr("telephone"));
            $('.xinxi3').html("");
            $('.xinxi4').html("");
        }))
        
        $(".zhu").on('mouseout', (function () {
	        // 取得一些该显示的数据
	        $('.xinxi1').html("");
	        $('.xinxi2').html("");
	        $('.xinxi3').html("");
	        $('.xinxi4').html("");
	    }))
	    $(".fen").on('mouseout', (function () {
	        // 取得一些该显示的数据
	    	$('.xinxi1').html("");
	        $('.xinxi2').html("");
	        $('.xinxi3').html("");
	        $('.xinxi4').html("");
	    }))
        $(".yi").on('mouseout', (function () {
            // 取得一些该显示的数据
        	$('.xinxi1').html("");
	        $('.xinxi2').html("");
	        $('.xinxi3').html("");
	        $('.xinxi4').html("");
        }))
        $(".er").on('mouseout', (function () {
            // 取得一些该显示的数据
        	$('.xinxi1').html("");
	        $('.xinxi2').html("");
	        $('.xinxi3').html("");
	        $('.xinxi4').html("");
        }))
        $(".san li").on('mouseout', (function () {
            // 取得一些该显示的数据
        	$('.xinxi1').html("");
	        $('.xinxi2').html("");
	        $('.xinxi3').html("");
	        $('.xinxi4').html("");
        }))
}

proto.tu=function(topLevelId,topNodeName, nodeType){
	var _self=this;
    var subCoreTranslate = $('#subcore_translate').val();
    var mianCoreTranslate = $('#maincore_translate').val();
    //当前选中的是第几个（abcdef 层次上）
            var index;
            //ABCDEF层次上的数据
            var yiArray;
            //第二层上的数据

            var erArray;
            //复制数组
            var copyArray
            //json字符串
            var obj;
            var objBck;

            $.ajax({
            	async:false,
    			type : "post",
    			url:'/mine/user'
    			,data:{'nodeId':topLevelId},
    			dataType : "json"
    			,success:function(msg){
    				if(msg.status == 0){
    					obj = msg;
    					objBck = msg;
    				}else{
    					alertBoxFunc(msg.error.message,"sure");
    				}
    			}
    			,error:function(err){
                   console.log(err);
    			}
    		});

            //
            var mine_list = obj.data.mine_list;
            if(nodeType &&  nodeType== 'sub'){
                if(mine_list.status == 4){
                    $('.core-status p').hide().eq(0).show();
                }else{
                   $('.core-status p').hide().eq(1).show();
                }
            }
                     
            //数据渲染左边栏
            _self.childHref(obj.data.core_list, obj.data.mine_list);
            
            if(obj.data.is_main_node == 0){
            	//第二层
                
                $(".fen1").wheelmenu({
                    animation: "fly",
                    animationSpeed: "medium"
                });
                $(".fen2").wheelmenu({
                    animation: "fly",
                    animationSpeed: "medium"
                });
                $(".fen3").wheelmenu({
                    animation: "fly",
                    animationSpeed: "medium"
                });
                $(".fen4").wheelmenu({
                    animation: "fly",
                    animationSpeed: "medium"
                });
                $(".fen5").wheelmenu({
                    animation: "fly",
                    animationSpeed: "medium"
                });
                $(".fen6").wheelmenu({
                    animation: "fly",
                    animationSpeed: "medium"
                });
            }
          
            /***********鼠标经过，左边出现信息*********/
            $(".zhu").on('mouseover', (function () {
                // 取得一些该显示的数据
                $('.xinxi1').html($(this).children(".centerimg").attr("username"));
                $('.xinxi2').html($(this).children(".centerimg").attr("telephone"));
                $('.xinxi3').html("");
                $('.xinxi4').html("");
            }))
            $(".fen").on('mouseover', (function () {
                // 取得一些该显示的数据
                $('.xinxi1').html($(this).children(".chlidimg").attr("username"));
                $('.xinxi2').html($(this).children(".chlidimg").attr("telephone"));
                $('.xinxi3').html("");
                $('.xinxi4').html("");
            }))
            $(".yi").on('mouseover', (function () {
                // 取得一些该显示的数据
                $('.xinxi1').html($(this).children(".chlidimg").attr("username"));
                $('.xinxi2').html($(this).children(".chlidimg").attr("telephone"));
                $('.xinxi3').html("");
                $('.xinxi4').html("");
            }))
            $(".er").on('mouseover', (function () {
                // 取得一些该显示的数据
                $('.xinxi1').html($(this).children(".chlidimg").attr("username"));
                $('.xinxi2').html($(this).children(".chlidimg").attr("telephone"));
                $('.xinxi3').html("");
                $('.xinxi4').html("");
            }))
            $(".san li").on('mouseover', (function () {
                // 取得一些该显示的数据
                $('.xinxi1').html($(this).children("a").children(".chlidimg").attr("username"));
                $('.xinxi2').html($(this).children("a").children(".chlidimg").attr("telephone"));
                $('.xinxi3').html("");
                $('.xinxi4').html("");
            }))
            
            $(".zhu").on('mouseout', (function () {
		        // 取得一些该显示的数据
		        $('.xinxi1').html("");
		        $('.xinxi2').html("");
		        $('.xinxi3').html("");
		        $('.xinxi4').html("");
		    }))
		    $(".fen").on('mouseout', (function () {
		        // 取得一些该显示的数据
		    	$('.xinxi1').html("");
		        $('.xinxi2').html("");
		        $('.xinxi3').html("");
		        $('.xinxi4').html("");
		    }))
	        $(".yi").on('mouseout', (function () {
	            // 取得一些该显示的数据
	        	$('.xinxi1').html("");
		        $('.xinxi2').html("");
		        $('.xinxi3').html("");
		        $('.xinxi4').html("");
	        }))
	        $(".er").on('mouseout', (function () {
	            // 取得一些该显示的数据
	        	$('.xinxi1').html("");
		        $('.xinxi2').html("");
		        $('.xinxi3').html("");
		        $('.xinxi4').html("");
	        }))
	        $(".san li").on('mouseout', (function () {
	            // 取得一些该显示的数据
	        	$('.xinxi1').html("");
		        $('.xinxi2').html("");
		        $('.xinxi3').html("");
		        $('.xinxi4').html("");
	        }))


            // 第一层的a-e 的图片库
            yiArray = [
                [obj.data.mine_list.childrens[0].id, obj.data.mine_list.childrens[0].status, '../static/images/mine/a.png', '', obj.data.mine_list.childrens[0].username, obj.data.mine_list.childrens[0].telephone,obj.data.mine_list.childrens[0].level],
                [obj.data.mine_list.childrens[1].id, obj.data.mine_list.childrens[1].status, '../static/images/mine/b.png', '', obj.data.mine_list.childrens[1].username, obj.data.mine_list.childrens[1].telephone,obj.data.mine_list.childrens[0].level],
                [obj.data.mine_list.childrens[2].id, obj.data.mine_list.childrens[2].status, '../static/images/mine/c.png', '', obj.data.mine_list.childrens[2].username, obj.data.mine_list.childrens[2].telephone,obj.data.mine_list.childrens[0].level],
                [obj.data.mine_list.childrens[3].id, obj.data.mine_list.childrens[3].status, '../static/images/mine/d.png', '', obj.data.mine_list.childrens[3].username, obj.data.mine_list.childrens[3].telephone,obj.data.mine_list.childrens[0].level],
                [obj.data.mine_list.childrens[4].id, obj.data.mine_list.childrens[4].status, '../static/images/mine/e.png', '', obj.data.mine_list.childrens[4].username, obj.data.mine_list.childrens[4].telephone,obj.data.mine_list.childrens[0].level],
                [obj.data.mine_list.childrens[5].id, obj.data.mine_list.childrens[5].status, '../static/images/mine/f.png', '', obj.data.mine_list.childrens[5].username, obj.data.mine_list.childrens[5].telephone,obj.data.mine_list.childrens[0].level]
            ];

            //能量核心赋值
            function zhuFuzhi() {
                //给能量核心赋值
                var centerimg = $('.zhu').children(".centerimg");
                centerimg.attr("id", obj.data.mine_list.id);
                $('.zhu').attr("status", obj.data.mine_list.status);
                centerimg.attr("username", obj.data.mine_list.username);
                centerimg.attr("telephone", obj.data.mine_list.telephone);
                centerimg.attr("level", obj.data.mine_list.level);
                //能量核心没有做状态判断
                centerimg.children("img").attr("src", '../static/images/mine/zhu.png');
                centerimg.children("h4").html(topNodeName);
            }
            //第一截赋值
            function firstFuzhi(index) {

                //用状态判断文字和图片
                $.each(yiArray, function (n, value) {

                    if (yiArray[n][1] == "0") {
                        if (n == "0") {
                            yiArray[n][2] = '../static/images/mine/a.png';
                        }
                        if (n == "1") {
                            yiArray[n][2] = '../static/images/mine/b.png';
                        }
                        if (n == "2") {
                            yiArray[n][2] = '../static/images/mine/c.png';
                        }
                        if (n == "3") {
                            yiArray[n][2] = '../static/images/mine/d.png';
                        }
                        if (n == "4") {
                            yiArray[n][2] = '../static/images/mine/e.png';
                        }
                        if (n == "5") {
                            yiArray[n][2] = '../static/images/mine/f.png';
                        }
                    }
                    if (yiArray[n][1] == "1") {
                        if (n == "0") {
                            yiArray[n][2] = '../static/images/mine/la.png';
                        }
                        if (n == "1") {
                            yiArray[n][2] = '../static/images/mine/lb.png';
                        }
                        if (n == "2") {
                            yiArray[n][2] = '../static/images/mine/lc.png';
                        }
                        if (n == "3") {
                            yiArray[n][2] = '../static/images/mine/ld.png';
                        }
                        if (n == "4") {
                            yiArray[n][2] = '../static/images/mine/le.png';
                        }
                        if (n == "5") {
                            yiArray[n][2] = '../static/images/mine/lf.png';
                        }
                    }
                    if (yiArray[n][1] == "2") {
                        if (n == "0") {
                            yiArray[n][2] = '../static/images/mine/ma.png';
                        }
                        if (n == "1") {
                            yiArray[n][2] = '../static/images/mine/mb.png';
                        }
                        if (n == "2") {
                            yiArray[n][2] = '../static/images/mine/mc.png';
                        }
                        if (n == "3") {
                            yiArray[n][2] = '../static/images/mine/md.png';
                        }
                        if (n == "4") {
                            yiArray[n][2] = '../static/images/mine/me.png';
                        }
                        if (n == "5") {
                            yiArray[n][2] = '../static/images/mine/mf.png';
                        }
                    }
                    if (yiArray[n][1] == "3" || yiArray[n][1] == "4") {

                        if (n == "0") {
                            yiArray[n][2] = '../static/images/mine/childimg.png';
                            yiArray[n][3] = subCoreTranslate;
                        }
                        if (n == "1") {
                            yiArray[n][2] = '../static/images/mine/childimg.png';
                            yiArray[n][3] = subCoreTranslate;
                        }
                        if (n == "2") {
                            yiArray[n][2] = '../static/images/mine/childimg.png';
                            yiArray[n][3] = subCoreTranslate;
                        }
                        if (n == "3") {
                            yiArray[n][2] = '../static/images/mine/childimg.png';
                            yiArray[n][3] = subCoreTranslate;
                        }
                        if (n == "4") {
                            yiArray[n][2] = '../static/images/mine/childimg.png';
                            yiArray[n][3] = subCoreTranslate;
                        }
                        if (n == "5") {
                            yiArray[n][2] = '../static/images/mine/childimg.png';
                            yiArray[n][3] = subCoreTranslate;
                        }

                    }
                });
               
                //复制数组
                copyArray = yiArray.concat(); 
                //选中的元素在数组中的位置
             
                //数组去除选中的元素
                copyArray.splice(index, 1);

                //底下显示选中的元素
                if(yiArray[index] != undefined){
                	$('.fen').children(".chlidimg").attr("id", yiArray[index][0]);
                    $('.fen').attr("id", yiArray[index][0]);
                    $('.fen').attr("status", yiArray[index][1]);
                    $('.fen').children(".chlidimg").children("img").attr("src", yiArray[index][2]);
                    $('.fen').children(".chlidimg").children("h4").html(yiArray[index][3]);
                    $('.fen').children(".chlidimg").attr("username", yiArray[index][4]);
                    $('.fen').children(".chlidimg").attr("telephone", yiArray[index][5]);
                    $('.fen').children(".chlidimg").attr("level", yiArray[index][6]);
                }
                //给第一截的图片附上地址
                for (var i = 0; i < 5; i++) {
                    $('.yi').eq(i).children(".chlidimg").attr("id", copyArray[i][0]);
                    $('.yi').eq(i).attr("id", copyArray[i][0]);
                    $('.yi').eq(i).attr("status", copyArray[i][1]);
                    $('.yi').eq(i).children(".chlidimg").children("img").attr("src", copyArray[i][2]);
                    $('.yi').eq(i).children(".chlidimg").children("h4").html(copyArray[i][3]);
                    $('.yi').eq(i).children(".chlidimg").attr("username", copyArray[i][4]);
                    $('.yi').eq(i).children(".chlidimg").attr("telephone", copyArray[i][5]);
                    $('.yi').eq(i).children(".chlidimg").attr("level", copyArray[i][6]);
                }
            }
            //第二截赋值
            function secondFuzhi(index) {
            	if(obj.data.mine_list.childrens[index] == undefined || obj.data.mine_list.childrens[index].childrens == undefined){
            		console.log("创建子核心提交后mine list报错："+obj.data.mine_list.childrens[index]);
            		return ;
            	}

                erArray=[];
                for(var i=0;i<6;i++){
                    var info = [];
                    if(obj.data.mine_list.childrens[index].childrens[i]!=undefined){
                        info = [
                            obj.data.mine_list.childrens[index].childrens[i].id,
                            obj.data.mine_list.childrens[index].childrens[i].status,
                            '../static/images/mine/a.png',
                            '',
                            obj.data.mine_list.childrens[index].childrens[i].username,
                            obj.data.mine_list.childrens[index].childrens[i].telephone,
                            obj.data.mine_list.childrens[index].childrens[i].level
                        ];
                    }
                    erArray.push(info);
                }
                //erArray =
                //    [
                //        [
                //            obj.data.mine_list.childrens[index].childrens[0].id,
                //            obj.data.mine_list.childrens[index].childrens[0].status,
                //            '../static/images/mine/a.png',
                //            '',
                //            obj.data.mine_list.childrens[index].childrens[0].username,
                //            obj.data.mine_list.childrens[index].childrens[0].telephone,
                //            obj.data.mine_list.childrens[index].childrens[0].level
                //        ],
                //       [
                //            obj.data.mine_list.childrens[index].childrens[1].id,
                //            obj.data.mine_list.childrens[index].childrens[1].status,
                //            '../static/images/mine/a.png',
                //            '',
                //            obj.data.mine_list.childrens[index].childrens[1].username,
                //            obj.data.mine_list.childrens[index].childrens[1].telephone,
                //             obj.data.mine_list.childrens[index].childrens[1].level
                //       ],
                //       [
                //            obj.data.mine_list.childrens[index].childrens[2].id,
                //            obj.data.mine_list.childrens[index].childrens[2].status,
                //            '../static/images/mine/a.png',
                //            '',
                //            obj.data.mine_list.childrens[index].childrens[2].username,
                //            obj.data.mine_list.childrens[index].childrens[2].telephone,
                //             obj.data.mine_list.childrens[index].childrens[2].level
                //       ],
                //       [
                //            obj.data.mine_list.childrens[index].childrens[3].id,
                //            obj.data.mine_list.childrens[index].childrens[3].status,
                //            '../static/images/mine/a.png',
                //            '',
                //            obj.data.mine_list.childrens[index].childrens[3].username,
                //            obj.data.mine_list.childrens[index].childrens[3].telephone,
                //             obj.data.mine_list.childrens[index].childrens[3].level
                //       ],
                //       [
                //            obj.data.mine_list.childrens[index].childrens[4].id,
                //            obj.data.mine_list.childrens[index].childrens[4].status,
                //            '../static/images/mine/a.png',
                //            '',
                //            obj.data.mine_list.childrens[index].childrens[4].username,
                //            obj.data.mine_list.childrens[index].childrens[4].telephone,
                //             obj.data.mine_list.childrens[index].childrens[4].level
                //       ],
                //       [
                //            obj.data.mine_list.childrens[index].childrens[5].id,
                //            obj.data.mine_list.childrens[index].childrens[5].status,
                //            '../static/images/mine/a.png',
                //            '',
                //            obj.data.mine_list.childrens[index].childrens[5].username,
                //            obj.data.mine_list.childrens[index].childrens[5].telephone,
                //             obj.data.mine_list.childrens[index].childrens[5].level
                //       ]
                //    ];

                //用状态判断文字和图片
                $.each(erArray, function (n, value) {

                    if (erArray[n][1] == "0") {
                        if (index == "0") {
                            erArray[n][2] = '../static/images/mine/a2.png';
                        }
                        if (index == "1") {
                            erArray[n][2] = '../static/images/mine/b2.png';
                        }
                        if (index == "2") {
                            erArray[n][2] = '../static/images/mine/c2.png';
                        }
                        if (index == "3") {
                            erArray[n][2] = '../static/images/mine/d2.png';
                        }
                        if (index == "4") {
                            erArray[n][2] = '../static/images/mine/e2.png';
                        }
                        if (index == "5") {
                            erArray[n][2] = '../static/images/mine/f2.png';
                        }
                    }
                    if (erArray[n][1] == "1") {
                        if (index == "0") {
                            erArray[n][2] = '../static/images/mine/la2.png';
                        }
                        if (index == "1") {
                            erArray[n][2] = '../static/images/mine/lb2.png';
                        }
                        if (index == "2") {
                            erArray[n][2] = '../static/images/mine/lc2.png';
                        }
                        if (index == "3") {
                            erArray[n][2] = '../static/images/mine/ld2.png';
                        }
                        if (index == "4") {
                            erArray[n][2] = '../static/images/mine/le2.png';
                        }
                        if (index == "5") {
                            erArray[n][2] = '../static/images/mine/lf2.png';
                        }
                    }
                    if (erArray[n][1] == "2") {
                        if (index == "0") {
                            erArray[n][2] = '../static/images/mine/ma2.png';
                        }
                        if (index == "1") {
                            erArray[n][2] = '../static/images/mine/mb2.png';
                        }
                        if (index == "2") {
                            erArray[n][2] = '../static/images/mine/mc2.png';
                        }
                        if (index == "3") {
                            erArray[n][2] = '../static/images/mine/md2.png';
                        }
                        if (index == "4") {
                            erArray[n][2] = '../static/images/mine/me2.png';
                        }
                        if (index == "5") {
                            erArray[n][2] = '../static/images/mine/mf2.png';
                        }
                    }
                    if (erArray[n][1] == "3" || erArray[n][1] == "4") {

                        if (index == "0") {
                            erArray[n][2] = '../static/images/mine/childimg.png';
                            erArray[n][3] = "子核心a";
                        }
                        if (index == "1") {
                            erArray[n][2] = '../static/images/mine/childimg.png';
                            erArray[n][3] = "子核心b";
                        }
                        if (index == "2") {
                            erArray[n][2] = '../static/images/mine/childimg.png';
                            erArray[n][3] = "子核心c";
                        }
                        if (index == "3") {
                            erArray[n][2] = '../static/images/mine/childimg.png';
                            erArray[n][3] = "子核心d";
                        }
                        if (index == "4") {
                            erArray[n][2] = '../static/images/mine/childimg.png';
                            erArray[n][3] = "子核心e";
                        }
                        if (index == "5") {
                            erArray[n][2] = '../static/images/mine/childimg.png';
                            erArray[n][3] = "子核心f";
                        }

                    }
                });
                //下面进行其他赋值---------------------------------注意

                //给第二截的图片附上地址
                for (var i = 0; i < 6; i++) {
                    $('.er').eq(i).children(".chlidimg").attr("id", erArray[i][0]);
                    $('.er').eq(i).attr("status", erArray[i][1]);
                    $('.er').eq(i).attr("id", erArray[i][0]);
                    $('.er').eq(i).children(".chlidimg").children("img").attr("src", erArray[i][2]);
                    $('.er').eq(i).children(".chlidimg").children("h4").html(erArray[i][3]);
                    $('.er').eq(i).children(".chlidimg").attr("username", erArray[i][4]);
                    $('.er').eq(i).children(".chlidimg").attr("telephone", erArray[i][5]);
                    $('.er').eq(i).children(".chlidimg").attr("level", erArray[i][6]);
                }
            }

            //第三截赋值
            function thirdFuzhi(index) {
                $(".san >li>a>.chlidimg> h4").html("");
                for (var i = 0; i < 6; i++) {
                    var sanchlidimg = $('.san').eq(i).children('li');
                    for (var j = 0; j < 6; j++) {
                    	
                    	if(obj.data.mine_list.childrens[index] == undefined){
                    		console.log("创建子核心提交后mine list childrens报错："+"index="+index);
                    		continue;
                    	}
                        if(undefined == obj.data.mine_list.childrens[index].childrens[i]){
                            console.log("第二层 childrens报错："+"index="+index+",i="+i+",j="+j);
                            continue;
                        }
                        if(undefined == obj.data.mine_list.childrens[index].childrens[i].childrens[j]){
                            console.log("第三层 childrens报错："+"index="+index+",i="+i+",j="+j);
                            continue;
                        }

                        sanchlidimg.eq(j).attr("id", obj.data.mine_list.childrens[index].childrens[i].childrens[j].id);
                        sanchlidimg.eq(j).attr("status", obj.data.mine_list.childrens[index].childrens[i].childrens[j].status);
                        sanchlidimg.eq(j).children("a").children(".chlidimg").attr("username", obj.data.mine_list.childrens[index].childrens[i].childrens[j].username);
                        sanchlidimg.eq(j).children("a").children(".chlidimg").attr("telephone", obj.data.mine_list.childrens[index].childrens[i].childrens[j].telephone);
                        sanchlidimg.eq(j).children("a").children(".chlidimg").attr("level", obj.data.mine_list.childrens[index].childrens[i].childrens[j].level);

                        if (obj.data.mine_list.childrens[index].childrens[i].childrens[j].status == "0") {
                            if (index == "0") {
                                sanchlidimg.eq(j).children("a").children(".chlidimg").children("img").attr("src", '../static/images/mine/a3.png');
                            }
                            if (index == "1") {
                                sanchlidimg.eq(j).children("a").children(".chlidimg").children("img").attr("src", '../static/images/mine/b3.png');
                            }
                            if (index == "2") {
                                sanchlidimg.eq(j).children("a").children(".chlidimg").children("img").attr("src", '../static/images/mine/c3.png');
                            }
                            if (index == "3") {
                                sanchlidimg.eq(j).children("a").children(".chlidimg").children("img").attr("src", '../static/images/mine/d3.png');
                            }
                            if (index == "4") {
                                sanchlidimg.eq(j).children("a").children(".chlidimg").children("img").attr("src", '../static/images/mine/e3.png');
                            }
                            if (index == "5") {
                                sanchlidimg.eq(j).children("a").children(".chlidimg").children("img").attr("src", '../static/images/mine/f3.png');
                            }
                        }
                        if (obj.data.mine_list.childrens[index].childrens[i].childrens[j].status == "1") {
                            if (index == "0") {
                                sanchlidimg.eq(j).children("a").children(".chlidimg").children("img").attr("src", '../static/images/mine/la3.png');
                            }
                            if (index == "1") {
                                sanchlidimg.eq(j).children("a").children(".chlidimg").children("img").attr("src", '../static/images/mine/lb3.png');
                            }
                            if (index == "2") {
                                sanchlidimg.eq(j).children("a").children(".chlidimg").children("img").attr("src", '../static/images/mine/lc3.png');
                            }
                            if (index == "3") {
                                sanchlidimg.eq(j).children("a").children(".chlidimg").children("img").attr("src", '../static/images/mine/ld3.png');
                            }
                            if (index == "4") {
                                sanchlidimg.eq(j).children("a").children(".chlidimg").children("img").attr("src", '../static/images/mine/le3.png');
                            }
                            if (index == "5") {
                                sanchlidimg.eq(j).children("a").children(".chlidimg").children("img").attr("src", '../static/images/mine/lf3.png');
                            }
                        }
                        if (obj.data.mine_list.childrens[index].childrens[i].childrens[j].status == "2") {
                            if (index == "0") {
                                sanchlidimg.eq(j).children("a").children(".chlidimg").children("img").attr("src", '../static/images/mine/ma3.png');
                            }
                            if (index == "1") {
                                sanchlidimg.eq(j).children("a").children(".chlidimg").children("img").attr("src", '../static/images/mine/mb3.png');
                            }
                            if (index == "2") {
                                sanchlidimg.eq(j).children("a").children(".chlidimg").children("img").attr("src", '../static/images/mine/mc3.png');
                            }
                            if (index == "3") {
                                sanchlidimg.eq(j).children("a").children(".chlidimg").children("img").attr("src", '../static/images/mine/md3.png');
                            }
                            if (index == "4") {
                                sanchlidimg.eq(j).children("a").children(".chlidimg").children("img").attr("src", '../static/images/mine/me3.png');
                            }
                            if (index == "5") {
                                sanchlidimg.eq(j).children("a").children(".chlidimg").children("img").attr("src", '../static/images/mine/mf3.png');
                            }
                        }
                        if (obj.data.mine_list.childrens[index].childrens[i].childrens[j].status == "3") {

                            if (index == "0") {
                                sanchlidimg.eq(j).children("a").children(".chlidimg").children("img").attr("src", '../static/images/mine/childimg.png');
                                sanchlidimg.eq(j).children("a").children(".chlidimg").children("h4").html("子核心a");
                            }
                            if (index == "1") {
                                sanchlidimg.eq(j).children("a").children(".chlidimg").children("img").attr("src", '../static/images/mine/childimg.png');
                                sanchlidimg.eq(j).children("a").children(".chlidimg").children("h4").html("子核心b");
                            }
                            if (index == "2") {
                                sanchlidimg.eq(j).children("a").children(".chlidimg").children("img").attr("src", '../static/images/mine/childimg.png');
                                sanchlidimg.eq(j).children("a").children(".chlidimg").children("h4").html("子核心c");
                            }
                            if (index == "3") {
                                sanchlidimg.eq(j).children("a").children(".chlidimg").children("img").attr("src", '../static/images/mine/childimg.png');
                                sanchlidimg.eq(j).children("a").children(".chlidimg").children("h4").html("子核心d");
                            }
                            if (index == "4") {
                                sanchlidimg.eq(j).children("a").children(".chlidimg").children("img").attr("src", '../static/images/mine/childimg.png');
                                sanchlidimg.eq(j).children("a").children(".chlidimg").children("h4").html("子核心e");
                            }
                            if (index == "5") {
                                sanchlidimg.eq(j).children("a").children(".chlidimg").children("img").attr("src", '../static/images/mine/childimg.png');
                                sanchlidimg.eq(j).children("a").children(".chlidimg").children("h4").html("子核心f");
                            }
                        }
                    }
                }
            }

            //////////////////////////////////////// 赋值

            zhuFuzhi();
            firstFuzhi(0);
            secondFuzhi(0);
            thirdFuzhi(0);


            /*点击能力核心*/
            $('.zhu').click(function () {
              
                if ($(this).attr('status') == '2' || $(this).attr('status') == '3' || $(this).attr('status') == '4') {
                    if ($('.zhu2').css("display")=="none") {
                        $('.first').addClass("first-line");
                        $('.yi').fadeIn();
                        $('.second').fadeIn();

                    } else {
                        $('.first').removeClass("first-line");
                        $('.yi').hide();
                        $('.second').hide();
                        $('.second').removeClass("second2");
                        $('.er').hide();
                        $('.san').hide();
                        $('.san').removeClass("active");
                        $('.san').css("visibility", "hidden");
                        firstFuzhi(0);
                        secondFuzhi(0);
                        thirdFuzhi(0);
                    }
                }
            })
            var changID;//这里记录被点击，弹出框的id

            //点击bcd等
            $('.yi').click(function () {
                if ($(this).attr('status') == '2' || $(this).attr('status') == '3' || $(this).attr('status') == '4') {
                    //消失-------------------------------------
                $('.first').removeClass("first-line");
                $('.yi').fadeOut();
                $('.second').fadeOut();
                $('.second').removeClass("second2");
                $('.er').fadeOut();
                $('.san').fadeOut();
                $('.san').removeClass("active");
                $('.san').css("visibility", "hidden");



                //图片变换------------------------------------
                for (var i = 0; i < 6; i++) {
                    if ($(this).children(".chlidimg").attr("id") == yiArray[i][0]) {
                        index = i;
                    }

                }
                firstFuzhi(index); 
                secondFuzhi(index);
                thirdFuzhi(index );
                //出现-----------------------------------------------
                $('.first').addClass("first-line");
                $('.yi').fadeIn();
                $('.second').fadeIn();
                 } else if ($(this).attr('status') == '0')    {
                    changID = $(this).attr('id');
                    $('.messagebox3').css("top", "200px");
                    $('.bg').height($(document).height());
                    $('.bg').width($(document).width());
                    
                    $.ajax({
                		type : "get",
                		url:'/mine/getSubCore'
                		,data:{'mindfieldId':obj.data.main.main_core_id,'thisfieldId':changID},
                		dataType : "json"
                		,success:function(msg){
                			if(msg.status == 0){
                				$('#copyText').val(window.location.protocol+"//"+window.location.host+"/user/signup?code="+msg.data.code);
                				var subCreateText = $('#subCreateText').val();
                                $('.top').text(subCreateText+obj.data.main.used_sub_core);
                                $('#c_subcore_num').val(obj.data.main.sub_core);
                                $('#c_minefield_id').val(changID);
                                $('#c_main_core_id').val(obj.data.main.main_core_id);
                                $('.bg').show();
                			}else{
                				
                			}
                		}
                		,error:function(err){
                        console.log(err);
                		}
                	});
                    
                }else if($(this).attr('status') == '1'){//点击点位被占据如果超过72小时提示是否清除点位
                	var nodeId = $(this).attr('id');
                	alertBoxFunc($('#mineClearText').val(),"all",function(){
                		$.ajax({
                			type : "post",
                			url:'/mine/clearSubNode'
                			,data:{'nodeId':nodeId},
                			dataType : "json"
                			,success:function(msg){
                				if(msg.status == 0){
                					alertBoxFunc(msg.data,"sure",function(){
                						window.location = "/mine/user";
                					});
                				}else{
                					alertBoxFunc(msg.error.message,"sure");
                				}
                			}
                			,error:function(err){
                	        console.log(err);
                			}
                		});
    				});
                }
            })

            /*点击abcdef*/
            $('.fen').click(function () {
                if ($('.fen').attr('status') == '2' || $('.fen').attr('status') == '3' || $(this).attr('status') == '4') {
                    if ($('.fen1').is(":hidden")) {
                        $('.second').addClass("second2");
                        //$('.er').fadeIn();
                        $('.er').show();
                        $('.er').css("opacity",1);

                    } else {
                        $('.second').removeClass("second2");
                        $('.er').fadeOut();
                        $('.san').fadeOut();
                        $('.san').removeClass("active");
                        $('.san').css("visibility", "hidden");
                    }
                }else if ($('.fen').attr('status') == '0') {
                    changID = $(this).attr('id');
                    $('.messagebox3').css("top", "200px");
                    $('.bg').height($(document).height());
                    $('.bg').width($(document).width());
                    
                    $.ajax({
                		type : "get",
                		url:'/mine/getSubCore'
                		,data:{'mindfieldId':obj.data.main.main_core_id,'thisfieldId':changID},
                		dataType : "json"
                		,success:function(msg){
                			if(msg.status == 0){
                				$('#copyText').val(window.location.protocol+"//"+window.location.host+"/user/signup?code="+msg.data.code);
                				var subCreateText = $('#subCreateText').val();
                                $('.top').text(subCreateText+obj.data.main.used_sub_core);
                                $('#c_subcore_num').val(obj.data.main.sub_core);
                                $('#c_minefield_id').val(changID);
                                $('#c_main_core_id').val(obj.data.main.main_core_id);
                                $('.bg').show();
                			}else{
                				
                			}
                		}
                		,error:function(err){
                        console.log(err);
                		}
                	});
                }else if($('.fen').attr('status') == '1'){
                	var nodeId = $(this).attr('id');
                	alertBoxFunc($('#mineClearText').val(),"all",function(){
                		$.ajax({
                			type : "post",
                			url:'/mine/clearSubNode'
                			,data:{'nodeId':nodeId},
                			dataType : "json"
                			,success:function(msg){
                				if(msg.status == 0){
                					alertBoxFunc(msg.data,"sure",function(){
                						window.location = "/mine/user";
                					});
                				}else{
                					alertBoxFunc(msg.error.message,"sure");
                				}
                			}
                			,error:function(err){
                	        console.log(err);
                			}
                		});
    				});
                }
            })
            /* 第二层的点击*/
            $('.er').click(function () {
                if ($(this).attr('status') == '0') {
                    changID = $(this).attr('id');
                    $('.messagebox3').css("top", "200px");
                    $('.bg').height($(document).height());
                    $('.bg').width($(document).width());
                    
                    $.ajax({
                		type : "get",
                		url:'/mine/getSubCore'
                		,data:{'mindfieldId':obj.data.main.main_core_id,'thisfieldId':changID},
                		dataType : "json"
                		,success:function(msg){
                			if(msg.status == 0){
                				$('#copyText').val(window.location.protocol+"//"+window.location.host+"/user/signup?code="+msg.data.code);
                				var subCreateText = $('#subCreateText').val();
                                $('.top').text(subCreateText+obj.data.main.used_sub_core);
                                $('#c_subcore_num').val(obj.data.main.sub_core);
                                $('#c_minefield_id').val(changID);
                                $('#c_main_core_id').val(obj.data.main.main_core_id);
                                $('.bg').show();
                			}else{
                				
                			}
                		}
                		,error:function(err){
                        console.log(err);
                		}
                	});
                }else if($(this).attr('status') == '1'){
                	var nodeId = $(this).attr('id');
                	alertBoxFunc($('#mineClearText').val(),"all",function(){
                		$.ajax({
                			type : "post",
                			url:'/mine/clearSubNode'
                			,data:{'nodeId':nodeId},
                			dataType : "json"
                			,success:function(msg){
                				if(msg.status == 0){
                					alertBoxFunc(msg.data,"sure",function(){
                						window.location = "/mine/user";
                					});
                				}else{
                					alertBoxFunc(msg.error.message,"sure");
                				}
                			}
                			,error:function(err){
                	        console.log(err);
                			}
                		});
    				});
                }
            })
            /* 第三层的点击*/
            $('.san li').click(function () {
                if ($(this).attr('status') == '0') {
                    changID = $(this).attr('id');
                    $('.messagebox3').css("top", "200px");
                    $('.bg').height($(document).height());
                    $('.bg').width($(document).width());
                    
                    $.ajax({
                		type : "get",
                		url:'/mine/getSubCore'
                		,data:{'mindfieldId':obj.data.main.main_core_id,'thisfieldId':changID},
                		dataType : "json"
                		,success:function(msg){
                			if(msg.status == 0){
                				$('#copyText').val(window.location.protocol+"//"+window.location.host+"/user/signup?code="+msg.data.code);
                				var subCreateText = $('#subCreateText').val();
                                $('.top').text(subCreateText+obj.data.main.used_sub_core);
                                $('#c_subcore_num').val(obj.data.main.sub_core);
                                $('#c_minefield_id').val(changID);
                                $('#c_main_core_id').val(obj.data.main.main_core_id);
                                $('.bg').show();
                			}else{
                				
                			}
                		}
                		,error:function(err){
                        console.log(err);
                		}
                	});
                }else if($(this).attr('status') == '1'){
                	var nodeId = $(this).attr('id');
                	alertBoxFunc($('#mineClearText').val(),"all",function(){
                		$.ajax({
                			type : "post",
                			url:'/mine/clearSubNode'
                			,data:{'nodeId':nodeId},
                			dataType : "json"
                			,success:function(msg){
                				if(msg.status == 0){
                					alertBoxFunc(msg.data,"sure",function(){
                						window.location = "/mine/user";
                					});
                				}else{
                					alertBoxFunc(msg.error.message,"sure");
                				}
                			}
                			,error:function(err){
                	        console.log(err);
                			}
                		});
    				});
                }
            })
            $(".cancle").click(function () {
                $('.messagebox3').css("top", "-400px");
                $('.bg').hide();
            })
            $(".sure").click(function () {
                //整理同意创建子核心了,当前节点这个id，状态变为status3
                $('.messagebox3').css("top", "-400px");
                $('.bg').hide();

                //这里进行数据操作，然后重置json，然后重新赋值



                //重新赋值

                zhuFuzhi();
                firstFuzhi(index);
                secondFuzhi(index);
                thirdFuzhi(index);

            })

            //当页面滚动时候，也要跟着走
            $(window).scroll(function (event) {
                $('.san').each(function () {
                    itop = parseInt($(this).attr("alt"));
                    $(this).css("top", itop - parseInt($(document).scrollTop()));
                })

            });
            //跟随窗口的大小左右移动
            var $wind = $(window); //加载窗口
            var winW = parseInt($wind.outerWidth());//窗口宽度
            var warpWidth = parseInt(1000); //内容宽度
            //resize事件处理
            // $wind.resize(function () {
            //     var newW = parseInt($wind.outerWidth());
            //     $('.nav').html(newW + "|||||" + winW);
            //     $('.san').each(function () {
            //         //这个当时点开的时候，窗口的宽度
            //         iwidth = parseInt($(this).attr("alt2"));
            //         //如果当时窗口宽度大于内容宽度
            //         if (iwidth >= warpWidth) {
            //             //如果现在窗口大于当时窗口，加上左边距
            //             if (newW > iwidth) {
            //                 $(this).css("margin-left", (newW - iwidth) / 2);
            //             }
            //             //如果现在窗口不大于当时窗口，不加左边距
            //             if (warpWidth <= newW && newW <= iwidth) {
            //                 $(this).css("margin-left", (newW - iwidth) / 2);
            //             }
            //             if (newW < warpWidth) {

            //             }
            //         }
            //         //当时窗口宽度不大于1000
            //         if (iwidth <= warpWidth) {
            //             if (newW >= warpWidth) {
            //                 $(this).css("margin-left", (newW - warpWidth) / 2);
            //             }
            //         }
            //     })
            // })
            



}

$(function(){
	var mine=new mineFunc();
    initData = $('.tu').html();

    //TODO
    var mianCoreTranslate = $('#maincore_translate').val();
    mine.tu($('#topLevelNodeId').val(),mianCoreTranslate, 'top');
    $(".cancle").click(function () {
        $('.messagebox4').hide();
        $('.bg').hide();
    });
    firRequest();
    window.setInterval("firRequest()",1000*30);
   //剪切板js
    $('#copyBtn').zclip({
        path: '/static/other/ZeroClipboard.swf',
        copy: function () {//复制内容 
            return $.trim($('#copyText').val());
        },
        afterCopy: function () {
            alert('复制成功');
        }
    });
})

function getSlaveTable(){
	var data = eval($('#slaveList').val());
	
	var mineText17 = $('#mineText17').val();
	var mineText18 = $('#mineText18').val();
	var mineText19 = $('#mineText19').val();
	var mineText21 = $('#mineText21').val();
	var mineText22 = $('#mineText22').val();
	var mineText23 = $('#mineText23').val();
	var mineText24 = $('#mineText24').val();
	var mineText25 = $('#mineText25').val();
	
	var html = "<table class='yigouTable' cellpadding='0' cellspacing='0'> <tr class='order-th'><th>"+mineText17+"</th><th>"+mineText18+"</th>" ;
	html+=	"<th>"+mineText19+"</th><th>"+mineText21+"</th><th>"+mineText22+"</th><th>"+mineText23+"</th></tr>";
	for(var i=0;i<data.length;i++){
		html+="<tr id='rec_tr_"+data[i].nodeId+"'><td>"+data[i].nickname+"  </td><td><a href='javascript:getPosition("+data[i].nodeId+")'>"+mineText24+"</a></td><td>"+data[i].status+"  </td>";
		html+="<td>"+data[i].buyTime+"  </td><td>"+data[i].registerTime+"  </td>";

        if(data[i].nodeStatus == 1){
            html+="<td><a href='javascript:clearNode("+data[i].nodeId+")'>"+mineText25+"</a></td>";
        }else{
            html+="<td></td>";
        }

        html+="</tr>";
	}
	html+="</table>";
	
	
    $('.messagebox4').show();
    $('.bg').height($(document).height());
    $('.bg').width($(document).width());
    $('#slavediv').html(html);
    $('.bg').show();
}

function getPosition(nodeId){
	var mainNode = $('#topLevelNodeId').val();
	$.ajax({
		type : "post",
		url:'/mine/getNodePosition'
		,data:{'mainCoreId':mainNode,"nodeId":nodeId},
		dataType : "json"
		,success:function(msg){
			if(msg.status == 0){
				alertBoxFunc(msg.data,"sure");
			}else{
				alertBoxFunc(msg.error.message,"sure");
			}
		}
		,error:function(err){
        console.log(err);
		}
	});
}

function clearNode(nodeId){
	var self = $(this);
	console.log(self);
	alertBoxFunc($('#mineClearText').val(),"all",function(){
		$.ajax({
			type : "post",
			url:'/mine/clearSubNode'
			,data:{'nodeId':nodeId},
			dataType : "json"
			,success:function(msg){
				if(msg.status == 0){
					//TODO remove tr
					
					alertBoxFunc(msg.data,"sure",function(){
						window.location = "/mine/user";
					});
				}else{
					alertBoxFunc(msg.error.message,"sure");
				}
			}
			,error:function(err){
	        console.log(err);
			}
		});
	});
}

$(function(){
   /*添加导航栏*/
  
           nav_hover('#myquery','#myaquery','#query_li'); //脑波查询导航
           nav_hover('#mybuy','#myabuy','#buy_li');       // 认购导航
      function nav_hover(obj,obj_a,obj_li){
            var myleft = 0;
           $(obj).hover(function(){
                  myleft = $(obj_a).offset().left - 25;
                  $(obj_li).css("display","block");
                  $(obj_li).css("left",myleft);
             },function(){
                   $(obj_li).css("display","none");  
           })
           $(obj_li).find('li').hover(function(){
                  $(obj_li).css("display","block");
                  $(this).css('color','#1783e8');
                  $(this).css('background','#e6e6e6');
               
           },function(){
                   $(obj_li).css("display","none");
                    $(this).css('color','#777577');
                   $(this).css('background','#fff');
           })
      }
      //脑波查询导航跳转
           $('#myquery_btn').click(function(){
                    window.location.href = "/record/meditation/my/brain/search";
           })
           $('#query_btn').click(function(){
                    window.location.href = "/record/meditation/global/brain/search";
           })
     //认购界面跳转
          $('#buy_btn').click(function(){
                    window.location.href = "/deal/buy";
           })
           $('#buy_link_btn').click(function(){
                    window.location.href = "/deal/buy_link";
           })
           
})
