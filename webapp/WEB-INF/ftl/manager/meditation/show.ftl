<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <title>冥想数据</title>
</head>
<body>
<div class="main-content">

    <div id="main" style="min-width:700px;height:400px"></div>

</div>
<!-- ECharts单文件引入 -->
<script src="http://echarts.baidu.com/build/dist/echarts.js"></script>
<script type="text/javascript">
    // 路径配置
    require.config({
        paths: {
            echarts: 'http://echarts.baidu.com/build/dist'
        }
    });

    // 使用
    require(
            [
                'echarts',
                'echarts/chart/line'
            ],
            function (ec) {
                // 基于准备好的dom，初始化echarts图表
                var myChart = ec.init(document.getElementById('main'));

                option = {
                    title: {
                        text: '冥想数据',
                        subtext: 'uid=${gm.uid},meditationID=${gm.id}'
                    },
                    tooltip: {
                        trigger: 'item',
                        formatter: function (params) {
                            var date = new Date(params.value[0]);
                            data = date.getFullYear() + '-'
                                    + (date.getMonth() + 1) + '-'
                                    + date.getDate() + ' '
                                    + date.getHours() + ':'
                                    + date.getMinutes();
                            return data + '<br/>'
                                    + params.value[1] + ', '
                                    + params.value[2];
                        }
                    },
                    toolbox: {
                        show: true,
                        feature: {
                            mark: {show: true},
                            dataView: {show: true, readOnly: false},
                            restore: {show: true},
                            saveAsImage: {show: true}
                        }
                    },
                    dataZoom: {
                        show: true,
                        start: 70
                    },
                    legend: {
                        data: ['series1']
                    },
                    grid: {
                        y2: 80
                    },
                    xAxis: [
                        {
                            type: 'time',
                            splitNumber: 10
                        }
                    ],
                    yAxis: [
                        {
                            type: 'value'
                        }
                    ],
                    series: [
                        {
                            name: 'series1',
                            type: 'line',
                            showAllSymbol: true,
                            symbolSize: function (value) {
                                return Math.round(value[2] / 10) + 2;
                            },
                            data: (function () {
                                var d = [];
                                var info = ${data};
                                for (var i in info) {
                                    d.push([
                                        new Date(info[i].ts),
                                        info[i].value,
                                            0
                                    ]);
                                }
                                return d;
                            })()
                        }
                    ]
                };


                // 为echarts对象加载数据
                myChart.setOption(option);
            }
    );
</script>
</body>