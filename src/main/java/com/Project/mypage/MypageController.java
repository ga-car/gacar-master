package com.Project.mypage;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
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
import com.Project.member.MemberService;
import com.Project.qna.qnaModel;
import com.Project.review.ReviewModel;
import com.Project.review.ReviewService;
import com.Project.util.Paging;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	/*이용후기 불러오기*/
private static final String uploadPath = "C:\\java\\GACAR\\src\\main\\webapp\\resources\\reviewUpload\\";
	
	@Resource
	private ReviewService reviewService;
	private int searchNum;
	private String isSearch;
	private ReviewService reviewlist;
	private int currentPage = 1;	 
	private int totalCount; 		 
	private int blockCount =  3;	 
	private int blockPage = 5; 	 
	private String pagingHtml;  
	private Paging page;
	
	@ModelAttribute
	public ReviewModel formBack() {
		return new ReviewModel();
	}
	
	/*/////////////////////////////////////�۸��/////////////////////////////////////*/
	@RequestMapping(value="/list.do")
	public ModelAndView reviewList(HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException{
		
		ModelAndView mav = new ModelAndView();
		
		if(request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() || request.getParameter("currentPage").equals("0")) {
            currentPage = 1;
        } else {
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
        }
		
		String session_email = (String) session.getAttribute("session_email");
		List<ReviewModel> reviewList;
		reviewList = reviewService.reviewList(session_email);
		
		totalCount = reviewList.size();
		
		page = new Paging(currentPage, totalCount, blockCount, blockPage, "mypageList");
		pagingHtml=page.getPagingHtml().toString();
		
		int lastCount = totalCount;
		 
		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;
		 
		reviewList = reviewList.subList(page.getStartCount(), lastCount);
		
		mav.addObject("totalCount", totalCount);
		mav.addObject("pagingHtml", pagingHtml);
		mav.addObject("currentPage", currentPage);
		mav.addObject("reviewList", reviewList);
		mav.setViewName("mypageList");
		return mav;
	}
	
	
	
	
	
	
	@Resource(name = "memberService")
	private MemberService memberService;

	ModelAndView mav = new ModelAndView();
	
	@RequestMapping(value = "/mypage.do")
	public ModelAndView mypageMain(HttpServletRequest request, HttpSession session) {
		
		if (session.getAttribute("session_email") != null) {
  			mav.setViewName("mypage");
  			return mav;
  		} else {
  			mav.setViewName("loginConfirm");
  			return mav;
  		}
	}
	
	@RequestMapping(value = "/memberConfirm.do")
	public ModelAndView memberConfirm(HttpSession session) {
		
			String email = (String)session.getAttribute("session_email");
			MemberModel mem = memberService.getMember(email);
			mav.addObject("mem", mem);
  			mav.setViewName("memberConfirm");
  			return mav;
	}

	
	@RequestMapping(value = "/memberModify.do")
	public ModelAndView memberModify(@ModelAttribute("mem") MemberModel mem, BindingResult result,
  			HttpSession session, HttpServletRequest request) {
		String pwTemp = request.getParameter("password");	
		String email = (String)session.getAttribute("session_email");
		mem = memberService.getMember(email);
		String pw = mem.getPassword();
			mav.addObject("mem", mem);
			mav.setViewName("memberModify");			
			return mav;
	}
	
	@RequestMapping(value = "/memberModify.do", method=RequestMethod.POST)
	public ModelAndView memberModify(@ModelAttribute("mem") MemberModel mem, BindingResult result,
  			HttpSession session) {
		String email = (String)session.getAttribute("session_email");
		MemberModel memPre = memberService.getMember(email);
		String pwPre = memPre.getPassword();
		mem.setEmail(email);
		memberService.updateMember(mem);
		String pw = mem.getPassword();

		if ( pw.equals(pwPre)) {			
  			mav.setViewName("redirect:memberConfirm.do");
  		} else {
  			session.invalidate();
			mav.setViewName("memberModifyEnd");
  		}
		return mav;
	}
	
	@RequestMapping(value = "/memberDelPre.do")
	public ModelAndView memberDelPre() {
		System.out.println("delpre");		
		mav.addObject("pwCheck", 0);
		mav.setViewName("memberDelPre");
		return mav;
	}
	
	@RequestMapping(value = "/memberDel.do", method=RequestMethod.POST)
	public ModelAndView memberDel(HttpSession session, HttpServletRequest request) {
		
		System.out.println("delPost");
		MemberModel mem; // 쿼리 결과 값을 저장할 객체
 		
 		String email;
 		String pw;
 		pw = request.getParameter("password");
 		int pwCheck;
 		
 		email = session.getAttribute("session_email").toString();
 		mem = (MemberModel) memberService.getMember(email);
 		
 		
 		
 		if(mem.getPassword().equals(pw)) {
 			//패스워드가 맞으면
 			pwCheck = 1;
 			Date deldate = new Date();
 			//삭제 쿼리 수행 			
 			memberService.updateDelMem(email); 			
 			/*세션 한 번에 제거*/
 			session.invalidate();
 			
 		}
 		else {
 			pwCheck = -1; //패스워드가 안맞을때
 			
 		}
 		mav.addObject("pwCheck", pwCheck);
	 	mav.setViewName("memberDelPre");
		return mav;
	}

}
