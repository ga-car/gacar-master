package com.Project.mypage;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.Project.member.MemberModel;
import com.Project.member.MemberService;

@Controller
@RequestMapping("/mypage")
public class MypageController {
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

		String email = (String) session.getAttribute("session_email");
		MemberModel mem = memberService.getMember(email);
		mav.addObject("mem", mem);
		mav.setViewName("memberConfirm");
		return mav;
	}

	@RequestMapping(value = "/memberModify.do")
	public ModelAndView memberModify(@ModelAttribute("mem") MemberModel mem, BindingResult result, HttpSession session,
			HttpServletRequest request) {
		String pwTemp = request.getParameter("password");
		String email = (String) session.getAttribute("session_email");
		mem = memberService.getMember(email);
		String pw = mem.getPassword();
		mav.addObject("mem", mem);
		mav.setViewName("memberModify");
		return mav;
	}

	@RequestMapping(value = "/memberModify.do", method = RequestMethod.POST)
	public ModelAndView memberModify(@ModelAttribute("mem") MemberModel mem, BindingResult result,
			HttpSession session) {
		String email = (String) session.getAttribute("session_email");
		MemberModel memPre = memberService.getMember(email);
		String pwPre = memPre.getPassword();
		mem.setEmail(email);
		memberService.updateMember(mem);
		String pw = mem.getPassword();

		if (pw.equals(pwPre)) {
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


	@RequestMapping(value = "/memberDel.do", method = RequestMethod.POST)
	public ModelAndView memberDel(HttpSession session, HttpServletRequest request) {

		System.out.println("delPost");
		MemberModel mem; 

		String email;
		String pw;
		pw = request.getParameter("password");
		int pwCheck;

		email = session.getAttribute("session_email").toString();
		mem = (MemberModel) memberService.getMember(email);

		if (mem.getPassword().equals(pw)) {
			pwCheck = 1;
			mem.setDel("Y");
			memberService.updateDelMem(mem);
			session.invalidate();

		} else {
			pwCheck = -1; // �н����尡 �ȸ�����

		}
		mav.addObject("pwCheck", pwCheck);
		mav.setViewName("memberDelPre");
		return mav;
	}

}