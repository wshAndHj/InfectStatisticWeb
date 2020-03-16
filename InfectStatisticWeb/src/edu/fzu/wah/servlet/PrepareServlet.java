package edu.fzu.wah.servlet;

import java.io.Console;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.builder.StandardToStringStyle;

import edu.fzu.wah.pojo.ProvinceInfo;
import edu.fzu.wah.pojo.ProvinceMigration;
import edu.fzu.wah.service.InfectStatistic;
import edu.fzu.wah.service.ProcessParameter;

/**
 * Servlet implementation class PrepareServlet
 */
@WebServlet("/PrepareServlet")
public class PrepareServlet extends HttpServlet {// 该类用于最初的调用bean类中的方法，对日志文件的数据进行处理
	private static final long serialVersionUID = 1L;
	static private HashMap<String, ProvinceInfo> allProvincesInfoMap = null;
	static private HashMap<String, HashMap<String, ProvinceInfo>> tenDaysInfos = null;// 保存各省十天的数据
	static public SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
	private String currentMonth;
	private String currentDay;
	private String parameters = "-list -log log";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PrepareServlet() {
		super();
		// TODO Auto-generated constructor stub
		String parameterString = parameters;
		parameterString += " -date 2020-02-01";
		// getMonthDataOfFront("2020-02",2);
		prepareOpearte(parameterString);
		// getTendaysInfo("全国",1);
	}

	public Date rollDay(Date d, int day) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(d);
		cal.add(Calendar.DAY_OF_MONTH, day);
		return cal.getTime();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		System.out.println();
		System.out.println("doget");

		String thisPage = (String) request.getSession().getAttribute("page");
		currentMonth = (String) request.getParameter("currentMonth");
		currentDay = (String) request.getParameter("currentDay");
		String ask = (String) request.getParameter("ask");
		String provinceName = (String)request.getParameter("provinceName");
		System.out.println(currentMonth);
		System.out.println("this page:" + thisPage);

		if (thisPage == null) {
			System.out.println("thisPage null");
		}
		if (thisPage.equals("epidemicCase.jsp")) {// case界面
			if (currentMonth == null) {// 第一次请求
				currentMonth = "2020-02";
			}
			if (currentDay == null) {
				currentDay = currentMonth + "-01";
			}
			System.out.println("接收case界面传来的请求");
			String parameterString = parameters;
			parameterString += " -date " + currentDay;
			System.out.println("parameter  " + parameterString);
			prepareOpearte(parameterString);// 调用service获取所需的数据
			System.out.println("全国 " + allProvincesInfoMap.get("全国").getDiedNum());
			request.getSession().setAttribute("全国数据", allProvincesInfoMap);
			System.out.println("开始处理datalist");
			doDateRequest(request, response);// 把datalis（这里是dates）存到request
			// System.out.println("添加完成");
		} else if (thisPage.equals("epidemicDetails.jsp")) {// detail界面
			System.out.println("处理来自details的请求");
			if (currentMonth == null) {// 第一次访问detail界面
				currentMonth = "2020-02";
			}
			if(currentDay == null) {
				currentDay = "2020-02-01";				
			}
			String parameterString = parameters;
			parameterString += " -date " + currentDay;
			prepareOpearte(parameterString);// 调用service获取所需的数据
			request.getSession().setAttribute("全国数据", allProvincesInfoMap);
			System.out.println("currentday " + currentDay);
			//System.out.println(tenDaysInfos.get(provinceName).get(currentDay).getInfectNum());
			System.out.println(provinceName);
			String[][] tenDayData = getTendaysInfo(provinceName);
			System.out.println("开始处理十天数据");
			request.getSession().setAttribute("十天数据", tenDayData);
			request.setAttribute("provinceName", provinceName);
			System.out.println("开始处理datalist");
			doDateRequest(request, response);// 把datalis（这里是dates）存到request
			System.out.println();

		}else if(thisPage.equals("chartOrder.jsp")) {
			System.out.println("开始处理chartOrder");
			System.out.println(provinceName);
			currentMonth = "2020-02";
			currentDay = "2020-02-02";
			
			String parameterString = parameters;
			parameterString += " -date " + currentDay;
			prepareOpearte(parameterString);// 调用service获取所需的数据
			request.setAttribute("provinceName", provinceName);
			String [][] oneProvinceTenData = getTendaysInfo(provinceName);
			request.getSession().setAttribute("单省十天数据", oneProvinceTenData);
			request.getRequestDispatcher("chartOrder.jsp").forward(request, response);
			
		}

