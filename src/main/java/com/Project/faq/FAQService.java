package com.Project.faq;

import java.util.List;
import javax.annotation.Resource;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.Project.faq.FAQDAO;
import com.Project.faq.FAQModel;


@Service
public class FAQService implements FAQDAO{
	
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	//글목록
	@Override
	public List<FAQModel> faqList() {
		return sqlSessionTemplate.selectList("faq.faqList"); 
	}

	//글쓰기
	@Override
	public int faqWrite(FAQModel faqModel) {
		return sqlSessionTemplate.insert("faq.faqWrite", faqModel);
	}
	
	//글 하나 불러오기
	@Override
	public FAQModel faqView(int no) {
		return sqlSessionTemplate.selectOne("faq.faqView",no); 
	}
	
	//조회수 증가
	@Override
	public int faqUpdateReadcount(int no) {
		return sqlSessionTemplate.update("faq.faqUpdateReadcount",no); 
	}

	//제목으로 검색
	@Override
	public List<FAQModel> faqSearch0(String search) {
		return sqlSessionTemplate.selectList("faq.faqSearch0", "%"+search+"%"); 
	}
	
	//내용으로 검색
	@Override
	public List<FAQModel> faqSearch1(String search) {
		return sqlSessionTemplate.selectList("faq.faqSearch1", "%"+search+"%"); 
	}
	
	//작성자로 검색
	@Override
	public List<FAQModel> faqSearch2(String search) {
		return sqlSessionTemplate.selectList("faq.faqSearch2", "%"+search+"%"); 
	}

	//글수정
	@Override
	public int faqModify(FAQModel faqModel) {
		return sqlSessionTemplate.update("faq.faqModify",faqModel); 
	}

	//글삭제
	@Override
	public int faqDelete(int no) {
		return sqlSessionTemplate.update("faq.faqDelete",no); 
	}
}