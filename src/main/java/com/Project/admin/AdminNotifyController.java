package com.Project.admin;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.Project.notify.NotifyModel;
import com.Project.notify.NotifyService;
import com.Project.util.Paging;
import com.Project.validator.NoticeValidator;


@Controller
@RequestMapping("/admin/notify")
public class AdminNotifyController {

	@Resource
	private NotifyService notifyService;
	private int searchNum;
	private String isSearch;
	
	private int currentPage = 1;	 
	private int totalCount; 		 
	private int blockCount = 10;	 
	private int blockPage = 5; 	 
	private String pagingHtml;  
	private Paging page;	
	
	
	@RequestMapping(value="/list.do", method=RequestMethod.GET)
	public ModelAndView noticeList(HttpServletRequest request) throws UnsupportedEncodingException
	{ 
	ModelAndView mav = new ModelAndView();
		
		if(request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() || request.getParameter("currentPage").equals("0")) {
            currentPage = 1;
        } else {
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
        }

		List<NotifyModel> noticeList;
		
		
		String isSearch = request.getParameter("isSearch");
		if(isSearch != null) isSearch = new String(isSearch.getBytes("8859_1"), "UTF-8");
		
		
		if(isSearch != null)
		{
			searchNum = Integer.parseInt(request.getParameter("searchNum"));

			if(searchNum==0)
				noticeList = notifyService.noticeSearch0(isSearch);
			else if(searchNum==1)
				noticeList = notifyService.noticeSearch1(isSearch);
			else /*if(searchN==2)*/
				noticeList = notifyService.noticeSearch2(isSearch);
		
			totalCount = noticeList.size();
			page = new Paging(currentPage, totalCount, blockCount, blockPage, "noticeList", searchNum, isSearch);
			pagingHtml = page.getPagingHtml().toString();
		
			int lastCount = totalCount;
		
			if(page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;
			
			noticeList = noticeList.subList(page.getStartCount(), lastCount);
		
			mav.addObject("isSearch", isSearch);
			mav.addObject("searchNum", searchNum);
			mav.addObject("totalCount", totalCount);
			mav.addObject("pagingHtml", pagingHtml);
			mav.addObject("currentPage", currentPage);
			mav.addObject("noticeList", noticeList);
			mav.setViewName("noticeadminList");
			return mav;
		}
		
		noticeList = notifyService.noticeList();
		
		totalCount = noticeList.size();
		
		page = new Paging(currentPage, totalCount, blockCount, blockPage, "noticeList");
		pagingHtml=page.getPagingHtml().toString();  
		
		int lastCount = totalCount;
		 
		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;
		 
		noticeList = noticeList.subList(page.getStartCount(), lastCount);
		
		mav.addObject("totalCount", totalCount);
		mav.addObject("pagingHtml", pagingHtml);
		mav.addObject("currentPage", currentPage);
		mav.addObject("noticeList", noticeList);
		mav.setViewName("noticeadminList");
		return mav;
	}

	//공지사항 상세보기
	@RequestMapping("/detail.do")
	public ModelAndView noticeView(HttpServletRequest request){
		   
		ModelAndView mav = new ModelAndView();
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		NotifyModel notifyModel = notifyService.noticeView(no);
		
		notifyService.noticeUpdateReadcount(no);
		
		mav.addObject("currentPage", currentPage);
		mav.addObject("notifyModel", notifyModel);
		mav.setViewName("noticeadminView");
		
		return mav;
	}
	
	//공지사항 글쓰기 폼
		@RequestMapping(value="/write.do", method=RequestMethod.GET)
		public ModelAndView noticeForm(HttpServletRequest request) {
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("notifyModel", new NotifyModel());
			mav.setViewName("noticeadminForm");
			return mav;
		}
		
		//공지사항 글쓰기
		@RequestMapping(value="/write.do", method=RequestMethod.POST)
		public ModelAndView noticeWrite(@ModelAttribute("notifyModel") NotifyModel notifyModel, BindingResult result, 
				HttpServletRequest request, HttpSession session){
			System.out.println(notifyModel.getSubject());
			ModelAndView mav = new ModelAndView();
			
			new NoticeValidator().validate(notifyModel, result);
			
			if(result.hasErrors()) {
				mav.setViewName("noticeadminForm");
				return mav;
			}
			
			String content = notifyModel.getContent().replaceAll("\r\n", "<br />");
			notifyModel.setContent(content);
			
			notifyService.noticeWrite(notifyModel);
			
			mav.addObject("notifyModel", notifyModel);
			mav.setViewName("redirect:list.do");
			
			return mav;
		}
		
		//공지사항 삭제
		@RequestMapping("/delete.do")
		public ModelAndView noticeDelete(HttpServletRequest request){
			
			ModelAndView mav = new ModelAndView();
			int no = Integer.parseInt(request.getParameter("no"));
			notifyService.noticeDelete(no);
			mav.setViewName("redirect:/admin/notify/list.do");
			
			return mav;	
		}
		
		//공지사항 수정폼
		@RequestMapping("/modify.do")
		public ModelAndView noticeModifyForm(@ModelAttribute("notifyModel") NotifyModel notifyModel, BindingResult result, HttpServletRequest request){
			
			ModelAndView mav = new ModelAndView();
			notifyModel = notifyService.noticeView(notifyModel.getNo());
			
			String content = notifyModel.getContent().replaceAll("<br />", "\r\n");
			notifyModel.setContent(content);
			
			mav.addObject("notifyModel", notifyModel);
			mav.setViewName("noticeadminModify");
			
			return mav;	
		}
		
		//공지사항 수정
		@RequestMapping("/modifySuccess.do")
		public ModelAndView noticeModify(@ModelAttribute("notifyModel") NotifyModel notifyModel, HttpServletRequest request){
			
			ModelAndView mav = new ModelAndView("redirect:/admin/notify/list.do");
			
			String content = notifyModel.getContent().replaceAll("\r\n", "<br />");
			notifyModel.setContent(content);
			
			notifyService.noticeModify(notifyModel);
			
			mav.addObject("no", notifyModel.getNo());
			
			return mav;	
		}
	
}
