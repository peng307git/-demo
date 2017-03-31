<!DOCTYPE html>
<html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]>
<html class="ie8"><![endif]-->
<!--[if IE 9 ]>
<html class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<!--<![endif]-->
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><@spring.messageText "mind_mine" "智慧矿场"/></title>
    <!-- css -->
    <link rel="stylesheet" type="text/css" href="/static/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/static/css/base.css">
    <link rel="stylesheet" type="text/css" href="/static/css/main.css">
    <!-- 树用-->
    <link rel="stylesheet" type="text/css" href="/static/css/default.css"/>
    <!-- js -->
    <script type="text/javascript" src='/static/js/jquery-1.11.2.min.js'></script>
    <script type="text/javascript" src='/static/js/jquery.i18n.properties-1.0.9.js'></script>
    <script type="text/javascript" src='/static/js/bootstrap.min.js'></script>
    <script type="text/javascript" src='/static/js/common.js?v=201607143213213'></script>
    <script type="text/javascript" src="/static/js/global.js"></script>
    <!-- plugin/js -->
    <script type="text/javascript" src="/static/js/plugin/jquery.zclip.min.js"></script>
    <script type="text/javascript" src="/static/js/plugin/jquery.wheelmenu.js"></script>

    <script type="text/javascript" src='/static/js/business/mine.js'></script>
    <style>

        .mine-video {
            position: fixed;
            width: 860px;
            top: -600px;
            left: 50%;
            margin: -240px 0 0 -430px;
            z-index: 9999;
            padding: 15px;
            background-color: #fff;
            border: 1px solid #ddd;
            box-shadow: 1px 1px 3px rgba(0, 0, 0, .4);
        }

        .mine-video .close {
            position: absolute;
            right: 0;
            top: 0px;
            opacity: .4;
        }

        .mine-video .close:hover {
            opacity: .8;
        }

        .videoNail {
            position: relative;
            margin: 100px 15px 0;
            cursor: pointer;
        }

        .videoNail img {
            display: block;
            width: 100%;
        }

        .videoNail .play {
            position: absolute;
            top: 50%;
            left: 50%;
            margin: -16px 0 0 -16px;
            width: 32px;
            height: 32px;
            background: url(/static/images/play-icon.png) no-repeat 0 0;
        }

        
        .left-bar{
            overflow-y: scroll; 
            width:170px; 
            height: 800px; 
            float: left; 
            position: relative;
            top:-2px;
            margin-left:-170px; 
            display:inline-block;
        }

    </style>
</head>

