package com.Project.notify;

import java.util.List;
import javax.annotation.Resource;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.Project.notify.NotifyDAO;
import com.Project.notify.NotifyModel;

@Service
public class NotifyService implements NotifyDAO {

	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	//글목록
	@Override
	public List<NotifyModel> noticeList() {
		return sqlSessionTemplate.selectList("notice.noticeList"); 
	}

	//글쓰기
	@Override
	public int noticeWrite(NotifyModel NotifyModel) {
		return sqlSessionTemplate.insert("notice.noticeWrite", NotifyModel);
	}
	
	//글 하나 불러오기
	@Override
	public NotifyModel noticeView(int no) {
		return sqlSessionTemplate.selectOne("notice.noticeView",no); 
	}
	
	//조회수 증가
	@Override
	public int noticeUpdateReadcount(int no) {
		return sqlSessionTemplate.update("notice.noticeUpdateReadcount",no); 
	}

	//제목으로 검색
	@Override
	public List<NotifyModel> noticeSearch0(String search) {
		return sqlSessionTemplate.selectList("notice.noticeSearch0", "%"+search+"%"); 
	}
	
	//내용으로 검색
	@Override
	public List<NotifyModel> noticeSearch1(String search) {
		return sqlSessionTemplate.selectList("notice.noticeSearch1", "%"+search+"%"); 
	}
	
	//작성자로 검색
	@Override
	public List<NotifyModel> noticeSearch2(String search) {
		return sqlSessionTemplate.selectList("notice.noticeSearch2", "%"+search+"%"); 
	}

	//글수정
	@Override
	public int noticeModify(NotifyModel NotifyModel) {
		return sqlSessionTemplate.update("notice.noticeModify",NotifyModel); 
	}

	//글삭제
	@Override
	public int noticeDelete(int no) {
		return sqlSessionTemplate.update("notice.noticeDelete",no); 
	}
}
