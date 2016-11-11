package com.Project.qna;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
public class qnaService implements qnaDao{

	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	//글목록
	@Override
	public List<qnaModel> qnaList() {
		return sqlSessionTemplate.selectList("qna.qnaList"); 
	}

	//글쓰기
	@Override
	public int qnaWrite(qnaModel qnaModel) {
		return sqlSessionTemplate.insert("qna.qnaWrite", qnaModel);
	}


	//글 하나 불러오기
	@Override
	public qnaModel qnaView(int no) {
		return sqlSessionTemplate.selectOne("qna.qnaView",no); 
	}

	//조회수 증가
	@Override
	public int qnaUpdateReadcount(int no) {
		return sqlSessionTemplate.update("qna.qnaUpdateReadcount",no); 
	}

	//글삭제
	@Override
	public int qnaDelete(int no) {
		return sqlSessionTemplate.update("qna.qnaDelete",no); 
	}

	//글수정
	@Override
	public int qnaModify(qnaModel qnaModel) {
		return sqlSessionTemplate.update("qna.qnaModify",qnaModel); 
	}

	//댓글목록
	@Override
	public List<qnaCommModel> qnaCommList(int no) {
		return sqlSessionTemplate.selectList("qna.qnaCommList", no); 
	}

	//댓글쓰기
	@Override
	public int qnaCommWrite(qnaCommModel qnaCommModel){
		return sqlSessionTemplate.insert("qna.qnaCommWrite", qnaCommModel); 
	}

	//댓글삭제
	@Override
	public int qnaCommDelete(qnaCommModel qnaCommModel){
		return sqlSessionTemplate.delete("qna.qnaCommDelete",  qnaCommModel); 
	}

	//댓글 모두 삭제
	@Override
	public int qnaAllCommDelete(int no){
		return sqlSessionTemplate.delete("qna.qnaAllCommDelete", no); 
	}

	//댓글 총 개수
	public int qnaCommCount(int no){
		return sqlSessionTemplate.selectOne("qna.qnaCommCount", no); 
	}

	//댓글 1 상승
	public int qnaCommUpdate1(int no){
		return sqlSessionTemplate.update("qna.qnaCommUpdate1",no);
	}

	//댓글 1 하락
	public int qnaCommUpdate2(int no){
		return sqlSessionTemplate.update("qna.qnaCommUpdate2",no);
	}
	//게시판 검색
	//제목으로 검색
	@Override
	public List<qnaModel> qnaSearch0(String search) {
		return sqlSessionTemplate.selectList("qna.qnaSearch0", "%"+search+"%"); 
	}

	//내용으로 검색
	@Override
	public List<qnaModel> qnaSearch1(String search) {
		return sqlSessionTemplate.selectList("qna.qnaSearch1", "%"+search+"%"); 
	}

	//작성자로 검색
	@Override
	public List<qnaModel> qnaSearch2(String search) {
		return sqlSessionTemplate.selectList("qna.qnaSearch2", "%"+search+"%"); 
	}

	//관리자 답변유무 확인 콤보박스
	//답변완료
	@Override
	public List<qnaModel> qnaReply1(String email) {
		return sqlSessionTemplate.selectList("qna.qnaReply1", email); 
	}

	//답변전
	@Override
	public List<qnaModel> qnaReply2(String email){
		return sqlSessionTemplate.selectList("qna.qnaReply2", email); 
	}

	//관리자 댓글 +1
	public int AdminUpdateReply(int no){
		return sqlSessionTemplate.update("qna.AdminUpdateReply",no);
	}

	//관리자 댓글 -1
	public int AdminDeleteReply(int no){
		return sqlSessionTemplate.update("qna.AdminDeleteReply",no);
	}

	public List<qnaModel> qnaList(String email) {
		return sqlSessionTemplate.selectList("qna.qnaMyList", email); 
	}
}