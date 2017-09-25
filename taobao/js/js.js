// JavaScript Document

window.onload = function () {

	//简历窗
	(function () {
		var tDiv = document.getElementById('tuo');
		var tP = tDiv.getElementsByTagName('p')[0];
		var tStrong = tDiv.getElementsByTagName('strong')[0];
		var tSpan = tDiv.getElementsByTagName('span');
		var tA = document.getElementById('denglu');

		tuo(tDiv, tP); //拖拽窗口
		bianda(tDiv, tStrong); //拖拽变大变小
		guanbi(tDiv, tSpan[0]); //点击关闭
		denglu(tDiv, tA); //点击显示
		da(tDiv, tSpan[1]); //点击变大
		xiao(tDiv, tSpan[2]); //点击恢复

		var iTop = tDiv.offsetTop;
		window.onscroll = function () {
			var scrollTop = document.documentElement.scrollTop || document.body.scrollTop;
			tDiv.style.top = iTop + scrollTop + 'px';
		};
		function da(obj, obj1) {
			obj1.onclick = function () {
				//obj.style.width = window.screen.width +'px';
				//obj.style.height = window.screen.height +'px';
				obj.style.width = document.body.clientWidth + 'px';
				obj.style.height = document.body.clientHeight + 'px';
			}
		}

		function xiao(obj, obj1) {
			obj1.onclick = function () {
				obj.style.width = '350px';
				obj.style.height = '400px';
			}
		}

		function guanbi(obj, obj1) { //点击关闭
			obj1.onclick = function () {
				obj.style.display = 'none';
			}
		};

		function denglu(obj, obj1) { //点击显示
			obj1.onclick = function () {
				obj.style.display = 'block';
			}
		};

		function bianda(obj, obj1) { //拖拽变大变小

			var disX = 0;
			var disY = 0;
			var iW = 0;
			var iH = 0;
			obj1.onmousedown = function (ev) {
				var ev = ev || event;
				disX = ev.clientX;
				disY = ev.clientY;
				iW = obj.offsetWidth;
				iH = obj.offsetHeight;

				document.onmousemove = function (ev) {
					var ev = ev || event;
					var L = ev.clientX - disX;
					var T = ev.clientY - disY;

					obj.style.width = iW + L + 'px';
					obj.style.height = iH + T + 'px';
				}
				document.onmouseup = function () {
					document.onmouseup = document.onmousemove = null;
				}
				return false;
			}
		};

		//拖拽窗口		
		function tuo(obj, obj1) {
			var disX = 0;
			var disY = 0;

			obj1.onmousedown = function (ev) {
				var ev = ev || event;
				disX = ev.clientX - obj.offsetLeft;
				disY = ev.clientY - obj.offsetTop;

				document.onmousemove = function (ev) {
					var ev = ev || event;
					var L = ev.clientX - disX;
					var T = ev.clientY - disY;
					L = xianzhi(L, document.body.clientWidth - obj.offsetWidth, 0);
					T = xianzhi(T, document.body.clientHeight - obj.offsetHeight, 0);
					obj.style.left = L + 'px';
					obj.style.top = T + 'px';
				}
				document.onmouseup = function () {
					document.onmouseup = document.onmousemove = null;
				}
				return false;
			}
		};

		function xianzhi(obj, max, min) { //限制拖拽范围

			if (obj > max) {
				return max;
			} else if (obj < min) {
				return min;
			} else {
				return obj;
			}
		}

	})();
};

