
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
<script>
	function init() {
		var maps = new Array();
		maps[0] = "nowInfect";
		maps[1] = "allInfect";
		var ths = document.getElementById("doubleChoiceTr").children;
		var check = 0;
		for (var i = 0; i < ths.length; i++) {
			ths[i].index = i;
			ths[i].onclick = function() {
				if (check != this.index) {
					var oldId = maps[check];
					ths[check].className = 'unselected';
					check = this.index;
					var newId = maps[check];
					ths[check].className = 'selected';
					document.getElementById(oldId).id = newId;
					if (check == 0) {
						initNowInfect();
					} else {
						initAllInfect();
					}
				}
			};

		}
		//for(var i=0;)
		//alert("ok");
	}
	window.onload = init;
</script>
</head>
<body>