package com.Project.member;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.validation.BindingResult;

import com.Project.validator.MemberValidator;
import com.Project.member.ZipcodeModel;
import com.Project.member.MemberModel;
import com.sun.xml.internal.messaging.saaj.packaging.mime.internet.MimeUtility;

import org.springframework.dao.DuplicateKeyException;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Resource(name = "memberService")
	private MemberService memberService;

	ModelAndView mav = new ModelAndView();
	private List<ZipcodeModel> zipcodeList = new ArrayList<ZipcodeModel>();

	@ModelAttribute("member")
	public MemberModel formBack() {
		return new MemberModel();
	}

	@RequestMapping("/memberAgree.do")
	public ModelAndView memberStep1() {
		mav.setViewName("memberAgree");
		return mav;
	}

	@RequestMapping("/member.do")
	public ModelAndView memberStep2(@ModelAttribute("mem") MemberModel mem, BindingResult result) {
		mav.setViewName("member");
		return mav;
	}

	@RequestMapping("/memberEnd.do")
	public ModelAndView memberStep3(@ModelAttribute("mem") MemberModel mem, BindingResult result) {
		memberService.insertMember(mem);
		mav.addObject("mem", mem);
		mav.setViewName("memberEnd");
		return mav;

	}

	@RequestMapping("/emailAuth.do")
	public ModelAndView emailAuth(HttpServletResponse response, HttpServletRequest request) throws Exception {

		boolean isEmail;
		String reciver = request.getParameter("email");
		MemberModel result = memberService.getMember(reciver);
		if (result == null) {
			String authNum = "";
			authNum = RandomNum();
			isEmail = sendEmail(reciver.toString(), authNum);

			if (isEmail == true) {
				System.out.println("인증번호:" + authNum);

				ModelAndView mav = new ModelAndView();
				mav.addObject("email", reciver);
				mav.addObject("authNum", authNum);
				mav.setViewName("/member/emailAuth");
				return mav;
			} else {
				ModelAndView mav = new ModelAndView();
				mav.addObject("email3", reciver);
				mav.setViewName("/member/emailAuth");
				return mav;
			}
		} else {
			ModelAndView mav = new ModelAndView();
			mav.addObject("email2", reciver);
			mav.setViewName("/member/emailAuth");
			return mav;
		}
	}

	public String RandomNum() {
		StringBuffer buffer = new StringBuffer();
		for (int i = 0; i <= 6; i++) {
			int n = (int) (Math.random() * 10);
			buffer.append(n);
		}
		return buffer.toString();
	}

	private boolean sendEmail(String email, String authNum) {
		String host = "smtp.gmail.com";
		String subject = "인증번호 전송";
		String fromName = "관리자";
		/* String sender = "felicitas_r@naver.com"; */
		final String sender = "rrryung9083@gmail.com";
		String to1 = email;

		String content = "인증번호[" + authNum + "]";

		try {
			Properties props = new Properties();

			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", host);
			props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.user", sender);
			props.put("mail.smtp.auth", "true");

			Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(sender, "admin1123");
				}
			});

			Message msg = new MimeMessage(mailSession);
			msg.setFrom(new InternetAddress(sender, MimeUtility.encodeText(fromName, "UTF-8", "B")));

			InternetAddress[] address1 = { new InternetAddress(to1) };
			msg.setRecipients(Message.RecipientType.TO, address1);
			msg.setSubject(subject);
			msg.setSentDate(new java.util.Date());
			msg.setContent(content, "text/html;charset=euc-kr");

			Transport.send(msg);

		} catch (MessagingException e) {
			e.printStackTrace();
			return false;///////////// @exceptionhandler사용!!->
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@RequestMapping(value = "/zipcodeCheckForm.do")
	public ModelAndView zipcodeCheckForm(HttpServletRequest req) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/zipcodeCheck");
		return mv;
	}

	/* 회원가입시 우편번호 검색 로직 */
	@RequestMapping(value = "/zipcodeCheck.do")
	public ModelAndView zipcodeCheck(@ModelAttribute ZipcodeModel zipcodeModel, HttpServletRequest req)
			throws Exception {

		ModelAndView mv = new ModelAndView();

		int chk = 100;

		zipcodeList = memberService.zipcodeCheck(zipcodeModel);

		mv.addObject("zipcode", zipcodeList);

		if (zipcodeList.size() == 0) {
			chk = 0;
		} else {
			chk = 1;
		}
		mv.addObject("chk", chk);
		mv.setViewName("member/zipcodeCheck");
		return mv;
	}

	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public ModelAndView loginForm(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String preAddr = request.getHeader("referer");
		mv.setViewName("member/login");
		return mv;
	}

	@RequestMapping(value = "/login.do", method = RequestMethod.POST)////////////////////////////////////////
	public ModelAndView login(HttpServletRequest request, MemberModel mem) throws Exception {
		String addr = request.getParameter("parentUrl");
		MemberModel result = memberService.login(mem);
		String suc = null;
		if (result != null) {
			Date del = result.getDeldate();
			String emailCheck =result.getEmail();
			if (del == null) {

				HttpSession session = request.getSession();

				session.setAttribute("session_mem", result);
				session.setAttribute("session_email", result.getEmail());
				session.setAttribute("session_name", result.getName());
				session.setAttribute("session_num", result.getNum());
				session.setAttribute("TOKEN_SAVE_CHECK", "TRUE"); 
				if(emailCheck.equals("admin"))
					suc = "admin";
				else
					suc = "suc";
			} else {
				suc = "err2";
			}
		} else {
			suc = "err";
		}

		mav.addObject("suc", suc);
		mav.setViewName("member/login");
		return mav;

	}

	@RequestMapping("/logout.do")
	public ModelAndView memberLogout(HttpServletRequest request, MemberModel mem) {

		HttpSession session = request.getSession(false);

		if (session != null) {
			session.invalidate();
		}
		mav.setViewName("member/logout");
		return mav;
	}

	@RequestMapping(value = "/emailpwFind.do", method = RequestMethod.GET)
	public ModelAndView memFindForm(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		String preAddr = request.getHeader("Referer");
		mv.setViewName("member/emailpwFind");
		return mv;
	}

	@RequestMapping(value = "/emailFind.do")
	public ModelAndView emailFind(HttpServletRequest request, @ModelAttribute("mem") MemberModel mem) throws Exception {
		int isFind = 0;
		int isEmailFind = 0;
		mem = memberService.emailFind(mem);

		if (mem != null) {
			isFind = 1;
			mav.addObject("isFind", isFind);
			mav.addObject("mem", mem);
		} else {
			isFind = -1;
			mav.addObject("isFind", isFind);
		}
		mav.setViewName("member/emailpwFind");
		return mav;
	}

	@RequestMapping(value = "/pwFind.do")
	public ModelAndView pwFind(HttpServletRequest request, @ModelAttribute("mem") MemberModel mem) throws Exception {
		int isFind = 0;
		mem = memberService.pwFind(mem);
		if (mem != null) {
			isFind = 2;
			mav.addObject("isFind", isFind);
			mav.addObject("mem", mem);
		} else {
			isFind = -2;
			mav.addObject("isFind", isFind);
		}
		mav.setViewName("member/emailpwFind");
		return mav;
	}

	@RequestMapping("/emailAuth2.do")
	public ModelAndView emailAuth2(HttpServletRequest request) throws Exception {
		String reciver = request.getParameter("email");
		MemberModel result = memberService.getMember(reciver);

		if (result != null) {
			String authNum = "";
			authNum = RandomNum();
			sendEmail(reciver.toString(), authNum);

			ModelAndView mav = new ModelAndView();
			mav.addObject("email", reciver);
			mav.addObject("authNum", authNum);
			mav.setViewName("/member/emailAuth2");
			return mav;
		} else {
			ModelAndView mav = new ModelAndView();
			mav.addObject("email2", reciver);
			mav.setViewName("/member/emailAuth2");
			return mav;
		}
	}
}
