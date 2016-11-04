package com.Project.rentacar;

import java.util.List;

public interface RentacarDao {

	List<RentacarModel> rentacarList();

	List<RentacarModel> rentacarLatLng(RentacarModel rentacarModel);

	List<RentacarModel> rentacarOneView(String car_no);

}
