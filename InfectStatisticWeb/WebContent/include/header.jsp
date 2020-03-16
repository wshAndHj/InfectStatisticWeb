
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
<<<<<<< HEAD
<link href="css/front/chartOrder.css" rel="stylesheet">
=======
>>>>>>> 10dc93e4723eeae92c4da48dbf094b8b4daba0ca
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
	String currentMonth = (String)request.getAttribute("currentMonth");
	String[][] dateList = (String[][]) request.getAttribute("dateList");
	System.out.print(dateList == null);
	String dateListString="";
	if(dateList == null){
		System.out.print("datelist null");
	}
	if(currentMonth == null){
		System.out.print("currentMounth null");
	}
	for(int i=0;i<dateList.length-1;i++){
		dateListString+=dateList[i][0];
		dateListString+=",";
	}
	dateListString+=dateList[dateList.length-1][0];
	System.out.println(dateList.length);
%>
<script>

function getLastTenDays(currentDay) {
	var temDay = new Date(currentDay);
	var LastTenDays = new Array();
	for (var i = 0; i < 10; i++) {
		LastTenDays[i] = temDay.getFullYear() + "-"
				+ (temDay.getMonth() + 1) + "-" + temDay.getDate();
		temDay.setTime(temDay.getTime() - 24 * 60 * 60 * 1000);
	}
	return LastTenDays;
}
	var dateList = [ [ "2018-02-01" ], [ "2018-02-02" ], [ "2018-02-03" ],
			[ "2018-02-04" ], [ "2018-02-05" ], [ "2018-02-06" ],
			[ "2018-02-07" ], [ "2018-02-08" ], [ "2018-02-09" ],
			[ "2018-02-10" ], [ "2018-02-11" ], [ "2018-02-12" ],
			[ "2018-02-13" ], [ "2018-02-14" ], [ "2018-02-15" ],
			[ "2018-02-16" ], [ "2018-02-17" ], [ "2018-02-18" ],
			[ "2018-02-19" ], [ "2018-02-20" ], [ "2018-02-21" ],
			[ "2018-02-22" ], [ "2018-02-23" ], [ "2018-02-24" ],
			[ "2018-02-25" ], [ "2018-02-26" ], [ "2018-02-27" ],
			[ "2018-02-28" ] ];
	var dateList=new Array();
	var temList=temString.split(",");	
	var dateListLength='<%=dateList.length %>';
	var temString='<%=dateListString%>';
	for(var i=0;i<dateListLength;i++){
		dateList[i]=new Array();
		dateList[i][0]=temList[i];
	}
	var currentMonth = '<%=currentMonth%>
	';
	var currentDay = '2020-02-29';
</script>
</head>
<body>