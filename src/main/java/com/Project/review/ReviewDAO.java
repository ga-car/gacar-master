package com.Project.review;

import java.util.List;

public interface ReviewDAO {

	//글목록
	List<ReviewModel> reviewList();
	
	//검색 (0=제목, 1=내용, 2=이름)
	List<ReviewModel> reviewSearch0(String search);
	List<ReviewModel> reviewSearch1(String search);
	List<ReviewModel> reviewSearch2(String search);

	//글쓰기
	int reviewWrite(ReviewModel reviewModel);

	//상세보기
	ReviewModel reviewView(int no);
	
	//조회수 증가
	int reviewUpdateReadhit(int no);
	
	//글 삭제
	int reviewDelete(int no);

	//글 수정
	int reviewModify(ReviewModel reviewModel);
	
	/*//댓글목록
	List<ReviewcommModel> reviewcommList(int no);
	
	//댓글쓰기
	int reviewcommWrite(ReviewcommModel reviewcommModel);
	
	//댓글삭제
	int reviewcommDelete(ReviewcommModel reviewcommModel);
	
	//댓글 모두 삭제
	int reviewallcommDelete(int no);
			
	//댓글 총 개수
	int reviewcommCount(int no);
	
	//댓글 1 상승
	int reviewcommUpdate1(int no);
			
	//댓글 1 하락
	int reviewcommUpdate2(int no);*/
}
