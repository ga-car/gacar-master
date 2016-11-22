package com.Project.main;

import java.util.List;
import javax.annotation.Resource;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.Project.notify.NotifyModel;
import com.Project.review.ReviewModel;

@Service
public class MainService implements MainDAO {

	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<NotifyModel> noticeList() {
		return sqlSessionTemplate.selectList("notice.noticeList_new"); 
	}
	@Override
	public List<ReviewModel> reviewList() {
		return sqlSessionTemplate.selectList("review.reviewList_new");
	}
	
	/*@Override
	public List<NotifyModel> noticeList_new() {
		return sqlSessionTemplate.selectList("main.noticeList_new"); 
	}
	
	@Override
	public List<ReviewModel> reviewList_new() {
		return sqlSessionTemplate.selectList("main.reviewList_new"); 
	}
*/
}
