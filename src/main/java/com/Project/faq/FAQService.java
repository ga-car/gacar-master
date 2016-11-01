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
	
	//�۸��
	@Override
	public List<FAQModel> faqList() {
		return sqlSessionTemplate.selectList("faq.faqList"); 
	}

	//�۾���
	@Override
	public int faqWrite(FAQModel faqModel) {
		return sqlSessionTemplate.insert("faq.faqWrite", faqModel);
	}
	
	//�� �ϳ� �ҷ�����
	@Override
	public FAQModel faqView(int no) {
		return sqlSessionTemplate.selectOne("faq.faqView",no); 
	}
	
	//��ȸ�� ����
	@Override
	public int faqUpdateReadcount(int no) {
		return sqlSessionTemplate.update("faq.faqUpdateReadcount",no); 
	}

	//�������� �˻�
	@Override
	public List<FAQModel> faqSearch0(String search) {
		return sqlSessionTemplate.selectList("faq.faqSearch0", "%"+search+"%"); 
	}
	
	//�������� �˻�
	@Override
	public List<FAQModel> faqSearch1(String search) {
		return sqlSessionTemplate.selectList("faq.faqSearch1", "%"+search+"%"); 
	}
	
	//�ۼ��ڷ� �˻�
	@Override
	public List<FAQModel> faqSearch2(String search) {
		return sqlSessionTemplate.selectList("faq.faqSearch2", "%"+search+"%"); 
	}

	//�ۼ���
	@Override
	public int faqModify(FAQModel faqModel) {
		return sqlSessionTemplate.update("faq.faqModify",faqModel); 
	}

	//�ۻ���
	@Override
	public int faqDelete(int no) {
		return sqlSessionTemplate.update("faq.faqDelete",no); 
	}
}