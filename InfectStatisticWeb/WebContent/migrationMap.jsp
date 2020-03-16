<%@page import="edu.fzu.wah.pojo.ProvinceMigration"%>
<%@page import="java.lang.*"%>
<%@ page pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("全国数据") == null) {
		request.getRequestDispatcher("PrepareServlet").forward(request, response);
	}
%>
<%@include file="include/header.jsp"%>
<%@include file="include/navigator.jsp"%>
<%@include file="include/migrationJS.jsp"%>
<title>患者流动</title>
</head>
<body>
	<%
		String provinceName = (String) request.getParameter("provinceName");
	%>
	<div id="main">
		<div id="navitagorDiv">
			<nav>
				<a href="epidemicCase.jsp">疫情动态</a> <a href="">患者流动</a> <a
					href="userServlet">图表定制</a> <a href="proventGuide.jsp">预防指南</a>
			</nav>
		</div>
		<div class="clear"></div>
		<div class="doubleChoiceDiv">
			<table>
				<tr id="doubleChoiceTr">
					<th class="selected">热门迁入地</th>
					<th class="unselected">热门迁出地</th>
				</tr>
			</table>
		</div>
		<div class="leftTitle"><h3><%=provinceName %></h3></div>
		<div id="migrationIn" class="show">
			<table class="marginTable">
				<tr>
					<th class="column1">排名</th>
					<th class="column2">省份名称</th>
					<th class="column3">迁入比例</th>
				</tr>
				<%
					session.setAttribute("nowProvince", provinceName);
					String name = (String) session.getAttribute("nowProvince");
				%>
				<%
					for (int i = 0; i < 10; i++) {
						String rowType = "column1";
						if (i == 0) {
							rowType = " row1";
						} else if (i == 1) {
							rowType = " row2";
						} else if (i == 2) {
							rowType = " row3";
						}
				%>
				<tr>
					<td class=<%=rowType%>><%=i + 1%></td>
					<td class="column2"><%=provincesMap.get(name).getMigrationInList().get(i).getName()%></td>
					<td class="column3">
						<%
							double rate = provincesMap.get(name).getMigrationInList().get(i).getInRate();
								rate = ((int) (rate * 1000)) / 10.0;
						%> <%=rate + "%"%>
					</td>
				<tr>
					<%
						}
					%>
				
			</table>
		</div>
		<div id="migrationOut" class="hidden">
			<table class="marginTable">
				<tr>
					<th class="column1">排名</th>
					<th class="column2">省份名称</th>
					<th class="column3">迁出比例</th>
				</tr>
				<%
					session.setAttribute("nowProvince", provinceName);
					name = (String) session.getAttribute("nowProvince");
				%>
				<%
					for (int i = 0; i < 10; i++) {
						String rowType = "column1";
						if (i == 0) {
							rowType = " row1";
						} else if (i == 1) {
							rowType = " row2";
						} else if (i == 2) {
							rowType = " row3";
						}
				%>
				<tr>
					<td class=<%=rowType%>><%=i + 1%></td>
					<td class="column2"><%=provincesMap.get(name).getMigrationOutList().get(i).getName()%></td>
					<td class="column3">
						<%
							double rate = provincesMap.get(name).getMigrationOutList().get(i).getOutRate();
								rate = ((int) (rate * 1000)) / 10.0;
						%> <%=rate + "%"%>
					</td>
				<tr>
					<%
						}
					%>
				
			</table>
		</div>
		<div class="leftTitle"><h3><%=provinceName %></h3></div>
		<script type="text/javascript">
			initMigration();
		</script>
		<%@include file="include/footer.jsp"%>
	</div>
</body>
</html>