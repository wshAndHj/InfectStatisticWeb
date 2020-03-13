<%@ page language="java"
	pageEncoding="UTF-8"%>

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
	</script>
		<script type="text/javascript">
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
	</script>