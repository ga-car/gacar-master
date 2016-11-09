package com.Project.admin;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
		public ModelAndView memList(HttpServletRequest request) throws Exception{
			
			
			if(request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() || request.getParameter("currentPage").equals("0")) {
	            currentPage = 1;
	        } else {
	            currentPage = Integer.parseInt(request.getParameter("currentPage"));
	        }
			
			List<MemberModel> memList=adminService.memberList();
			
			//멤버검색
			isSearch = request.getParameter("isSearch");
			if(isSearch != null){
				searchNum = Integer.parseInt(request.getParameter("searchNum"));

				if(searchNum==1)
					memList = adminService.memberSearch1(isSearch);
				if(searchNum==2)
					memList = adminService.memberSearch2(isSearch);
			
				totalCount = memList.size();
				page = new Paging(currentPage, totalCount, blockCount, blockPage, "memberadminList", searchNum, isSearch);
				pagingHtml = page.getPagingHtml().toString();
			
				int lastCount = totalCount;
			
				if(page.getEndCount() < totalCount)
					lastCount = page.getEndCount() + 1;
				
				memList = memList.subList(page.getStartCount(), lastCount);
			
				mav.addObject("isSearch", isSearch);
				mav.addObject("searchNum", searchNum);
				mav.addObject("totalCount", totalCount);
				mav.addObject("pagingHtml", pagingHtml);
				mav.addObject("currentPage", currentPage);
				mav.addObject("memList", memList);
				mav.setViewName("memberList");
				return mav;
			}
			
			totalCount = memList.size();
			
			page = new Paging(currentPage, totalCount, blockCount, blockPage, "memList");
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
			isSearch = request.getParameter("isSearch");
			if(isSearch != null){
				searchNum = Integer.parseInt(request.getParameter("searchNum"));

				if(searchNum==1)
					memList = adminService.memberSearch1(isSearch);
				if(searchNum==2)
					memList = adminService.memberSearch2(isSearch);
			
				totalCount = memList.size();
				page = new Paging(currentPage, totalCount, blockCount, blockPage, "memberadminList", searchNum, isSearch);
				pagingHtml = page.getPagingHtml().toString();
			
				int lastCount = totalCount;
			
				if(page.getEndCount() < totalCount)
					lastCount = page.getEndCount() + 1;
				
				memList = memList.subList(page.getStartCount(), lastCount);
			
				mav.addObject("isSearch", isSearch);
				mav.addObject("searchNum", searchNum);
				mav.addObject("totalCount", totalCount);
				mav.addObject("pagingHtml", pagingHtml);
				mav.addObject("currentPage", currentPage);
				mav.addObject("memList", memList);
				mav.setViewName("withdrawList");
				return mav;
			}
			
			totalCount = memList.size();
			
			page = new Paging(currentPage, totalCount, blockCount, blockPage, "memList");
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

		//회원삭제하기
		 @RequestMapping("adminMemDel.do")
			public ModelAndView memberDel(HttpServletRequest request){
			 Date deldate = new Date();
			 String email = request.getParameter("email");
	 
			 memberService.updateDelMem(email);
			 mav.setViewName("redirect:memberList.do");
				
			 return mav;	
		}
		 @RequestMapping("adminMemDel2.do")
			public ModelAndView memberDel2(HttpServletRequest request){		
			 String email = request.getParameter("email");
			 
			 adminService.deleteMem(email);
			 mav.setViewName("redirect:withdrawList.do");
				
			 return mav;	
		}
		 
		 @RequestMapping("adminMemRestore.do")
			public ModelAndView memberRestore(HttpServletRequest request){
			 String email = request.getParameter("email");
			 
			 adminService.updateRestoreMem(email);
			 mav.setViewName("redirect:withdrawList.do");
				
			 return mav;	
		}
		 
		 @RequestMapping("adminMemDetail.do")
			public ModelAndView memberDetail(HttpServletRequest request){
			 String email = request.getParameter("email");
			 String currentPage = request.getParameter("currentPage");
			 MemberModel mem = memberService.getMember(email);
			 mav.addObject("currentPage", currentPage);
			 mav.addObject("mem", mem);
			 mav.setViewName("adminMemDetail");
				
			 return mav;	
		}
		 
		 @RequestMapping("adminMemModify.do")
			public ModelAndView memberModify(HttpServletRequest request){
			 String email = request.getParameter("email");
			 String currentPage = request.getParameter("currentPage");
			 MemberModel mem = memberService.getMember(email);
			 mav.addObject("currentPage", currentPage);
			 mav.addObject("mem", mem);
			 mav.setViewName("adminMemModify");
				
			 return mav;	
		}
		 
		 @RequestMapping(value="adminMemModify.do", method=RequestMethod.POST)
			public ModelAndView memberModify(@ModelAttribute("mem") MemberModel mem, HttpServletRequest request){
			 String email = request.getParameter("email");
			 String currentPage = request.getParameter("currentPage");
			 adminService.adminUpdateMem(mem);
			 mav.addObject("currentPage", currentPage);
			 mav.setViewName("redirect:adminMemDetail.do?email="+email);
				
			 return mav;	
		}
		 
		 @RequestMapping("adminInfoDetail.do")
			public ModelAndView adminDetail(HttpSession session){
			 /*String admin = request.getParameter("email");*/
			 String admin = (String)session.getAttribute("session_email");
			 MemberModel mem = memberService.getMember(admin);
			 mav.addObject("mem", mem);
			 mav.setViewName("adminInfoDetail");
				
			 return mav;	
		}
		 @RequestMapping(value = "/adminInfoModify.do")
			public ModelAndView adminInfoModify(@ModelAttribute("mem") MemberModel mem, BindingResult result,
		  			HttpSession session, HttpServletRequest request) {
				/*String admin = (String)session.getAttribute("session_email");*/
				int pwchange=0;
				 String admin = request.getParameter("email");
					mem = memberService.getMember(admin);
					mav.addObject("mem", mem);
					mav.addObject("pwchange", pwchange);
					mav.setViewName("adminInfoModify");
					
					return mav;		
			}
			
			@RequestMapping(value = "/adminInfoModify.do", method=RequestMethod.POST)
			public ModelAndView adminInfoModify(@ModelAttribute("mem") MemberModel mem, BindingResult result,
		  			HttpSession session) {
				String admin = (String)session.getAttribute("session_email");
				MemberModel memPre = memberService.getMember(admin);
				String pwPre = memPre.getPassword();
				mem.setEmail(admin);
				String pw = mem.getPassword();
				int pwchange=0;
				if ( pw.equals(pwPre)) {			
					pwchange=-1;
		  		} else {
		  			pwchange=1;
		  			adminService.adminUpdate(mem);
		  			session.invalidate();
		  		}
				mav.addObject("pwchange", pwchange);
				mav.setViewName("adminInfoModify");
				return mav;				
			}
		 	 
}
