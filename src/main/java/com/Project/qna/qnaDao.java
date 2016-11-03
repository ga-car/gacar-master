package com.Project.qna;

import java.util.List;


public interface qnaDao {

		//글목록
		List<qnaModel> qnaList();
		
		//글쓰기
		int qnaWrite(qnaModel qnaModel);

		//글 상세보기
		qnaModel qnaView(int no);
		
		//조회수 증가
		int qnaUpdateReadcount(int no);
		
		//글삭제
		int qnaDelete(int no);
		
		//글수정
		int qnaModify(qnaModel qnaModel);
		
		//댓글목록
		List<qnaCommModel> qnaCommList(int no);
		
		//댓글쓰기
		int qnaCommWrite(qnaCommModel qnaCommModel);
	
		//댓글삭제
		int qnaCommDelete(qnaCommModel qnaCommModel);
		
		//댓글 모두 삭제
		int qnaAllCommDelete(int no);
		
		//댓글 총 개수
		int qnaCommCount(int no);
		
		//댓글 1 상승
		int qnaCommUpdate1(int no);
		
		//댓글 1 하락
		int qnaCommUpdate2(int no);
		
		//검색 (0=제목, 1=내용, 2=이름)
		List<qnaModel> qnaSearch0(String search);
		List<qnaModel> qnaSearch1(String search);
		List<qnaModel> qnaSearch2(String search);
		
		//답변유무 검색(1=답변완료, 2=답변전)
		List<qnaModel> qnaReply1();
		List<qnaModel> qnaReply2();
	
		//관리자 댓글 +1
		int AdminUpdateReply(int no);
		
		//관리자 댓글 -1
		int AdminDeleteReply(int no);
}