package com.Project.chats;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChatController {

	@RequestMapping("/carpool/chat.do")
	public String viewChattingPage() {
		return "chat-sockjs";
	}
}
