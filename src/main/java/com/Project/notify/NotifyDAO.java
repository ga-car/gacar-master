package com.Project.notify;

import java.util.List;

public interface NotifyDAO {

	List<NotifyModel> noticeList();
	
	int noticeWrite(NotifyModel notifyModel);
	
	NotifyModel noticeView(int no);
	
	int noticeUpdateReadcount(int no);
	
	List<NotifyModel> noticeSearch0(String search);
	
	List<NotifyModel> noticeSearch1(String search);
	
	List<NotifyModel> noticeSearch2(String search);
	
	int noticeModify(NotifyModel notifyModel);
	
	int noticeDelete(int no);
}
