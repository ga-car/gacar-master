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

import com.Project.carpool.CarpoolModel;
import com.Project.carpool.CarpoolService;
import com.Project.carpool.AttendModel;
import com.Project.util.Paging;

@Controller
@RequestMapping("/admin/carpool")
public class AdminCarpoolController {
	
	@Resource
	private CarpoolService carpoolService;
	private int searchNum;
	private String isSearch;
	private String isSearch1;
	
	private int currentPage = 1;	 
	private int totalCount; 		 
	private int blockCount = 10;	 
	private int blockPage = 5; 	 
	private String pagingHtml;  
	private Paging page;
	
	@RequestMapping(value="/list.do", method=RequestMethod.GET)
	public ModelAndView carpoolList(HttpServletRequest request) throws UnsupportedEncodingException
	{ 
	ModelAndView mav = new ModelAndView();
		
		if(request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() || request.getParameter("currentPage").equals("0")) {
            currentPage = 1;
        } else {
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
        }

		List<CarpoolModel> carpoolList;
		
		
		String isSearch = request.getParameter("isSearch");
		/*if(isSearch != null) isSearch = new String(isSearch.getBytes("8859_1"), "UTF-8");*/
		
		
		if(isSearch != null)
		{
			searchNum = Integer.parseInt(request.getParameter("searchNum"));
			carpoolList = carpoolService.carpoolSearch1(isSearch);
			
			if(searchNum==0)
				carpoolList = carpoolService.carpoolSearch1(isSearch);
			else if(searchNum==1)
				carpoolList = carpoolService.carpoolSearch3(isSearch);
		
			totalCount = carpoolList.size();
			page = new Paging(currentPage, totalCount, blockCount, blockPage, "list", searchNum, isSearch);
			pagingHtml = page.getPagingHtml().toString();
		
			int lastCount = totalCount;
		
			if(page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;
			
			carpoolList = carpoolList.subList(page.getStartCount(), lastCount);
		
			mav.addObject("isSearch", isSearch);
			mav.addObject("searchNum", searchNum);
			mav.addObject("totalCount", totalCount);
			mav.addObject("pagingHtml", pagingHtml);
			mav.addObject("currentPage", currentPage);
			mav.addObject("carpoolList", carpoolList);
			mav.setViewName("admincarpoolList");
			return mav;
		}
		
		carpoolList = carpoolService.carpoolList();
		
		totalCount = carpoolList.size();
		
		page = new Paging(currentPage, totalCount, blockCount, blockPage, "list");
		pagingHtml=page.getPagingHtml().toString();  
		
		int lastCount = totalCount;
		 
		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;
		 
		carpoolList = carpoolList.subList(page.getStartCount(), lastCount);
		
		mav.addObject("totalCount", totalCount);
		mav.addObject("pagingHtml", pagingHtml);
		mav.addObject("currentPage", currentPage);
		mav.addObject("carpoolList", carpoolList);
		mav.setViewName("admincarpoolList");
		return mav;
	}
	
			//īǮ �۾��� ��
			@RequestMapping(value="/write.do", method=RequestMethod.GET)
			public ModelAndView carpoolForm(HttpServletRequest request) {
				
				ModelAndView mav = new ModelAndView();
				mav.addObject("carpoolModel", new CarpoolModel());
				mav.setViewName("carpoolForm");
				return mav;
			}
			
			//īǮ �۾���
			@RequestMapping(value="/write.do", method=RequestMethod.POST)
			public ModelAndView carpoolWrite(@ModelAttribute("carpoolModel") CarpoolModel carpoolModel, BindingResult result, 
					HttpServletRequest request, HttpSession session){
				System.out.println(carpoolModel.getSubject());
				ModelAndView mav = new ModelAndView();
				
				
				
				if(result.hasErrors()) {
					mav.setViewName("carpoolForm");
					return mav;
				}
				
				String content = carpoolModel.getContent().replaceAll("\r\n", "<br />");
				carpoolModel.setContent(content);
				
				carpoolService.carpoolWrite(carpoolModel);
				
				mav.addObject("carpoolModel", carpoolModel);
				mav.setViewName("redirect:list.do");
				
				return mav;
			}
			
			//īǮ �󼼺���
			@RequestMapping("/detail.do")
			public ModelAndView carpoolView(HttpServletRequest request){
				   
				ModelAndView mav = new ModelAndView();
				
				int no = Integer.parseInt(request.getParameter("no"));
				
				CarpoolModel carpoolModel = carpoolService.carpoolView(no);
				
				carpoolService.carpoolUpdateReadcount(no);
				
				mav.addObject("currentPage", currentPage);
				mav.addObject("carpoolModel", carpoolModel);
				mav.setViewName("carpoolView");
				
				return mav;
			}
			
			//īǮ ����
			@RequestMapping("/delete.do")
			public ModelAndView Delete(HttpServletRequest request){
				
				ModelAndView mav = new ModelAndView();
				int no = Integer.parseInt(request.getParameter("no"));
				carpoolService.carpoolDelete(no);
				mav.setViewName("redirect:list.do");
				
				return mav;	
			}
			
			//īǮ ������
			@RequestMapping("/modify.do")
			public ModelAndView ModifyForm(@ModelAttribute("carpoolModel") CarpoolModel carpoolModel, BindingResult result, HttpServletRequest request){
				
				ModelAndView mav = new ModelAndView();
				carpoolModel = carpoolService.carpoolView(carpoolModel.getNo());
				
				String content = carpoolModel.getContent().replaceAll("<br />", "\r\n");
				carpoolModel.setContent(content);
				
				mav.addObject("carpoolModel", carpoolModel);
				mav.setViewName("carpoolModify");
				
				return mav;	
			}
			
			//īǮ ����
			@RequestMapping("/modifySuccess.do")
			public ModelAndView Modify(@ModelAttribute("carpoolModel") CarpoolModel carpoolModel, HttpServletRequest request){
				
				ModelAndView mav = new ModelAndView("redirect:list.do");
				
				String content = carpoolModel.getContent().replaceAll("\r\n", "<br />");
				carpoolModel.setContent(content);
				
				carpoolService.carpoolModify(carpoolModel);
				
				mav.addObject("no", carpoolModel.getNo());
				
				return mav;	
			}
			

			
			@RequestMapping(value="/attendlist.do", method=RequestMethod.GET)
			public ModelAndView carpoolattendList(HttpServletRequest request) throws UnsupportedEncodingException
			{ 
			ModelAndView mav = new ModelAndView();
				
				if(request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() || request.getParameter("currentPage").equals("0")) {
		            currentPage = 1;
		        } else {
		            currentPage = Integer.parseInt(request.getParameter("currentPage"));
		        }

				List<AttendModel> attendList;
				
				
				String isSearch = request.getParameter("isSearch");
				if(isSearch != null) isSearch = new String(isSearch.getBytes("8859_1"), "UTF-8");
				
				
				if(isSearch != null)
				{
					searchNum = Integer.parseInt(request.getParameter("searchNum"));
					attendList = carpoolService.carpoolSearch2(isSearch);
				
					totalCount = attendList.size();
					page = new Paging(currentPage, totalCount, blockCount, blockPage, "adminattendList", searchNum, isSearch);
					pagingHtml = page.getPagingHtml().toString();
				
					int lastCount = totalCount;
				
					if(page.getEndCount() < totalCount)
						lastCount = page.getEndCount() + 1;
					
					attendList = attendList.subList(page.getStartCount(), lastCount);
				
					mav.addObject("isSearch", isSearch);
					mav.addObject("searchNum", searchNum);
					mav.addObject("totalCount", totalCount);
					mav.addObject("pagingHtml", pagingHtml);
					mav.addObject("currentPage", currentPage);
					mav.addObject("attendList", attendList);
					mav.setViewName("adminattendList");
					return mav;
				}
				
				attendList = carpoolService.carpoolattendList();
				
				totalCount = attendList.size();
				
				page = new Paging(currentPage, totalCount, blockCount, blockPage, "adminattendList");
				pagingHtml=page.getPagingHtml().toString();  
				
				int lastCount = totalCount;
				 
				if (page.getEndCount() < totalCount)
					lastCount = page.getEndCount() + 1;
				 
				attendList = attendList.subList(page.getStartCount(), lastCount);
				
				mav.addObject("totalCount", totalCount);
				mav.addObject("pagingHtml", pagingHtml);
				mav.addObject("currentPage", currentPage);
				mav.addObject("attendList", attendList);
				mav.setViewName("adminattendList");
				return mav;
			}
			
			@RequestMapping("/attenddelete.do")
			public ModelAndView AttendDelete(HttpServletRequest request){
				
				ModelAndView mav = new ModelAndView();
				int no = Integer.parseInt(request.getParameter("no"));
				String email = request.getParameter("email");
				carpoolService.carpoolAttendDelete(email, no);
				carpoolService.carpoolAttendDecrease(no);
				mav.setViewName("redirect:attendlist.do");
				
				return mav;	
			}

}
