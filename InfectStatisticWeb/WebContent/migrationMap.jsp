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
<title>患者流动</title>
</head>
<body>
	<div id="main">
		<div id="navitagorDiv">
			<nav>
				<a href="epidemicCase.jsp">疫情动态</a> <a href="admin_category_list">患者流动</a>
				<a href="userServlet">图表定制</a> <a href="admin_order_list">预防指南</a>
			</nav>
		</div>
		<div class="clear"></div>
		<div class="doubleChoiceDiv">
			<table>
				<tr id="doubleChoiceTr">
					<th class="selected">现有确诊</th>
					<th class="unselected">累计确诊</th>
				</tr>
			</table>
		</div>
		<div class="migrationIn">
			<table class="marginTable">
				<tr>
					<th class="column1">排名</th>
					<th class="column2">省份名称</th>
					<th class="column3">迁入比例</th>
				</tr>
				<%
					session.setAttribute("nowProvince", "湖北");
					String name = (String) session.getAttribute("nowProvince");
				%>
				<%
					for (int i = 0; i < 10; i++) {
						String rowType = "column1";
						if(i == 0){
							rowType = " row1";
						}else if(i == 1){
							rowType = " row2";
						}else if(i == 2){
							rowType = " row3";
						}
				%>
				<tr>
					<td class=<%=rowType %>><%=i+1%></td>
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
		<div class="migrationOut">
			<table class="marginTable">
				<tr>
					<th class="column1">排名</th>
					<th class="column2">省份名称</th>
					<th class="column3">迁出比例</th>
				</tr>
				<%
					session.setAttribute("nowProvince", "湖北");
					name = (String) session.getAttribute("nowProvince");
				%>
				<%
					for (int i = 0; i < 10; i++) {
						String rowType = "column1";
						if(i == 0){
							rowType = " row1";
						}else if(i == 1){
							rowType = " row2";
						}else if(i == 2){
							rowType = " row3";
						}
				%>
				<tr>
					<td class=<%=rowType %>><%=i+1%></td>
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
		<%@include file="include/footer.jsp"%>
	</div>
</body>
</html>