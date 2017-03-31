define(function(require, exports, module){
    var $ = require('jquery');
    var d3 = require('d3');
    var template = require('artTemplate');
    var Util = require("../module/util");

    var Alertbox = require("../module/alertbox");
    var RSA = require("../module/rsa");
    console.log(RSA.encrypt('111111'));
    var box = new Alertbox({
        title: '創建子核心',
        content: "<p>創建子核心將消耗您100%產能,是否創建？</p>",
        hasClose: true,
        hasMask: true,
        btns: [
            {
                btnText: '创建',
                btnClass: 'aaaaa',
                clickEvent: function(){
                    alert(123213213);
                    box.destroy();
                }
            },
            {
                btnText: '取消'
            }
        ]
    });
    box.bind('afterRender', function(){
        alert(3333);
    });
    box.render();
    var listNum = $(".mine-side-bar li").length;
    if (listNum>10) {
        $(".mine-content .col-s").css("overflow-y","scroll");
    } else{
        $(".mine-content .col-s").css("overflow-y","auto");
    };
    var isPayPassword = $("#isPayPassword").attr('val');
    //激活子核心，点击确认
    var canBtnActivateClick = 1;
    $('#activateSubCoreModal .btn-confirm').on('click', function() {
        if(!canBtnActivateClick) return;
        canBtnActivateClick = 0;
        if(isPayPassword == 0) {
            if($('#activateSubCoreModal .input-vcode').val() == "") {
                alertBoxFunc( I18N.prop('vcodeisnull'), 'sure');
                canBtnActivateClick = 1;
                return;
            }
            if ($('#activateSubCoreModal .input-googlecode').val()=="") {
                alertBoxFunc( I18N.prop('googlecodeisnull'),'sure');
                canBtnActivateClick = 1;
                return;
            }
        } else if(isPayPassword == 1) {
            if($('#activateSubCoreModal #input-payPassword').val() == "") {
                alertBoxFunc('支付密码不能为空！', 'sure');
                canBtnActivateClick = 1;
                return;
            }
        }
        $('#activateSubCoreModal').modal('hide');
        var payPasswordVal = $('#activateSubCoreModal #input-payPassword').val();
        payPasswordVal = encodeURIComponent(ENCRYPT.encrypt(payPasswordVal));
        $.ajax({
            type: 'POST',
            url: '/mine/activationSubCore',
            data: {
                nodeId: $('#curNodeId').val(),
                CSRFToken: $('#CSRFToken').val(),
                vcode: $('#activateSubCoreModal .input-vcode').val(),
                payPassword: payPasswordVal,
                googlecode:$('#activateSubCoreModal .input-googlecode').val()
            },
            success: function(data) {
                canBtnActivateClick = 1;
                if(0 == data.status) {
                    alertBoxFunc(data.data.message, "sure", function() {
                        window.location.reload();
                    });
                } else {
                    if(data.error.code && data.error.code == 10010) {
                        $('#rechargeModal').modal('show');
                    } else {
                        alertBoxFunc(data.error.message, "sure");
                    }
                }
            }
        });
    });
    //激活子核心，点击发送验证码
    $('#activateSubCoreModal .btn-get-vcode').on('click', function() {
        var self = $(this);
        self[0].setAttribute("disabled", true);
        $.get('/user/getSmsCodeConsume/5', function(data) {
            if(0 == data.status) {
                var wait = 60;
                self.val(wait + I18N.prop('sendafterseconds'));
                var timer = setInterval(function() {
                    if(0 == wait) {
                        clearInterval(timer);
                        self[0].removeAttribute("disabled");
                        self.val(I18n.prop('getsmsvcode'));
                    } else {
                        self.val(wait + I18N.prop('sendafterseconds'));
                        wait--;
                    }
                }, 1000);
            } else {
                self[0].removeAttribute("disabled");
                alertBoxFunc(data.error.message, "sure");
            }
        });
    });
    //创建子核心，点击确认
    var canBtnCreateSubCoreClick = 1;
    $('#createSubCoreModal .btn-confirm').on('click', function() {
        if(!canBtnCreateSubCoreClick) {
            return false;
        }
        canBtnCreateSubCoreClick = 0;
        $('#createSubCoreModal').modal('hide');
        $.ajax({
            url: '/mine/createSubCore',
            type: 'post',
            data: {
                coreNodeId: $('#topLevelNodeId').val(),
                CSRFToken: $('#CSRFToken').val(),
                nodeId: $('#curNodeId').val()
            },
            success: function(data) {
                canBtnCreateSubCoreClick = 1;
                if(0 == data.status) {
                    alertBoxFunc(data.data, "sure", function() {
                        window.location.reload();
                    });
                } else {
                    alertBoxFunc(data.error.message, "sure");
                    if(data.error.message.indexOf('2627') > -1){
                        $("<div class='mine-invite-tip'> + I18N.prop('capacitytip') + </div>").insertAfter('#alertWrap .alert-text');
                    }
                }
            }
        });
    });
    //复制邀请链接
    $('#createUserModal .btn-confirm').on('mouseover', function() {
        $(this).off('mouseover');
        $(this).zclip({
            path: '/static/other/ZeroClipboard.swf',
            copy: function() {
                return $.trim( I18N.prop('invitecode') + ':' + $("#createUserModal .invite-code").html()+'\n' + I18N.prop('invitelink') +': '+$('#createUserModal .invite-code-url').html());
            },
            afterCopy: function() {
                $('.popularize-copy-tip').css('opacity', '1');
            }
        });
    });
    $('#createUserModal').on('hidden.bs.modal', function() {
        $('.popularize-copy-tip').css('opacity', '0');
    });
    //下方信息tab切换
    $('.mine-desc').on('click', '.mine-desc-detail-title li', function() {
        var self = $(this);
        var index = self.index();
        self.siblings().removeClass('active');
        self.addClass('active');
        $('.mine-desc-detail-item').hide().eq(index).show();
    });

    //激活子核心弹窗
    $('.mine-desc').on('click', '.btn-activate', function() {
        $.ajax({
            url: '/deal/user/balance',
            success: function(data) {
                if(0 == data.status) {
                    var balanceBtc = parseInt(data.data.balanceBtc);
                    if(balanceBtc >= 1) {
                        $('#activateSubCoreModal').modal('show');
                        $("#activateSubCoreModal #input-payPassword").val("");
                        $("#activateSubCoreModal .input-vcode").val("");
                        $("#activateSubCoreModal .input-googlecode").val("");
                        console.log(isPayPassword);
                        if(isPayPassword == 0) {
                            $("#activateSubCoreModal .vcode-box").show();
                            $("#activateSubCoreModal .googlecode-box").show();
                            $("#activateSubCoreModal #pay-password-box").hide();
                        } else if(isPayPassword == 1) {
                            $("#activateSubCoreModal .vcode-box").hide();
                            $("#activateSubCoreModal .googlecode-box").hide();
                            $("#activateSubCoreModal #pay-password-box").show();
                        }
                    } else {
                        $('#rechargeModal').modal('show');
                    }
                } else {
                    $('#rechargeModal').modal('show');
                }
            }
        });
    });
    //激活子核心弹窗
    $('.mine-status').on('click', '#btn-active-top', function(){
       $.ajax({
            url: '/deal/user/balance',
            success: function(data){
                if(0 == data.status){
                    var balanceBtc = parseInt(data.data.balanceBtc);
                    if(balanceBtc >= 1){
                        $('#activateSubCoreModal').modal('show');
                        $("#activateSubCoreModal #input-payPassword").val("");
                        $("#activateSubCoreModal .input-vcode").val("");
                        $("#activateSubCoreModal .input-googlecode").val("");
                        console.log(isPayPassword);
                        if(isPayPassword==0){
                            $("#activateSubCoreModal .vcode-box").show();
                            $("#activateSubCoreModal .googlecode-box").show();
                            $("#activateSubCoreModal #pay-password-box").hide();
                        }else if(isPayPassword==1){
                            $("#activateSubCoreModal .vcode-box").hide();
                            $("#activateSubCoreModal .googlecode-box").hide();
                            $("#activateSubCoreModal #pay-password-box").show();
                        }
                    }else{
                        $('#rechargeModal').modal('show');
                    }
                }else{
                    $('#rechargeModal').modal('show');
                }
            }
        });
    });
    $('#activateSubCoreModal').on('hidden.bs.modal', function() {
        $('#activateSubCoreModal .input-vcode').val('');
        $("#activateSubCoreModal .googlecode-box").val('');
    });
    //移除点位弹窗
    $('.mine-desc').on('click', '.btn-remove', function() {
        $('#removeUserModal').modal('show');
    });
    //确认移除点位
    $('#removeUserModal .btn-confirm').on('click', function() {
        $.ajax({
            type: "post",
            url: '/mine/clearSubNode',
            data: {
                'nodeId': $('#curNodeId').val()
            },
            dataType: "json",
            success: function(data) {
                if(data.status == 0) {
                    alertBoxFunc(data.data, "sure", function() {
                        window.location.reload();
                    });
                } else {
                    alertBoxFunc(data.error.message, "sure");
                }
            }
        });
    });
    //领取Mp操作
    var canBtnPrizeClick = 1;
    $('#prizeModal .btn-confirm').on('click', function() {
        if(!canBtnPrizeClick) return false;
        canBtnPrizeClick = 0;
        $.ajax({
            url: '/mine/receiveMP',
            type: 'post',
            data: {
                nodeId: $('#mpPrizeNodeId').val(),
                CSRFToken: $('#CSRFToken').val()
            },
            success: function(data) {
                canBtnPrizeClick = 1;
                if(data.status == 0) {
                    alertBoxFunc( I18N.prop('congratulationformp') + data.data.MPNum + 'MP', "sure", function() {
                        window.location.reload();
                    });
                } else {
                    alertBoxFunc(data.error.message, "sure");
                }
            }
        });
    });

    function CORE(opt) {
        this.wrap = opt.wrap;
        this.begin_time = opt.begin_time;
        this.outer_radius = opt.outer_radius;
        this.inner_radius = opt.inner_radius;
        this.subnode_width = opt.subnode_width;
        this.subnode_height = opt.subnode_height;
        this.data = opt.data;
        this.level = opt.level;
        this.x = opt.x;
        this.y = opt.y;
        this.type = opt.type;
        this.mouseOverTimer = null;
        this.customEvent = d3.dispatch('addSubCore', 'removeSubCore');
        this.selectedSubCoreIndex = null;
        this.busy = false;
        this.init();
    }
    CORE.prototype = {
        init: function() {
            var self = this;
            this.group = this.wrap.append('g')
                .attr('transform', 'translate(' + this.x + ',' + this.y + ') scale(0)');
            this.group.append('circle')
                .attr('r', this.outer_radius)
                .style({
                    fill: "#fff"
                });
            this.group.append('image')
                .attr('xlink:href', '/static/images/mine-core-bg.png')
                .attr('x', -this.inner_radius)
                .attr('y', -this.inner_radius)
                .attr('width', this.inner_radius * 2)
                .attr('height', this.inner_radius * 2);
            var angel = 360 / this.data.childrens.length;
            this.subGroup = this.group.append('g');
            var icon = ['/static/images/node-empty.png', '/static/images/node-user-inactive.png', '/static/images/node-user-active.png', '/static/images/node-sub-inactive.png', '/static/images/node-sub-active.png', '/static/images/node-other-inactive.png', '/static/images/node-other-active.png'];
            this.subGroup.selectAll("g")
                .data(this.data.childrens)
                .enter()
                .append('g')
                .attr('transform', function(d, i) {
                    var x = self.outer_radius * Math.sin(i * angel * Math.PI / 180) - self.subnode_width / 2;
                    var y = -self.outer_radius * Math.cos(i * angel * Math.PI / 180) - self.subnode_height / 2;
                    return 'translate(' + x + ',' + y + ')';
                })
                .on('click', function(d, i) {
                    clearTimeout(self.mouseOverTimer);
                    self.hideSubNodePercent();
                    self.subcodeOnclick(d, i);
                })
                .on('mouseenter', function(d, i) {
                    self.mouseOverTimer = setTimeout(function() {
                        if(d.status == 0 || ((d.status == 3 || d.status == 4) && !d.is_my_core) || self.level == 2) {
                            return;
                        }
                        self.showSubNodePercent(d, i);
                    }, 1000);

                })
                .on('mouseleave', function() {
                    clearTimeout(self.mouseOverTimer);
                    self.hideSubNodePercent();
                })
                .on('mouseout', function(d, i) {})
                .each(function(d, i) {
                    d3.select(this)
                        .append('image')
                        .attr("xlink:href", function() {
                            var status = d.status;
                            if(status == 3 || status == 4) {
                                if(!d.is_my_core) {
                                    return icon[status + 2];
                                }
                            }else if(status ==111){
                                return icon[2];
                            }
                            return icon[status];
                        })
                        .attr('width', self.subnode_width)
                        .attr('height', self.subnode_height);
                    d3.select(this)
                        .append('text')
                        .text(function(d, i) {
                            var text = '';
                            switch(d.status) {
                                case 1:
                                    var now = +new Date;
                                    var timeDifference = 72 * 1000 * 60 * 60 - d.interval_time - (now - self.begin_time);
                                    if(timeDifference < 0) {
                                        text = I18N.prop('noderemovable');
                                        d.removable = 1;
                                    } else {
                                        var hour = Math.floor(timeDifference / (1000 * 60 * 60));
                                        var minute = Math.floor(timeDifference % (1000 * 60 * 60) / (1000 * 60));
                                        text = hour + ':' + minute;
                                        d.removable_time = text;
                                    }
                                    break;
                                case 2:
                                case 111:
                                    text = d.node_position;
                                    break;
                                case 3:
                                case 4:
                                    if(d.is_my_core) {
                                        text = d.core_index;
                                    }
                                    break;
                            }
                            return text;
                        })
                        .style("text-anchor", "middle")
                        .attr("font-size", "12px")
                        .style("fill", '#fff')
                        .attr('width', self.subnode_width)
                        .attr('height', self.subnode_height)
                        .attr('transform', function(d, i) {
                            if(d.status == 2 || d.status == 111) {
                                var x = self.subnode_width / 2;
                                var y = self.subnode_height / 2 + 15;
                            } else {
                                var x = self.subnode_width / 2;
                                var y = self.subnode_height / 2 + 5;
                            }
                            return 'translate(' + x + ',' + y + ')';
                        });
                })
                .attr('width', self.subnode_width)
                .attr('height', self.subnode_height);
            //子核心展示占位百分比
            var userid = $('#userid').val();
            if(this.data.status == 3 || this.data.status == 4 || (this.data.status == 2 && this.data.userid == userid)) {
                var percentage = Math.floor(this.data.person_percent * 100);
                this.showPercentage(percentage);
            }
            //this.showMineStatus(this.data);
            var coreImgArr = ['/static/images/core-m.png', '/static/images/mine-info-user-inactive.png', '/static/images/mine-info-user-active.png', '/static/images/mine-info-subcore-inactive.png', '/static/images/mine-info-subcore-active.png'];
            var coreImg = '';
            if(this.type && this.type == 'core') {
                coreImg = coreImgArr[0];
            } else {
                coreImg = coreImgArr[this.data.status];
            }
            this.group.append('image')
                .attr('xlink:href', coreImg)
                .attr('x', -41)
                .attr('y', -41)
                .attr('width', 83)
                .attr('height', 83)
                .attr('cursor', 'pointer')
                .on('click', function() {
                    if(self.data.status == 3 || self.data.status == 4 || (self.data.status == 2 && self.data.userid == userid)) {
                        var percentage = Math.floor(self.data.person_percent * 100);
                        $('#prizeModalPercent').html(percentage);
                        if(percentage == 100) {
                            $('#prizeModal .btn-confirm').show();
                        } else {
                            $('#prizeModal .btn-confirm').hide();
                        }
                        $('#mpPrizeNodeId').val(self.data.id);
                        console.log(self.data.id);
                        $('#prizeModal').modal('show');
                    }
                });
            this.group
                .transition()
                .duration(500)
                .attr('transform', 'translate(' + this.x + ',' + this.y + ')' + 'scale(1)');
            this.showLevelCircle();
        },
        showPercentage: function(value) {
            var config = {
                minValue: 0,
                maxValue: 100,
                circleFillGap: 0.15,
                waveHeight: 0.05,
                waveCount: 0.5,
                waveRiseTime: 1000,
                waveAnimateTime: 1500,
                waveAnimate: true,
                waveColor: "#0047ab",
                waveOffset: 0,
                textVertPosition: 0.1,
                textSize: 0.2,
                textColor: "#fff",
                waveTextColor: "#fff"
            };
            var gauge = this.group;
            var elementId = 'aa';
            var radius = 70;
            var locationX = -70;
            var locationY = -70;
            var fillPercent = value / 100;
            var waveHeightScale = d3.scale.linear()
                .range([config.waveHeight, config.waveHeight])
                .domain([0, 100]);
            var textPixels = (config.textSize * radius / 2);
            var textFinalValue = parseFloat(value).toFixed(2);
            var textStartValue = 0;
            var circleFillGap = config.circleFillGap * radius;
            var fillCircleRadius = radius - circleFillGap;
            var waveHeight = fillCircleRadius * waveHeightScale(fillPercent * 100);
            var waveLength = fillCircleRadius * 2 / config.waveCount;
            var waveClipCount = 1 + config.waveCount;
            var waveClipWidth = waveLength * waveClipCount;
            var textRounder = function(value) {
                return Math.round(value);
            };
            if(parseFloat(textFinalValue) != parseFloat(textRounder(textFinalValue))) {
                textRounder = function(value) {
                    return parseFloat(value).toFixed(1);
                };
            }
            if(parseFloat(textFinalValue) != parseFloat(textRounder(textFinalValue))) {
                textRounder = function(value) {
                    return parseFloat(value).toFixed(2);
                };
            }
            var data = [];
            for(var i = 0; i <= 40 * waveClipCount; i++) {
                data.push({
                    x: i / (40 * waveClipCount),
                    y: (i / (40))
                });
            }
            var waveScaleX = d3.scale.linear().range([0, waveClipWidth]).domain([0, 1]);
            var waveScaleY = d3.scale.linear().range([0, waveHeight]).domain([0, 1]);
            var waveRiseScale = d3.scale.linear()
                .range([(circleFillGap + fillCircleRadius * 2 + waveHeight), (circleFillGap - waveHeight)])
                .domain([0, 1]);
            var waveAnimateScale = d3.scale.linear()
                .range([0, waveClipWidth - fillCircleRadius * 2])
                .domain([0, 1]);
            var textRiseScaleY = d3.scale.linear()
                .range([circleFillGap + fillCircleRadius * 2, (circleFillGap + textPixels * 0.7)])
                .domain([0, 1]);
            var gaugeGroup = gauge.append("g")
                .attr('opacity', 0.8)
                .attr('transform', 'translate(' + locationX + ',' + locationY + ')');
            var text1 = gaugeGroup.append("text")
                .text(textRounder(textStartValue) + "%")
                .attr("class", "liquidFillGaugeText")
                .attr("text-anchor", "middle")
                .attr("font-size", textPixels + "px")
                .style("fill", config.textColor)
                .attr('transform', 'translate(' + radius + ',' + textRiseScaleY(config.textVertPosition) + ')');
            var clipArea = d3.svg.area()
                .x(function(d) {
                    return waveScaleX(d.x);
                })
                .y0(function(d) {
                    return waveScaleY(Math.sin(Math.PI * 2 * config.waveOffset * -1 + Math.PI * 2 * (1 - config.waveCount) + d.y * 2 * Math.PI));
                })
                .y1(function(d) {
                    return(fillCircleRadius * 2 + waveHeight);
                });
            var waveGroup = gaugeGroup.append("defs")
                .append("clipPath")
                .attr("id", "clipWave" + elementId);
            var wave = waveGroup.append("path")
                .datum(data)
                .attr("d", clipArea)
                .attr("T", 0);
            var fillCircleGroup = gaugeGroup.append("g")
                .attr("clip-path", "url(#clipWave" + elementId + ")");
            fillCircleGroup.append("circle")
                .attr("cx", radius)
                .attr("cy", radius)
                .attr("r", fillCircleRadius)
                .style("fill", config.waveColor);
            var text2 = fillCircleGroup.append("text")
                .text(textRounder(textStartValue) + "%")
                .attr("class", "liquidFillGaugeText")
                .attr("text-anchor", "middle")
                .attr("font-size", textPixels + "px")
                .style("fill", config.waveTextColor)
                .attr('transform', 'translate(' + radius + ',' + textRiseScaleY(config.textVertPosition) + ')');
            var textTween = function() {
                var i = d3.interpolate(this.textContent, textFinalValue);
                return function(t) {
                    this.textContent = textRounder(i(t)) + "%";
                }
            };
            text1.transition()
                .duration(config.waveRiseTime)
                .tween("text", textTween);
            text2.transition()
                .duration(config.waveRiseTime)
                .tween("text", textTween);
            var waveGroupXPosition = circleFillGap + fillCircleRadius * 2 - waveClipWidth;
            waveGroup.attr('transform', 'translate(' + waveGroupXPosition + ',' + waveRiseScale(0) + ')')
                .transition()
                .duration(config.waveRiseTime)
                .attr('transform', 'translate(' + waveGroupXPosition + ',' + waveRiseScale(fillPercent) + ')')
                .each("start", function() {
                    wave.attr('transform', 'translate(1,0)');
                });
            if(config.waveAnimate) animateWave();

            function animateWave() {
                wave.attr('transform', 'translate(' + waveAnimateScale(wave.attr('T')) + ',0)');
                wave.transition()
                    .duration(config.waveAnimateTime * (1 - wave.attr('T')))
                    .ease('linear')
                    .attr('transform', 'translate(' + waveAnimateScale(1) + ',0)')
                    .attr('T', 1)
                    .each('end', function() {
                        wave.attr('T', 0);
                        animateWave(config.waveAnimateTime);
                    });
            }
        },
        subcodeOnclick: function(data, index) {
            var self = this;
            switch(data.status) {
                case 0:
                case 1:
                case 2:
                case 3:
                case 4:
                case 111:
                    var isSubCoreShown = this.isSubCoreShown;
                    var iconArr = ['/static/images/node-empty.png', '/static/images/node-user-inactive.png', '/static/images/node-user-active.png', '/static/images/node-sub-inactive.png', '/static/images/node-sub-active.png', '/static/images/node-other-inactive.png', '/static/images/node-other-active.png'];
                    var selectedIconArr = ['/static/images/node-empty.png', '/static/images/node-user-inactive-selected.png', '/static/images/node-user-active-selected.png', '/static/images/node-sub-inactive-selected.png', '/static/images/node-sub-active-selected.png', '/static/images/node-other-inactive.png', '/static/images/node-other-active.png'];
                    //保存上一次index
                    var lastSelectedIndex = this.selectedSubCoreIndex;
                    if(lastSelectedIndex != null) {
                        var child = this.data.childrens[lastSelectedIndex];
                        var icon;
                        var status = child.status;
                        icon = iconArr[status];
                        if(status == 3 || status == 4) {
                            if(!child.is_my_core) {
                                icon = iconArr[status + 2];
                            }
                        }else if(status == 111){
                            icon = iconArr[2];
                        }
                        var lastSelectedNode = this.subGroup.selectAll("g:nth-child(" + (lastSelectedIndex + 1) + ")");
                        lastSelectedNode.select('image').attr('xlink:href', icon);
                    }
                    var newIcon = selectedIconArr[data.status];
                    if(data.status == 3 || data.status == 4) {
                        if(!data.is_my_core) {
                            newIcon = selectedIconArr[data.status + 2];
                        }
                    }else if(data.status == 111){
                        newIcon = selectedIconArr[2];
                    }
                    var node = this.subGroup.selectAll("g:nth-child(" + (index + 1) + ")");
                    node.select('image').attr('xlink:href', newIcon);
                    this.hideMineDetail();
                    if(this.selectedSubCoreIndex != index && !(this.selectedSubCoreIndex == null && index == 0)) {
                        this.rotate(index, data);
                    }
                    if(this.isSubCoreShown) {
                        this.isSubCoreShown = false;
                        this.hideSubCore();
                        this.hideCreatePop();
                    }
                    if(!isSubCoreShown || (isSubCoreShown && this.selectedSubCoreIndex != index)) {
                        if(0 == data.status) {
                            self.showCreatePop(index);
                        } else {
                            //6.28，修改子核心显示逻辑，只要是有子节点就显示，gaia-470
                            //if(data.childrens.length > 0 && (data.status == 1 || data.status == 2 || data.is_my_core == 1)){
                            if(data.childrens.length > 0 && data.status != 0) {
                                this.showSubCore(data, index);
                            }
                            console.log(data);
                            this.showMineDetail(data);
                        }
                        this.isSubCoreShown = true;
                        this.selectedSubCoreIndex = index;
                        this.updateCurrentNodeidInPage(data.id);
                        //this.showMineStatus(data);
                    }
                    break;
            }
        },
        showSubNodePercent: function(d, i) {
            var self = this;
            var nid = d.id;
            if(!nid) {
                return false;
            }
            $.ajax({
                url: '/mine/suspension/node',
                type: 'post',
                data: {
                    nodeId: nid,
                    level: d.level
                },
                success: function(obj) {
                    if(0 == obj.status) {
                        var subNode = self.subGroup.select("g:nth-child(" + (i + 1) + ")");
                        var t = d3.transform(subNode.attr('transform')).translate;
                        var textArr = [{
                            cx: 60,
                            cy: 25,
                            text: I18N.prop('emptynodecount') + ':' + obj.data.unuse_node
                        }, {
                            cx: 60,
                            cy: 45,
                            text: I18N.prop('nodeoccupy') +':' + Math.floor(Util.accMul(parseFloat(obj.data.use_proportion), 100)) + '%'
                        }];
                        if(self.SubNodePercent) {
                            self.SubNodePercent.remove();
                        }
                        self.SubNodePercent = self.group.append('g')
                            .attr('transform', 'translate(' + (t[0] + 50) + ',' + (t[1] - 50) + ')');
                        self.SubNodePercent
                            .append('rect')
                            .attr('fill', '#002b49')
                            .attr('width', 120)
                            .attr('height', 60)
                            .attr('cx', 20)
                            .attr('cy', 20)
                            .attr('opacity', 0.8);
                        self.SubNodePercent.selectAll("text")
                            .data(textArr)
                            .enter()
                            .append("text")
                            .attr("x", function(d) {
                                return d.cx;
                            })
                            .attr("y", function(d) {
                                return d.cy;
                            })
                            .attr('fill', '#fff')
                            .attr('width', 120)
                            .attr('font-size', 14)
                            .attr('text-anchor', 'middle')
                            .attr('text-center', 'middle')
                            .text(function(d) {
                                return d.text
                            });
                    }
                }
            });

        },
        hideSubNodePercent: function() {
            if(this.SubNodePercent) {
                this.SubNodePercent.remove();
                this.SubNodePercent = null;
            }
        },
        showLevelCircle: function() {
            var level = this.data.level;
            for(var i = 1; i < level + 2; i++) {
                var arc = d3.svg.arc()
                    .innerRadius(this.inner_radius + 3 * i)
                    .outerRadius(this.inner_radius + 4 * i)
                    .startAngle(0)
                    .endAngle(2 * Math.PI);
                this.group.append("path")
                    .attr("fill", "#00a0e9")
                    .attr("d", arc);
            }
        },
        showMineDetail: function(data) {
            //状态为1的接口无数据，直接前端处理
            if(1 == data.status || 111 == data.status) {
                var html = template('mine-desc', $.extend(data, {
                    node_status: 1
                }));
                $('.mine-desc').html(html);
            } else {
            console.log(22)
                $.ajax({
                    url: '/mine/getMinerInfo',
                    type: 'post',
                    data: {
                        nodeId: data.id
                    },
                    success: function(obj) {
                        if(0 == obj.status) {
                            var detailData = obj.data;
                            if(detailData.capacity != null) {
                                detailData.capacity = Util.accMul(detailData.capacity, 100) + '%';
                            }
                            if(detailData.contribution_output != null) {
                                detailData.contribution_output = Util.accMul(detailData.contribution_output, 100) + '%';
                            }
                            detailData.contribution_century_integral = parseFloat(detailData.contribution_century_integral).toFixed(4);
                            detailData.contribution_total = parseFloat(detailData.contribution_total).toFixed(4);
                            detailData.century_integral = parseFloat(detailData.century_integral).toFixed(4);
                            detailData.output_sum = parseFloat(detailData.output_sum).toFixed(4);
                            var html = template('mine-desc', $.extend(data, detailData));
                            $('.mine-desc').html(html);
                        }
                    }
                });
            }
        },
        hideMineDetail: function() {
            $('.mine-desc-detail').html('');
            $('.mine-desc-info').html('');
        },
        updateCurrentNodeidInPage: function(nid) {
            $('#curNodeId').val(nid);
        },
        showSubCore: function(data, index) {
            this.customEvent.addSubCore(data);
        },
        hideSubCore: function() {
            this.customEvent.removeSubCore(this.level);
        },
        showCreatePop: function(index) {
            var arr = [{
                cx: 50,
                cy: 25,
                text: I18N.prop('createsubcore')
            }, {
                cx: 50,
                cy: 45,
                text: I18N.prop('recommend')
            }];
            /*
            var cur = this.selectedSubCoreIndex||0;
            var position = (6 + index - cur)%6*60/360;
            if(position > 0.2 && position < 0.7){
                var x =  this.outer_radius * Math.sin(2 * Math.PI * position) - 50;
                var y =  -this.outer_radius * Math.cos(2 * Math.PI * position) + 20 + this.subnode_height/2;
                this.createPopGroup = this.group.append('g')
                            .attr('transform', 'translate(' + x + ',' + y + ')')
                this.createPopGroup.append('line')
                    .attr("x1", 50)
                    .attr("y1", 0)
                    .attr("x2", 50)
                    .attr("y2", -20)
                    .attr("stroke", '#fff');
            }else{
                var x =  this.outer_radius * Math.sin(2 * Math.PI * position) - 50;
                var y =  -this.outer_radius * Math.cos(2 * Math.PI * position) - 60 - 20 - this.subnode_height/2;
                this.createPopGroup = this.group.append('g')
                            .attr('transform', 'translate(' + x + ',' + y + ')')
                this.createPopGroup.append('line')
                    .attr("x1", 50)
                    .attr("y1", 60)
                    .attr("x2", 50)
                    .attr("y2", 80)
                    .attr("stroke", '#fff');
            }
            */
            var position = 0;
            var x = this.outer_radius * Math.sin(2 * Math.PI * position) - 50;
            var y = -this.outer_radius * Math.cos(2 * Math.PI * position) - 60 - 20 - this.subnode_height / 2;
            this.createPopGroup = this.group.append('g')
                .attr('transform', 'translate(' + x + ',' + y + ')')
                .attr('display', 'none');
            this.createPopGroup.append('line')
                .attr("x1", 50)
                .attr("y1", 60)
                .attr("x2", 50)
                .attr("y2", 80)
                .attr("stroke", '#fff');
            this.createPopGroup.append('rect')
                .attr('stroke', '#fff')
                .attr('rx', 20)
                .attr('ry', 20)
                .attr('width', 100)
                .attr('height', 60)
                .attr('opacity', 0.8);
            this.createPopGroup.selectAll("text")
                .data(arr)
                .enter()
                .append("text")
                .attr("x", function(d) {
                    return d.cx;
                })
                .attr("y", function(d) {
                    return d.cy;
                })
                .attr('fill', '#fff')
                .attr('width', 100)
                .attr('font-size', 14)
                .attr('cursor', 'pointer')
                .attr('text-anchor', 'middle')
                .attr('text-center', 'middle')
                .text(function(d) {
                    return d.text
                })
                .on('mouseover', function(d) {
                    d3.select(this).attr('fill', '#076bb6');
                })
                .on('mouseout', function(d) {
                    d3.select(this).attr('fill', '#fff');
                })
                .on('click', function(d, i) {
                    if(0 == i) {
                        $('#createSubCoreModal').modal('show');
                    } else {
                        $.ajax({
                            url: '/mine/getSubCore',
                            type: 'get',
                            data: {
                                mindfieldId: $('#topLevelNodeId').val(),
                                thisfieldId: $('#curNodeId').val()
                            },
                            success: function(data) {
                                if(0 == data.status) {
                                    var link = window.location.protocol + "//" + window.location.host + "/user/signup?code=" + data.data.code;
                                    $(".invite-code").html(data.data.code);
                                    $('.invite-code-url').html(link);
                                    $('.invite-code-url').attr("href",link);
                                    $('#createUserModal').modal('show');
                                }
                            }
                        });
                    }
                });
            this.createPopGroup
                .transition()
                .delay(500)
                .attr('display', 'block');
        },
        hideCreatePop: function() {
            if(this.createPopGroup) {
                this.createPopGroup.remove();
                this.createPopGroup = null;
                this.selectedCreatePopIndex = null;
            }
        },
        showCoreInfo: function(index) {},
        destroy: function() {
            if(this.group) this.group.remove();
            this.group = null;
            this.wrap = null;
            this.outer_radius = null;
            this.inner_radius = null;
            this.subnode_width = null;
            this.subnode_height = null;
            this.data = null;
            this.level = null;
            this.x = null;
            this.y = null;
            this.customEvent = null;
            this.selectedSubCoreIndex = null;
            this.busy = null;
        },
        hide: function() {
            this.group.remove();
        },
        rotate: function(index, data, callback) {
            var self = this;
            //保存上一次index
            var lastSelectedIndex = this.selectedSubCoreIndex;
            var transCount = 0;
            this.subGroup.selectAll("g")
                .transition()
                .duration(500)
                .attrTween('transform', translateFn('subnode'))
                .each('start', function() {
                    transCount++;
                })
                .each('end', function() {
                    if(--transCount === 0) {
                        if(callback) {
                            callback();
                        }
                    }
                });

            function translateFn(type) {
                return function(d, i) {
                    //计算开始和结束为止
                    if(lastSelectedIndex) {
                        var begin = (6 + i - lastSelectedIndex) % 6 * 60 / 360;
                        var end = (6 + i - index) % 6 * 60 / 360;
                    } else {
                        var begin = i * 60 / 360;
                        var end = (6 + i - index) % 6 * 60 / 360;
                    }
                    //保证顺时针旋转
                    if(end < begin) {
                        end = end + 1;
                    }
                    var pos = d3.interpolate(2 * Math.PI * begin, 2 * Math.PI * end);
                    return function(t) {
                        if('subnode' == type) {
                            var x = self.outer_radius * Math.sin(pos(t)) - self.subnode_width / 2;
                            var y = -self.outer_radius * Math.cos(pos(t)) - self.subnode_height / 2;
                        } else {
                            var x = self.outer_radius * Math.sin(pos(t));
                            if(d.status == 2) {
                                var y = -self.outer_radius * Math.cos(pos(t)) + 15;
                            } else {
                                var y = -self.outer_radius * Math.cos(pos(t)) + 5;
                            }
                        }
                        return 'translate(' + x + ',' + y + ')';
                    }
                }
            }
        }
    };

    function SCENE(opt) {
        this.circle_spacing = opt.circle_spacing;
        this.width = opt.width;
        this.height = opt.height;
        this.outer_radius = opt.outer_radius;
        this.inner_radius = opt.inner_radius;
        this.subnode_width = opt.subnode_width;
        this.subnode_height = opt.subnode_height;
        this.cores = [];
        this.paths = [];
        this.init(opt);
    }
    SCENE.prototype = {
        init: function(opt) {
            var self = this;
            var wrap = opt.wrap;
            var width = opt.width;
            var height = opt.height;
            this.begin_time = +new Date;
            this.wrapId = opt.wrap;
            this.wrap = d3.select('#' + wrap)
                .attr('width', width)
                .attr('height', height)
                .append('g');
            this.addMask();
            var main = this.addCore({
                level: 0,
                type: opt.type,
                data: opt.data
            });
            this.showMineStatus(opt.data);
        },
        addCore: function(data) {
            var self = this;
            var config = {};
            config.wrap = this.wrap;
            config.begin_time = this.begin_time;
            config.outer_radius = this.outer_radius;
            config.inner_radius = this.inner_radius;
            config.subnode_width = this.subnode_width;
            config.subnode_height = this.subnode_height;
            config.level = this.cores.length;
            config.x = this.width / 2 + this.cores.length * this.circle_spacing;
            config.y = this.height / 2;
            $.extend(config, data);
            var core = new CORE(config);
            core.customEvent.on('addSubCore', function(data) {
                self.showLine(self.cores.length);
                self.addCore({
                    data: data
                });
            });
            core.customEvent.on('removeSubCore', function(level) {
                self.removeCore(level);
                self.hideLine(level);
            });
            this.cores.push(core);
            this.ajustPosition();
            return core;
        },
        removeCore: function(level) {
            for(var i = this.cores.length - 1; i > level; i--) {
                this.cores[i].destroy();
                this.cores.pop();
            }
            this.ajustPosition();
        },
        showLine: function(level) {
            var x = this.width / 2 + this.subnode_width / 2 + this.paths.length * this.circle_spacing;
            var y = this.height / 2 - this.outer_radius;
            var path = this.wrap.append('g')
                .attr('transform', 'translate(' + x + ',' + y + ')');
            var pathinfo = [{
                x: 0,
                y: 0
            }, {
                x: 20,
                y: 0
            }, {
                x: 55,
                y: -22
            }, {
                x: 220,
                y: -22
            }, {
                x: 260,
                y: 10
            }];
            var line = d3.svg.line()
                .x(function(d) {
                    return d.x;
                })
                .y(function(d) {
                    return d.y;
                })
                .interpolate("linear");
            path.append("svg:path")
                .attr("d", line(pathinfo))
                .style("stroke-width", 2)
                .style("stroke", "#fff")
                .style("fill", "none")
                .attr("opacity", 0)
                .transition()
                .duration(500)
                .attr('opacity', 1);
            this.paths.push(path);
        },
        hideLine: function(level) {
            for(var i = this.paths.length - 1; i > level - 1; i--) {
                this.paths[i].remove();
                this.paths.pop();
            }
        },
        showMineStatus: function(data) {
            if(data.capacity != null) {
                data.capacity = Util.accMul(data.capacity, 100) + '%';
            }
            data.contribution = parseFloat(data.contribution).toFixed(4);
            data.century_integral = parseFloat(data.century_integral).toFixed(4);
            data.output = parseFloat(data.output).toFixed(4);
            var html = template('mine-status-html', data);
            $('.mine-status').html(html);
        },
        ajustPosition: function() {
            var self = this;
            var len = this.cores.length;
            if(len == 2) {
                this.wrap
                    .transition()
                    .duration(500)
                    .attr('transform', 'translate(' + (1 - len) * 200 + ',0)');
            } else {
                this.wrap
                    .transition()
                    .duration(500)
                    .attr('transform', 'translate(' + (1 - len) * 230 + ',0)');
            }
            if(len > 2) {
                self.showLeftMask();
            } else {
                self.hideMask();
            }

        },
        addMask: function() {
            var self = this;
            this.leftMask = d3.select('#' + this.wrapId)
                .append('g')
                .attr('display', 'none');
            this.rightMask = d3.select('#' + this.wrapId)
                .append('g')
                .attr('transform', 'translate(' + (this.width - 110) + ',0)')
                .attr('display', 'none');
            this.leftMask.append('rect')
                .attr('fill', '#000')
                .attr('opacity', '0.1')
                .attr('width', this.outer_radius)
                .attr('height', this.height);
            this.leftMask.append('image')
                .attr('xlink:href', '/static/images/mine-slide-left.png')
                .attr('width', 28)
                .attr('height', 38)
                .attr('x', (this.outer_radius - 28) / 2)
                .attr('y', (this.height - 38) / 2)
                .attr('cursor', 'pointer')
                .on('click', function() {
                    self.wrap
                        .transition()
                        .duration(500)
                        .attr('transform', 'translate(-200,0)')
                        .each('end', function() {
                            self.showRightMask();
                        });
                });
            this.rightMask.append('rect')
                .attr('fill', '#000')
                .attr('opacity', '0.1')
                .attr('width', this.outer_radius)
                .attr('height', this.height);
            this.rightMask.append('image')
                .attr('xlink:href', '/static/images/mine-slide-right.png')
                .attr('width', 28)
                .attr('height', 38)
                .attr('x', (this.outer_radius - 28) / 2)
                .attr('y', (this.height - 38) / 2)
                .attr('cursor', 'pointer')
                .on('click', function() {
                    self.wrap
                        .transition()
                        .duration(500)
                        .attr('transform', 'translate(-460,0)')
                        .each('end', function() {
                            self.showLeftMask();
                        });
                });
        },
        showLeftMask: function() {
            var t = d3.transform(this.wrap.attr('transform')).translate[0];
            this.leftMask.attr('display', 'block');
            this.rightMask.attr('display', 'none');
        },
        showRightMask: function() {
            var t = d3.transform(this.wrap.attr('transform')).translate[0];
            this.leftMask.attr('display', 'none');
            this.rightMask.attr('display', 'block');
        },
        hideMask: function() {
            this.leftMask.attr('display', 'none');
            this.rightMask.attr('display', 'none');
        },
        updateTitle: function(type, index) {
            if('core' == type) {
                $('.mine-title').html(I18N.prop('energycore'));
            } else {
                $('.mine-title').html('G ' + index);
            }
        },
        destroy: function() {
            if(this.wrap) {
                this.wrap.remove();
            }
            if(this.leftMask) {
                this.leftMask.remove();
            }
            if(this.rightMask) {
                this.rightMask.remove();
            }
        }
    };
    var scene;
    var conf = {
        wrap: 'mine-svg',
        width: 870,
        height: 500,
        circle_spacing: 350,
        outer_radius: 110,
        inner_radius: 70,
        subnode_width: 53,
        subnode_height: 60
    };
    $.ajax({
        url: '/mine/user/v2',
        type: 'post',
        data: {
            nodeId: $("#topLevelNodeId").val()
        },
        success: function(data) {
            if(0 == data.status) {
                $('#topLevelNodeId').val(data.data.mine_list.id);
                $.extend(conf, {
                    type: 'core',
                    data: data.data.mine_list
                });
                $('#userid').val(data.data.mine_list.userid);
                scene = new SCENE(conf);
            }
        }
    });
    $('.mine-side-search input').on('keyup', function() {
        var val = $(this).val();
        if(!val) {
            var html = template('mine-side-html', {
                list: sideListArr
            });
            $('.mine-side-bar').html(html);
            return;
        }
        var curNodeArr = [];
        var nodeArr = [];
        var curNode = $('.mine-side-bar .active').attr('data-nodeid');
        $.each(sideListArr, function(i, item) {
            item.active = 0;
            if(item.id == curNode) {
                item.active = 1;
                curNodeArr.push(item);
            } else if(item.indexNum.indexOf(val) > -1) {
                nodeArr.push(item);
            }
        });
        var html = template('mine-side-html', {
            list: curNodeArr.concat(nodeArr)
        });
        $('.mine-side-bar').html(html);
    });
    $('.mine-side-bar').on('click', 'li', function() {
        var self = $(this);
        var index = self.index();
        if(self.hasClass('active')) {
            return false;
        }
        $('.mine-desc-detail').html('');
        $('.mine-desc-info').html('');
        $('.mine-title').html(self.find('h5').html());
        $.each(sideListArr, function(i, item) {
            if(self.attr('data-index') == item.coreIndex) {
                item.active = 1;
            } else {
                item.active = 0;
            }
        });
        $.ajax({
            url: '/mine/user/v2',
            type: 'post',
            data: {
                nodeId: self.attr('data-nodeid')
            },
            success: function(data) {
                if(0 == data.status) {
                    scene.destroy();
                    $.extend(conf, {
                        type: index ? '' : 'core',
                        data: data.data.mine_list
                    });
                    scene = new SCENE(conf);
                    $('#curNodeId').val(self.attr('data-nodeid'));
                    $('.child-core-name').html(self.find('h5').html());
                    if(index > 0){
                        $('.mine-status').find('table').addClass('table-status');
                    }else{
                        $('.mine-status').find('table').removeClass('table-status');
                    }
                }
            }
        });
        $(this).siblings().removeClass('active');
        $(this).addClass('active');
    });
});