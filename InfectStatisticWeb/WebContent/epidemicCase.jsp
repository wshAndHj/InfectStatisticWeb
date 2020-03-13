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

		<%@include file="include/footer.jsp"%>
	</div>
</body>
</html>