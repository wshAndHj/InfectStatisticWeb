<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>newFile</title>
</head>
<body>
	<%
		List<String> mouthDays = (List<String>)request.getAttribute("dates");
		int num = mouthDays.size();
		String[][] dateList = new String[num][];
		for(int i =0 ; i <num; i++){
			dateList[i] = new String[1];
			
		}
		for(int i = 0; i < num; i++){
			dateList[i][0] = mouthDays.get(i);
		}
		request.setAttribute("dateList", dateList);
		if(request.getAttribute("provinceName") == null){//初始界面
			request.getRequestDispatcher("epidemicCase.jsp").forward(request, response);			
		}else{//详情界面
			request.getRequestDispatcher("epidemicDetails.jsp").forward(request, response);
		}
	%>
</body>
</html>