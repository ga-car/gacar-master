package com.Project.main;

import java.util.List;

import com.Project.notify.NotifyModel;
import com.Project.review.ReviewModel;

public interface MainDAO {

	List<NotifyModel> noticeList();
	List<ReviewModel> reviewList();
	/*List<NotifyModel> noticeList_new();
	List<ReviewModel> reviewList_new();*/
	
	
}
