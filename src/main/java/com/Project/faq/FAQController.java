package com.Project.faq;

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

import com.Project.faq.FAQModel;
import com.Project.faq.FAQService;
import com.Project.util.Paging;
import com.Project.validator.FaqValidator;

@Controller
@RequestMapping("/faq")
public class FAQController {

	@Resource
	private FAQService faqService;
	private int searchNum;
	private String isSearch;
	
	//����¡�� ���� ���� ����
	private int currentPage = 1;	 
	private int totalCount; 		 
	private int blockCount = 10;	 
	private int blockPage = 5; 	 
	private String pagingHtml;  
	private Paging page;

	//����Ʈ ó��(�˻�)
	@RequestMapping(value="/list.do", method=RequestMethod.GET)
	public ModelAndView faqList(HttpServletRequest request) throws UnsupportedEncodingException{
		
		ModelAndView mav = new ModelAndView();
		
		if(request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() || request.getParameter("currentPage").equals("0")) {
            currentPage = 1;
        } else {
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
        }

		List<FAQModel> faqList;
		
		
		String isSearch = request.getParameter("isSearch");
		if(isSearch != null) isSearch = new String(isSearch.getBytes("8859_1"), "UTF-8");
		
		
		if(isSearch != null)
		{
			searchNum = Integer.parseInt(request.getParameter("searchNum"));

			if(searchNum==0)
				faqList = faqService.faqSearch0(isSearch);
			else if(searchNum==1)
				faqList = faqService.faqSearch1(isSearch);
			else /*if(searchN==2)*/
				faqList = faqService.faqSearch2(isSearch);
		
			totalCount = faqList.size();
			page = new Paging(currentPage, totalCount, blockCount, blockPage, "faqList", searchNum, isSearch);
			pagingHtml = page.getPagingHtml().toString();
		
			int lastCount = totalCount;
		
			if(page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;
			
			faqList = faqList.subList(page.getStartCount(), lastCount);
		
			mav.addObject("isSearch", isSearch);
			mav.addObject("searchNum", searchNum);
			mav.addObject("totalCount", totalCount);
			mav.addObject("pagingHtml", pagingHtml);
			mav.addObject("currentPage", currentPage);
			mav.addObject("faqList", faqList);
			mav.setViewName("faqList");
			return mav;
		}
		
		faqList = faqService.faqList();
		
		totalCount = faqList.size();
		
		page = new Paging(currentPage, totalCount, blockCount, blockPage, "faqList");
		pagingHtml=page.getPagingHtml().toString();  
		
		int lastCount = totalCount;
		 
		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;
		 
		faqList = faqList.subList(page.getStartCount(), lastCount);
		
		mav.addObject("totalCount", totalCount);
		mav.addObject("pagingHtml", pagingHtml);
		mav.addObject("currentPage", currentPage);
		mav.addObject("faqList", faqList);
		mav.setViewName("faqList");
		return mav;
	}

	//FAQ �󼼺���
	@RequestMapping("/view.do")
	public ModelAndView faqView(HttpServletRequest request){
		   
		ModelAndView mav = new ModelAndView();
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		FAQModel faqModel = faqService.faqView(no);
		
		faqService.faqUpdateReadcount(no);
		
		mav.addObject("currentPage", currentPage);
		mav.addObject("faqModel", faqModel);
		mav.setViewName("faqView");
		
		return mav;
	}
	/*
	//FAQ �۾��� ��
	@RequestMapping(value="/Write.do", method=RequestMethod.GET)
	public ModelAndView faqForm(HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("faqModel", new FAQModel());
		mav.setViewName("faqForm");
		return mav;
	}
	
	//�������� �۾���
	@RequestMapping(value="/Write.do", method=RequestMethod.POST)
	public ModelAndView faqWrite(@ModelAttribute("faqModel") FAQModel faqModel, BindingResult result, 
			HttpServletRequest request, HttpSession session){
		
		ModelAndView mav = new ModelAndView();
		
		new FaqValidator().validate(faqModel, result);
		
		if(result.hasErrors()) {
			mav.setViewName("faqForm");
			return mav;
		}
		
		String content = faqModel.getContent().replaceAll("\r\n", "<br />");
		faqModel.setContent(content);
		
		faqService.faqWrite(faqModel);
		
		mav.addObject("faqModel", faqModel);
		mav.setViewName("redirect:faq/list.do");
		
		return mav;
	}
	
	//�������� ����
	@RequestMapping("/Delete.do")
	public ModelAndView faqDelete(HttpServletRequest request){
		
		ModelAndView mav = new ModelAndView();
		int no = Integer.parseInt(request.getParameter("no"));
		faqService.faqDelete(no);
		mav.setViewName("redirect:faq/list.do");
		
		return mav;	
	}
	
	//�������� ������
	@RequestMapping("/modify.do")
	public ModelAndView faqModifyForm(@ModelAttribute("faqModel") FAQModel faqModel, BindingResult result, HttpServletRequest request){
		
		ModelAndView mav = new ModelAndView();
		faqModel = faqService.faqView(faqModel.getNo());
		
		String content = faqModel.getContent().replaceAll("<br />", "\r\n");
		faqModel.setContent(content);
		
		mav.addObject("faqModel", faqModel);
		mav.setViewName("faqModify");
		
		return mav;	
	}
	
	//�������� ����
	@RequestMapping("/modifySuccess.do")
	public ModelAndView faqModify(@ModelAttribute("faqModel") FAQModel faqModel, HttpServletRequest request){
		
		ModelAndView mav = new ModelAndView("redirect:faq/view.do");
		
		String content = faqModel.getContent().replaceAll("\r\n", "<br />");
		faqModel.setContent(content);
		
		faqService.faqModify(faqModel);
		
		mav.addObject("no", faqModel.getNo());
		
		return mav;	
	}*/
}
