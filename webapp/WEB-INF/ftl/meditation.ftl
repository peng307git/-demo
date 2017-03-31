<html>
<head>
    <script type="text/javascript" src="http://cdn.hcharts.cn/jquery/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="http://cdn.hcharts.cn/highcharts/highcharts.js"></script>
</head>
<body>
<#list chartList as c>
<div id="chart${c_index}" style="min-width:700px;height:400px"></div>
</#list>

<script>

    $(function () {
        Highcharts.setOptions({global: {useUTC: false}});

    <#list chartList as c>
        $('#chart${c_index}').highcharts({
            chart: {
                type: 'spline'
            },
            title: {
                text: '${c.title}'
            },
            subtitle: {
                text: '${c.subtitle}'
            },
            xAxis: {
                type: 'datetime',
                pointInterval: 24 * 3600,
                dateTimeLabelFormats: { // don't display the dummy year
                    day: '%Y-%m-%d',
                    month: '%e. %b',
                    year: '%b'
                }

            },
            yAxis: {
                title: {
                    text: '${c.yAxisTitle}'
                },
                min: 0
            },
            tooltip: {
                formatter: function () {
                    return '<b>' + this.series.name + '</b><br/>' +
                            Highcharts.dateFormat('%Y-%m-%d', this.x) + ' :' + this.y + ' ${c.tooltipUnit}';
                }
            },

            series: [{
                name: '${c.title}',
                // Define the data points. All series have a dummy year
                // of 1970/71 in order to be compared on the same x axis. Note
                // that in JavaScript, months start at 0 for January, 1 for February etc.
                data: [
                    <#list c.data as r>
                        [${r.time}, ${r.num}],
                    </#list>]
            }]
        });

    </#list>


    });
</script>
</body>
</html>