package com.Project.review;

import java.util.List;

import com.Project.qna.qnaModel;

public interface ReviewDAO {

	//�۸��
	List<ReviewModel> reviewList();
	public List<ReviewModel> reviewList(String email);
	
	//�˻� (0=����, 1=����, 2=�̸�)
	List<ReviewModel> reviewSearch0(String search);
	List<ReviewModel> reviewSearch1(String search);
	List<ReviewModel> reviewSearch2(String search);

	//�۾���
	int reviewWrite(ReviewModel reviewModel);

	//�󼼺���
	ReviewModel reviewView(int no);
	
	//��ȸ�� ����
	int reviewUpdateReadhit(int no);
	
	//�� ����
	int reviewDelete(int no);

	//�� ����
	int reviewModify(ReviewModel reviewModel);

	
	/*//��۸��
	List<ReviewcommModel> reviewcommList(int no);
	
	//��۾���
	int reviewcommWrite(ReviewcommModel reviewcommModel);
	
	//��ۻ���
	int reviewcommDelete(ReviewcommModel reviewcommModel);
	
	//��� ��� ����
	int reviewallcommDelete(int no);
			
	//��� �� ����
	int reviewcommCount(int no);
	
	//��� 1 ���
	int reviewcommUpdate1(int no);
			
	//��� 1 �϶�
	int reviewcommUpdate2(int no);*/
}
