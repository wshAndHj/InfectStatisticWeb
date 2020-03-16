<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="edu.fzu.wah.pojo.ProvinceInfo"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<script type="text/javascript">
	function initDiagramNewInfect(currentDay) {
		var LastTenDays = getLastTenDays(currentDay);
		var myChart = echarts.init(document.getElementById('diagramNewInfect'));
		var option = {
			backgroundColor : '#FFF0F5',
			title : {
				text : '新增确诊趋势',
				x : 'center'
			},
			legend : {
				// orient 设置布局方式，默认水平布局，可选值：'horizontal'（水平） ¦ 'vertical'（垂直）
				orient : 'horizontal',
				// x 设置水平安放位置，默认全图居中，可选值：'center' ¦ 'left' ¦ 'right' ¦ {number}（x坐标，单位px）
				x : 'left',
				// y 设置垂直安放位置，默认全图顶端，可选值：'top' ¦ 'bottom' ¦ 'center' ¦ {number}（y坐标，单位px）
				y : 'top',
				data : [ '新增确诊' ]
			},
			//  图表距边框的距离,可选值：'百分比'¦ {number}（单位px）
			grid : {
				top : '16%', // 等价于 y: '16%'
				left : '3%',
				right : '8%',
				bottom : '3%',
				containLabel : true
			},
			// 提示框
			tooltip : {
				trigger : 'axis'
			},
			//工具框，可以选择
			toolbox : {
				feature : {
					saveAsImage : {}
				//下载工具
				}
			},
			xAxis : {
				name : '日期',
				type : 'category',
				axisLine : {
					lineStyle : {
						// 设置x轴颜色
						color : '#912CEE'
					}
				},
				// 设置X轴数据旋转倾斜
				axisLabel : {
					rotate : 30, // 旋转角度
					interval : 0
				//设置X轴数据间隔几个显示一个，为0表示都显示
				},
				// boundaryGap值为false的时候，折线第一个点在y轴上
				boundaryGap : false,
				data : [ LastTenDays[9], LastTenDays[8], LastTenDays[7],
						LastTenDays[6], LastTenDays[5], LastTenDays[4],
						LastTenDays[3], LastTenDays[2], LastTenDays[1],
						LastTenDays[0] ]
			},
			yAxis : {
				name : '单位：例',
				type : 'value',
				min : 0, // 设置y轴刻度的最小值
				max : 1800, // 设置y轴刻度的最大值
				splitNumber : 9, // 设置y轴刻度间隔个数
				axisLine : {
					lineStyle : {
						// 设置y轴颜色
						color : '#87CEFA'
					}
				},
			},
			series : [
					{
						name : '新增确诊',
						data : [ 820, 932, 301, 1434, 1290, 1330, 1120, 1320,
								1020, 320 ],
						type : 'line',
						// 设置小圆点消失
						// 注意：设置symbol: 'none'以后，拐点不存在了，设置拐点上显示数值无效
						symbol : 'none',
						// 设置折线弧度，取值：0-1之间
						smooth : 0.5,
					}, ],
			color : [ '#00EE00' ]
		};
		if (option && typeof option === "object") {
			myChart.setOption(option, true);
		}
	}
	function initDiagramNewSuspected(currentDay) {
		var LastTenDays = getLastTenDays(currentDay);
		var myChart = echarts.init(document
				.getElementById('diagramNewSuspected'));
		var option = {
			backgroundColor : '#FFF0F5',
			title : {
				text : '新增疑似趋势',
				x : 'center'
			},
			legend : {
				// orient 设置布局方式，默认水平布局，可选值：'horizontal'（水平） ¦ 'vertical'（垂直）
				orient : 'horizontal',
				// x 设置水平安放位置，默认全图居中，可选值：'center' ¦ 'left' ¦ 'right' ¦ {number}（x坐标，单位px）
				x : 'left',
				// y 设置垂直安放位置，默认全图顶端，可选值：'top' ¦ 'bottom' ¦ 'center' ¦ {number}（y坐标，单位px）
				y : 'top',
				data : [ '新增疑似' ]
			},
			//  图表距边框的距离,可选值：'百分比'¦ {number}（单位px）
			grid : {
				top : '16%', // 等价于 y: '16%'
				left : '3%',
				right : '8%',
				bottom : '3%',
				containLabel : true
			},
			// 提示框
			tooltip : {
				trigger : 'axis'
			},
			//工具框，可以选择
			toolbox : {
				feature : {
					saveAsImage : {}
				//下载工具
				}
			},
			xAxis : {
				name : '日期',
				type : 'category',
				axisLine : {
					lineStyle : {
						// 设置x轴颜色
						color : '#912CEE'
					}
				},
				// 设置X轴数据旋转倾斜
				axisLabel : {
					rotate : 30, // 旋转角度
					interval : 0
				//设置X轴数据间隔几个显示一个，为0表示都显示
				},
				// boundaryGap值为false的时候，折线第一个点在y轴上
				boundaryGap : false,
				data : [ LastTenDays[9], LastTenDays[8], LastTenDays[7],
						LastTenDays[6], LastTenDays[5], LastTenDays[4],
						LastTenDays[3], LastTenDays[2], LastTenDays[1],
						LastTenDays[0] ]
			},
			yAxis : {
				name : '单位：例',
				type : 'value',
				min : 0, // 设置y轴刻度的最小值
				max : 1800, // 设置y轴刻度的最大值
				splitNumber : 9, // 设置y轴刻度间隔个数
				axisLine : {
					lineStyle : {
						// 设置y轴颜色
						color : '#87CEFA'
					}
				},
			},
			series : [
					{
						name : '新增疑似',
						data : [ 820, 932, 301, 1434, 1290, 1330, 1120, 1320,
								1020, 320 ],
						type : 'line',
						// 设置小圆点消失
						// 注意：设置symbol: 'none'以后，拐点不存在了，设置拐点上显示数值无效
						symbol : 'none',
						// 设置折线弧度，取值：0-1之间
						smooth : 0.5,
					}, ],
			color : [ '#00EE00' ]
		};
		if (option && typeof option === "object") {
			myChart.setOption(option, true);
		}
	}
	function initDiagramTotalCureAndDied(currentDay) {
		var LastTenDays = getLastTenDays(currentDay);
		var myChart = echarts.init(document
				.getElementById('diagramTotalCureAndDied'));
		var option = {
			backgroundColor : '#FFF0F5',
			title : {
				text : '累计治愈/死亡趋势',
				x : 'center'
			},
			legend : {
				// orient 设置布局方式，默认水平布局，可选值：'horizontal'（水平） ¦ 'vertical'（垂直）
				orient : 'horizontal',
				// x 设置水平安放位置，默认全图居中，可选值：'center' ¦ 'left' ¦ 'right' ¦ {number}（x坐标，单位px）
				x : 'left',
				// y 设置垂直安放位置，默认全图顶端，可选值：'top' ¦ 'bottom' ¦ 'center' ¦ {number}（y坐标，单位px）
				y : 'top',
				data : [ '累计治愈', '累计死亡' ]
			},
			//  图表距边框的距离,可选值：'百分比'¦ {number}（单位px）
			grid : {
				top : '16%', // 等价于 y: '16%'
				left : '3%',
				right : '8%',
				bottom : '3%',
				containLabel : true
			},
			// 提示框
			tooltip : {
				trigger : 'axis'
			},
			//工具框，可以选择
			toolbox : {
				feature : {
					saveAsImage : {}
				//下载工具
				}
			},
			xAxis : {
				name : '日期',
				type : 'category',
				axisLine : {
					lineStyle : {
						// 设置x轴颜色
						color : '#912CEE'
					}
				},
				// 设置X轴数据旋转倾斜
				axisLabel : {
					rotate : 30, // 旋转角度
					interval : 0
				//设置X轴数据间隔几个显示一个，为0表示都显示
				},
				// boundaryGap值为false的时候，折线第一个点在y轴上
				boundaryGap : false,
				data : [ LastTenDays[9], LastTenDays[8], LastTenDays[7],
						LastTenDays[6], LastTenDays[5], LastTenDays[4],
						LastTenDays[3], LastTenDays[2], LastTenDays[1],
						LastTenDays[0] ]
			},
			yAxis : {
				name : '单位：例',
				type : 'value',
				min : 0, // 设置y轴刻度的最小值
				max : 1800, // 设置y轴刻度的最大值
				splitNumber : 9, // 设置y轴刻度间隔个数
				axisLine : {
					lineStyle : {
						// 设置y轴颜色
						color : '#87CEFA'
					}
				},
			},
			series : [
					{
						name : '累计治愈',
						data : [ 820, 932, 301, 1434, 1290, 1330, 1120, 1320,
								1020, 320 ],
						type : 'line',
						// 设置小圆点消失
						// 注意：设置symbol: 'none'以后，拐点不存在了，设置拐点上显示数值无效
						symbol : 'none',
						// 设置折线弧度，取值：0-1之间
						smooth : 0.5,
					},
					{
						name : '累计死亡',
						data : [ 1020, 902, 801, 534, 790, 1230, 720, 920, 320,
								120 ],
						type : 'line',
						// 设置小圆点消失
						// 注意：设置symbol: 'none'以后，拐点不存在了，设置拐点上显示数值无效
						symbol : 'none',
						// 设置折线弧度，取值：0-1之间
						smooth : 0.5,
					} ],
			color : [ '#00EE00', '#FF9F7F' ]
		};
		if (option && typeof option === "object") {
			myChart.setOption(option, true);
		}
	}
