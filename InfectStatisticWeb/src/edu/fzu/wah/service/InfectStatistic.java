package edu.fzu.wah.service;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.Formatter;
import java.util.HashMap;
import java.util.List;

import edu.fzu.wah.pojo.ProvinceInfo;

public class InfectStatistic {
	private String[] provinceList = 
		{ "安徽", "北京", "重庆", "福建", "甘肃", "广东", "广西", "贵州", "海南", "河北", "河南", "黑龙江", "湖北",
			"湖南", "吉林", "江苏", "江西", "辽宁", "内蒙古", "宁夏", "青海", "山东", "山西", "陕西", "上海",
			"四川", "天津", "西藏", "新疆", "云南", "浙江", "台湾" };
	private HashMap<String, ProvinceInfo> provinceMap = new HashMap<>();
	private List<String> fileList = new ArrayList<>();
	private int infectTotalNum, suspectedTotalNum, cureTotalNum, diedTotalNum;
	private ProvinceInfo countryInfo = new ProvinceInfo("全国");
	//保存各个省份近十天的数据
	private HashMap<String, List<ProvinceInfo>> tendaysInfos = new HashMap<String, List<ProvinceInfo>>();
	private Date firstDate;
	private Date lastDate;
	
	
	
	public InfectStatistic() {
		for (String p : provinceList) {
			//System.out.print(p + "  ");
			provinceMap.put(p, new ProvinceInfo(p));
		}
	
		infectTotalNum = suspectedTotalNum = cureTotalNum = diedTotalNum = 0;
	}

	public void processLogDir(File dir) {// 处理log文件夹的日志文件
		for (File f : dir.listFiles()) {// 将目录下所有的文件名加入fileList列表用于排序
			fileList.add(f.getName().split("\\.")[0]);
		}
		Collections.sort(fileList);
	}

	public int processDate(Date date) {// 时间处理
		try {
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			String lastDateString = fileList.get(fileList.size() - 1);// 最大文件日期
			String firstDateString = fileList.get(0);//最小文件日期
			Date fileLastDate = simpleDateFormat.parse(lastDateString);
			Date fileFirstDate = simpleDateFormat.parse(firstDateString);
			firstDate = rollDay(date, -10);
			lastDate = rollDay(fileFirstDate, 10);
			firstDate = firstDate.compareTo(fileFirstDate) > 0 ? firstDate : fileFirstDate;
			lastDate = lastDate.compareTo(date) > 0 ? lastDate : date;
			System.out.println(firstDate);
			System.out.println(lastDate);
			if (date != null && date.compareTo(fileLastDate) > 0) {
				System.out.println("抱歉，日期超出范围");
				return -1;
			}
		} catch (Exception e) {
			return -1;
		}
		return 0;
	}

	public int statistic(File dir, Date date) {// 统计
		try {
			BufferedReader reader = null;
			String line;
			processLogDir(dir);
			processDate(date);
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			for (String fileDateString : fileList) {
				System.out.println(fileDateString);
				File file = new File(dir.getPath() + "/" + fileDateString + ".log.txt");
				Date fileDate = simpleDateFormat.parse(fileDateString);// 日志日期
				if (date != null && fileDate.compareTo(date) > 0) {
					break;
				}
				reader = new BufferedReader(new FileReader(file));

				
				while ((line = reader.readLine()) != null) {
					if (line.length() > 1 && line.charAt(0) != '/') {// 该行不为注释
						updateProvinceInfo(line);
					}
				}
			}
			countryInfo.setCureNum(cureTotalNum);
			countryInfo.setDiedNum(diedTotalNum);
			countryInfo.setInfectNum(infectTotalNum);
			countryInfo.setSuspectedNum(suspectedTotalNum);
			provinceMap.put("全国", countryInfo);
		} catch (Exception e) {

		}
		computeMigrationRate();
		return 0;
	}

