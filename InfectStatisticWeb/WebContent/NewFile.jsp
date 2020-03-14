<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>newFile</title>
</head>
<body>
	<%
		String[][] dateList = new String[][] { { "2018-02-01" }, { "2018-02-02" }, { "2018-02-03" } };
		request.setAttribute("dateList", dateList);
		request.getRequestDispatcher("epidemicCase.jsp").forward(request, response);
	%>
</body>
</html>