$(function () {

	//回到顶部
	(function () {

		$('#jiantou').click(function () {

			$('html,body').animate({
				'scrollTop': 0
			}, 500);
		})
	})();

	//图片按需加载
	(function () {

		var aImg = $('img');

		show();

		$(window).scroll(show);

		function show() {

			var top = $(window).scrollTop();
			var iH = $(window).height();

			aImg.each(function (i, element) {

				if (!$(this).loang && $(this).offset().top < top + iH) {

					var atr = $(this).attr('_src');

					$(this).attr('src', atr);
					$(this).loang = true;
				}
			});

		};

	})();



	// 导航移入移出
	(function () {
		var aDiv = $('.ul1 .fl').find('div');
		var aDiv1 = $('.ul1_div1');
		var aDiv2 = $('.ul1_div2');
		var oDiv = $('#head');
		var aLi = $('.ul1').find('.fl');

		aLi.hover(function () {
			aDiv.css('display', 'none');
			$(this).css('background', '#FFF')
			$(this).find('div').css('display', 'block');

		}, function () {
			aLi.css('background', '#f5f5f5')
		});

		function move(obj) {
			obj.hover(function () {
				$(this).css('display', 'block');
			}, function () {
				obj.css('display', 'none');
			});
		}

		move(aDiv1);
		move(aDiv2);

	})();

	// 点击切换搜索栏
	(function () {

		var aLi = $('.liebiao li');
		var oA = aLi.find('a');
		var aText = $('.text1');
		var iNow = 0;


		var attr = ['宝贝宝贝里面的东西', '天猫里面的东西', '店铺店铺里面的东西'];
		var attr1 = [
			['新款连衣裙', '四件套', '潮流T恤', '时尚女鞋', '短裤', '半身裙', '男士外套', '墙纸', '行车记录仪', '新款男鞋', '耳机'],
			['连衣裙', '夏净水器', '爸爸t恤', '凉鞋', '防晒霜', '剃须刀', '蚊帐', '内裤', '手表', '无硅油洗发水', '行车记录仪', '运动鞋'],
		];

		aLi.click(function () {
			oA.css('background', '')
			aText.removeClass('bor');
			$('.btn1').removeClass('back');
			oA.removeClass('active_al');
			$('.neirong a').remove();

			oA.addClass('al');
			iNow = $(this).index();
			aText.val(attr[iNow]);
			$(this).find('a').addClass('active_al');

			if (iNow == 1) {
				aText.addClass('bor');
				$('.btn1').addClass('back');
				$(this).find('a').css('background', '#c12c26');
				for (var i = 0; i < attr1[1].length; i++) {
					$('.neirong').append('<a href="javascript:;">' + attr1[1][i] + '</a>');
				}
			} else {
				for (var i = 0; i < attr1[0].length; i++) {
					$('.neirong').append('<a href="javascript:;">' + attr1[0][i] + '</a>');
				}
			}
		});

		aText.focus(function () {

			if ($(this).val() == attr[iNow]) {
				$(this).val('');
			}
		});
		aText.blur(function () {

			if ($(this).val() == '') {
				$(this).val(attr[iNow]);
			}

		});



	})();

	//轮播图
	(function () {

		var oUl = $('#wh').find('.one1_ul1');
		var aLi = oUl.find('li');
		var aLi2 = $('#wh').find('.one1_ul2 li');



		var iW = aLi.width();
		var iNow = 0;
		var a1 = $('#a_up');
		var a2 = $('#a_down');
		var a01 = $('#a_up1');
		var a02 = $('#a_down1');
		var timer = null;

		a1.click(function () {
			move(-1, aLi, aLi2, oUl);
		});
		a2.click(function () {
			move(1, aLi, aLi2, oUl);
		});

		function doplay() {
			timer = setInterval(function () {
				move(-1, aLi, aLi2, oUl);
			}, 1500);
		}

		doplay();

		$('.wh').hover(function () {
			clearInterval(timer);
		}, doplay);

		function move(num, obj1, obj2, obj) {
			iNow += num;
			if (Math.abs(iNow) > obj1.length - 1) {
				iNow = 0;
			}
			if (iNow > 0) {
				iNow = -(obj1.length - 1);
			}

			obj.stop().animate({
				'left': iW * iNow
			}, 1000);

			obj2.removeClass('one1_active');
			obj2.eq(Math.abs(iNow)).addClass('one1_active');

		}


	})();

	//轮播图2
	(function () {

		var oUl1 = $('.wh1').find('.one1_ul1');
		var aaLi = oUl1.find('li');
		var aaLi2 = $('.wh1').find('.one1_ul2 li');
		var aspan = $('.wh1').find('span');

		var iW = aaLi.width();
		var iNow = 0;
		var a01 = $('#a_up1');
		var a02 = $('#a_down1');
		var timer = null;
		a01.click(function () {
			move(-1, aaLi, aaLi2, oUl1);
		});
		a02.click(function () {
			move(1, aaLi, aaLi2, oUl1);
		});

		function doplay() {
			timer = setInterval(function () {
				move(1, aaLi, aaLi2, oUl1);
			}, 1500);
		}

		doplay();

		$('.wh1').hover(function () {
			clearInterval(timer);
		}, doplay);

		function move(num, obj1, obj2, obj) {
			iNow += num;
			if (Math.abs(iNow) > obj1.length - 1) {
				iNow = 0;
			}
			if (iNow > 0) {
				iNow = -(obj1.length - 1);
			}

			obj.stop().animate({
				'left': iW * iNow
			}, 1000);

			obj2.removeClass('one1_active');
			obj2.eq(Math.abs(iNow)).addClass('one1_active');
			aspan.html((Math.abs(iNow) + 1) + '/' + obj1.length);
		}

	})();

	//右边鼠标移入移出
	(function () {
		var aLi = $('.tow2 .ul2').find('li');
		var oP = $('.tow2').find('p');

		aLi.hover(function () {
			aLi.removeClass('tow_active');
			$(this).addClass('tow_active');
			oP.addClass('tow_p1');
			oP.eq($(this).index()).removeClass('tow_p1');
		}, function () {


		});
	})();

	//右边鼠标移入显示
	(function () {
		var oUl = $('.divright').find('.tow3 .clear');

		var oLi = oUl.find('.tow3_1');
		var aLi = oUl.find('li');
		var aDiv = $('.tow3_div1');

		aLi.hover(function () {
			aLi.css('border-color', '#f1f1f1');
			$(this).css('border-color', 'red');

		}, function () {

		});

		oLi.hover(function () {

			oLi.css('border-color', '#f1f1f1');
			$(this).css('border-color', 'red');
			aDiv.css('display', 'block');

		}, function () {
			aDiv.css('display', 'none');

		});

		aDiv.mouseover(function () {
			$(this).css('display', 'block');
		});

		$('.guanbi').click(function () {
			aDiv.css('display', 'none');
		});


	})();

	//显示二维码
	(function () {

		var oUl = $('.tow4').find('ul');
		var aLi = oUl.find('li');
		var oDiv = $('.erwei');
		aLi.hover(function () {
			var iTop = $(this).position().top - 83;
			var iLeft = $(this).position().left;

			oDiv.show().css({
				'top': iTop,
				'left': iLeft
			});

		}, function () {
			oDiv.hide();
		});
		oDiv.hover(function () {
			oDiv.show()

		}, function () {
			oDiv.hide();
		});
	})();

	//中间右边span里面的字体颜色
	(function () {
		var aSpan = $('.tow_h').find('span');

		aSpan.hover(function () {
			$(this).css('color', '#ff4400');

		}, function () {
			$(this).css('color', '#333');
		});

	})();

	//右边 淘宝头条自动播放

	(function () {

		var oUl = $('.ul_div').find('ul');
		var aLi = oUl.find('li')
		var iNow = 0;
		var iH = aLi.height();

		setInterval(function () {
			move();
		}, 1000);
		move();

		function move() {
			iNow += -1;
			if (Math.abs(iNow) > aLi.length - 1) {
				iNow = 0;
			}
			oUl.stop().animate({
				'top': iH * iNow
			}, 500);

		}

	})();

	//鼠标移入加边框
	function domove(obj, attr, str) {

		obj.hover(function () {

			$(this).css(attr, str);

		}, function () {
			$(this).css(attr, 'none');
		});
	}

	//中间左边第二个大块  
	(function () {
		//第 one2 部分
		var adiv = $('.one2').find('.div1');
		domove(adiv, 'background', '#CC66FF');

		//第 one3 部分
		var adiv1 = $('.one3').find('.div1');
		domove(adiv1, 'background', '#FF6699');
		//最后一个部分 one4
		var adiv2 = $('.one4').find('.div1');
		//domove(adiv1,'border','1px solid red');
		domove(adiv2, 'background', '#999933');
	})();

	//热卖单品
	(function () {

		var oDiv = $('.divbot_one').find('.pad');
		var aDiv = $('.pad_2');
		var aDiv1 = $('.pad_3');

		aDiv.hover(function () {
				aDiv.removeClass('pad_1');

				$(this).addClass('pad_1');
			},
			function () {
				aDiv.removeClass('pad_1');
			});

		aDiv1.hover(function () {
				aDiv1.removeClass('pad_5');

				$(this).addClass('pad_5');
			},
			function () {
				aDiv1.removeClass('pad_5');
			});
	})();

	//猜你喜欢

	(function () {

		var aImg = $('.bl_1').find('img');


		aImg.hover(function () {

			$(this).css('border', '1px solid red');

		}, function () {
			aImg.css('border', 'none');

		});

	})();

	//中间左边第一个大块  超多选项

	(function () {
		var $Ali = $('.div_ul').find('li');
		var $Div = $('.one1_div').find('.div_div1');

		$Ali.mouseover(function () {

			var This = $(this).index();

			$Div.removeClass('block');
			$Div.eq(This).addClass('block');

		});

		/*  $('.div_ul').mouseout(function(){
			  setTimeout(function(){
				   $Div.removeClass('block');
				  },500);
			
			  
			  });*/

		$('.div_ul').mouseout(function () {

			$Div.removeClass('block');


		});

		$Div.mouseover(function () {

			$(this).addClass('block');

		}).mouseout(function () {
			$(this).removeClass('block');

		});
	})();


});