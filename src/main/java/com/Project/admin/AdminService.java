package com.Project.admin;

import java.util.List;

import javax.annotation.Resource;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.Project.member.MemberModel;
import com.Project.rentacar.RentacarModel;

@Service
public class AdminService implements AdminDAO {

	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<RentacarModel> rentacarAdminList() {
		return sqlSessionTemplate.selectList("admin.rentacarAdminList"); 
	}

	@Override
	public int insertRentacar(RentacarModel reatacarModel) {
		return sqlSessionTemplate.insert("admin.insertRentacar", reatacarModel);
	}
	
	//회원목록 출력
		@Override
		public List<MemberModel> memberList() {
			return sqlSessionTemplate.selectList("member.memberList");
		}

		public List<MemberModel> withdrawList() {
			// TODO Auto-generated method stub
			return sqlSessionTemplate.selectList("member.withdrawList");
		}

}
