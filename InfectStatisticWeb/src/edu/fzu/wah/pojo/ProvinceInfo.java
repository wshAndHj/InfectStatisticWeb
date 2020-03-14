package edu.fzu.wah.pojo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.Formatter;
import java.util.HashMap;
import java.util.List;

public class ProvinceInfo {
	static public String[] provinceList = { "安徽", "北京", "重庆", "福建", "甘肃", "广东", "广西", "贵州", "海南", "河北", "河南", "黑龙江",
			"湖北", "湖南", "吉林", "江苏", "江西", "辽宁", "内蒙古", "宁夏", "青海", "山东", "山西", "陕西", "上海", "四川", "天津", "西藏", "新疆", "云南",
			"浙江", "台湾" };
	private String name;// 省名
	private int infectNum = 0;// 感染数
	private int suspectedNum = 0;// 疑似数
	private int diedNum = 0;// 死亡数
	private int cureNum = 0;// 治愈数
	private int inTotalNum = 0;// 迁入本省人口总数
	private int outTotalNum = 0;// 迁出本省人口总数
	private boolean doesRefered = false;// 是否有日志提到
	private Date date;
	private List<ProvinceMigration> provinceMigrations = new ArrayList<ProvinceMigration>();

	public ProvinceInfo(String name) {
		this.name = name;
		addProvinceMigration();// 将所有省份的迁徙信息添加到provinceMigrations中
	}
	
	public ProvinceInfo(ProvinceInfo p) {
		infectNum = p.getInfectNum();
		suspectedNum = p.getSuspectedNum();
		diedNum = p.getDiedNum();
		cureNum = p.getCureNum();
		inTotalNum = p.getInTotalNum();
		outTotalNum = p.getOutTotalNum();
		
	}

	private void addProvinceMigration() {// 添加迁徙省份到provinceMigrations
		for (int i = 0; i < provinceList.length; i++) {
			ProvinceMigration m = new ProvinceMigration(provinceList[i]);
			provinceMigrations.add(m);
		}
	}

	public void addProvinceMigrationIn(String name, int num) {
		List<String> list = Arrays.asList(provinceList);
		int index = list.indexOf(name);
		provinceMigrations.get(index).addInNum(num);
		inTotalNum += num;
	}

	public void addProvinceMigrationOut(String name, int num) {
		List<String> list = Arrays.asList(provinceList);
		int index = list.indexOf(name);
		provinceMigrations.get(index).addOutNum(num);
		outTotalNum += num;
	}

	public int getProvinceIndex(String name) {
		return 0;
	}

	public void computeInAndOutRate() {// 根据总迁入/迁出数计算迁入/迁出占比
		for (int i = 0; i < provinceMigrations.size(); i++) {
			provinceMigrations.get(i).computeRate(inTotalNum, outTotalNum);
		}
	}

	public void output(Formatter writer, HashMap<String, Integer> typeMap) {
		int infectDoesShow, suspectedDoesShow, cureDoesShow, diedDoesShow;
		infectDoesShow = typeMap.get("ip");
		suspectedDoesShow = typeMap.get("sp");
		cureDoesShow = typeMap.get("cure");
		diedDoesShow = typeMap.get("dead");
		writer.format(name + "  ");
		if (infectDoesShow > 0) {
			writer.format("感染患者:%d人  ", infectNum);
		}
		if (suspectedDoesShow > 0) {
			writer.format("疑似患者%d人  ", suspectedNum);
		}
		if (cureDoesShow > 0) {
			writer.format("治愈%d人  ", cureNum);
		}
		if (diedDoesShow > 0) {
			writer.format("死亡%d人  ", diedNum);
		}
		writer.format("\n");
	}

	// 根据接受本省迁徙人口数排序并返回provinceMigrations
	public List<ProvinceMigration> getMigrationOutList() {
		Collections.sort(provinceMigrations, new Comparator<ProvinceMigration>() {
			@Override
			public int compare(ProvinceMigration o1, ProvinceMigration o2) {
				// TODO Auto-generated method stub
				if (o1.getOutNum() >= o2.getOutNum()) {
					return -1;
				} else {
					return 1;
				}
			}
		});
		return provinceMigrations;
	}

	// 根据迁入本省人口数排序并返回provinceMigrations
	public List<ProvinceMigration> getMigrationInList() {
		Collections.sort(provinceMigrations, new Comparator<ProvinceMigration>() {
			@Override
			public int compare(ProvinceMigration o1, ProvinceMigration o2) {
				// TODO Auto-generated method stub
				if (o1.getInNum() >= o2.getInNum()) {
					return -1;
				} else {
					return 1;
				}
			}
		});
		return provinceMigrations;
	}

	public int getInfectNum() {
		return infectNum;
	}

	public int infectNumAdd(int num) {
		return infectNum += num;
	}

	public int infectNumSub(int num) {
		return infectNum -= num;
	}

	public int getSuspectedNum() {
		return suspectedNum;
	}

	public int suspectedAdd(int num) {
		return suspectedNum += num;
	}

	public int suspectedSub(int num) {
		return suspectedNum -= num;
	}

	public int getDiedNum() {
		return diedNum;
	}

	public int diedNumAdd(int num) {
		return diedNum += num;
	}

	public int diedNumSub(int num) {
		return diedNum -= num;
	}

	public int getCureNum() {
		return cureNum;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setInfectNum(int infectNum) {
		this.infectNum = infectNum;
	}

	public void setSuspectedNum(int suspectedNum) {
		this.suspectedNum = suspectedNum;
	}

	public void setDiedNum(int diedNum) {
		this.diedNum = diedNum;
	}

	public void setCureNum(int cureNum) {
		this.cureNum = cureNum;
	}

	public int cureNumAdd(int num) {
		return cureNum += num;
	}

	public int cureNumSub(int num) {
		return cureNum -= num;
	}

	public String getName() {
		return name;
	}

	public boolean isDoesRefered() {
		return doesRefered;
	}

	public void setDoesRefered(boolean doesRefered) {
		this.doesRefered = doesRefered;
	}

	public int getInTotalNum() {
		return inTotalNum;
	}

	public void setInTotalNum(int inTotalNum) {
		this.inTotalNum = inTotalNum;
	}

	public int getOutTotalNum() {
		return outTotalNum;
	}

	public void setOutTotalNum(int outTotalNum) {
		this.outTotalNum = outTotalNum;
	}

	public List<ProvinceMigration> getProvinceMigrations() {
		return provinceMigrations;
	}

	public void setProvinceMigrations(List<ProvinceMigration> provinceMigrations) {
		this.provinceMigrations = provinceMigrations;
	}
	
	public void setDate(String dateString) {
		try {
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			date = simpleDateFormat.parse(dateString);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
