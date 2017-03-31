
//弹窗
var alertbox = function (data){
        $('.alert_main').remove();
        var _self = this;
        var langs = location.pathname.match(/TW|CN|EN/g)||['CN'];
        var title = "";
        var ok = "";
        _self.text = data.text;
        _self.vote = data.vote;
        _self.url = data.url;
        langtext();
        var html = "";
        if( data.vote ){
            html = '<div class="alert_main">'+
                     '<div class="alert_main_bg"></div>'+
                     '<div class="alert_text">'+
                         '<div class="alert_text_warp">'+
                             '<h2>'+title+'</h2>'+
                             '<p>'+_self.text+'</p>'+
                             '<p class="vote_p"><a href="'+_self.url+'">'+_self.vote+'</a></p>'+
                             '<footer>'+
                                 '<div class="alert_org_close alert_none">'+ok+'</div>'+
                             '</footer>'+
                         '</div>'+
                         '<span class="alert_span alert_none"></span>'+
                     '</div>'+
                 '</div>';
        }
        else{
            html = '<div class="alert_main">'+
                     '<div class="alert_main_bg"></div>'+
                     '<div class="alert_text">'+
                         '<div class="alert_text_warp">'+
                             '<h2>'+title+'</h2>'+
                             '<p>'+_self.text+'</p>'+
                             '<footer>'+
                                 '<div class="alert_org_close alert_none">'+ok+'</div>'+
                             '</footer>'+
                         '</div>'+
                         '<span class="alert_span alert_none"></span>'+
                     '</div>'+
                 '</div>';
        }
        $("body").append(html);
        function langtext(){
          if(langs == "CN"){
            title = "温馨提示";
            ok = "确定";
          }
          else if(langs == "EN"){
              title = "Tips";
              ok = "OK";
          }
          else{
              title = "溫馨提示";
              ok = "確定";
              
          }
        }
        //关闭提示窗
        $(document).on("click",".alert_main .alert_none",function(){
            $(".alert_main").remove();
        })
    };

//字符串转义
function html_encode(data){
         var s = "";   
          if (data.length == 0) return "";   
          s = data.replace(/&/g, "&g;");   
          s = s.replace(/</g, "&lt;");   
          s = s.replace(/>/g, "&gt;");  
          s = s.replace(/\'/g, "&#39;");   
          s = s.replace(/\"/g, "&quot;"); 
          return s; 
}
 //字符串转义回来
function get_html_encode(data){  
          var s = "";   
          if (data.length == 0) return "";   
          s = data.replace(/&g;/g, "&");   
          s = s.replace(/&lt;/g, "<");   
          s = s.replace(/&gt;/g, ">");    
          s = s.replace(/&#39;/g, "\'");   
          s = s.replace(/&quot;/g, "\""); 
          return s;   
    }
function GetQueryString(name){   //取url后面参数的值
            var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if(r!=null)return  unescape(r[2]); return null;
    }
function getByteLen(val) {
      var len = 0;
      for (var i = 0; i < val.length; i++) {
        var a = val.charAt(i);
        if (a.match(/[^\x00-\xff]/ig) != null) {
          len += 1;
        }
        else {
          len += 0.5;
        }
      }
      return Math.ceil(len);
};
//判断语言
    function langtype(data){
            if(data == "CN"){
                data = "zh_CN";
            }else if( data == "TW" ){
                data = "zh_TW";
            }else{
                data = "en_US";
            }
            return data;
    }
function isEmail(mail){   
  var filter  = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
  if (!filter.test(mail)) return false;
  return true 
}
function isChinaOrNumbOrLett( s )
{
    //判断是否是汉字、字母、数字组成 
    var regu = "^[0-9a-zA-Z\u4e00-\u9fa5]+$";
    var re = new RegExp(regu);
    if (re.test(s)) {
        return true;
    }
    else {
        return false;
    }
};

