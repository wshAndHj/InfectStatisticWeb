<%@ page pageEncoding="UTF-8"%>
<% 
	if(session.getAttribute("全国数据") == null)
	{
		request.getRequestDispatcher("PrepareServlet").forward(request, response);		
	}
%>
<%@include file="include/header.jsp"%>
<%@include file="include/navigator.jsp"%>
<title>疫情动态</title>
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
		<div id="situationDiv">
			<table>
				<tr>
					<th>现有确诊</th>
					<th>现有疑似</th>
					<th>累计治愈</th>
					<th>累计死亡</th>
				</tr>
				<tr>
					<%//provincesMap在navigator.jsp中声明 %>
					<td class="infect"><%=provincesMap.get("全国").getInfectNum() %></td>
					<td class="suspected"><%=provincesMap.get("全国").getSuspectedNum() %></td>
					<td class="cure"><%=provincesMap.get("全国").getCureNum()%></td>
					<td class="died"><%=provincesMap.get("全国").getDiedNum() %></td>
				</tr>
			</table>
		</div>
		<div class="doubleChoiceDiv">
			<table>
				<tr id="doubleChoiceTr">
					<th class="selected">现有确诊</th>
					<th class="unselected">累计确诊</th>
				</tr>
			</table>
		</div>
		<div id="nowInfect"></div>
		<script>
			initNowInfect();
		</script>
		<%@include file="include/footer.jsp"%>
	</div>
</body>
</html>