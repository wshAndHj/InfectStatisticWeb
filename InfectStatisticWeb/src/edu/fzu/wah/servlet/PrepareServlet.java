package edu.fzu.wah.servlet;

import java.io.Console;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.fzu.wah.pojo.ProvinceInfo;
import edu.fzu.wah.service.InfectStatistic;
import edu.fzu.wah.service.ProcessParameter;

/**
 * Servlet implementation class PrepareServlet
 */
@WebServlet("/PrepareServlet")
public class PrepareServlet extends HttpServlet {//该类用于最初的调用bean类中的方法，对日志文件的数据进行处理
	private static final long serialVersionUID = 1L;
	static private HashMap<String, ProvinceInfo> allProvincesInfoMap = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PrepareServlet() {
        super();
        // TODO Auto-generated constructor stub
       
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		
		String parameters = "-list -log C:\\Users\\绍鸿\\Desktop\\部分疫情日志log"
				+ " -date 2020-01-19 -out C:\\Users\\绍鸿\\Desktop\\out.txt";
		prepareOpearte(parameters);
		ProvinceInfo p = getProvinceInfo("广西");
		System.out.println("广西 "+ p.getInfectNum() + "  " +
				p.getSuspectedNum() + "  " + p.getCureNum() + "  " + p.getDiedNum());
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
		//processParameter.statistic();//开始统计
		InfectStatistic infectStatistic = new InfectStatistic();
        infectStatistic.statistic(processParameter.getLogDir(), processParameter.getDate());
        System.out.println(infectStatistic.getProvinceMap().get("全国").getCureNum());
        allProvincesInfoMap = infectStatistic.getProvinceMap();//各省份的疫情信息(包含全国)，信息包含四个数据和省名
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
	
}
