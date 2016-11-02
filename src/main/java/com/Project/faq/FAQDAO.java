package com.Project.faq;

import java.util.List;

import com.Project.faq.FAQModel;

public interface FAQDAO {

	//글목록
	List<FAQModel> faqList();

	//글쓰기
	int faqWrite(FAQModel faqModel);

	//글 상세보기
	FAQModel faqView(int no);
	
	//조회수 증가
	int faqUpdateReadcount(int no);

	//검색 (0=제목, 1=내용, 2=이름)
	List<FAQModel> faqSearch0(String search);
	List<FAQModel> faqSearch1(String search);
	List<FAQModel> faqSearch2(String search);
	
	//글수정
	int faqModify(FAQModel faqModel);

	//글삭제
	int faqDelete(int no);
	
}