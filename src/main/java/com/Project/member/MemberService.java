package com.Project.member;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.Project.member.MemberModel;
import com.Project.member.ZipcodeModel;

@Service
public class MemberService implements MemberDao {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public Object insertMember(MemberModel mem) {
		return sqlSessionTemplate.insert("member.insertMember", mem);
	}

	@Override
	public MemberModel getMember(String email) {
		return sqlSessionTemplate.selectOne("member.getMember", email);
	}

	@Override
	public List<ZipcodeModel> zipcodeCheck(ZipcodeModel zipcodeModel) throws Exception {
		return sqlSessionTemplate.selectList("member.zipcodeCheck", zipcodeModel);
	}

	@Override
	public MemberModel login(MemberModel mem) {
		return sqlSessionTemplate.selectOne("member.login", mem);
	}

	@Override
	public MemberModel emailFind(MemberModel mem) {
		return sqlSessionTemplate.selectOne("member.emailFind", mem);
	}

	@Override
	public MemberModel pwFind(MemberModel mem) {
		return sqlSessionTemplate.selectOne("member.pwFind", mem);
	}

	public Object insertDelMem(MemberModel mem) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("member.insertDelMem", mem);

	}

	public Object updateDelMem(MemberModel mem) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("member.updateDelMem", mem);

	}

	public Object memberDel(String email) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete("member.deleteMember", email);

	}

	public Object updateMember(MemberModel mem) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("member.updateMember", mem);
	}

}