<body>
<div class="messagebox3">
    <div class="message-borderbox">
        <div class="messagebox_content3 text-center">
            <input type="hidden" id="topLevelNodeId" value="${topLevelNodeId}">
            <input type="hidden" id="slaveList" value='${slave_list_json}'/>
            <input type="hidden" id="CSRFToken" value="${CSRFToken}" />
            <div class="margin10 ">
                <input type="hidden" id="subcore_translate" value="<@spring.message "subcore_translate"/>"/>
                <input type="hidden" id="maincore_translate" value="<@spring.message "maincore_translate"/>"/>
                <input type="hidden" id="subCreateText" value="<@spring.messageText "mine.text6" "还可创建的子核心数"/>"/>
                <input type="hidden" id="mineClearText" value="<@spring.messageText "mine.js.text1" "请确认是否需要清空该点位的用户？"/>"/>
                
                <input type="hidden" id="mineText17" value="<@spring.messageText "mine.text17" "昵称"/>"/>
                <input type="hidden" id="mineText18" value="<@spring.messageText "mine.text18" "所在位置"/>"/>
                <input type="hidden" id="mineText19" value="<@spring.messageText "mine.text19" "状态"/>"/>
                <input type="hidden" id="mineText21" value="<@spring.messageText "mine.text21" "购买时间"/>"/>
                <input type="hidden" id="mineText22" value="<@spring.messageText "mine.text22" "加入时间"/>"/>
                <input type="hidden" id="mineText23" value="<@spring.messageText "mine.text23" "操作"/>"/>
                <input type="hidden" id="mineText24" value="<@spring.messageText "mine.text24" "点击查看详情"/>"/>
                <input type="hidden" id="mineText25" value="<@spring.messageText "mine.text25" "移除"/>"/>
                

            <@spring.messageText "mine.text4" "通过邀请码推荐好友注册或者创建子核心"/><br/>
                <br/>
                <table class="vmiddle text-left ">
                    <tr>
                        <td><@spring.messageText "invite_code" "邀请码"/></td>
                        <td>&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            <input class="form-control bgblue  width130" id="copyText"/></td>
                        <td>&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            <div style="position: relative; display: inline-block;"><a class="btn-default-black font16"
                                                                                       id="copyBtn"><@spring.messageText "mine.text5" "复制邀请码"/></a>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="3" class="bordergray"><h5
                                class="top core"><@spring.messageText "mine.text6" "还可创建的子核心数"/></h5></td>
                        <input type="hidden" id="c_minefield_id">
                        <input type="hidden" id="c_subcore_num">
                        <td>&nbsp;&nbsp;&nbsp;</td>
                        <input type="hidden" id="c_main_core_id">
                        <td>
                            <input id="create_sub_core_but" type="button" class="btn-default-black sure font16"
                                   value="<@spring.messageText "mine.text7" "创建子核心"/>"
                                   onclick="mineFunc.prototype.createSubCore()"/></td>
                    </tr>
                </table>

                <a class="btn-default-black  top30 cancle"><@spring.messageText "cancel" "取消"/></a>
            </div>
        </div>
    </div>
</div>

<div class="messagebox4" style="display:none;width: 800px;margin: -400px;position: absolute;z-index: 999;left: 50%;top: 500px;">
    <div class="message-borderbox">
        <div class="messagebox_content4 text-center">
            <div class="margin11 ">

            <@spring.messageText "mine.text16" "直接推荐列表"/><br/>
                <br/>
                <div id="slavediv"></div>
                <a class="btn-default-black  top30 cancle"><@spring.messageText "cancel" "取消"/></a>
            </div>
        </div>
    </div>
</div>

<div class="warp asset-manager">
    <!--修改的代码0111 end-->