		////////////////////////////////////////////////
//		currentDay = "2020-02-01";
//		request.getSession().setAttribute("全国数据", allProvincesInfoMap);
//		System.out.println("添加完成");
//		// doTendaysRequest(request, response);
//		// System.out.println(System.getProperty("user.dir"));
//		// request.getRequestDispatcher("migrationMap.jsp").forward(request, response);
//		String provinceName = request.getParameter("provinceName");
//		if (provinceName != null) {
//			request.setAttribute("provinceName", provinceName);
//		}
//		if (request.getParameter("currentMonth") != null) {// 是日期请求
//			System.out.println("has currentMonth");
//			doDateRequest(request, response);
//		} else {
//			request.setAttribute("currentMonth", "2020-03");
//			List<String> list = getMonthDataOfFront("2020-03", 1);
//			request.setAttribute("dates", list);
//			request.getRequestDispatcher("NewFile.jsp").forward(request, response);
//		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	// 预处理：从service类中获取指定日期前的各省份疫情情况，并存在allProvincesInfoMap中
	static private void prepareOpearte(String parameters) {// parameter是第一次作业中传入的参数列表字符串
		String[] args = parameters.split(" ");
		ProcessParameter processParameter = new ProcessParameter();
		processParameter.processParameters(args);
		InfectStatistic infectStatistic = new InfectStatistic();
		infectStatistic.statistic(processParameter.getLogDir(), processParameter.getDate());
		allProvincesInfoMap = infectStatistic.getProvinceMap();// 各省份的疫情信息(包含全国)，信息包含四个数据和省名
		tenDaysInfos = infectStatistic.getTendaysInfo();
		// System.out.println(tenDaysInfos.size());
	}

	// 获取某个省份的疫情情况
	private ProvinceInfo getProvinceInfo(String name) {
		if (allProvincesInfoMap.containsKey(name)) {
			return allProvincesInfoMap.get(name);
		} else {
			System.out.println("省份" + name + "不存在");
			return null;
		}
	}

	// 获取某个省份(也可以是全国)的迁入/迁出前十名热门省份，迁入还是迁出根据type判断(in：迁入, out：迁出)
	private List<ProvinceMigration> getProvinceMigrationsList(String name, String type) {
		ProvinceInfo provinceInfo = getProvinceInfo(name);
		if (type.equals("in")) {
			return provinceInfo.getProvinceMigrations().subList(0, 10);
		} else {
			return provinceInfo.getMigrationOutList().subList(0, 10);
		}

	}

	public static int getDaysOfMonth(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		return calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
	}

