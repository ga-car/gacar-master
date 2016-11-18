package com.Project.review;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.Project.review.ReviewModel;
import com.Project.qna.qnaModel;
import com.Project.review.ReviewDAO;

@Service
public class ReviewService implements ReviewDAO {

	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	//����Ʈ

	public List<ReviewModel> reviewList(String email) {
		return sqlSessionTemplate.selectList("review.reviewMyList", email); 
	}
	
	@Override
	public List<ReviewModel> reviewList() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("review.reviewList");
	}
	
	
	//�۾���reviewWrite
	@Override
	public int reviewWrite(ReviewModel reviewModel) {
		return sqlSessionTemplate.insert("review.reviewWrite", reviewModel);
	}
	
	//�� �ϳ� �ҷ�����
	@Override
	public ReviewModel reviewView(int no) {
		return sqlSessionTemplate.selectOne("review.reviewView",no); 
	}
	
	//��ȸ�� ����
	@Override
	public int reviewUpdateReadhit(int no) {
		return sqlSessionTemplate.update("review.reviewUpdateReadhit",no); 
	}
	
	//�������� �˻�
	@Override
	public List<ReviewModel> reviewSearch0(String search) {
		return sqlSessionTemplate.selectList("review.reviewSearch0", "%"+search+"%"); 
	}
		
	//�������� �˻�
	@Override
	public List<ReviewModel> reviewSearch1(String search) {
		return sqlSessionTemplate.selectList("review.reviewSearch1", "%"+search+"%"); 
	}
		
	//�ۼ��ڷ� �˻�
	@Override
	public List<ReviewModel> reviewSearch2(String search) {
		return sqlSessionTemplate.selectList("review.reviewSearch2", "%"+search+"%"); 
	}
	
	//�ۻ���
	@Override
	public int reviewDelete(int no) {
		return sqlSessionTemplate.update("review.reviewDelete",no); 
	}
	//�ۼ���
	@Override
	public int reviewModify(ReviewModel reviewModel) {
		return sqlSessionTemplate.update("review.reviewModify",reviewModel); 
	}
	/*
	//��۸��
	@Override
	public List<ReviewcommModel> reviewcommList(int no) {
		return sqlSessionTemplate.selectList("review.reviewcommList", no); 
	}
	
	//��۾���
	@Override
	public int reviewcommWrite(ReviewcommModel reviewcommModel){
		return sqlSessionTemplate.insert("review.reviewcommWrite", reviewcommModel); 
	}
	
	//��ۻ���
	@Override
	public int reviewcommDelete(ReviewcommModel reviewcommModel){
		return sqlSessionTemplate.delete("review.reviewcommDelete",  reviewcommModel); 
	}
	
	//��� ��� ����
	@Override
	public int reviewallcommDelete(int no){
		return sqlSessionTemplate.delete("review.reviewallcommDelete", no); 
	}
	
	//��� �� ����
	public int reviewcommCount(int no){
		return sqlSessionTemplate.selectOne("review.reviewcommCount", no); 
	}
	
	//��� 1 ���
	public int reviewcommUpdate1(int no){
		return sqlSessionTemplate.update("review.reviewcommUpdate1",no);
	}
			
	//��� 1 �϶�
	public int reviewcommUpdate2(int no){
		return sqlSessionTemplate.update("review.reviewcommUpdate2",no);
	}*/




}


