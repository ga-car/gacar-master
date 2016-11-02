package com.Project.admin;

import java.util.List;

import com.Project.rentacar.RentacarModel;

public interface AdminDAO {
	
	int insertRentacar(RentacarModel reatacarModel);

	List<RentacarModel> rentacarAdminList();
}
