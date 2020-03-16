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
				<a href="epidemicCase.jsp">疫情动态</a> <a
					href="migrationMap.jsp?provinceName=全国">患者流动</a> <a
					href="chartOrder.jsp">图表定制</a> <a href="proventGuide.jsp">预防指南</a>
			</nav>
		</div>
		<div class="clear"></div>
		<div id="guideTitle">
			<h1>新冠肺炎预防须知</h1>
		</div>
		<div id="guideBackground">
			<div id="guideContent">
				<span class="glyphicon glyphicon-exclamation-sign"></span> <span
					class="guideSubTitle">&nbsp;&nbsp;个人清洁</span> <br />
				<div class="guideSubContent">
					<span class="glyphicon glyphicon-ok"></span>
					&nbsp;&nbsp;经常保持双手清洁，尤其在触摸口、鼻或眼之前。<br /> <span
						class="glyphicon glyphicon-ok"></span>
					&nbsp;&nbsp;经常用洗手液和清水清洗双手，搓手最少20秒，并用纸巾擦干。<br /> <span
						class="glyphicon glyphicon-ok"></span>
					&nbsp;&nbsp;打喷嚏或咳嗽时应用纸巾掩盖口鼻，把用过的纸巾弃置于有盖垃圾箱内，然后彻底清洁双手。<br />
				</div>
				<br /> <span class="glyphicon glyphicon-ban-circle"></span> <span
					class="guideSubTitle">&nbsp;&nbsp;尽量避免</span> <br />
				<div class="guideSubContent">
					<span class="glyphicon glyphicon-remove"></span>
					&nbsp;&nbsp;减少前往人流密集的场所。如不可避免，应戴上外科口罩。<br /> <span
						class="glyphicon glyphicon-remove"></span>
					&nbsp;&nbsp;避免接触动物(包括野味)、禽鸟或其粪便;避免到海鲜、活禽市场或农场。<br /> <span
						class="glyphicon glyphicon-remove"></span>
					&nbsp;&nbsp;切勿进食野味及切勿光顾有提供野味的餐馆。<br /> <span
						class="glyphicon glyphicon-remove"></span>
					&nbsp;&nbsp;注意食物安全和卫生，避免进食或饮用生或未熟透的动物产品，包括奶类、蛋类和肉类。<br />
				</div>
				<br /> <span class="glyphicon glyphicon-plus-sign"></span> <span
					class="guideSubTitle">&nbsp;&nbsp;尽快就诊</span> <br />
				<div class="guideSubContent">
					<span class="glyphicon glyphicon-plus"></span>
					&nbsp;&nbsp;如有身体不适，特别是有发烧或咳嗽，应戴上外科口罩并尽快就诊。<br /> 
				</div>
			</div>
		</div>
		<%@include file="include/footer.jsp"%>
	</div>
</body>
</html>