<%@ page pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("全国数据") == null) {
		request.getRequestDispatcher("PrepareServlet").forward(request, response);
	}
%>
<%@include file="include/header.jsp"%>
<%@include file="include/navigator.jsp"%>
<%
String provinceName="";
	String[] provinceList = {"安徽", "北京", "重庆", "福建", "甘肃", "广东", "广西", "贵州", "海南", "河北", "河南", "黑龙江", "湖北",
			"湖南", "吉林", "江苏", "江西", "辽宁", "内蒙古", "宁夏", "青海", "山东", "山西", "陕西", "上海", "四川", "天津", "西藏", "新疆",
			"云南", "浙江", "台湾"};
%>
<%@include file="include/orderJS.jsp"%>
<title>图表定制</title>
</head>

<body>
	<div id="main">
		<div id="navitagorDiv">
			<nav>
				<a href="epidemicCase.jsp">疫情动态</a> <a
					href="migrationMap.jsp?provinceName=全国">患者流动</a> <a
					href="chartOrder.jsp">图表定制</a> <a href="proventGuide.jsp">预防指南</a>
			</nav>
		</div>
		<div class="clear"></div>
		<div id="selects">
			<select id="provinceSelects">
				<%
					for (int i = 0; i < provinceList.length; i++) {
						if (provinceName != null && provinceList[i].equals(provinceName)) {
				%><option value=<%=provinceList[i]%> selected="selected"><%=provinceList[i]%></option>
				<%
					} else
				%><option value=<%=provinceList[i]%>><%=provinceList[i]%></option>
				<%
					}
				%>
			</select> <select id="trendSelects">
				<option value="0">新增确诊趋势</option>
				<option value="1">新增疑似趋势</option>
				<option value="2">累计治愈/死亡</option>
			</select> <select id="typeSelects">
				<option value="0">曲线图</option>
				<option value="1">柱状图</option>
			</select>
			<button id="produce">生成</button>
		</div>
		<div id="diagramNewInfect" class="show"></div>
		<script>
			initDiagramNewInfect(currentDay);
		</script>
		<div id="diagramNewSuspected" class="hidden"></div>
		<script>
			initDiagramNewSuspected(currentDay);
		</script>
		<div id="diagramTotalCureAndDied" class="hidden"></div>
		<script>
			initDiagramTotalCureAndDied(currentDay);
		</script>
		<div id="histogramNewInfect" class="hidden"></div>
		<script>
			initHistogramNewInfect(currentDay);
		</script>
		<div id="histogramNewSuspected" class="hidden"></div>
		<script>
			initHistogramNewSuspected(currentDay);
		</script>
		<div id="histogramTotalCureAndDied" class="hidden"></div>
		<script>
			initHistogramTotalCureAndDied(currentDay);
		</script>
		<script type="text/javascript">
			initButtons();
			var provinces = document.getElementById("provinceSelects");
			provinces.onchange = function() {
				alert(provinces.value);
			}
		</script>
		<%@include file="include/footer.jsp"%>
	</div>
</body>
</html>