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
		
		<%@include file="include/footer.jsp"%>
	</div>
</body>
</html>