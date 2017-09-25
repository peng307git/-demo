//运动框架，带缓冲，透明度。

// JavaScript Document
function getStyle(obj, attr) { //获取当前元素的属性。
	return obj.currentStyle ? obj.currentStyle[attr] : getComputedStyle(obj)[attr];
}

function statMove(obj, json, fn) { //对象， 改变的参数集合。 回调函数

	var speed = 0; //速度
	var icur = 0; //当前的元素属性值。0.

	clearInterval(obj.timer);
	obj.timer = setInterval(function () {

		var ibtn = true;

		for (var atr in json) {

			var Mubiao = json[atr]; //目标点

			if (atr == 'opacity') {
				icur = Math.round(getStyle(obj, 'opacity') * 100);
			} else {
				icur = parseInt(getStyle(obj, atr));
			}
			//速度算法
			speed = (Mubiao - icur) / 8; //目标点减去当前值 除以系数
			speed = speed > 0 ? Math.ceil(speed) : Math.floor(speed); //速度取整

			if (icur != Mubiao) { //如果属性前值没有到达目标点的话。走下面。
				ibtn = false; //关闭开关。
				if (atr == 'opacity') {
					obj.style.opacity = (icur + speed) / 100;
					obj.style.filter = 'alpha(opacity=' + (icur + speed) + ')';
				} else {
					obj.style[atr] = (icur + speed) + 'px';
				}
			}
		}

		if (ibtn) { //如果属性值都到达了目标点的话，开关开启。停止定时器，调用回调函数。
			clearInterval(obj.timer);
			fn && fn.call(obj); //回调函数，call 调用一个对象的一个方法，以另一个对象替换当前对象。
		}

	}, 30);
}