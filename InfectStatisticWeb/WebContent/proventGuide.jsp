<%@ page pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("全国数据") == null) {
		request.getRequestDispatcher("PrepareServlet").forward(request, response);
	}
%>
<%@include file="include/header.jsp"%>
<%@include file="include/navigator.jsp"%>
<%
	String provinceName = request.getParameter("provinceName");
%>
<title>预防指南</title>
</head>

<body>
	<div id="main">
		<div id="navitagorDiv">
			<nav>
				<a href="epidemicCase.jsp">疫情动态</a> <a href="migrationMap.jsp?provinceName=全国">患者流动</a>
				<a href="userServlet">图表定制</a> <a href="proventGuide.jsp">预防指南</a>
			</nav>
		</div>
		<div class="clear"></div>
		<div id="guideTitle"></div>
		<%@include file="include/footer.jsp"%>
	</div>
</body>
</html>