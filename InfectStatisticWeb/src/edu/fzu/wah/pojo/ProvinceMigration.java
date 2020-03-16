package edu.fzu.wah.pojo;


/*
 * 本类是为了实现迁徙地图功能而实现的实体类
 * 本实体类主要用于存储某个省份的迁入人口数和迁出人口数
 * 
 * */
public class ProvinceMigration {
	private String name;//省名
	private int inNum = 0;//该省的输入人口数量
	private int outNum = 0;//输出到该省的人口数量
	private double inRate = 0;//该省输入占比
	private double outRate = 0;//该省输出占比
	
	public ProvinceMigration(String n) {
		name = n;
	}
	
	public void computeRate(int inTotalNum, int outTotalNum) {//计算本省的迁入/迁出占比
		if(inTotalNum != 0) {			
			inRate = (double)inNum/(double)inTotalNum;
		}
		if(outTotalNum != 0) {
			outRate = (double)outNum/(double)outTotalNum;			
		}
	}
	
	public String getName() {
		return name;
	}
	
	public int addInNum(int num) {
		return inNum += num;
	}
	
	public int addOutNum(int num) {
		return outNum += num;
	}

	public int getInNum() {
		return inNum;
	}
	public void setInNum(int inNum) {
		this.inNum = inNum;
	}
	public int getOutNum() {
		return outNum;
	}
	public void setOutNum(int outNum) {
		this.outNum = outNum;
	}
	public double getInRate() {
		return inRate;
	}
	public void setInRate(double inRate) {
		this.inRate = inRate;
	}
	public double getOutRate() {
		return outRate;
	}
	public void setOutRate(double outRate) {
		this.outRate = outRate;
	}
}
