package com.Project.review;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.Project.review.ReviewModel;
import com.Project.review.ReviewDAO;

@Service
public class ReviewService implements ReviewDAO {

	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	//리스트
	@Override
	public List<ReviewModel> reviewList() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("review.reviewList");
	}
	
	//글쓰기reviewWrite
	@Override
	public int reviewWrite(ReviewModel reviewModel) {
		return sqlSessionTemplate.insert("review.reviewWrite", reviewModel);
	}
	
	//글 하나 불러오기
	@Override
	public ReviewModel reviewView(int no) {
		return sqlSessionTemplate.selectOne("review.reviewView",no); 
	}
	
	//조회수 증가
	@Override
	public int reviewUpdateReadhit(int no) {
		return sqlSessionTemplate.update("review.reviewUpdateReadhit",no); 
	}
	
	//제목으로 검색
	@Override
	public List<ReviewModel> reviewSearch0(String search) {
		return sqlSessionTemplate.selectList("review.reviewSearch0", "%"+search+"%"); 
	}
		
	//내용으로 검색
	@Override
	public List<ReviewModel> reviewSearch1(String search) {
		return sqlSessionTemplate.selectList("review.reviewSearch1", "%"+search+"%"); 
	}
		
	//작성자로 검색
	@Override
	public List<ReviewModel> reviewSearch2(String search) {
		return sqlSessionTemplate.selectList("review.reviewSearch2", "%"+search+"%"); 
	}
	
	//글삭제
	@Override
	public int reviewDelete(int no) {
		return sqlSessionTemplate.update("review.reviewDelete",no); 
	}
	//글수정
	@Override
	public int reviewModify(ReviewModel reviewModel) {
		return sqlSessionTemplate.update("review.reviewModify",reviewModel); 
	}
	/*
	//댓글목록
	@Override
	public List<ReviewcommModel> reviewcommList(int no) {
		return sqlSessionTemplate.selectList("review.reviewcommList", no); 
	}
	
	//댓글쓰기
	@Override
	public int reviewcommWrite(ReviewcommModel reviewcommModel){
		return sqlSessionTemplate.insert("review.reviewcommWrite", reviewcommModel); 
	}
	
	//댓글삭제
	@Override
	public int reviewcommDelete(ReviewcommModel reviewcommModel){
		return sqlSessionTemplate.delete("review.reviewcommDelete",  reviewcommModel); 
	}
	
	//댓글 모두 삭제
	@Override
	public int reviewallcommDelete(int no){
		return sqlSessionTemplate.delete("review.reviewallcommDelete", no); 
	}
	
	//댓글 총 개수
	public int reviewcommCount(int no){
		return sqlSessionTemplate.selectOne("review.reviewcommCount", no); 
	}
	
	//댓글 1 상승
	public int reviewcommUpdate1(int no){
		return sqlSessionTemplate.update("review.reviewcommUpdate1",no);
	}
			
	//댓글 1 하락
	public int reviewcommUpdate2(int no){
		return sqlSessionTemplate.update("review.reviewcommUpdate2",no);
	}*/
	
}


