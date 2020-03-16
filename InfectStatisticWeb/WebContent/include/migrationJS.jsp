<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="edu.fzu.wah.pojo.ProvinceInfo"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<script type="text/javascript">
	function initMigration() {
		var maps = new Array();
		maps[0] = document.getElementById("migrationIn");
		maps[1] = document.getElementById("migrationOut");
		var ths = document.getElementById("doubleChoiceTr").children;
		var check = 0;
		for (var i = 0; i < ths.length; i++) {
			ths[i].index = i;
			ths[i].onclick = function() {
				if (check != this.index) {
					ths[check].className = 'unselected';
					maps[check].className = 'hidden';
					check = this.index;
					ths[check].className = 'selected';
					maps[check].className = 'show';
				}
			};
		}
	}
</script>