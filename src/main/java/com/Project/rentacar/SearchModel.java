package com.Project.rentacar;

public class SearchModel {
	private String car_lat;
	private String car_lng;
	private String reserve_sdate;
	private String reserve_edate;
	
	public String getCar_lat() {
		return car_lat;
	}
	public void setCar_lat(String car_lat) {
		this.car_lat = car_lat;
	}
	public String getCar_lng() {
		return car_lng;
	}
	public void setCar_lng(String car_lng) {
		this.car_lng = car_lng;
	}
	public String getReserve_sdate() {
		return reserve_sdate;
	}
	public void setReserve_sdate(String reserve_sdate) {
		this.reserve_sdate = reserve_sdate;
	}
	public String getReserve_edate() {
		return reserve_edate;
	}
	public void setReserve_edate(String reserve_edate) {
		this.reserve_edate = reserve_edate;
	}

}
