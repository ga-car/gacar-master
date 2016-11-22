package com.Project.main;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.Project.notify.NotifyModel;
import com.Project.review.ReviewModel;

@Controller
public class MainController {
	
	@Resource
	private MainService mainService;
	
	ModelAndView mav = new ModelAndView();
	
	
	@RequestMapping(value="main.do")
	public ModelAndView main(){
		List<NotifyModel> noticeList;
		List<ReviewModel> reviewList;
		
		noticeList = mainService.noticeList();
		reviewList = mainService.reviewList();
		
		mav.addObject("noticeList", noticeList);
		mav.addObject("reviewList_new", reviewList);
		mav.setViewName("main");
		return mav;
	}
	
}
