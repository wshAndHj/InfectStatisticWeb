<!DOCTYPE html>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt'%>

<html>

<head>
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css"
	rel="stylesheet">
<link href="css/front/style.css" rel="stylesheet">
<link href="css/front/migrationMap.css" rel="stylesheet">
<link href="css/front/epidemicDetails.css" rel="stylesheet">
<link href="css/front/proventGuide.css" rel="stylesheet">
<link href="css/front/chartOrder.css" rel="stylesheet">
<script src="https://cdn.bootcss.com/echarts/4.2.1-rc1/echarts.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/echarts/dist/echarts.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/echarts-gl/dist/echarts-gl.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/echarts-stat/dist/ecStat.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/echarts/dist/extension/dataTool.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/echarts/map/js/china.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/echarts/map/js/world.js"></script>
<script type="text/javascript"
	src="https://api.map.baidu.com/api?ak=KQzYf2XpU8I6WA42psXOl4aroUUBK7oR&__ec_v__=20190126"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/echarts/dist/extension/bmap.min.js"></script>
<%
	String thisPage = this.getClass().getSimpleName().replaceAll("_", ".");
	session.setAttribute("page", thisPage);

	String currentMonth=null;
	String currentDay=null;
	String[][] dateList;
	if (thisPage.equals("epidemicCase.jsp") || thisPage.equals("epidemicDetails.jsp")) {
		currentMonth = (String) request.getAttribute("currentMonth");
		dateList = (String[][]) request.getAttribute("dateList");
		System.out.print(dateList == null);
		String dateListString = "";
		currentDay = (String) request.getAttribute("currentDay");
		if (dateList == null) {
			System.out.println("datelist null");
			dateList = new String[1][];
			dateList[0] = new String[1];
			dateList[0][0] = "";
		}
		if (currentMonth == null) {
			currentMonth ="2020-02";
			currentDay = "2020-02-02";
			System.out.println("currentMounth null");
		}
		for (int i = 0; i < dateList.length - 1; i++) {
			dateListString += dateList[i][0];
			dateListString += ",";
		}
		dateListString += dateList[dateList.length - 1][0];
%><script type="text/javascript">

var dateList=new Array();
var dateListLength='<%=dateList.length %>';
var temString='<%=dateListString%>';
var temList=temString.split(",");	
for(var i=0;i<dateListLength;i++){
	dateList[i]=new Array();
	dateList[i][0]=temList[i];
}
var currentMonth = '<%=currentMonth%>';
	var currentDay = '<%=currentDay%>';
</script>
<%
	} else {
		if (currentMonth == null) {
			currentMonth = "2020-02";
			currentDay = "2020-02-02";
		}
		%>
		<script type="text/javascript">
		var currentMonth = '<%=currentMonth%>';
		var currentDay = '<%=currentDay%>';
		</script>
		<%
	}
%>
<script type="text/javascript">
function getLastTenDays(currentDay) {
	var temDay = new Date(currentDay);
	var LastTenDays = new Array();
	for (var i = 0; i < 10; i++) {
		LastTenDays[i] = temDay.getFullYear() + "-"
				+ (temDay.getMonth() + 1) + "-" + temDay.getDate();
		temDay.setTime(temDay.getTime() - 24 * 60 * 60 * 1000);
	}
	return LastTenDays;
}</script>
</head>
<body>