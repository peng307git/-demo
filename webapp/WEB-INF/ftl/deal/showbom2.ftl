<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<style>
 
body {
  background: #F0F3F5;
  font-family: sans-serif;
  font-style: italic;
  margin: 0;
  border: 0;
}

</style>
</head>
<body>
<script src="/static/js/jquery-1.11.2.min.js"></script>
<script src="/static/js/d3.min.js"></script>
<script>
$(function(){
  (function init(){
    //ajax请求数据
    $.ajax({
        url: "/queue/show/generator/block/mp",              //请求地址
        type: "POST",                       //请求方式
        //data: { name: "super", age: 20 },        //请求参数
        dataType: "json",
        success: function (data) {
          //console.log(data.orTime)
            // 此处放成功后执行的代码
            var datar = data.data
            //console.log(data.status)
            if (status==0) {
             
            game("body","https://o5uaa1ha4.qnssl.com/static/images/",datar);
          };
        },
        fail: function (status) {
            location.reload();
        }
    });
    
  })();

  function game(box,imagesUrl,datas){
    var orTime = datas.orTime , 
        orBag = datas.orBag , 
        beforeBag = datas.beforeBag,
        afterBag = datas.afterBag,
        username = datas.userName,
        needBag = datas.needBag,
        Ranks = datas.Ranks,
        orBagNew = datas.orBagNew,
        beforeBagNew = datas.beforeBagNew,
        afterBagNew = datas.afterBagNew,
        needBagNew = datas.needBagNew,
        ranksNew = datas.ranksNew,
        mpCount = datas.mpCount,
        preSMPCount = datas.preSMPCount,
        SMPCount = datas.SMPCount;
    var needDataNew=0;
    if(orBagNew!=""||orBagNew!=0){
      needDataNew==1;
    }
    
    var produceSpeed = 90;//生产速度 90S/5b
    var spacetime = d3.select(box);
    var width = 920,//画面宽度
        height = 220,//画面高度
        radius = Math.min(width, height),//路径直径
        speed = 2 //speed秒转一圈,数越大速度越慢
        longer = 40//尾巴长度
        evYellow = 0;
    var fujicanshu ;
    var radii = {
      "ballOrbit": radius / 2.4,//轨迹半径
      "ball": radius / 32,//第一个球半径
    };
    var imgUrl = imagesUrl //包旋转图片的url = imgUrl + showbom/***.png 
    // Space
    var svg = spacetime.append("svg")
      .attr("width", width)
      .attr("height", height+30)
      .append("g")
      .attr("transform", "translate(" + radius / 2 + "," + radius / 2 + ")");

    //绘制操场形灰色背景
    svg.append('path')
        .attr("class","greyBackground")
        .style("fill", "#DDD")
        .attr("d","M" + 0 + ","+ -radius / 2.2
          +"L"+ (width-radius) + ","+ -radius/2.2 + "A" + radius/2.2 + "," + radius/2.2 + " 0 1,1 " + (width-radius)+ ","+ radius/2.2 +"L"+ 0 + ","+ radius/2.2 + "A" + radius/2.2 + "," + radius/2.2 + " 0 1,1 " + 0 + ","+ -radius/2.2+"Z")

    //虚化滤镜      
    var defs =svg.append("defs")
    var f1 = defs.append("filter")
                  .attr("id", "f1")
                  .attr("x","0")
                  .attr("y", "0");
            f1.append('feGaussianBlur')
              .attr("in","SourceGraphic")
              .attr("result","blurOut")
              .attr("stdDeviation", radii.ball/3);
              var defs =svg.append("defs")
    var f2 = defs.append("filter")
                  .attr("id", "f2")
                  .attr("x","0")
                  .attr("y", "0");
            f2.append('feGaussianBlur')
              .attr("in","SourceGraphic")
              .attr("result","blurOut")
              .attr("stdDeviation", 3);
    //放射渐变滤镜
    var grad1 = defs.append("radialGradient")
                    .attr("id", "grad1")
                    .attr("x1", "100%")
                    .attr("y1", "50%")
                    .attr("x2", "0%")
                    .attr("y2", "50%");
        grad1.append("stop")
              .attr("offset", "80%")
              .attr("stop-color", "#070C17")
              .attr("stop-opacity", "1");
        grad1.append("stop")
              .attr("offset", "100%")
              .attr("stop-color", "#185D98")
              .attr("stop-opacity", "1");

    //绘制包
    var imagesBao = [], 
        imagesBao2 = [],
        imagesBom = []; 
    for (var i = 0; i < 30; i++) {
        imagesBao[i] = imgUrl+"showbom/bao_"+i+".png";
        imagesBao2[i] = imgUrl+"showbom/bao2_"+i+".png";
        imagesBom[i] = imgUrl+"showbom/bom_"+i+".png";
    };
    


    //画左侧圆
    svg.append('g')
        .attr('id', 'CircleA');
    var CircleA = svg.select("#CircleA");

    drawCircle(CircleA,1)//左侧圆,加入转盘
    
    
    //画右侧圆
    svg.append('g')
        .attr('id', 'CircleB')
        .attr("transform", "translate(" + (width-radius) + ","+0+")");
    var CircleB = svg.select("#CircleB");
    
    drawCircle(CircleB,0)//右侧圆,无转盘
    drawMain2(CircleB)//右侧圆内容

    //绘制圆盘及球和尾巴外盒,box为外盒,you为是否有转盘 0=否，1=是 ;
    function drawCircle(box,you){
      box.append("circle")
        .attr("class", "ballOrbit")
        .attr("r", radii.ballOrbit)
        .style("fill",  "url(#grad1)")
        .style("stroke", "rgba(84, 84, 84, 0.5)")
        .style("stroke-width",radii.ball);
      //blue line
      if (you==1) {
        box.append('g')
          .attr("class", "tiao")
          .attr("transform", "rotate(" + -90 + ")");
        var tiao = box.select(".tiao");
        var coner = (2*Math.PI / 360) * 360/(produceSpeed*4) ;
        for (var i = produceSpeed - 1; i >= 0; i--) {
          tiao.append('path')
          .attr("class","blue"+i)
          .attr("d","M 0,0 L"+ radii.ballOrbit*Math.cos(coner) +","+ -radii.ballOrbit*Math.sin(coner)+" L "+radii.ballOrbit*Math.cos(coner)+","+radii.ballOrbit*Math.sin(coner)+" Z" )
          .style("fill", "rgba(50,86,168,0.75)")
          .attr("transform", "rotate(" + 360/(produceSpeed)*i + ")");
        };
        for (var i = orTime; i >= 0; i--) {
          tiao.select(".blue" + i)
              .style("fill", "rgba(136,235,253,1)"); 
        }
        //blue light 蓝条变亮
        var startTime = new Date().getTime()
        var blueLight = orTime;
        var blueLightId = d3.timer(function(){
            var nowtime = new Date();
            var timeC = Math.floor((nowtime - startTime)/1000)+blueLight;
            for (var i = timeC ; i > 0; i--) {
              tiao.select(".blue" + i)
              .style("fill", "rgba(136,235,253,1)"); 
            };
            
            if (timeC >= produceSpeed) {
              blueLight = 0;
              timeC = 0;
              needDataNew=0;
              startTime = new Date().getTime()
              tiao.selectAll("path")
                .style("fill", "rgba(50,86,168,0.75)");
              tiao.select(".blue" + timeC)
              .style("fill", "rgba(136,235,253,1)"); 
            }
            CircleA.select(".second").text(function(){ if (timeC>=80) {return "0"+(89-timeC)} else{return 89-timeC}; });
            CircleA.select(".millisecond").text(function(){ return "."+(9-Math.floor((nowtime - startTime)/100)%10)});
            if (timeC < 60) {
              needDataNew==0
            }
            if (needDataNew==0&&timeC>=60) {
              needDataNew =1;
              $.ajax({
                url: "/queue/show/generator/block/mp",              //请求地址
                type: "POST",                       //请求方式
                //data: { name: "super", age: 20 },        //请求参数
                dataType: "json",
                success: function (data) {
                    // 此处放成功后执行的代码
                  var datar = data.data
                  if(datar.orBagNew==0){
                    //console.log(datar.afterBagNew)
                    location.reload();
                  }else{
                    orBagNew=datar.orBagNew;
                    beforeBagNew=datar.beforeBagNew;
                    afterBagNew=datar.afterBagNew;
                    needBagNew=datar.needBagNew;
                    ranksNew=datar.ranksNew;
                    mpCount=datar.mpCount;
                    fujicanshu = datar.firstQueueNum;
                    SMPCount = datar.SMPCount;
                  }
                },
                fail: function (status) {
                    location.reload();
                }
              });
            };
        })
      };
    }

    //亮球 move 循环
    drawBallMove(CircleB,0);
    drawBallMove(CircleA,1);

    //绘制亮球 move ,box为外盒,go为转向 0=逆时针，1=顺时针 ;
    function drawBallMove(box,go){
      //ball
      box.append('g')
        .attr("class", "ball");
      for (var i = 0; i < longer; i++) {
        box.select(".ball").append("circle")
        .attr("class", "ball"+i)
        .attr("r", radii.ball-(radii.ball/longer)*i)
        .style("fill", "rgba("+8*(longer-i)+","+ 15*(longer-i) +", "+13*(longer-i)+","+" 1.0)");
      };
      box.append('circle')
        .attr("r", radii.ball)
        .style("fill","#080808")
      //尾巴跟随亮球
      var places = new Array(longer); //储存位置信息供尾巴跟随
      var tailFollowBall = d3.timer(function () {
        var x = box.select(".ball0").attr("transform");
        places.splice(0,0,x);
        places.splice(longer,1);
        for (var i = 1; i < longer; i++) {
          box.select(".ball"+i).attr("transform", places[i])
        };
      })

      var angle = 0 ;
      var endAngle;
      var speederMove = 360/(speed*50);
      var enderMove = (width-radius/2-radii.ballOrbit)/50;
      var orTimeint = orTime
      //复位
      var startTime = new Date().getTime() - orTimeint*1000;
      var endAngleX , endAngleY ;
      var angleR ;
      angleA();
      function angleA(){
        if (go==1) {
            angle =  0 + 360*(orTimeint/speed);
            endAngle = 360*((produceSpeed-orTimeint)/speed)+angle ;
        }else if(go==0){
            angle = 180 - 360*(orTimeint/speed);
            endAngle = 360*((produceSpeed-orTimeint)/speed)-angle ;
        }
        endAngleX = radii.ballOrbit*Math.cos((2*Math.PI / 360) * endAngle );
        endAngleY = radii.ballOrbit*Math.sin((2*Math.PI / 360) * endAngle );
        startTime = new Date().getTime();
        orTimeint = 0;
        angleR=0;
      }
      
      var ballMoveId = d3.timer(function () {
        var timeC = new Date() - startTime;
        if (go==1) {
          if(angleR >= endAngle){
            angleR == endAngle;
            endAngleX += enderMove
            if (endAngleX >= (width-radius)/2) {
              evYellow = 1;
              angleA()
            } 
            m2()
          }else{
            angleR = angle + speederMove*(timeC/20)
            //angle += speederMove;
            m1();
          }
        } else if (go==0){
          if(angleR <= -endAngle){
            angleR == endAngle;
            endAngleX -= enderMove
            if (endAngleX <= -(width-radius)/2) {
              evYellow = 1;
              angleA()
            }
            m2(); 
          }else{
            angleR = angle - speederMove*(timeC/20)
            m1();
          }
        };
        
      });
      function m1(){
          var radian = (2*Math.PI / 360) * angleR ;
          box.select(".ball0")
            .attr("transform", "translate(" + radii.ballOrbit*Math.cos(radian) + "," + radii.ballOrbit*Math.sin(radian) + ")")
          ; 
        }
        function m2(){
          if (endAngleY > 0) {
            endAngleY--
          } else if(endAngleY < 0){
            endAngleY++
          } else{
            endAngleY==0
          };
          box.select(".ball0").attr("transform", "translate(" + endAngleX + ","+endAngleY+")"); 
        }
    }
    drawMain1(CircleA)//绘制左侧圆内容
    //绘制左侧圆内容
    function drawMain1(box){
      var ro =radii.ballOrbit*2/3-1
      box.append('g')
        .attr("class", "popbox")
        .append("circle")
        .attr("r", ro+2 )
        .style("fill",  "#242933");
      var popbox = box.select(".popbox");
      var popA = popbox.append('path')
                        .attr("class", "popA")
                        .attr("d", "M "+(ro-2)+","+0
                                  +"A"+(ro-2)+","+(ro-2)+ " 0 1 0 " + -7 + ","+ (ro-3)
                                  +"C"+(ro/2)+","+(ro-5)+" "+ 4 +","+ (ro/2-1)+" "+(ro/3)+","+(ro/3)
                                  +"S"+ (ro-3) +","+ (ro/2) +" "+(ro-2)+","+0
                                  +" Z")
                        .style("fill",  "#4E566C")
                        .style("stroke", "#9098AC")
                        .style("stroke-width",2)
      var popB = popbox.append('path')
                        .attr("class", "popB")
                        .attr("d", "M "+(ro-5)+","+0
                                  +"A"+(ro-5)+","+(ro-5)+ " 0 1 0 " + -(4) + ","+ (ro-6)
                                  +"C"+(ro/2-6)+","+(ro-10)+" "+ 2 +","+ (ro/2-4)+" "+(ro/3-3)+","+(ro/3-3)
                                  +"S"+ (ro-6) +","+ (ro/2-3) +" "+(ro-5)+","+0
                                  +" Z")
                        .style("fill",  "rgba(0,0,0,0.5)");
      var popCBg = popbox.append("circle")
                        .attr("class", "popCBg")
                        .attr("r", (ro/4+1))
                        .style("fill",  "#4E566C")
                        .style("stroke", "#9098AC")
                        .style("stroke-width",2)
                        .attr("transform", "translate(" + (ro/2+1) + ","+(ro/2+2)+")");
      var popC = popbox.append("circle")
                        .attr("class", "popC")
                        .attr("r", (ro/4-3))
                        .style("fill",  "rgba(0,0,0,0.5)")
                        .attr("transform", "translate(" + (ro/2+1) + ","+(ro/2+2)+")");
      var popR = popbox.append("g")
                      .attr("transform", "translate(" + (ro/2+1) + ","+(ro/2+2)+")")
                      .append("g")
                      .attr("class", "popR");
          popR.append("path")
              .attr("d","M "+(ro/4-1)+","+0+"A"+(ro/4-1)+","+(ro/4-1)+ " 1 0 1 " + 0 + ","+ (ro/4-1))
              .style("stroke", "rgba(136,235,253,1)")
              .style("stroke-width",2)
              .style("fill",  "none");
      //旋转动画
      var anglePopR = 0;
      var start = Date.now();
      d3.timer(function() {
          anglePopR = (Date.now() - start)/1000 * 360,
          transform = function(d) { return "rotate(" + anglePopR + ")"; };
          popR.attr("transform", transform);
      });
      box.append('text')
        .attr('class', 'second')
        .attr("font-size", 36)
        .attr("x","-33")
        .attr("y","10")
        .attr("fill","white")
        .text('');
      box.append('text')
        .attr('class', 'millisecond')
        .attr("font-size", 20)
        .attr("x","12")
        .attr("y","10")
        .attr("fill","white")
        .text('.0');
    }
    //绘制 中间 模型
    //加载images
    function loadImg(){
      var BaoObj = new Array();
      var Bao2Obj = new Array(); 
      var BomObj = new Array(); 
      for(var j = 0; j < 30; j++ ) { 
        BaoObj[j] = new Image();
        Bao2Obj[j] = new Image(); 
        BomObj[j] = new Image(); 
        BaoObj[j].src=imagesBao[j];
        Bao2Obj[j].src=imagesBao2[j];
        BomObj[j].src=imagesBom[j]; 
      }
      drawCenter();
    }
    function drawCenter(){
      svg.append('g')
          .attr('class', 'centerBox');
      var centerBox = svg.select('.centerBox');
      centerBox.append('g')
              .attr('class', 'greyShadow')
              .attr("transform", "translate(" + (width-radius)/2 + ","+ 15 +")")
              .append('ellipse')
              .attr('rx', '40')
              .attr('ry', '10')
              .attr("fill","#999")
              .attr("filter", "url(#f2)");
      centerBox.select(".greyShadow")
              .append('ellipse')
              .attr('rx', '37')
              .attr('ry', '8')
              .style("stroke", "#DDD")
              .style("stroke-width",1)
              .style("fill",  "none");
      centerBox.append('image')
              .attr('width', (width-radius)/2)
              .attr('height', '36')
              .attr("transform", "translate(" + (width/2-radii.ballOrbit)/2 + ","+ -40 +")")
              .attr("xlink:href",imgUrl+"showbom/arrow.gif");
      centerBox.append('image')
              .attr('width', (width-radius)/2)
              .attr('height', 79)
              .attr("transform", "translate(" + (width/2-radii.ballOrbit-8)/2 + ","+ -60 +")")
              .attr("xlink:href",imgUrl+"showbom/lattice.gif");
      centerBox.append('image')
              .attr('class', 'bao')
              .attr('width', '100')
              .attr('height', '100')
              .attr("transform", "translate(" + ((width-radius)/2-50) + ","+ -80 +")")
              .attr("xlink:href",function(d){return imagesBao[0];});
      centerBox.append('image')
              .attr('class', 'bom')
              .attr('width', '150')
              .attr('height', '150')
              .attr("transform", "translate(" + ((width-radius)/2-75) + ","+ -85 +")")
              .style("opacity",0.0)
              .attr("xlink:href",function(d){return imagesBom[0];});
      centerBox.append('text')
              .attr('class', 'Xspeed')
              .attr("font-size", 36)
              .attr('font-style', 'normal')
              .attr('font-family', 'Microsoft Yahei')
              .attr("x",(width-radius)/2+30)
              .attr("y",radius/2-130)
              .attr("fill","#3194DE")
              .text('X'+mpCount)
              .style("opacity",0);
      centerBox.append('text')
              .attr('class', 'titleBottom1')
              .attr("font-size", 16)
              .attr('font-style', 'normal')
              .attr('font-weight', 'bold')
              .attr('font-family', 'Microsoft Yahei')
              .attr("x",(width-radius)/2-150)
              .attr("y",radius/2-45)
              .attr("fill","#749ACE")
              .text('<@spring.messageText "buythen.text5021" "目前全球有"/>');
      centerBox.append('text')
              .attr('class', 'titleBottom2')
              .attr("font-size", 16)
              .attr('font-style', 'normal')
              .attr('font-weight', 'bold')
              .attr('font-family', 'Microsoft Yahei')
              .attr("x",(width-radius)/2+70)
              .attr("y",radius/2-45)
              .attr("fill","#749ACE")
              .text('<@spring.messageText "buythen.text5022" "个智慧包等待购买"/>');
      centerBox.append('text')
              .attr('class', 'titleBottom')
              .attr("font-size", 30)
              .attr('font-style', 'normal')
              .attr('font-weight', 'bold')
              .attr('font-family', 'Microsoft Yahei')
              .attr('text-anchor', 'middle')
              .attr("x",(width-radius)/2)
              .attr("y",radius/2-45)
              .attr("fill","#000")
              .text(orBag);
      centerBox.append('text')
              .attr('class', 'subheadBottom1')
              .attr("font-size", 12)
              .attr('font-style', 'normal')
              .attr('font-weight', 'bold')
              .attr('font-family', 'Microsoft Yahei')
              .attr('text-anchor', 'end')
              .attr("x",(width-radius)/2-10)
              .attr("y",radius/2-20)
              .attr("fill","#666")
              .text('<@spring.messageText "buythen.text5029" "每90秒产生6个智慧包，本世纪还可以产生"/>');
      centerBox.append('text')
              .attr('class', 'subheadBottom2')
              .attr("font-size", 12)
              .attr('font-style', 'normal')
              .attr('font-weight', 'bold')
              .attr('font-family', 'Microsoft Yahei')
              .attr("x",(width-radius)/2+70)
              .attr("y",radius/2-20)
              .attr("fill","#666")
              .text('<@spring.messageText "buythen.text5030" "个智慧包，每个智慧包有390个MN。"/>');
      centerBox.append('text')
              .attr('class', 'subheadBottom')
              .attr("font-size", 16)
              .attr('font-style', 'normal')
              .attr('font-weight', 'bold')
              .attr('font-family', 'Microsoft Yahei')
              .attr("x",(width-radius)/2+30)
              .attr("y",radius/2-20)
              .attr("fill","#333")
              .attr('text-anchor', 'middle')
              .text(preSMPCount);
      /* centerBox.append('g')
              .attr('class', 'infoBox')
              .attr("transform", "translate(" + ((width-radius)/2+210) + ","+ 75 +")")
      var infoBoxMark = centerBox.select('.infoBox')
                                .append('g')
                                .attr('class', 'infoBoxMark')
                                .attr("transform", "translate(" + 40 + ","+ 10 +")")
                                .attr("cursor","pointer");
      infoBoxMark.append('ellipse')
                .attr('rx', '10')
                .attr('ry', '10')
                .style("stroke", "#5CA9EA")
                .style("stroke-width",1)
                .style("fill",  "#EEE");
      infoBoxMark.append('text')
              .attr("font-size", 16)
              .attr('font-style', 'normal')
              .attr('font-weight', 'normal')
              .attr('font-family', 'Microsoft Yahei')
              .attr("x",-4)
              .attr("y",6)
              .attr("fill","#5CA9EA")
              .text('?');
      var infoBoxDetail = centerBox.select('.infoBox')
                                  .append('g')
                                  .attr('class', 'infoBoxDetail')
                                  .attr("transform", "translate(" + -9930 + ","+ 55 +")");
      infoBoxDetail.append("path")
                  .attr("d","M "+ -400 +","+ -30+
                            "L"+ -17 +","+ -30 +
                            "L"+ -10 +","+ -40 +
                            "L"+ -3 +","+ -30 +
                            "L"+120+","+ -30 +
                            "A"+10+","+10+ " 1 0 1 " +120+","+ -7+
                            "L"+ -400 +","+ -7 +
                            "A"+10+","+10+ " 1 0 1 " +-400+","+ -30 +
                            "Z")
                  .style("stroke", "#5CA9EA")
                  .style("stroke-width",1)
                  .style("fill",  "#EEE");
      infoBoxDetail.append('text')
              .attr("font-size", 12)
              .attr('font-style', 'normal')
              .attr('font-weight', 'bold')
              .attr('font-family', 'Microsoft Yahei')
              .attr('text-anchor', 'middle')
              .attr("x",-140)
              .attr("y",-15)
              .attr("fill","#666")
              .text('<@spring.messageText "buythen.text5031" "下一世纪每个智慧包含有390个MN，智慧包内MN数量以到账时间为准，不以系统下单时间为准。"/>');
              
      infoBoxMark.on("mouseover",function(){
        infoBoxDetail.attr("transform", "translate(" + 50 + ","+ 55 +")");
      })
      infoBoxMark.on("mouseout",function(){
        infoBoxDetail.attr("transform", "translate(" + -9930 + ","+ 55 +")");
      })*/
      var indexImages=0;
      var start = Date.now();
      d3.timer(function() {
        indexImages = Math.floor((Date.now() - start)/33);
        if(indexImages>=30 ){
          indexImages = 29 ;
          start = Date.now();
        }
        if(evYellow>0){
          evYellow ++ ;
          if(evYellow>=60){evYellow=0;}
          centerBox.select('.bao').attr("xlink:href",function(d){return imagesBao[indexImages];});
          if(indexImages<=30){
            centerBox.select('.bom').attr("xlink:href",function(d){return imagesBom[indexImages];})
            .style("opacity",1.0);
            centerBox.select('.Xspeed').style("opacity",1);
          }else{
            centerBox.select('.bom').style("opacity",0);
            centerBox.select('.Xspeed').style("opacity",0);
          }
        }else{
          centerBox.select('.bao').attr("xlink:href",function(d){return imagesBao2[indexImages];});
          centerBox.select('.bom').style("opacity",0);
          centerBox.select('.Xspeed').style("opacity",0);
        }
        //新数据赋值到页面
        if(evYellow==2){
          //console.log(orBagNew)
          svg.select(".titleBottom").text(orBagNew);
          svg.select(".data1").text(beforeBagNew);
          svg.select(".data4").text(afterBagNew);
          svg.select(".data2").text(needBagNew);
          svg.select(".data3").text(ranksNew);
          svg.select(".Xspeed").text('X'+mpCount);
          svg.select(".subheadBottom").text(SMPCount);
          window.parent.changeNum2(fujicanshu);
        }
      })
    }
    //绘制右侧圆内容
    function drawMain2(box){
      box.append('image')
        .attr('class', 'CircleBbg')
        .attr('width', radii.ballOrbit*2)
        .attr('height', '130')
        .attr("transform", "translate(" + -(radii.ballOrbit) + ","+ -68 +")")
        .attr("xlink:href",imgUrl+"showbom/CircleBbg.png");
      box.append('g')
        .attr("class", "textbox")
        .attr("transform", "translate(" + 0 + ","+ -radii.ballOrbit +")")
      var textBox = box.select(".textbox");
      textBox.append('text')
            .attr('class', 'text1')
            .attr("font-size", 12)
            .attr("fill","#FFF")
            .attr('font-style', 'normal')
            .attr('text-anchor', 'middle')
            .attr("y",20)
            .text('<@spring.messageText "buythen.text5023" "前方排队包数"/>');
      textBox.append('text')
            .attr('class', 'data1')
            .attr("font-size", 12)
            .attr("fill","#FFF")
            .attr('font-style', 'normal')
            .attr('text-anchor', 'middle')
            .attr("y",37)
            .text(beforeBag);
      textBox.append('text')
            .attr('class', 'username')
            .attr("font-size", 14)
            .attr("fill","#749ACE")
            .attr('font-style', 'normal')
            .attr('text-anchor', 'middle')
            .attr("y",65)
            .text(username);
      textBox.append('text')
            .attr('class', 'text2')
            .attr("font-size", 14)
            .attr("fill","#749ACE")
            .attr('font-style', 'normal')
            .attr('text-anchor', 'middle')
            .attr("x",-radii.ballOrbit/2)
            .attr("y",90)
            .text('<@spring.messageText "buythen.text5024" "购买数量"/>');
      textBox.append('text')
            .attr('class', 'data2')
            .attr("font-size", 14)
            .attr("fill","#749ACE")
            .attr('font-style', 'normal')
            .attr('text-anchor', 'middle')
            .attr("x",-radii.ballOrbit/2)
            .attr("y",110)
            .text(needBag);
      textBox.append('text')
            .attr('class', 'text3')
            .attr("font-size", 14)
            .attr("fill","#749ACE")
            .attr('font-style', 'normal')
            .attr('text-anchor', 'middle')
            .attr("x",radii.ballOrbit/2)
            .attr("y",90)
            .text('<@spring.messageText "buythen.text5025" "排队位置"/>');
      textBox.append('text')
            .attr('class', 'data3')
            .attr("font-size", 14)
            .attr("fill","#749ACE")
            .attr('font-style', 'normal')
            .attr('text-anchor', 'middle')
            .attr("x",radii.ballOrbit/2)
            .attr("y",110)
            .text(Ranks);
      textBox.append('text')
            .attr('class', 'text4')
            .attr("font-size", 12)
            .attr("fill","#FFF")
            .attr('font-style', 'normal')
            .attr('text-anchor', 'middle')
            .attr("y",(radii.ballOrbit*2-25))
            .text('<@spring.messageText "buythen.text5026" "后方增加包数"/>');
      textBox.append('text')
            .attr('class', 'data4')
            .attr("font-size", 12)
            .attr("fill","#FFF")
            .attr('font-style', 'normal')
            .attr('text-anchor', 'middle')
            .attr("y",(radii.ballOrbit*2-10))
            .text(afterBag);
    }
    loadImg()
  }
});
</script>
</body>