</script>
<script type="text/javascript">
	// 以下为柱状图
	function initHistogramNewInfect(currentDay) {
		var LastTenDays = getLastTenDays(currentDay);
		var myChart = echarts.init(document
				.getElementById('histogramNewInfect'), 'light');

		// 指定图表的配置项和数据
		var option = {
			title : {
				text : '新增确诊趋势'
			},
			toolbox : {
				feature : {
					saveAsImage : {}
				//下载工具
				}
			},
			legend : {
				data : [ '新增确诊' ]
			},
			xAxis : {
				axisLabel : {
					rotate : 30, // 旋转角度
					interval : 0
				//设置X轴数据间隔几个显示一个，为0表示都显示
				},
				data : [ LastTenDays[9], LastTenDays[8], LastTenDays[7],
						LastTenDays[6], LastTenDays[5], LastTenDays[4],
						LastTenDays[3], LastTenDays[2], LastTenDays[1],
						LastTenDays[0] ]
			},
			yAxis : {},
			series : [ {
				name : '新增确诊',
				type : 'bar',
				data : [ 820, 932, 301, 1434, 1290, 1330, 1120, 1320, 1020, 320 ]
			} ]
		};

		// 使用刚指定的配置项和数据显示图表。
		myChart.setOption(option);
	}
	function initHistogramNewSuspected(currentDay) {
		var LastTenDays = getLastTenDays(currentDay);
		var myChart = echarts.init(document
				.getElementById('histogramNewSuspected'), 'light');

		// 指定图表的配置项和数据
		var option = {
			title : {
				text : '新增疑似趋势'
			},
			toolbox : {
				feature : {
					saveAsImage : {}
				//下载工具
				}
			},
			legend : {
				data : [ '新增疑似' ]
			},
			xAxis : {
				axisLabel : {
					rotate : 30, // 旋转角度
					interval : 0
				//设置X轴数据间隔几个显示一个，为0表示都显示
				},
				data : [ LastTenDays[9], LastTenDays[8], LastTenDays[7],
						LastTenDays[6], LastTenDays[5], LastTenDays[4],
						LastTenDays[3], LastTenDays[2], LastTenDays[1],
						LastTenDays[0] ]
			},
			yAxis : {},
			series : [ {
				name : '新增疑似',
				type : 'bar',
				data : [ 820, 932, 301, 1434, 1290, 1330, 1120, 1320, 1020, 320 ]
			} ]
		};

		// 使用刚指定的配置项和数据显示图表。
		myChart.setOption(option);
	}
	function initHistogramTotalCureAndDied(currentDay) {
		var LastTenDays = getLastTenDays(currentDay);
		var myChart = echarts.init(document
				.getElementById('histogramTotalCureAndDied'), 'light');

		// 指定图表的配置项和数据
		var option = {
			title : {
				text : '累计治愈/死亡趋势'
			},
			toolbox : {
				feature : {
					saveAsImage : {}
				//下载工具
				}
			},
			legend : {
				data : [ '累计治愈' ,'累计死亡']
			},
			xAxis : {
				axisLabel : {
					rotate : 30, // 旋转角度
					interval : 0
				//设置X轴数据间隔几个显示一个，为0表示都显示
				},
				data : [ LastTenDays[9], LastTenDays[8], LastTenDays[7],
						LastTenDays[6], LastTenDays[5], LastTenDays[4],
						LastTenDays[3], LastTenDays[2], LastTenDays[1],
						LastTenDays[0] ]
			},
			yAxis : {},
			series : [ {
				name : '累计治愈',
				type : 'bar',
				data : [ 820, 932, 301, 1434, 1290, 1330, 1120, 1320, 1020, 320 ]
			},{
				name : '累计死亡',
				type : 'bar',
				data : [ 1020, 902, 801, 534, 790, 1230, 720, 920, 320,
					120 ]
			} ],
			color : [ '#00EE00', '#FF9F7F' ]
		};

		// 使用刚指定的配置项和数据显示图表。
		myChart.setOption(option);
	}
	function initButtons() {
		var trend = document.getElementById("trendSelects");
		var type = document.getElementById("typeSelects");
		var button = document.getElementById("produce");
		var diagram = new Array();
		diagram[0] = document.getElementById("diagramNewInfect");
		diagram[1] = document.getElementById("diagramNewSuspected");
		diagram[2] = document.getElementById("diagramTotalCureAndDied");
		var checkDiagram = 0;
		var histogram = new Array();
		histogram[0] = document.getElementById("histogramNewInfect");
		histogram[1] = document.getElementById("histogramNewSuspected");
		histogram[2] = document.getElementById("histogramTotalCureAndDied");
		var checkHistogram = 0;
		
		
		
		button.onclick = function() {
			if (type.value == 0) {
				diagram[checkDiagram].className = 'hidden';
				histogram[checkHistogram].className = 'hidden';
				checkDiagram = trend.value;
				diagram[checkDiagram].className = 'show';
				//alert(type.value+"----"+trend.value+"   check="+checkDiagram);
			} else if (type.value == 1) {
				histogram[checkHistogram].className = 'hidden';
				diagram[checkDiagram].className = 'hidden';
				checkHistogram = trend.value;
				histogram[checkHistogram].className = 'show';
				//alert(type.value+"----"+trend.value+"   check="+checkDiagram);
			}
		};
	}
</script>