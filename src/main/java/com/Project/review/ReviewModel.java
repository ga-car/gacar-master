package com.Project.review;

import java.io.File;
import java.util.Date;

public class ReviewModel {

	private int no;
	private String content;
	private String subject;
	private String email;
	private String name;
	private Date regdate;
	private int readcount;
	private String imagefile_orgname;
	private String imagefile_savname;
	private String car;
	private String usedate;

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
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
	public String getImagefile_orgname() {
		return imagefile_orgname;
	}
	public void setImagefile_orgname(String imagefile_orgname) {
		this.imagefile_orgname = imagefile_orgname;
	}
	public String getImagefile_savname() {
		return imagefile_savname;
	}
	public void setImagefile_savname(String imagefile_savname) {
		this.imagefile_savname = imagefile_savname;
	}
	public String getCar() {
		return car;
	}
	public void setCar(String car) {
		this.car = car;
	}
	public String getUsedate() {
		return usedate;
	}
	public void setUsedate(String usedate) {
		this.usedate = usedate;
	}
	
	
}
