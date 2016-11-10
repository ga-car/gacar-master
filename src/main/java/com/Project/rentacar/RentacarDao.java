package com.Project.rentacar;

import java.util.List;

public interface RentacarDao {

	List<RentacarModel> rentacarList();

	List<RentacarModel> rentacarLatLng(RentacarModel rentacarModel);

	RentacarModel rentacarOneView(String car_no);

	int insertReserve(ReserveModel reserveModel);

}