<#include "common/header.ftl" >
    <!-- 页头结束 -->
    <div class="warp-container">
        <div class="container-bg overh">
            <div class="container">
                <div class="manager-bar clearfix">
                    <div class="text-center">
                    <@spring.messageText "mine.text8" "核心管理"/></div>
                    <div class="text-center">
                    <@spring.messageText "mine.text9" "交易平台"/></div>
                </div>
                <div class="manager-container mine-container">
                    <div class="left-bar">
                        <div class="total-energy-heart">
                            <a href="/mine/user">
                                <span class="mine-icon mine-primaryHeart"></span>
                            <@spring.messageText "mine.text10" "能量核心"/></a>
                        </div>
                        <input type="hidden" id="indexnum" value="0">
                        <ul class="left-bar-ul" id="sub-core-list">

                        </ul>
                    </div>
                    <div class="right-bar" style='min-height:600px;'>
                        <div class="bgwhite">
                        	<div class="core-status">
                        		<p><@spring.messageText "record.myreco.text36" "当前状态"/>：<span class="text-core-status"><@spring.messageText "mine.text90" "已激活"/></span></p>
                                <p style="display:none;">
                                <@spring.messageText "record.myreco.text36" "当前状态"/>：<span class="text-core-status"><@spring.messageText "mine.text89" "未激活"/></span>
                                    <span class="btn-activate-core">1BTC&nbsp;&nbsp;<@spring.messageText "mine.text8911" "立即激活"/></span>
                                </p>
                        	</div>
                            <div class="tu">
                                <div class="first">
                                    <div class="zhu ">
                                        <div class="centerimg">
                                            <h4 id="top_node_name"><@spring.messageText "mine.text20" "能量<br/>核心"/></h4>
                                            <img src="/static/images/mine/zhu.png"/>
                                        </div>
                                    </div>
                                    <div class="zhu2 yi">
                                        <div class="chlidimg">
                                            <h4></h4>
                                            <img src="/static/images/mine/mb.png"/>
                                        </div>
                                    </div>
                                    <div class="zhu3 yi">
                                        <div class="chlidimg">
                                            <h4></h4>
                                            <img src="/static/images/mine/mc.png"/>
                                        </div>
                                    </div>
                                    <div class="zhu4 yi">
                                        <div class="chlidimg">
                                            <h4></h4>
                                            <img src="/static/images/mine/md.png"/>
                                        </div>
                                    </div>
                                    <div class="zhu5 yi">
                                        <div class="chlidimg">
                                            <h4></h4>
                                            <img src="/static/images/mine/me.png"/>
                                        </div>
                                    </div>
                                    <div class="zhu6 yi">
                                        <div class="chlidimg">
                                            <h4></h4>
                                            <img src="/static/images/mine/mf.png"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="second">
                                    <div class="fen ">
                                        <div class="chlidimg">
                                            <h4></h4>
                                            <img src="/static/images/mine/mb.png"/>
                                        </div>
                                    </div>
                                    <div class="fen1 er " href="#11">
                                        <div class="chlidimg">
                                            <h4></h4>
                                            <img src="/static/images/mine/la2.png"/>
                                        </div>
                                    </div>
                                    <div class="fen2 er " href="#12">
                                        <div class="chlidimg">
                                            <h4></h4>
                                            <img src="/static/images/mine/la2.png"/>
                                        </div>
                                    </div>
                                    <div class="fen3 er" href="#13">
                                        <div class="chlidimg">
                                            <h4></h4>
                                            <img src="/static/images/mine/la2.png"/>
                                        </div>
                                    </div>
                                    <div class="fen4 er" href="#14">
                                        <div class="chlidimg">
                                            <h4></h4>
                                            <img src="/static/images/mine/la2.png"/>
                                        </div>
                                    </div>
                                    <div class="fen5 er" href="#15">
                                        <div class="chlidimg">
                                            <h4></h4>
                                            <img src="/static/images/mine/la2.png"/>
                                        </div>
                                    </div>
                                    <div class="fen6 er" href="#16">
                                        <div class="chlidimg">
                                            <h4></h4>
                                            <img src="/static/images/mine/la2.png"/>
                                        </div>
                                    </div>
                                    <ul id="11" class="san">
                                        <li class="item"><a>
                                            <div class="chlidimg">
                                                <h4></h4>
                                                <img src="/static/images/mine/la2.png"/>
                                            </div>
                                        </a></li>
                                        <li class="item"><a>
                                            <div class="chlidimg">
                                                <h4></h4>
                                                <img src="/static/images/mine/la2.png"/>
                                            </div>
                                        </a></li>
                                        <li class="item"><a>
                                            <div class="chlidimg">
                                                <h4></h4>
                                                <img src="/static/images/mine/la2.png"/>
                                            </div>
                                        </a></li>
                                        <li class="item"><a>
                                            <div class="chlidimg">
                                                <h4></h4>
                                                <img src="/static/images/mine/la2.png"/>
                                            </div>
                                        </a></li>
                                        <li class="item"><a>
                                            <div class="chlidimg">
                                                <h4></h4>
                                                <img src="/static/images/mine/la2.png"/>
                                            </div>
                                        </a></li>
                                        <li class="item"><a>
                                            <div class="chlidimg">
                                                <h4></h4>
                                                <img src="/static/images/mine/la2.png"/>
                                            </div>
                                        </a></li>
                                    </ul>
                                    <ul id="12" class="san">
                                        <li class="item"><a>
                                            <div class="chlidimg">
                                                <h4></h4>
                                                <img src="/static/images/mine/la2.png"/>
                                            </div>
                                        </a></li>
                                        <li class="item"><a>
                                            <div class="chlidimg">
                                                <h4></h4>
                                                <img src="/static/images/mine/la2.png"/>
                                            </div>
                                        </a></li>
                                        <li class="item"><a>
                                            <div class="chlidimg">
                                                <h4></h4>
                                                <img src="/static/images/mine/la2.png"/>
                                            </div>
                                        </a></li>
                                        <li class="item"><a>
                                            <div class="chlidimg">
                                                <h4></h4>
                                                <img src="/static/images/mine/la2.png"/>
                                            </div>
                                        </a></li>
                                        <li class="item"><a>
                                            <div class="chlidimg">
                                                <h4></h4>
                                                <img src="/static/images/mine/la2.png"/>
                                            </div>
                                        </a></li>
                                        <li class="item"><a>
                                            <div class="chlidimg">
                                                <h4></h4>
                                                <img src="/static/images/mine/la2.png"/>
                                            </div>
                                        </a></li>
                                    </ul>
                                    <ul id="13" class="san">
                                        <li class="item"><a>
                                            <div class="chlidimg">
                                                <h4></h4>
                                                <img src="/static/images/mine/la2.png"/>
                                            </div>
                                        </a></li>
                                        <li class="item"><a>
                                            <div class="chlidimg">
                                                <h4></h4>
                                                <img src="/static/images/mine/la2.png"/>
                                            </div>
                                        </a></li>
                                        <li class="item"><a>
                                            <div class="chlidimg">
                                                <h4></h4>
                                                <img src="/static/images/mine/la2.png"/>
                                            </div>
                                        </a></li>
                                        <li class="item"><a>
                                            <div class="chlidimg">
                                                <h4></h4>
                                                <img src="/static/images/mine/la2.png"/>
                                            </div>
                                        </a></li>
                                        <li class="item"><a>
                                            <div class="chlidimg">
                                                <h4></h4>
                                                <img src="/static/images/mine/la2.png"/>
                                            </div>
                                        </a></li>
                                        <li class="item"><a>
                                            <div class="chlidimg">
                                                <h4></h4>
                                                <img src="/static/images/mine/la2.png"/>
                                            </div>
                                        </a></li>
                                    </ul>
                                    <ul id="14" class="san">
                                        <li class="item"><a>
                                            <div class="chlidimg">
                                                <h4></h4>
                                                <img src="/static/images/mine/la2.png"/>
                                            </div>
                                        </a></li>
                                        <li class="item"><a>
                                            <div class="chlidimg">
                                                <h4></h4>
                                                <img src="/static/images/mine/la2.png"/>
                                            </div>
                                        </a></li>
                                        <li class="item"><a>
                                            <div class="chlidimg">
                                                <h4></h4>
                                                <img src="/static/images/mine/la2.png"/>
                                            </div>
                                        </a></li>
                                        <li class="item"><a>
                                            <div class="chlidimg">
                                                <h4></h4>
                                                <img src="/static/images/mine/la2.png"/>
                                            </div>
                                        </a></li>
                                        <li class="item"><a>
                                            <div class="chlidimg">
                                                <h4></h4>
                                                <img src="/static/images/mine/la2.png"/>
                                            </div>
                                        </a></li>
                                        <li class="item"><a>
                                            <div class="chlidimg">
                                                <h4></h4>
                                                <img src="/static/images/mine/la2.png"/>
                                            </div>
                                        </a></li>

                                    </ul>
                                    <ul id="15" class="san">
                                        <li class="item"><a>
                                            <div class="chlidimg">
                                                <h4></h4>
                                                <img src="/static/images/mine/la2.png"/>
                                            </div>
                                        </a></li>
                                        <li class="item"><a>
                                            <div class="chlidimg">
                                                <h4></h4>
                                                <img src="/static/images/mine/la2.png"/>
                                            </div>
                                        </a></li>
                                        <li class="item"><a>
                                            <div class="chlidimg">
                                                <h4></h4>
                                                <img src="/static/images/mine/la2.png"/>
                                            </div>
                                        </a></li>
                                        <li class="item"><a>
                                            <div class="chlidimg">
                                                <h4></h4>
                                                <img src="/static/images/mine/la2.png"/>
                                            </div>
                                        </a></li>
                                        <li class="item"><a>
                                            <div class="chlidimg">
                                                <h4></h4>
                                                <img src="/static/images/mine/la2.png"/>
                                            </div>
                                        </a></li>
                                        <li class="item"><a>
                                            <div class="chlidimg">
                                                <h4></h4>
                                                <img src="/static/images/mine/la2.png"/>
                                            </div>
                                        </a></li>
                                    </ul>
                                    <ul id="16" class="san">
                                        <li class="item"><a>
                                            <div class="chlidimg">
                                                <h4></h4>
                                                <img src="/static/images/mine/la2.png"/>
                                            </div>
                                        </a></li>
                                        <li class="item"><a>
                                            <div class="chlidimg">
                                                <h4></h4>
                                                <img src="/static/images/mine/la2.png"/>
                                            </div>
                                        </a></li>
                                        <li class="item"><a>
                                            <div class="chlidimg">
                                                <h4></h4>
                                                <img src="/static/images/mine/la2.png"/>
                                            </div>
                                        </a></li>
                                        <li class="item"><a>
                                            <div class="chlidimg">
                                                <h4></h4>
                                                <img src="/static/images/mine/la2.png"/>
                                            </div>
                                        </a></li>
                                        <li class="item"><a>
                                            <div class="chlidimg">
                                                <h4></h4>
                                                <img src="/static/images/mine/la2.png"/>
                                            </div>
                                        </a></li>
                                        <li class="item"><a>
                                            <div class="chlidimg">
                                                <h4></h4>
                                                <img src="/static/images/mine/la2.png"/>
                                            </div>
                                        </a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="mine-asset-info">
                        <ul class="mine-info-bar">
                            <li>
                                <span class="mine-icon mine-infoBg"></span>
                            <@spring.messageText "mine.text11" "总资产暂无"/>
                            </li>
                            <li>
                                <span class="mine-icon mine-infoBg"></span>
                            <@spring.messageText "mine.text12" "创建子核心"/> ${sub_core_num}
                            </li>
                            <li>
                                <span class="mine-icon mine-infoBg"></span>
                            <@spring.messageText "mine.text13" "已使用点位"/> ${used_node_num}
                            </li>
                            <li>
                                <span class="mine-icon mine-infoBg"></span>
                            <@spring.messageText "mine.text14" "未使用点位"/> ${unused_node_num}
                            </li>
                            
                            <li>
                                <span class="mine-icon mine-infoBg"></span>
                            <a href="javascript:getSlaveTable()"><@spring.messageText "mine.text26" "直接推荐人数"/>  ${slave_size}</a>
                            </li>

                        </ul>
                        <div class="mine-info-pannel">
                            <p class='xinxi1'><@spring.messageText "name" "姓名"/></p>
                            <p class='xinxi2'><@spring.messageText "mine.text15" "其它信息"/></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<#include "/decorators/footer.ftl" >
