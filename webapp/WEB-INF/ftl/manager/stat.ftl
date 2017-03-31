<body>
<div class="main-content">
<#list chartList as c>
    <div id="chart${c_index}" style="min-width:700px;height:400px"></div>
</#list>
</div>

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
            <#list chartList as c>
                // 基于准备好的dom，初始化echarts图表
                var myChart${c_index} = ec.init(document.getElementById('chart${c_index}'));

                option${c_index} = {
                    title: {
                        text: '${c.title}',
                        subtext: '${c.subtitle}'
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
                    legend: {
                        data: ['${c.title}']
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
                            name: '${c.title}',
                            type: 'line',
                            smooth:true,
                            showAllSymbol: true,
                            symbolSize: function (value) {
                                return Math.round(value[2] / 10) + 2;
                            },
                            data: (function () {
                                console.log(${c.data});
                                var d = [];

                                <#list c.data as r>
                                    d.push([
                                        new Date(${r.time}),
                                    ${r.num},
                                            0
                                    ]);
                                </#list>

                                return d;
                            })()
                        }
                    ]
                };


                // 为echarts对象加载数据
                myChart${c_index}.setOption(option${c_index});

            </#list>
            }
    );

</script>
</body>