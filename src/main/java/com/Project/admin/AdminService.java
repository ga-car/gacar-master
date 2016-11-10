package com.Project.admin;

import java.util.List;

import javax.annotation.Resource;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.Project.member.MemberModel;
import com.Project.rentacar.RentacarModel;
import com.Project.rentacar.ReserveModel;

@Service
public class AdminService implements AdminDAO {

	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	// 차등록
	@Override
	public List<RentacarModel> rentacarAdminList() {
		return sqlSessionTemplate.selectList("rentacar.rentacarAdminList");
	}

	@Override
	public int insertRentacar(RentacarModel reatacarModel) {
		return sqlSessionTemplate.insert("rentacar.insertRentacar", reatacarModel);
	}

	@Override
	public List<ReserveModel> reserveAdminList() {
		return sqlSessionTemplate.selectList("reserve.reserveAdminList");
	}

	// 회원목록 출력
	@Override
	public List<MemberModel> memberList() {
		return sqlSessionTemplate.selectList("member.memberList");
	}

	public List<MemberModel> withdrawList() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("member.withdrawList");
	}

	// 회원 삭제
	public int deleteMem(String email) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete("member.deleteMember", email);

	}

	public int updateRestoreMem(String email) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete("member.updateRestoreMem", email);

	}

	// 회원수정
	@Override
	public Object adminUpdateMem(MemberModel mem) {
		return sqlSessionTemplate.update("member.adminUpdateMem", mem);
	}

	@Override
	public Object adminUpdate(MemberModel mem) {
		return sqlSessionTemplate.update("member.adminUpdate", mem);
	}

	// 회원이름으로 검색
	@Override
	public List<MemberModel> memberSearch1(String search) {
		return sqlSessionTemplate.selectList("member.memberSearch1", "%" + search + "%");
	}

	@Override
	public List<MemberModel> memberSearch2(String search) {
		return sqlSessionTemplate.selectList("member.memberSearch2", "%" + search + "%");
	}

}
