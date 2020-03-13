<%@ page pageEncoding="UTF-8"%>
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
					<td class="infect">现有确诊</td>
					<td class="suspected">现有疑似</td>
					<td class="cure">累计治愈</td>
					<td class="died">累计死亡</td>
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
		<%@include file="include/footer.jsp"%>
	</div>
</body>
</html>