</div>


<script type="text/javascript" src="/static/images/index/swfobject.min.js"></script>
<script type="text/javascript">
	$(function(){

        $('.core-status').on('click', '.btn-activate-core', function(){
            var html = [
                '<div class="modal fade" id="activateModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">',
                  '<div class="modal-dialog modal-sm" role="document">',
                    '<div class="modal-content">',
                      '<div class="modal-header">',
                        '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>',
                        '<h4 class="modal-title" id="exampleModalLabel"><@spring.messageText "mine.text999999" "温馨提示"/></h4>',
                      '</div>',
                      '<div class="modal-body">',
                        '<form>',
                          '<div class="form-group text-center">',
                            '<@spring.messageText "mine.text999999" "激活子核心需要花费"/><span>1BTC</span><@spring.messageText "mine.text999999" "，确认支付?"/>',
                          '</div>',
                          '<div class="form-group">',
                            '手机验证码：',
                            '<input type="text" class="input-vcode" />',
                            '<input type="button" class="btn-get-vcode" value="獲取短信驗證碼" />',
                          '</div>',
                          '<div class="form-group text-center">',
                            '<a class="btn-dialog-confirm" href="###"><@spring.messageText "mine.text999999" "确认支付"/></a>',
                            '<a class="btn-dialog-cancel" href="###"><@spring.messageText "mine.text999999" "取消"/></a>',
                          '</div>',
                          '<input id="user-uuid" type="hidden" />',
                        '</form>',
                      '</div>',
                    '</div>',
                  '</div>',
                '</div>'
            ].join('');
            $(document.body).append(html);
            $('#activateModal').modal('show');
            $('#activateModal').on('hidden.bs.modal', function(){
                $(this).remove();
            });
            $('#activateModal .btn-get-vcode').on('click', function(){
                var self = $(this);
                self[0].setAttribute("disabled", true);
                $.get('/user/getSmsCodeConsume/5', function(data){
                    if(0 == data.status){
                        var wait = 60;
                        
                        self.val(wait + "<@spring.messageText "withdrawal.text20" "秒后重新发送"/>");
                        var timer = setInterval(function(){
                            if(0 == wait){
                                clearInterval(timer);
                                self[0].removeAttribute("disabled");
                                self.val('<@spring.messageText "getsmscaptcha" "获取短信验证码"/>');
                            }else{
                                self.val(wait + "<@spring.messageText "withdrawal.text20" "秒后重新发送"/>");
                                wait--;
                            }
                        }, 1000);
                        self.parent().find('input[type="text"]').focus();
                    }else{
                        self[0].removeAttribute("disabled");
                        alertBoxFunc(data.error.message, "sure");
                    }
                });
            });
            var canBtnActivateClick = 1;
            $('#activateModal .btn-dialog-confirm').on('click', function(){
                if(!canBtnActivateClick) return;
                canBtnActivateClick = 0;
                $('#activateModal').modal('hide');
                $.ajax({
                    type: 'POST',
                    url: '/mine/activationSubCore',
                    data: {
                        nodeId: $('#topLevelNodeId').val(),
                        CSRFToken: $('#CSRFToken').val(),
                        vcode: $('#activateModal .input-vcode').val()
                    },
                    success: function(data){
                        canBtnActivateClick = 1;
                        if(0 == data.status){
                            alertBoxFunc(data.data.message,"sure",function(){
                                window.location.reload();
                            });
                        }else{
                            if(data.error.code && data.error.code == 10010){
                                var html = [
                                    '<div class="modal fade" id="rechargeModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">',
                                      '<div class="modal-dialog modal-sm" role="document">',
                                        '<div class="modal-content">',
                                          '<div class="modal-header">',
                                            '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>',
                                            '<h4 class="modal-title" id="exampleModalLabel"><@spring.messageText "mine.text999999" "温馨提示"/></h4>',
                                          '</div>',
                                          '<div class="modal-body">',
                                            '<form>',
                                              '<div class="form-group text-center">',
                                                '<@spring.messageText "mine.text999999" "余额不足，是否前往充值？"/>',
                                              '</div>',
                                              '<div class="form-group text-center">',
                                                '<a class="btn-dialog-confirm" href="/deal/recharge"><@spring.messageText "mine.text999999" "立即充值"/></a>',
                                                '<a class="btn-dialog-cancel" href="###"><@spring.messageText "mine.text999999" "取消"/></a>',
                                              '</div>',
                                            '</form>',
                                          '</div>',
                                        '</div>',
                                      '</div>',
                                    '</div>'
                                ].join('');
                                $(document.body).append(html);
                                $('#rechargeModal').modal('show');

                                $('#rechargeModal').on('hidden.bs.modal', function (e) {
                                    $(this).remove();
                                });

                                $('#rechargeModal .btn-dialog-cancel').on('click', function(){
                                    $('#rechargeModal').modal('hide');
                                });
                            }else{
                                alertBoxFunc(data.error.message,"sure");
                            }
                        }
                    }

                });
            });
            $('#activateModal .btn-dialog-cancel').on('click', function(){
                $('#activateModal').modal('hide');
            });


        });
		
	});

</script>

</body>
</html>