	public void updateProvinceInfo(String line) {
		System.out.println(line);
		String message[] = line.split(" ");
		ProvinceInfo province = provinceMap.get(message[0]);
		String lastMessage = message[message.length - 1];
		int num = Integer.parseInt(lastMessage.substring(0, lastMessage.length() - 1));// 更新人数
		switch (message.length) {
		case 3:// 死亡、治愈
			province.setDoesRefered(true);
			if (message[1].equals("死亡")) {
				province.diedNumAdd(num);
				province.infectNumSub(num);
				diedTotalNum += num;
				infectTotalNum -= num;
			} else {// 治愈
				province.cureNumAdd(num);
				province.infectNumSub(num);
				cureTotalNum += num;
				infectTotalNum -= num;
			}
			break;
		case 4:// 新增、确诊、排除
			province.setDoesRefered(true);
			if (message[1].equals("新增")) {
				if (message[2].equals("感染患者")) {
					province.infectNumAdd(num);
					infectTotalNum += num;
				} else {// 疑似患者
					province.suspectedAdd(num);
					suspectedTotalNum += num;
				}
			} else if (message[1].equals("排除")) {// 排除疑似患者
				province.suspectedSub(num);
				suspectedTotalNum -= num;
			} else {// 确诊感染
				province.suspectedSub(num);
				province.infectNumAdd(num);
				suspectedTotalNum -= num;
				infectTotalNum += num;
			}
			break;
		case 5:// 从A省流入B省
			System.out.println("migration");
			ProvinceInfo provinceB = provinceMap.get(message[3]);
			province.addProvinceMigrationOut(message[3], num);// 记录A省中迁出到B省的人数+num
			provinceB.addProvinceMigrationIn(message[0], num);// 记录B省中从A省迁入的人数+num
			countryInfo.addProvinceMigrationOut(message[0], num);// 全国记录各个省份的输出人口
			countryInfo.addProvinceMigrationIn(message[3], num);
			//System.out.println("in:" + countryInfo.getInTotalNum() + "  out:" + countryInfo.getOutTotalNum());
			
			province.setDoesRefered(true);
			provinceB.setDoesRefered(true);	
			if (message[1].equals("感染患者")) {
				province.infectNumSub(num);
				provinceB.infectNumAdd(num);
			} else {// 疑似患者
				province.suspectedSub(num);
				provinceB.suspectedAdd(num);
			}
			break;
		}
	}

	public void output(String outputPath, ArrayList<String> provinceList, HashMap<String, Integer> typeMap) {
		try {
			Formatter writer = new Formatter(outputPath);
			int infectNum, suspectedNum, cureNum, diedNum;
			int infectDoesShow, suspectedDoesShow, cureDoesShow, diedDoesShow;
			infectNum = suspectedNum = cureNum = diedNum = 0;
			infectDoesShow = typeMap.get("ip");
			suspectedDoesShow = typeMap.get("sp");
			cureDoesShow = typeMap.get("cure");
			diedDoesShow = typeMap.get("dead");

			if (provinceList.contains("全国") || provinceList.size() == 0) {
				writer.format("全国  ");
				if (infectDoesShow > 0) {
					writer.format("感染患者:%d人  ", infectTotalNum);
				}
				if (suspectedDoesShow > 0) {
					writer.format("疑似患者%d人  ", suspectedTotalNum);
				}
				if (cureDoesShow > 0) {
					writer.format("治愈%d人  ", cureTotalNum);
				}
				if (diedDoesShow > 0) {
					writer.format("死亡%d人  ", diedTotalNum);
				}
				writer.format("\n");
			}

			if (provinceList.size() == 0) {// 指令没有传入-province参数
				for (ProvinceInfo p : provinceMap.values()) {
					if (p.isDoesRefered()) {
						p.output(writer, typeMap);
					}
				}
			} else {// 有传入-province参数
				for (ProvinceInfo p : provinceMap.values()) {
					if (provinceList.contains(p.getName())) {
						p.output(writer, typeMap);
					}
					infectNum += p.getInfectNum();
					suspectedNum += p.getSuspectedNum();
					cureNum += p.getCureNum();
					diedNum += p.getDiedNum();
				}
			}

			writer.flush();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static Date rollDay(Date d, int day) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(d);
        cal.add(Calendar.DAY_OF_MONTH, day);
        return cal.getTime();
    }
	
	public void computeMigrationRate() {//计算并保存所有省份的迁入迁出比
		for(ProvinceInfo p : provinceMap.values()) {
			p.computeInAndOutRate();
		}
	}

	public String[] getProvinceList() {
		return provinceList;
	}

	public HashMap<String, ProvinceInfo> getProvinceMap() {
		return provinceMap;
	}

	public List<String> getFileList() {
		return fileList;
	}

	public int getInfectTotalNum() {
		return infectTotalNum;
	}

	public int getSuspectedTotalNum() {
		return suspectedTotalNum;
	}

	public int getCureTotalNum() {
		return cureTotalNum;
	}

	public int getDiedTotalNum() {
		return diedTotalNum;
	}

}
