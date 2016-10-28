package com.Project.member;

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

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.validation.BindingResult;

import com.Project.validator.MemberValidator;
import com.Project.member.MemberModel;
import com.sun.xml.internal.messaging.saaj.packaging.mime.internet.MimeUtility;

import org.springframework.dao.DuplicateKeyException;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Resource(name="memberService")
	private MemberService memberService;
	
	ModelAndView mav = new ModelAndView();

	@ModelAttribute("member")
	public MemberModel formBack(){
		return new MemberModel();
	}
	
	@RequestMapping("/memberAgree.do")
	public ModelAndView memberStep1(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("memberAgree");
		return mav;
	}
	
	@RequestMapping("/member.do")
	public ModelAndView memberStep2(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member");
		return mav;
	}
	
	@RequestMapping("/memberEnd.do")
	public ModelAndView memberStep3(@ModelAttribute("member") MemberModel member, BindingResult result){
		
		member.setAddr(member.getAddr()+" " + member.getAddr2());
		
		memberService.insertMember(member);
		mav.addObject("member", member);
		mav.setViewName("memberEnd");
		return mav;
		
/*		new MemberValidator().validate(member, result);
		
		if(result.hasErrors()){
			ModelAndView mav = new ModelAndView();
			mav.setViewName("member");
			return mav;
		} try{
			member.setAddr(member.getAddr()+" " + member.getAddr2());
			
			memberService.insertMember(member);
			mav.addObject("member", member);
			mav.setViewName("memberEnd");
			return mav;
		} catch (DuplicateKeyException e){
			result.reject("invalid", null);
			mav.setViewName("member");
			return mav;
		}*/
	}
	
	@RequestMapping("/emailAuth.do")
	public ModelAndView emailAuth(HttpServletResponse response, HttpServletRequest request) throws Exception {
		/*Email email = new Email();*/
		/*member.setPasscode((int)(Math.random() * 100000) + 100000);// create
*/																	// passcode
 		
		String reciver = request.getParameter("email");
		MemberModel result = memberService.getMember(reciver);
		if(result==null){
			System.out.println("reciver" + reciver);
		
			/*String reciver = "rrryung83@gmail.com";*/
			String authNum="";

			authNum = RandomNum();
			sendEmail(reciver.toString(), authNum);
		
			System.out.println("인증번호:" + authNum);

				ModelAndView mav = new ModelAndView();
			mav.addObject("email",reciver);
			mav.addObject("authNum",authNum);
			mav.setViewName("/member/emailAuth");
			return mav;
		}
		else {
				ModelAndView mav = new ModelAndView();
				/*reciver=null;*/
				mav.addObject("email2",reciver);
			mav.setViewName("/member/emailAuth");
			return mav;
		}
	}
 	
 	public String RandomNum(){
 		StringBuffer buffer = new StringBuffer();
 		for(int i=0; i<=6; i++){
 			int n = (int) (Math.random() * 10);
 			buffer.append(n);
 		}
 		return buffer.toString();
 	}

	private void sendEmail(String email, String authNum){
		String host = "smtp.gmail.com";
		String subject = "인증번호 전송";
		String fromName = "관리자";
		final String sender = "rrryung9083@gmail.com";
		String to1 = email;
		
		String content = "인증번호[" + authNum + "]";
		
		try{
			Properties props = new Properties();
			
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", host);
			props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.user", sender);
			props.put("mail.smtp.auth", "true");
			
			Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication(){
					return new PasswordAuthentication(sender, "admin1123");
				}
			});
			
			Message msg = new MimeMessage(mailSession);
			msg.setFrom(new InternetAddress(sender, MimeUtility.encodeText(fromName,"UTF-8","B")));
			
			InternetAddress[] address1 = {new InternetAddress(to1)};
			msg.setRecipients(Message.RecipientType.TO, address1);
			msg.setSubject(subject);
			msg.setSentDate(new java.util.Date());
			msg.setContent(content, "text/html;charset=euc-kr");
			
			Transport.send(msg);
		} catch(MessagingException e){
			e.printStackTrace();
		} catch(Exception e){
			e.printStackTrace();
		}
	}
}
