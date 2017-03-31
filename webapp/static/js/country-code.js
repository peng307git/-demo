var CountryCode = function(options){
	var default_option = {
		dom: '',
		wrapClass: 'country-code',
		countryList: [
				[86,'中国']
				,[60,'马来西亚']
				,[91,'印度']
				,[62,'印尼']
				,[84,'越南']
				,[886,'台湾']
				,[850,'朝鲜']
				,[82,'韩国']
				,[63,'菲律宾']
				,[66,'泰国']
				,[855,'柬埔寨']
				,[65,'新加坡']
				,[81,'日本']
				,[93,'阿富汗']
				,[54,'阿根廷']
				,[61,'澳大利亚']
				,[43,'奥地利']
				,[880,'孟加拉国']
				,[375,'白俄罗斯']
				,[32,'比利时']
				,[55,'巴西']
				,[95,'缅甸']
				,[99901,'加拿大',1]
				,[1345,'开曼群岛']
				,[56,'智利']
				,[57,'哥伦比亚']
				,[242,'刚果']
				,[53,'古巴']
				,[357,'塞浦路斯']
				,[420,'捷克']
				,[45,'丹麦']
				,[593,'厄瓜多尔']
				,[20,'埃及']
				,[251,'埃塞俄比亚']
				,[679,'斐济']
				,[358,'芬兰']
				,[33,'法国']
				,[241,'加蓬']
				,[49,'德国']
				,[233,'加纳']
				,[30,'希腊']
				,[224,'几内亚']
				,[509,'海地']
				,[852,'香港']
				,[36,'匈牙利']
				,[354,'冰岛']
				,[98,'伊朗']
				,[353,'爱尔兰']
				,[972,'以色列']
				,[39,'意大利']
				,[1876,'牙买加']
				,[327,'哈萨克斯坦']
				,[254,'肯尼亚']
				,[965,'科威特']
				,[331,'吉尔吉斯坦']
				,[856,'老挝']
				,[371,'拉脱维亚']
				,[961,'黎巴嫩']
				,[231,'利比里亚']
				,[370,'立陶宛']
				,[261,'马达加斯加']
				,[960,'马尔代夫']
				,[52,'墨西哥']
				,[377,'摩纳哥']
				,[976,'蒙古']
				,[212,'摩洛哥']
				,[674,'瑙鲁']
				,[977,'尼泊尔']
				,[31,'荷兰']
				,[64,'新西兰']
				,[227,'尼日尔']
				,[234,'尼日利亚']
				,[47,'挪威']
				,[968,'阿曼']
				,[92,'巴基斯坦']
				,[507,'巴拿马']
				,[51,'秘鲁']
				,[48,'波兰']
				,[351,'葡萄牙']
				,[1787,'波多黎各']
				,[974,'卡塔尔']
				,[40,'罗马尼亚']
				,[7,'俄罗斯']
				,[966,'沙特阿拉伯']
				,[27,'南非']
				,[34,'西班牙']
				,[94,'斯里兰卡']
				,[46,'瑞典']
				,[41,'瑞士']
				,[992,'塔吉克斯坦']
				,[255,'坦桑尼亚']
				,[90,'土耳其']
				,[993,'土库曼斯坦']
				,[256,'乌干达']
				,[380,'乌克兰']
				,[971,'阿拉伯联合酋长国']
				,[44,'英国']
				,[1,'美国']
				,[598,'乌拉圭']
				,[998,'乌兹别克斯坦']
				,[260,'赞比亚']
				,[853,'澳门']
			],
		afterCountrySelected: function(country_code, flag_code){
			console.log(country_code);
		}
	};
	$.extend(default_option, options);

	this.init(default_option);

};

CountryCode.prototype.init = function(options){
	var self = this;

	$.extend(this, options);
	this.isShow = 0;
	this.currentCountryIndex = 0;
	this.currentCountryCode = this.countryList[this.currentCountryIndex][2]?this.countryList[this.currentCountryIndex][2]:this.countryList[this.currentCountryIndex][0];

	var position = $(this.dom).offset();
	var x = position.left;
	var y = position.top + $(this.dom).height();
	var arr = [];
	var htmlArr = ['<div class="'+this.wrapClass+'" style="display:none;position:absolute;z-index:9999;top:' + y + 'px;left:' + x + 'px;"><ul>'];
	$.each(this.countryList, function(index, item){
		if(self.currentCountryIndex == index){
			htmlArr.push('<li class="active"><img src="https://o5uaa1ha4.qnssl.com/static/images/flags/'+item[0]+'.gif" />'+'<span> '+item[1]+' </span>'+'</li>');
		}else{
			htmlArr.push('<li><img src="https://o5uaa1ha4.qnssl.com/static/images/flags/'+item[0]+'.gif" />'+'<span> '+item[1]+' </span>'+'</li>');
		}
	});
	htmlArr.push['</ul></div>'];
	$(document.body).append(htmlArr.join(''));
	this.bindEvent();
};

CountryCode.prototype.bindEvent = function(){
	var self = this;

	$('.' + this.wrapClass).on('click', 'li', function(){
		var index = $(this).index();
		
		self.changeCountry(index);
	});

	$(this.dom).on('click', function(){
		self.toggle();
	});
};

CountryCode.prototype.toggle = function(){
	if(this.isShow){
		this.hide();
	}else{
		this.show();
	}
};
CountryCode.prototype.hide = function(){
	this.isShow = 0;
	$('.'+this.wrapClass).hide();
};
CountryCode.prototype.show = function(){
	this.isShow = 1;
	var position = $(this.dom).offset();
	var x = position.left;
	var y = position.top + $(this.dom).height();
	$('.'+this.wrapClass).css({
		"top": y,
		"left": x
	}).show();
};
CountryCode.prototype.changeCountry = function(index){
	this.hide();
	if(this.currentCountryIndex == index) return;
	var country = this.countryList[index];
	var country_code = country[2]?country[2]:country[0];
	var flag_code = country[0];

	this.currentCountryIndex = index;
	this.currentCountryCode = country_code;
	$('.'+this.wrapClass).find('li').removeClass('active').eq(index).addClass('active');
	this.afterCountrySelected(country_code, flag_code);
};
CountryCode.prototype.destroy = function(){
	$('.' + this.wrapClass).unbind('click');
	$(this.dom).unbind('click');
	$('.' + this.wrapClass).remove();
};
