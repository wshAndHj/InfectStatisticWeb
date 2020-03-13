<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="edu.fzu.wah.pojo.ProvinceInfo"%>
<%@ page language="java" pageEncoding="UTF-8"%>

<%
	HashMap<String, ProvinceInfo> provincesMap = (HashMap<String, ProvinceInfo>) session.getAttribute("全国数据");
%>

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
					max : 1000,
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
					<%="data : ["%>
					<%//System.out.println("省份：" + provincesMap.keySet().size());
			List<String> list = new ArrayList<String>(provincesMap.keySet());
			for (String name : list) {%>
					<%="{name:'" + name + "',value:" + provincesMap.get(name).getInfectNum() + "},"%>
					<%}%>
					<%="]"%>
				}]
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
					max : 2000,
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
					<%="data : ["%>
					<%//System.out.println("省份：" + provincesMap.keySet().size());
			list = new ArrayList<String>(provincesMap.keySet());
			int cumulateNum;
			for (String name : list) {
				cumulateNum = provincesMap.get(name).getInfectNum() + provincesMap.get(name).getDiedNum()
						+ provincesMap.get(name).getCureNum();%>
					<%="{name:'" + name + "',value:" + cumulateNum + "},"%>
					<%}%>
					<%="]"%>
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