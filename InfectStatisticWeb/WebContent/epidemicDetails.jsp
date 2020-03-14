<%@ page pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("全国数据") == null) {
		request.getRequestDispatcher("PrepareServlet").forward(request, response);
	}
%>
<%@include file="include/header.jsp"%>
<%@include file="include/navigator.jsp"%>
<%@include file="include/detailsJS.jsp"%>
<%
	String provinceName = request.getParameter("provinceName");
%>
<title>疫情详情--<%=provinceName%></title>
</head>

<body>
	<div id="main">
		<div id="navitagorDiv">
			<nav>
				<a href="epidemicCase.jsp">疫情动态</a> <a href="admin_category_list">患者流动</a>
				<a href="userServlet">图表定制</a> <a href="proventGuide.jsp">预防指南</a>
			</nav>
		</div>
		<div class="clear"></div>
		<div id="situationDiv">
			<table>
				<tr>
					<th>现有确诊</th>
					<th>现有疑似</th>
					<th>累计治愈</th>
					<th>累计死亡</th>
				</tr>
				<tr>
					<%
						//provincesMap在navigator.jsp中声明
					%>
					<td class="infect"><%=provincesMap.get(provinceName).getInfectNum()%></td>
					<td class="suspected"><%=provincesMap.get(provinceName).getSuspectedNum()%></td>
					<td class="cure"><%=provincesMap.get(provinceName).getCureNum()%></td>
					<td class="died"><%=provincesMap.get(provinceName).getDiedNum()%></td>
				</tr>
			</table>
		</div>
		<div id="currentTime">
			<table>
				<tr>
					<td><a href=""><span
							class="glyphicon glyphicon-chevron-left"></span></a></td>
					<td id="currentMonth"><%=currentMonth%></td>
					<td><a href=""><span
							class="glyphicon glyphicon-chevron-right"></span></a></td>
				</tr>
			</table>
		</div>
		<div id="calander"></div>
		<script>
			initcalander(dateList, currentMonth, currentDay);
		</script>
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
			initTotalCureAndDied(currentDay);
		</script>
		<div class="thirdChoiceDiv">
			<table>
				<tr id="thirdChoiceTr">
					<th class="selected">新增<br />确诊趋势
					</th>
					<th class="unselected">新增<br />疑似趋势
					</th>
					<th class="unselected">累计<br />治愈/死亡
					</th>
				</tr>
			</table>
		</div>
		<script>
			initDiagram();
		</script>
		<%@include file="include/footer.jsp"%>
	</div>
</body>
</html>