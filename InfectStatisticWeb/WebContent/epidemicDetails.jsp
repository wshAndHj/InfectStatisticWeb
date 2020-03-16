<%@ page pageEncoding="UTF-8"%>
<%
	String provinceName = (String)request.getParameter("provinceName");
	if (provinceName == null) {
		provinceName = (String)request.getAttribute("provinceName");
	}
	System.out.println("省份" + provinceName);
%>
<%
	String pa = this.getClass().getSimpleName().replaceAll("_", ".");
	session.setAttribute("page", pa);
	String m = (String) request.getAttribute("currentMonth");
	if (m == null) {
%>
<script type="text/javascript">
	//document.write("abc");
	window.location.href = "PrepareServlet?provinceName=" +'<%=provinceName%>';
</script>
<%
	System.out.println("m == null");
	}
	if (session.getAttribute("全国数据") == null) {
		request.getRequestDispatcher("/PrepareServlet").forward(request, response);
	}
%>
<script type="text/javascript">
var provinceName='<%=provinceName%>';
</script>
<%@include file="include/header.jsp"%>
<%@include file="include/navigator.jsp"%>
<%@include file="include/detailsJS.jsp"%>
<title>疫情详情--<%=provinceName%></title>
</head>

<body>
	<div id="main">
		<div id="navitagorDiv">
			<nav>
				<a href="epidemicCase.jsp">疫情动态</a> <a
					href="migrationMap.jsp?provinceName=<%=provinceName%>">患者流动</a> <a
					href="chartOrder.jsp?provinceName=<%=provinceName%>">图表定制</a> <a
					href="proventGuide.jsp">预防指南</a>
			</nav>
		</div>
		<div class="clear"></div>
		<%=(String) session.getAttribute("page")%>
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
					<td><a
						href="<%="PrepareServlet?currentMonth=" + currentMonth + "&ask=last&currentDay=" + currentDay
					+ "&provinceName=" + provinceName%>">
							<span class="glyphicon glyphicon-chevron-left"></span>
					</a></td>
					<%
						request.setAttribute("name", "123");
					%>
					<td id="currentMonth"><%=currentMonth%></td>
					<td><a
						href=<%="PrepareServlet?currentMonth=" + currentMonth + "&ask=next&currentDay=" + currentDay
					+ "&provinceName=" + provinceName%>><span
							class="glyphicon glyphicon-chevron-right"></span></a></span></td>
				</tr>
			</table>
		</div>
		<div id="calander"></div>
		<script>
			initCalanderDetail(dateList, currentMonth, currentDay, provinceName);
		</script>
		<div class="leftTitle">
			<h3><%=provinceName%></h3>
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