	public List<String> getMonthDataOfFront(String month, int flag) {// flag：0上个月，1这个月,2下个月
		Date date;
		List<String> list = new ArrayList<String>();
		try {
			date = simpleDateFormat.parse(month + "-01");
			Date targetDate = null;
			if (flag == 1) {
				targetDate = InfectStatistic.rollDay(date, 0);
			} else if (flag == 0) {
				targetDate = InfectStatistic.rollDay(date, -2);
			} else if (flag == 2) {
				targetDate = InfectStatistic.rollDay(date, 35);
			}

			int num = getDaysOfMonth(targetDate);
			String day = simpleDateFormat.format(targetDate);
			String dates[] = day.split("-");
			currentMonth = dates[0] + "-" + dates[1];
			for (int i = 1; i <= num; i++) {
				if (i < 10) {
					list.add(dates[0] + "-" + dates[1] + "-0" + i);
				} else {
					list.add(dates[0] + "-" + dates[1] + "-" + i);
				}
			}
//			for(String s : list) {
//				System.out.println(s);
//			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	public void doDateRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String date = (String) request.getParameter("currentMonth");
		System.out.println("date " + date);
		int type = 1;
		if (request.getParameter("ask") != null) {
			String askString = (String) request.getParameter("ask");
			if (askString.equals("last")) {
				type = 0;
			} else {
				type = 2;
			}
		} // 没有asktype=1（本月）
		List<String> list = getMonthDataOfFront(currentMonth, type);
		System.out.println("list:" + list.size() + "  " + list.get(0));
		request.setAttribute("currentMonth", currentMonth);
		request.setAttribute("currentDay", currentDay);
		request.setAttribute("dates", list);
		request.getRequestDispatcher("NewFile.jsp").forward(request, response);
	}

//	public void doDateRequest(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		String date = (String)request.getParameter("currentMonth");
//		System.out.println("date " + date);
//		int type = 1;
//		if (request.getParameter("ask") != null) {
//			String askString = (String) request.getParameter("ask");
//			if (askString.equals("last")) {
//				type = 0;
//			} else {
//				type = 2;
//			}
//		} // 没有asktype=1（本月）
//		List<String> list = getMonthDataOfFront(date, type);
//		 System.out.println("list:" + list.size() + "  " + list.get(0));
//		request.setAttribute("currentMonth", currentMonth);
//		request.setAttribute("currentDay", currentDay);
//		request.setAttribute("dates", list);
//		request.getRequestDispatcher("NewFile.jsp").forward(request, response);
//	}

	// 获取某个省份十天的数据，type:0-确诊，1-疑似，2-死亡，3-治愈
	private String[][] getTendaysInfo(String name) {
		HashMap<String, ProvinceInfo> infoMap = tenDaysInfos.get(name);
		String infos[][] = new String[4][10];
		String date = currentDay;
		System.out.println("date:" + date + " " + name);
		for (int i = 0; i < 10; i++) {
			ProvinceInfo p = infoMap.get(date);
			Date pDate = getDate(date);
			//System.out.println(p.getInfectNum() + " " + p.getDiedNum() + " " + p.getSuspectedNum() + " " + p.getCureNum());
			Date lastDate = InfectStatistic.rollDay(pDate, -1);
			String lastString = getcurrentDay(lastDate);
			//System.out.println("laststring" + lastString);
			ProvinceInfo lastInfo = infoMap.get(lastString);
			infos[0][9 - i] = String.valueOf(p.getInfectNum() - lastInfo.getInfectNum());
			infos[1][9 - i] = String.valueOf(p.getSuspectedNum() - lastInfo.getSuspectedNum());
			infos[2][9 - i] = String.valueOf(p.getDiedNum() - lastInfo.getDiedNum());
			infos[3][9 - i] = String.valueOf(p.getCureNum() - lastInfo.getCureNum());
			date = lastString;
			System.out.println(infos[0][9-i] + "  " + infos[1][9-i] + " " + infos[2][9-i] + " " + infos[3][9-i]);
		}
		return infos;
	}

	public static Date getDate(String currentDay) {
		Date date = null;
		try {
			// System.out.println(currentDay);
			date = simpleDateFormat.parse(currentDay);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return date;
	}

	public static String getcurrentDay(Date date) {
		return simpleDateFormat.format(date);
	}

	public String[] getDateArrays(String dateString) {
		String[] dates = new String[10];
		Date date = getDate(dateString);
		date = InfectStatistic.rollDay(date, -9);
		for (int i = 0; i < 10; i++) {
			dates[i] = getcurrentDay(date);
			// System.out.println(dates[i]);
			date = InfectStatistic.rollDay(date, 1);
		}
		return dates;
	}
	
	private String[][] getAProvinceTenData(String name) {
		HashMap<String, ProvinceInfo> infoMap = tenDaysInfos.get(name);
		String infos[][] = new String[4][10];
		String date = currentDay;
		for (int i = 0; i < 10; i++) {
			ProvinceInfo p = infoMap.get(date);
			Date pDate = getDate(date);
			//System.out.println(p.getInfectNum() + " " + p.getDiedNum() + " " + p.getSuspectedNum() + " " + p.getCureNum());
			Date lastDate = InfectStatistic.rollDay(pDate, -1);
			String lastString = getcurrentDay(lastDate);
			//System.out.println("laststring" + lastString);
			ProvinceInfo lastInfo = infoMap.get(lastString);
			infos[0][9 - i] = String.valueOf(p.getInfectNum());
			infos[1][9 - i] = String.valueOf(p.getSuspectedNum());
			infos[2][9 - i] = String.valueOf(p.getDiedNum());
			infos[3][9 - i] = String.valueOf(p.getCureNum());
			date = lastString;
			System.out.println(infos[0][9-i] + "  " + infos[1][9-i] + " " + infos[2][9-i] + " " + infos[3][9-i]);
		}
		return infos;
	}

}
