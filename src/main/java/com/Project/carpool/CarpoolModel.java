package com.Project.carpool;

import java.util.Date;

public class CarpoolModel {

	private int no;
	private String name;
	private String subject;
	private String content;
	private Date regdate;
	private int readcount;
	private double slat;
	private double slng;
	private double elat;
	private double elng;
	private String saddr;
	private String eaddr;
	private String startdate;
	private String goal;
	private String term;
	private String charge;
	private String smoke;
	private String insure;
	private String pnum1;
	private String pnum2;
	
	
	public String getPnum1() {
		return pnum1;
	}
	public void setPnum1(String pnum1) {
		this.pnum1 = pnum1;
	}
	public String getPnum2() {
		return pnum2;
	}
	public void setPnum2(String pnum2) {
		this.pnum2 = pnum2;
	}
	public String getTerm() {
		return term;
	}
	public void setTerm(String term) {
		this.term = term;
	}
	public String getCharge() {
		return charge;
	}
	public void setCharge(String charge) {
		this.charge = charge;
	}
	public String getSmoke() {
		return smoke;
	}
	public void setSmoke(String smoke) {
		this.smoke = smoke;
	}
	public String getInsure() {
		return insure;
	}
	public void setInsure(String insure) {
		this.insure = insure;
	}
	public String getGoal() {
		return goal;
	}
	public void setGoal(String goal) {
		this.goal = goal;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getSaddr() {
		return saddr;
	}
	public void setSaddr(String saddr) {
		this.saddr = saddr;
	}
	public String getEaddr() {
		return eaddr;
	}
	public void setEaddr(String eaddr) {
		this.eaddr = eaddr;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public double getSlat() {
		return slat;
	}
	public void setSlat(double slat) {
		this.slat = slat;
	}
	public double getSlng() {
		return slng;
	}
	public void setSlng(double slng) {
		this.slng = slng;
	}
	public double getElat() {
		return elat;
	}
	public void setElat(double elat) {
		this.elat = elat;
	}
	public double getElng() {
		return elng;
	}
	public void setElng(double elng) {
		this.elng = elng;
	}
}
