/*****
**@name：login页
**
**/
var addressCountry=function(data){
	var _self = this;
	_self.ider = data.id;
	_self.needId = false;
	if (data.showId) {
		_self.needId = data.showId ;
	};
	_self.default = 86
	if (data.default) {
		_self.default = data.default;
	}
	_self.ready();
}
var proto=addressCountry.prototype;
proto.flags_data={86:'中国'
				,60:'马来西亚'
				,91:'印度'
				,62:'印尼'
				,84:'越南'
				,886:'台湾'
				,850:'朝鲜'
				,82:'韩国'
				,63:'菲律宾'
				,66:'泰国'
				,855:'柬埔寨'
				,65:'新加坡'
				,81:'日本'
				,93:'阿富汗'
				,54:'阿根廷'
				,61:'澳大利亚'
				,43:'奥地利'
				,880:'孟加拉国'
				,375:'白俄罗斯'
				,32:'比利时'
				,55:'巴西'
				,95:'缅甸'
				,1:'加拿大'
				,1345:'开曼群岛'
				,56:'智利'
				,57:'哥伦比亚'
				,242:'刚果'
				,53:'古巴'
				,357:'塞浦路斯'
				,420:'捷克'
				,45:'丹麦'
				,593:'厄瓜多尔'
				,20:'埃及'
				,251:'埃塞俄比亚'
				,679:'斐济'
				,358:'芬兰'
				,33:'法国'
				,241:'加蓬'
				,49:'德国'
				,233:'加纳'
				,30:'希腊'
				,224:'几内亚'
				,509:'海地'
				,852:'香港'
				,36:'匈牙利'
				,354:'冰岛'
				,98:'伊朗'
				,353:'爱尔兰'
				,972:'以色列'
				,39:'意大利'
				,1876:'牙买加'
				,327:'哈萨克斯坦'
				,254:'肯尼亚'
				,965:'科威特'
				,331:'吉尔吉斯坦'
				,856:'老挝'
				,371:'拉脱维亚'
				,961:'黎巴嫩'
				,231:'利比里亚'
				,370:'立陶宛'
				,261:'马达加斯加'
				,960:'马尔代夫'
				,52:'墨西哥'
				,377:'摩纳哥'
				,976:'蒙古'
				,212:'摩洛哥'
				,674:'瑙鲁'
				,977:'尼泊尔'
				,31:'荷兰'
				,64:'新西兰'
				,227:'尼日尔'
				,234:'尼日利亚'
				,47:'挪威'
				,968:'阿曼'
				,92:'巴基斯坦'
				,507:'巴拿马'
				,51:'秘鲁'
				,48:'波兰'
				,351:'葡萄牙'
				,1787:'波多黎各'
				,974:'卡塔尔'
				,40:'罗马尼亚'
				,7:'俄罗斯'
				,966:'沙特阿拉伯'
				,27:'南非'
				,34:'西班牙'
				,94:'斯里兰卡'
				,46:'瑞典'
				,41:'瑞士'
				,992:'塔吉克斯坦'
				,255:'坦桑尼亚'
				,90:'土耳其'
				,993:'土库曼斯坦'
				,256:'乌干达'
				,380:'乌克兰'
				,971:'阿拉伯联合酋长国'
				,44:'英国'
				,1:'美国'
				,598:'乌拉圭'
				,998:'乌兹别克斯坦'
				,260:'赞比亚'
				,853:'澳门'
};

proto.flagEvent = function(){
	var _self=this;
    var area = $(_self.ider);
    var htmlCountry =  '';
    for(var i in _self.flags_data)
    {
    	var country = _self.flags_data[i];
    	var class_str='';
    	htmlCountry +='<option value ="'+i+'"> '+i+'</option>'
    }
    //console.log(area.html());
    area.html(htmlCountry);
    //area.val(_self.default);
}


proto.ready=function(){
	var _self=this;

    _self.flagEvent();
    //flags国际化
    // var _lang=langType();
    // $.i18n.properties({
    //         name : 'strings', //资源文件名称
    //         path : 'https://o5uaa1ha4.qnssl.com/static/i18n/', //资源文件路径
    //         cache: true,
    //         mode : 'map', //用Map的方式使用资源文件中的值
    //         language : _lang,
    //         callback : function() {//加载成功后设置显示内容
    //         	if(_self.needId == true ){
    //         		for(var i in _self.flags_data)
	   //          	{
	   //                $(_self.ider + ' option[value='+i+']').text(' '+$.i18n.prop(''+i)+' '+i);
	   //          	}
    //         	}else{
	   //          	for(var i in _self.flags_data)
	   //          	{
	   //                $(_self.ider + ' option[value='+i+']').text(' '+$.i18n.prop(''+i));
	   //          	}
    //         	}
    //         }
    // });
}


