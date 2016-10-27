package com.Project.member;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.Project.member.MemberModel;

@Service
public class MemberService implements MemberDao{
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public Object insertMember(MemberModel mem){
		return sqlSessionTemplate.insert("member.insertMember", mem);
	}
	
	@Override
	public MemberModel getMember(String email) {
		return sqlSessionTemplate.selectOne("member.getMember", email);
	}

}
