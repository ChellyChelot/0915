package org.itbank.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/test")
public class ChatController {
	
	@RequestMapping("/chat")
	public String basicHandle() {
		return "test/chat";
	}
}



