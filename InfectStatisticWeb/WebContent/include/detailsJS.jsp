<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="edu.fzu.wah.pojo.ProvinceInfo"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<% 
	String [][] tenDayDatas = (String[][])request.getSession().getAttribute("十天数据");
%>
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
						data : [
							<% for(int i = 0; i < 10; i++){%>
								<%= tenDayDatas[0][i] + ","%>
							<%
								}
							%>
						],
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
						data : [ <% for(int i = 0; i < 10; i++){%>
						<%= tenDayDatas[1][i] + ","%>
						<%
							}
						%> ],
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
				max : 100, // 设置y轴刻度的最大值
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
						data : [ 
							<% for(int i = 0; i < 10; i++){%>
							<%= tenDayDatas[3][i] + ","%>
							<%
								}
							%>
						 ],
						type : 'line',
						// 设置小圆点消失
						// 注意：设置symbol: 'none'以后，拐点不存在了，设置拐点上显示数值无效
						symbol : 'none',
						// 设置折线弧度，取值：0-1之间
						smooth : 0.5,
					},
					{
						name : '累计死亡',
						data : [ <% for(int i = 0; i < 10; i++){%>
						<%= tenDayDatas[2][i] + ","%>
						<%
							}
						%> ],
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
	function initCalanderDetail(dateList, currentMonth, currentDay,
			provinceName) {
		var calander = echarts.init(document.getElementById("calander"));

		var heatmapData = [];
		var lunarData = [];
		for (var i = 0; i < dateList.length; i++) {
			heatmapData.push([ dateList[i][0], Math.random() * 300 ]);
			lunarData.push({
				value : [ dateList[i][0], 1, dateList[i][1], dateList[i][2] ],
				symbol : 'rect', // 核心1，这边长方形来填充
				itemStyle : {
					color : '#81D0F1' // 填充色颜色
				}
			});
		}
		var option = {
			visualMap : {
				show : false,
				min : 0,
				max : 300,
				calculable : true,
				seriesIndex : [ 2 ],
				orient : 'horizontal',
				left : 'center',
				bottom : 0,
				inRange : {
					color : [ '#fff', '#fff' ]
				}
			},
			calendar : [ {
				left : 'center',
				top : 'middle',
				cellSize : [ '80', '40' ], // 设置日历格的大小，可支持设置不同高宽
				yearLabel : {
					show : false
				}, // 显示年度
				orient : 'vertical', // 
				dayLabel : {
					firstDay : 1, // 从1号开始
					margin : 0, // 星期标签与轴线之间的距离
					padding : [ 15, 22, 15, 22 ],
					backgroundColor : '#FAFAFA', // 可以是直接的颜色值，例如：'#123234', 'red', rgba(0,23,11,0.3)'
					color : '#85807C',
					nameMap : [ '星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六' ]
				// cn或者en，也可以是数组
				},
				monthLabel : {
					show : false, // 显示月度
					margin : 100
				// 月份和y轴的间距
				},
				range : currentMonth, // 当前日历显示的月份
				itemStyle : {
					borderColor : '#F0F0F0'
				},
				splitLine : {
					show : false
				}
			} ],

			series : [ {
				type : 'scatter',
				coordinateSystem : 'calendar',
				symbolSize : function(param, e, m) { // 核心2，把需要高亮的日期，宽度高度设置成和单元格宽度高度一样
					if (e.value[0] == currentDay) {
						return [ 80, 40 ]
					} else {
						return 1
					}
				},
				label : {
					normal : {
						show : true,
						formatter : function(params) {
							var d = echarts.number.parseDate(params.value[0]);
							return '\n' + d.getDate() + '\n';
						},
						textStyle : {
							color : '#000'
						}
					}
				},
				data : lunarData
			}, {
				type : 'scatter',
				coordinateSystem : 'calendar',
				symbolSize : 1,
				label : {
					normal : {
						show : true,
						formatter : function(params) {
							return '\n\n\n' + (params.value[3] || '');
						},
						textStyle : {
							fontSize : 14,
							fontWeight : 600,
							color : '#a00'
						}
					}
				},
				data : lunarData
			}, {
				type : 'heatmap',
				coordinateSystem : 'calendar',
				data : heatmapData
			} ]
		};

		calander.on('click', function(params) {
			currentDay = params.value[0];
			calander.setOption(option);
			window.location.href = "PrepareServlet?currentDay=" + currentDay + "&currentMonth=" + currentMonth + "&provinceName=" + provinceName;
			// 这边写自己的业务逻辑，例如当天日期的日程安排

		});
		calander.setOption(option);
	}
</script>