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
	
	//�۸��
	@Override
	public List<NotifyModel> noticeList() {
		return sqlSessionTemplate.selectList("notice.noticeList"); 
	}

	//�۾���
	@Override
	public int noticeWrite(NotifyModel NotifyModel) {
		return sqlSessionTemplate.insert("notice.noticeWrite", NotifyModel);
	}
	
	//�� �ϳ� �ҷ�����
	@Override
	public NotifyModel noticeView(int no) {
		return sqlSessionTemplate.selectOne("notice.noticeView",no); 
	}
	
	//��ȸ�� ����
	@Override
	public int noticeUpdateReadcount(int no) {
		return sqlSessionTemplate.update("notice.noticeUpdateReadcount",no); 
	}

	//�������� �˻�
	@Override
	public List<NotifyModel> noticeSearch0(String search) {
		return sqlSessionTemplate.selectList("notice.noticeSearch0", "%"+search+"%"); 
	}
	
	//�������� �˻�
	@Override
	public List<NotifyModel> noticeSearch1(String search) {
		return sqlSessionTemplate.selectList("notice.noticeSearch1", "%"+search+"%"); 
	}
	
	//�ۼ��ڷ� �˻�
	@Override
	public List<NotifyModel> noticeSearch2(String search) {
		return sqlSessionTemplate.selectList("notice.noticeSearch2", "%"+search+"%"); 
	}

	//�ۼ���
	@Override
	public int noticeModify(NotifyModel NotifyModel) {
		return sqlSessionTemplate.update("notice.noticeModify",NotifyModel); 
	}

	//�ۻ���
	@Override
	public int noticeDelete(int no) {
		return sqlSessionTemplate.update("notice.noticeDelete",no); 
	}
}
