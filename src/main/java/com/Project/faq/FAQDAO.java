package com.Project.faq;

import java.util.List;

import com.Project.faq.FAQModel;

public interface FAQDAO {

	//�۸��
	List<FAQModel> faqList();

	//�۾���
	int faqWrite(FAQModel faqModel);

	//�� �󼼺���
	FAQModel faqView(int no);
	
	//��ȸ�� ����
	int faqUpdateReadcount(int no);

	//�˻� (0=����, 1=����, 2=�̸�)
	List<FAQModel> faqSearch0(String search);
	List<FAQModel> faqSearch1(String search);
	List<FAQModel> faqSearch2(String search);
	
	//�ۼ���
	int faqModify(FAQModel faqModel);

	//�ۻ���
	int faqDelete(int no);
	
}