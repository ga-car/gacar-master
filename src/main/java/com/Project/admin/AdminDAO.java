package com.Project.admin;

import java.util.List;

import com.Project.member.MemberModel;
import com.Project.rentacar.RentacarModel;

public interface AdminDAO {
	
	int insertRentacar(RentacarModel reatacarModel);

	List<RentacarModel> rentacarAdminList();
	//회원목록
		public List<MemberModel> memberList();
		public List<MemberModel> withdrawList();
}
