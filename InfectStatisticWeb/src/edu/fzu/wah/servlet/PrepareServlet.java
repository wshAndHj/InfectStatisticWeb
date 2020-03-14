package edu.fzu.wah.servlet;

import java.io.Console;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.lang.*;
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
public class PrepareServlet extends HttpServlet {//该类用于最初的调用bean类中的方法，对日志文件的数据进行处理
	private static final long serialVersionUID = 1L;
	static private HashMap<String, ProvinceInfo> allProvincesInfoMap = null;
	static private HashMap<String, HashMap<String, ProvinceInfo>> tenDaysInfos = null;//保存各省十天的数据
	static public SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
	private String currentMounth;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PrepareServlet() {
        super();
        // TODO Auto-generated constructor stub
		String parameters = "-list -log F:\\GitHub\\InfectStatisticWeb\\InfectStatisticWeb\\src\\edu\\fzu\\wah\\service\\log";	
		parameters += " -date 2020-02-01";
		//getMonthDataOfFront("2020-02",2);
		prepareOpearte(parameters);
    }
    
    public Date rollDay(Date d, int day) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(d);
        cal.add(Calendar.DAY_OF_MONTH, day);
        return cal.getTime();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");

		request.getSession().setAttribute("全国数据", allProvincesInfoMap);
		System.out.println("添加完成");
		//System.out.println(System.getProperty("user.dir"));
		//request.getRequestDispatcher("epidemicCase.jsp").forward(request, response);
		String provinceName = request.getParameter("provinceName");
		if(provinceName != null) {
			request.setAttribute("provinceName", provinceName);
		}
		if(request.getParameter("currentMonth") != null) {//是日期请求
			doDateRequest(request, response);
		}else {			
			request.setAttribute("currentMonth", "2020-03");
			List<String> list = getMonthDataOfFront("2020-03",1);
			request.setAttribute("dates", list);
			request.getRequestDispatcher("NewFile.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	//预处理：从service类中获取指定日期前的各省份疫情情况，并存在allProvincesInfoMap中
	static private void prepareOpearte(String parameters) {//parameter是第一次作业中传入的参数列表字符串
		String []args = parameters.split(" ");
		ProcessParameter processParameter = new ProcessParameter();
		processParameter.processParameters(args);
		InfectStatistic infectStatistic = new InfectStatistic();
        infectStatistic.statistic(processParameter.getLogDir(), processParameter.getDate());
        allProvincesInfoMap = infectStatistic.getProvinceMap();//各省份的疫情信息(包含全国)，信息包含四个数据和省名
        tenDaysInfos = infectStatistic.getTendaysInfo();
	}
	
	
	//获取某个省份的疫情情况
	private ProvinceInfo getProvinceInfo(String name) {
		if(allProvincesInfoMap.containsKey(name)) {
			return allProvincesInfoMap.get(name);
		}else {
			System.out.println("省份"+name+"不存在");
			return null;
		}
	}
	
	
	//获取某个省份(也可以是全国)的迁入/迁出前十名热门省份，迁入还是迁出根据type判断(in：迁入, out：迁出)
	private List<ProvinceMigration> getProvinceMigrationsList(String name, String type){
		ProvinceInfo provinceInfo = getProvinceInfo(name);
		if(type.equals("in")) {
			return provinceInfo.getProvinceMigrations().subList(0, 10);
		}else {
			return provinceInfo.getMigrationOutList().subList(0, 10);
		}
		
	}
	
	public static int getDaysOfMonth(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		return calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
	}

	public List<String> getMonthDataOfFront(String month, int flag){//flag：0上个月，1这个月,2下个月
		Date date;
		List<String> list = new ArrayList<String>();
		try {
			date = simpleDateFormat.parse(month + "-01");
			Date targetDate = null;
			if(flag == 1) {
				targetDate = InfectStatistic.rollDay(date, 0);			
			}else if(flag == 0) {
				targetDate = InfectStatistic.rollDay(date, -2);
			}else if(flag == 2) {
				targetDate = InfectStatistic.rollDay(date, 35);
			}
			
			int num = getDaysOfMonth(targetDate);
			String dateString = simpleDateFormat.format(targetDate);
			String dates[] = dateString.split("-");
			currentMounth = dates[0] + "-" + dates[1];
			for(int i = 1; i <= num; i++) {
				if(i < 10) {
					list.add(dates[0] + "-" + dates[1] + "-0" + i);					
				}else {
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
	
	public void doDateRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException  {
		String date = (String) request.getParameter("currentMonth");
		String origin = (String) request.getParameter("origin");
		int type = 1;
		if(request.getParameter("ask") != null) {
			String askString = (String) request.getParameter("ask");
			if(askString.equals("last")) {
				type = 0;
			}else {
				type = 2;
			}
		}
		List<String> list = getMonthDataOfFront(date, type);
		request.setAttribute("currentMonth", currentMounth);
		//System.out.println("currentMounth:" + currentMounth);
		request.setAttribute("dates", list);
		request.getRequestDispatcher("NewFile.jsp").forward(request, response);
	}
	
	
	
}
