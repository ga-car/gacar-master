package com.Project.member;

import java.util.ArrayList;
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
		ModelAndView mav = new ModelAndView();
		mav.setViewName("memberAgree");
		return mav;
	}

	@RequestMapping("/member.do")
	public ModelAndView memberStep2() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member");
		return mav;
	}

	@RequestMapping("/memberEnd.do")
	public ModelAndView memberStep3(@ModelAttribute("member") MemberModel member, BindingResult result) {

		/* member.setAddr(member.getAddr()+" " + member.getAddr2()); */

		memberService.insertMember(member);
		mav.addObject("member", member);
		mav.setViewName("memberEnd");
		return mav;

		/*
		 * new MemberValidator().validate(member, result);
		 * 
		 * if(result.hasErrors()){ ModelAndView mav = new ModelAndView();
		 * mav.setViewName("member"); return mav; } try{
		 * member.setAddr(member.getAddr()+" " + member.getAddr2());
		 * 
		 * memberService.insertMember(member); mav.addObject("member", member);
		 * mav.setViewName("memberEnd"); return mav; } catch
		 * (DuplicateKeyException e){ result.reject("invalid", null);
		 * mav.setViewName("member"); return mav; }
		 */
	}

	@RequestMapping("/emailAuth.do")
	public ModelAndView emailAuth(HttpServletResponse response, HttpServletRequest request) throws Exception {
		/* Email email = new Email(); */
		/*
		 * member.setPasscode((int)(Math.random() * 100000) + 100000);// create
		 */ // passcode
		boolean isEmail;
		String reciver = request.getParameter("email");
		MemberModel result = memberService.getMember(reciver);
		if (result == null) {
			System.out.println("reciver" + reciver);

			/* String reciver = "rrryung83@gmail.com"; */
			String authNum = "";

			authNum = RandomNum();
			isEmail = sendEmail(reciver.toString(), authNum);

			if (isEmail == true) {
				System.out.println("������ȣ:" + authNum);

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
			/* reciver=null; */
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
		String subject = "������ȣ ����";
		String fromName = "������";
		/* String sender = "felicitas_r@naver.com"; */
		final String sender = "rrryung9083@gmail.com";
		String to1 = email;

		String content = "������ȣ[" + authNum + "]";

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
			return false;///////////// @exceptionhandler���!!->
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

	/* ȸ�����Խ� �����ȣ �˻� ���� */
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
		ModelAndView mv = new ModelAndView();// QModelAndView�� �̸� ��ü �����س����� ��
												// �Ǵ���?ex>service,controller�� ����
		String preAddr = request.getHeader("referer");
		System.out.println(preAddr);
		mv.setViewName("member/login");
		return mv;
	}

	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public ModelAndView login(HttpServletRequest request, MemberModel mem) throws Exception {
		String addr = request.getParameter("parentUrl");
		System.out.println(addr);

		MemberModel result = memberService.login(mem);
		String suc = null;
		
		if (result != null) {
			System.out.println("name:" + result.getName());

			HttpSession session = request.getSession();

			session.setAttribute("session_mem", result);
			session.setAttribute("session_email", result.getEmail());
			session.setAttribute("session_name", result.getName());
			session.setAttribute("session_num", result.getNum());

			session.setAttribute("TOKEN_SAVE_CHECK", "TRUE");

			/* mav.setViewName("redirect:"+addr); */
			suc = "suc";
			/*mav.addObject("suc", suc);
			mav.setViewName("member/login");
			return mav;*/
		} else {

			suc = "err";
			// System.out.println("�α��� ����");
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
		/* mav.addObject("member", new MemberModel()); */
		// ModelAndView mav = new ModelAndView();
		/* mav.setViewName("main"); */
		mav.setViewName("member/logout");
		return mav;
	}

	@RequestMapping(value = "/emailpwFind.do", method = RequestMethod.GET)
	public ModelAndView memFindForm(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		String preAddr = request.getHeader("Referer");
		System.out.println(preAddr);
		mv.setViewName("member/emailpwFind");
		return mv;
	}
	
	@RequestMapping(value = "/emailFind.do")
	//@ModelAttribute("member") MemberModel member jsp���� MemberModel��ü�� ������ �ش��ϴ� �� ���� �����ͼ� member��ü ����, @ModelAttribute("member")�� jsp���� member�� ���
	public ModelAndView emailFind(HttpServletRequest request, @ModelAttribute("mem") MemberModel mem) throws Exception {
		int isFind=0;
		int isEmailFind=0;
		/*String isFind="YN";*/
		mem = memberService.emailFind(mem);
		
		if(mem!=null){
			/*emailOrpw=0;*/
			isFind=1;
			System.out.println("idã���� mem" + mem.getEmail());
			System.out.println("idã���� mem2" + mem.getPassword());
			mav.addObject("isFind", isFind);
			mav.addObject("mem", mem);
		} else{
			isFind=-1;
			mav.addObject("isFind", isFind);
		}
		mav.setViewName("member/emailpwFind");
		return mav;
	}
	
	@RequestMapping(value = "/pwFind.do")
	//@ModelAttribute("member") MemberModel member jsp���� MemberModel��ü�� ������ �ش��ϴ� �� ���� �����ͼ� member��ü ����, @ModelAttribute("member")�� jsp���� member�� ���
	public ModelAndView pwFind(HttpServletRequest request, @ModelAttribute("mem") MemberModel mem) throws Exception {
		/*int emailOrpw;*/
		/*int isPwFind=0;*/
		int isFind=0;
		mem = memberService.pwFind(mem);
		if(mem!=null){
			/*emailOrpw=0;*/
			isFind=2;
			System.out.println("pwã���� mem" + mem.getPassword());
			mav.addObject("isFind", isFind);
			mav.addObject("mem", mem);
		} else{
			isFind=-2;
			mav.addObject("isFind", isFind);			
		}
		mav.setViewName("member/emailpwFind");
		return mav;
	}
	
	@RequestMapping("/emailAuth2.do")
	public ModelAndView emailAuth2(HttpServletRequest request) throws Exception {
		/* Email email = new Email(); */
		/*
		 * member.setPasscode((int)(Math.random() * 100000) + 100000);// create
		 */ // passcode
		/*boolean isEmail;*/
		/*System.out.println("�̸���"+mem.getEmail());
		System.out.println("�̸�"+mem.getName());
		System.out.println("�ֹ�pre"+mem.getJumin1());
		System.out.println("�ֹ�:" +mem.getJumin1());*/
		/*String reciver = mem.getEmail();*/
		String reciver = request.getParameter("email");
		MemberModel result = memberService.getMember(reciver);
		
		if (result != null) {
			System.out.println("reciver" + reciver);

			/* String reciver = "rrryung83@gmail.com"; */
			String authNum = "";

			authNum = RandomNum();
			/*isEmail = sendEmail(reciver.toString(), authNum);*/
			
			sendEmail(reciver.toString(), authNum);
			System.out.println("������ȣ:" + authNum);

			ModelAndView mav = new ModelAndView();
			mav.addObject("email", reciver);
			mav.addObject("authNum", authNum);
			mav.setViewName("/member/emailAuth2");
			return mav;

			/*if (isEmail == true) {
				
			} else {
				ModelAndView mav = new ModelAndView();
				mav.addObject("email3", reciver);
				mav.setViewName("/member/emailAuth");
				return mav;
			}*/
		} else {
			ModelAndView mav = new ModelAndView();
			/* reciver=null; */
			mav.addObject("email2", reciver);
			mav.setViewName("/member/emailAuth2");
			return mav;
		}
	}
}
