<%@ page language="java" pageEncoding="UTF-8"%>

<script type="text/javascript">
	function initNowInfect() {
		var myChart = echarts.init(document.getElementById('nowInfect'));
		var app = {};
		option = null;
		option = {
			title : {
				text : '现有确诊疫情',
				left : 'center'
			},
			tooltip : {
				triggerOn : 'mousemove',
				trigger : 'item',
				formatter : function(params) {
					var str = '地区：' + params.name + '<br/>' + '确诊：'
							+ params.value;
					return str;
				}
			},
			legend : {//选择显示，左上角的
				orient : 'vertical',
				left : 'left',
				data : [ '疫情' ]
			},
			visualMap : {
				min : 0,
				max : 2500,
				left : 'left',
				top : 'bottom',
				text : [ '高', '低' ], // 文本，默认为数值文本
				calculable : true
			},//上色
			toolbox : {
				show : true,
				orient : 'vertical',
				left : 'right',
				top : 'center',
				feature : {
					mark : {
						show : true
					},
					dataView : {
						show : true,
						readOnly : false
					},
					restore : {
						show : true
					},
					saveAsImage : {
						show : true
					}
				}
			},
			series : [ {
				name : '疫情',
				type : 'map',
				mapType : 'china',
				roam : false,
				showLegendSymbol : false,
				markPoint : {
					clickable : true
				},
				label : {
					normal : {
						show : true
					},//正常样式
					emphasis : {
						show : true
					}
				//鼠标事件区块样式
				},
				data : [ {
					name : '北京',
					value : 500
				}, {
					name : '天津',
					value : 500
				}, {
					name : '上海',
					value : Math.round(Math.random() * 1000)
				}, {
					name : '重庆',
					value : Math.round(Math.random() * 1000)
				}, {
					name : '河北',
					value : 500
				}, {
					name : '河南',
					value : Math.round(Math.random() * 1000)
				}, {
					name : '云南',
					value : Math.round(Math.random() * 1000)
				}, {
					name : '辽宁',
					value : Math.round(Math.random() * 1000)
				}, {
					name : '黑龙江',
					value : Math.round(Math.random() * 1000)
				}, {
					name : '湖南',
					value :
<%=1%>
	}, {
					name : '安徽',
					value : Math.round(Math.random() * 1000)
				}, {
					name : '山东',
					value : Math.round(Math.random() * 1000)
				}, {
					name : '新疆',
					value : Math.round(Math.random() * 1000)
				}, {
					name : '江苏',
					value : Math.round(Math.random() * 1000)
				}, {
					name : '浙江',
					value : Math.round(Math.random() * 1000)
				}, {
					name : '江西',
					value : Math.round(Math.random() * 1000)
				}, {
					name : '湖北',
					value : Math.round(Math.random() * 1000)
				}, {
					name : '广西',
					value : Math.round(Math.random() * 1000)
				}, {
					name : '甘肃',
					value : Math.round(Math.random() * 1000)
				}, {
					name : '山西',
					value : Math.round(Math.random() * 1000)
				}, {
					name : '内蒙古',
					value : Math.round(Math.random() * 1000)
				}, {
					name : '陕西',
					value : Math.round(Math.random() * 1000)
				}, {
					name : '吉林',
					value : Math.round(Math.random() * 1000)
				}, {
					name : '福建',
					value : Math.round(Math.random() * 1000)
				}, {
					name : '贵州',
					value : Math.round(Math.random() * 1000)
				}, {
					name : '广东',
					value : Math.round(Math.random() * 1000)
				}, {
					name : '青海',
					value : Math.round(Math.random() * 1000)
				}, {
					name : '西藏',
					value : Math.round(Math.random() * 1000)
				}, {
					name : '四川',
					value : Math.round(Math.random() * 1000)
				}, {
					name : '宁夏',
					value : Math.round(Math.random() * 1000)
				}, {
					name : '海南',
					value : Math.round(Math.random() * 1000)
				}, {
					name : '台湾',
					value : Math.round(Math.random() * 1000)
				}, {
					name : '香港',
					value : Math.round(Math.random() * 1000)
				}, {
					name : '澳门',
					value : Math.round(Math.random() * 1000)
				} ]
			} ]
		};
		if (option && typeof option === "object") {
			myChart.setOption(option, true);
		}
		myChart.on('click', function(params) {
			//alert(params.name);
			window.location.href = "test.jsp?paramsName=" + params.name;
		})
	}
	function initAllInfect() {
		var myChart = echarts.init(document.getElementById('allInfect'));
		var app = {};
		option = null;
		option = {
			title : {
				text : '累计确诊疫情',
				left : 'center'
			},
			tooltip : {
				triggerOn : 'mousemove',
				trigger : 'item',
				formatter : function(params) {
					var str = '地区：' + params.name + '<br/>' + '确诊：'
							+ params.value;
					return str;
				}
			},
			legend : {//选择显示，左上角的
				orient : 'vertical',
				left : 'left',
				data : [ '疫情' ]
			},
			visualMap : {
				min : 0,
				max : 2500,
				left : 'left',
				top : 'bottom',
				text : [ '高', '低' ], // 文本，默认为数值文本
				calculable : true
			},//上色
			toolbox : {
				show : true,
				orient : 'vertical',
				left : 'right',
				top : 'center',
				feature : {
					mark : {
						show : true
					},
					dataView : {
						show : true,
						readOnly : false
					},
					restore : {
						show : true
					},
					saveAsImage : {
						show : true
					}
				}
			},
			series : [ {
				name : '疫情',
				type : 'map',
				mapType : 'china',
				roam : false,
				showLegendSymbol : false,
				markPoint : {
					clickable : true
				},
				label : {
					normal : {
						show : true
					},//正常样式
					emphasis : {
						show : true
					}
				//鼠标事件区块样式
				},
				data : [ {
					name : '北京',
					value : 500
				}, {
					name : '天津',
					value : 500
				}, {
					name : '上海',
					value : Math.round(Math.random() * 1000)
				}, {
					name : '重庆',
					value : Math.round(Math.random() * 1000)
				}, {
					name : '河北',
					value : 500
				}, {
					name : '河南',
					value : Math.round(Math.random() * 1000)
				}, {
					name : '云南',
					value : Math.round(Math.random() * 1000)
				}, {
					name : '辽宁',
					value : Math.round(Math.random() * 1000)
				}, {
					name : '黑龙江',
					value : Math.round(Math.random() * 1000)
				}, {
					name : '湖南',
					value :
<%=1%>
	}, {
					name : '安徽',
					value : Math.round(Math.random() * 1000)
				}, {
					name : '山东',
					value : Math.round(Math.random() * 1000)
				}, {
					name : '新疆',
					value : Math.round(Math.random() * 1000)
				}, {
					name : '江苏',
					value : Math.round(Math.random() * 1000)
				}, {
					name : '浙江',
					value : Math.round(Math.random() * 1000)
				}, {
					name : '江西',
					value : Math.round(Math.random() * 1000)
				}, {
					name : '湖北',
					value : Math.round(Math.random() * 1000)
				}, {
					name : '广西',
					value : Math.round(Math.random() * 1000)
				}, {
					name : '甘肃',
					value : Math.round(Math.random() * 1000)
				}, {
					name : '山西',
					value : Math.round(Math.random() * 1000)
				}, {
					name : '内蒙古',
					value : Math.round(Math.random() * 1000)
				}, {
					name : '陕西',
					value : Math.round(Math.random() * 1000)
				}, {
					name : '吉林',
					value : Math.round(Math.random() * 1000)
				}, {
					name : '福建',
					value : Math.round(Math.random() * 1000)
				}, {
					name : '贵州',
					value : Math.round(Math.random() * 1000)
				}, {
					name : '广东',
					value : Math.round(Math.random() * 1000)
				}, {
					name : '青海',
					value : Math.round(Math.random() * 1000)
				}, {
					name : '西藏',
					value : Math.round(Math.random() * 1000)
				}, {
					name : '四川',
					value : Math.round(Math.random() * 1000)
				}, {
					name : '宁夏',
					value : Math.round(Math.random() * 1000)
				}, {
					name : '海南',
					value : Math.round(Math.random() * 1000)
				}, {
					name : '台湾',
					value : Math.round(Math.random() * 1000)
				}, {
					name : '香港',
					value : Math.round(Math.random() * 1000)
				}, {
					name : '澳门',
					value : Math.round(Math.random() * 1000)
				} ]
			} ]
		};
		if (option && typeof option === "object") {
			myChart.setOption(option, true);
		}
		myChart.on('click', function(params) {
			//alert(params.name);
			window.location.href = "test.jsp?paramsName=" + params.name;
		})
	}
	function initcalander(dateList, currentMonth, currentDay) {
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

			series : [
					{
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
									var d = echarts.number
											.parseDate(params.value[0]);
									return '\n'+d.getDate() + '\n';
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
			window.location.href = "test.jsp?paramsName=" + params.value[0];
			// 这边写自己的业务逻辑，例如当天日期的日程安排

		});
		calander.setOption(option);
	}
</script>