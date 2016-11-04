package com.Project.admin;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.Project.member.MemberModel;
import com.Project.admin.AdminService;
import com.Project.member.MemberService;
import com.Project.util.Paging;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {

	@Resource
	private AdminService adminService;
	
	@Resource
	private MemberService memberService;
	
	ModelAndView mav = new ModelAndView();
	
	//페이징
	private int searchNum;
	private String isSearch;
	
	private int currentPage = 1;	 
	private int totalCount; 		 
	private int blockCount = 7;	 
	private int blockPage = 5; 	 
	private String pagingHtml;  
	private Paging page;
	
	@RequestMapping(value = "/main.do")
	public ModelAndView adminLogin(HttpSession session) throws Exception {
		String admin = (String)session.getAttribute("session_email");
		
		if(admin==null){
			mav.addObject("invalid", 1);
			/*mav.setViewName("redirect:/main.do");*/ //redirect사용하면 left.jsp에서 ${invalid}로 값을 받지 못함
			mav.setViewName("main");
			return mav;
		} else{
			mav.setViewName("adminMain");
			return mav;		
		}
	}
	

	 //회원목록
		@RequestMapping("memberList.do")
		public ModelAndView memberList(HttpServletRequest request) throws Exception{
			
			if(request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() || request.getParameter("currentPage").equals("0")) {
	            currentPage = 1;
	        } else {
	            currentPage = Integer.parseInt(request.getParameter("currentPage"));
	        }
			
			List<MemberModel> memList=adminService.memberList();
			
			//멤버검색
			/*isSearch = request.getParameter("isSearch");
			if(isSearch != null){
				searchNum = Integer.parseInt(request.getParameter("searchNum"));

				if(searchNum==0)
					memberlist = adminService.memberSearch0(isSearch);
			
				totalCount = memberlist.size();
				page = new Paging(currentPage, totalCount, blockCount, blockPage, "memberadminList", searchNum, isSearch);
				pagingHtml = page.getPagingHtml().toString();
			
				int lastCount = totalCount;
			
				if(page.getEndCount() < totalCount)
					lastCount = page.getEndCount() + 1;
				
				memberlist = memberlist.subList(page.getStartCount(), lastCount);
			
				mav.addObject("isSearch", isSearch);
				mav.addObject("searchNum", searchNum);
				mav.addObject("totalCount", totalCount);
				mav.addObject("pagingHtml", pagingHtml);
				mav.addObject("currentPage", currentPage);
				mav.addObject("memberlist", memberlist);
				mav.setViewName("memberadminList");
				return mav;
			}*/
			
			totalCount = memList.size();
			
			page = new Paging(currentPage, totalCount, blockCount, blockPage, "memberList");
			pagingHtml=page.getPagingHtml().toString(); 
			

			int lastCount = totalCount;
			 
			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;
			 
			memList = memList.subList(page.getStartCount(), lastCount);
			
			mav.addObject("totalCount", totalCount);
			mav.addObject("pagingHtml", pagingHtml);
			mav.addObject("currentPage", currentPage);
			
			mav.addObject("memList", memList);
			mav.setViewName("memberList");
			
			return mav;
		}
		
		@RequestMapping("withdrawList.do")
		public ModelAndView withdrawList(HttpServletRequest request) throws Exception{
			
			if(request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() || request.getParameter("currentPage").equals("0")) {
	            currentPage = 1;
	        } else {
	            currentPage = Integer.parseInt(request.getParameter("currentPage"));
	        }
			
			List<MemberModel> memList=adminService.withdrawList();
			
			//멤버검색
			/*isSearch = request.getParameter("isSearch");
			if(isSearch != null){
				searchNum = Integer.parseInt(request.getParameter("searchNum"));

				if(searchNum==0)
					memberlist = adminService.memberSearch0(isSearch);
			
				totalCount = memberlist.size();
				page = new Paging(currentPage, totalCount, blockCount, blockPage, "memberadminList", searchNum, isSearch);
				pagingHtml = page.getPagingHtml().toString();
			
				int lastCount = totalCount;
			
				if(page.getEndCount() < totalCount)
					lastCount = page.getEndCount() + 1;
				
				memberlist = memberlist.subList(page.getStartCount(), lastCount);
			
				mav.addObject("isSearch", isSearch);
				mav.addObject("searchNum", searchNum);
				mav.addObject("totalCount", totalCount);
				mav.addObject("pagingHtml", pagingHtml);
				mav.addObject("currentPage", currentPage);
				mav.addObject("memberlist", memberlist);
				mav.setViewName("memberadminList");
				return mav;
			}*/
			
			totalCount = memList.size();
			
			page = new Paging(currentPage, totalCount, blockCount, blockPage, "memberList");
			pagingHtml=page.getPagingHtml().toString(); 
			

			int lastCount = totalCount;
			 
			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;
			 
			memList = memList.subList(page.getStartCount(), lastCount);
			
			mav.addObject("totalCount", totalCount);
			mav.addObject("pagingHtml", pagingHtml);
			mav.addObject("currentPage", currentPage);
			
			mav.addObject("memList", memList);
			mav.setViewName("withdrawList");
			
			return mav;
		}

		/*//회원삭제하기
		 @RequestMapping("adminMemberDelete.dog")
			public ModelAndView memberDelete(HttpServletRequest request){		
			 String id = request.getParameter("id");
			 adminService.memberDelete(id);
			 mav.setViewName("redirect:memberadminList.dog");
				
			 return mav;	
		}
		 
		//회원 1명 View 상세보기
		// 회원정보수정
	  	@RequestMapping("adminmemberModify.dog")
	  	public ModelAndView memberModify(MemberModel member, HttpServletRequest request) {		  		 		
	  		
  			member =  memberService.getMember(member.getId());
  	
  			mav.addObject("member", member);
  			mav.setViewName("memberadminModify");
  			return mav;
	  	}
	  	
	  	//회원수정 등록
	    @RequestMapping("adminmemberModifyEnd.dog")
  		public ModelAndView adminmemberModifyEnd(MemberModel member) {
  		
		System.out.println("수정시작");
		
  			adminService.adminmemberModify(member);
  			mav.setViewName("redirect:memberadminList.dog");
  			return mav;
	    }*/
}
