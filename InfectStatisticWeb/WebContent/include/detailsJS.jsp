<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="edu.fzu.wah.pojo.ProvinceInfo"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<script type="text/javascript">
	function getLastTenDays(currentDay) {
		var temDay = new Date(currentDay);
		var LastTenDays = new Array();
		for (var i = 0; i < 10; i++) {
			LastTenDays[i] = temDay.getFullYear() + "-"
					+ (temDay.getMonth() + 1) + "-" + temDay.getDate();
			temDay.setTime(temDay.getTime() - 24 * 60 * 60 * 1000);
		}
		return LastTenDays;
	}
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
	function initTotalCureAndDied(currentDay) {
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
	function initDiagram() {
		var ths = document.getElementById("thirdChoiceTr").children;
		var diagram = new Array();
		diagram[0] = document.getElementById("diagramNewInfect");
		diagram[1] = document.getElementById("diagramNewSuspected");
		diagram[2] = document.getElementById("diagramTotalCureAndDied");
		check = 0;
		for (var i = 0; i < ths.length; i++) {
			ths[i].index = i;
			ths[i].onclick = function() {
				if (check != this.index) {
					ths[check].className = 'unselected';
					diagram[check].className = 'hidden';
					check = this.index;
					ths[check].className = 'selected';
					diagram[check].className = 'show';
				}
			};
		}
	}
</script>