var dom = document.getElementById("graph_container");
var myChart = echarts.init(dom);
var app = {};
option = null;
var xAxisData = [];
var data1 = [];
var data2 = [];
for (var i = 1; i < 32; i++) {
    xAxisData.push(i + '号' );
    data1.push((Math.sin(i / 5) * (i / 5 -10) + i / 6) * 5 + 100);
    data2.push((Math.cos(i / 5) * (i / 5 -10) + i / 6) * 5 + 100);
}

option = {
    title: {
        text: '本月概况'
    },
    legend: {
        data: ['追缴', '涉税'],
        align: 'left'
    },
    toolbox: {
        // y: 'bottom',
        feature: {
            magicType: {
                type: ['stack', 'tiled']
            },
            dataView: {},
            saveAsImage: {
                pixelRatio: 2
            }
        }
    },
    tooltip: {},
    xAxis: {
        data: xAxisData,
        silent: false,
        splitLine: {
            show: false
        }
    },
    yAxis: {
    },
    series: [{
        name: '追缴',
        type: 'bar',
        data: data1,
        animationDelay: function (idx) {
            return idx * 10;
        }
    }, {
        name: '涉税',
        type: 'bar',
        data: data2,
        animationDelay: function (idx) {
            return idx * 10 + 100;
        }
    }],
    animationEasing: 'elasticOut',
    animationDelayUpdate: function (idx) {
        return idx * 5;
    }
};;
if (option && typeof option === "object") {
    myChart.setOption(option, true);
}

/* ------------------------------------------------------------f分类*/
var dom = document.getElementById("pie_container");
var myChart = echarts.init(dom);
var app = {};
option = null;
app.title = '环形图';

option = {
    title: {
        text: '数据分类'
    },
    tooltip: {
        trigger: 'item',
        formatter: "{a} <br/>{b}: {c} ({d}%)"
    },
    legend: {
        orient: 'vertical',
        x: 'right',
        data:['土地交易', '国家政策','其他数据','税务法规','新闻公告']
    },
    series: [
        {
            name:'数据类型',
            type:'pie',
            radius: ['50%', '70%'],
            avoidLabelOverlap: false,
            label: {
                normal: {
                    show: false,
                    position: 'center'
                },
                emphasis: {
                    show: true,
                    textStyle: {
                        fontSize: '30',
                        fontWeight: 'bold'
                    }
                }
            },
            labelLine: {
                normal: {
                    show: false
                }
            },
            data:[
                {value:335, name:'土地交易'},
                {value:310, name:'国家政策'},
                {value:234, name:'其他数据'},
                {value:135, name:'税务法规'},
                {value:1548, name:'新闻公告'}
            ]
        }
    ]
};
;
if (option && typeof option === "object") {
    myChart.setOption(option, true);
}

/*失信名单*/
var dom = document.getElementById("promise_container");
var myChart = echarts.init(dom);
var app = {};
option = null;
app.title = '坐标轴刻度与标签对齐';

option = {
     title: {
        text: '税务危楼'
    },
    color: ['#61a0a8'],
    tooltip : {
        trigger: 'axis',
        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
        }
    },
    grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
    },
    xAxis : [
        {
            type : 'category',
            data : ['豪大大鸡排', '深计手套', '琳儿女装', '凡仔汉堡', '卫士食品', '小米', '某单位', '火菊锅', '摇摇欲坠'],
            axisTick: {
                alignWithLabel: true
            }
        }
    ],
    yAxis : [
        {
            type : 'value'
        }
    ],
    series : [
        {
            name:'避税指数',
            type:'bar',
            barWidth: '60%',
            data:[100, 95, 95, 95, 90, 85, 85, 75, 70]
        }
    ]
};
;
if (option && typeof option === "object") {
    myChart.setOption(option, true);
}