package org.itbank.app.controller;

import java.util.Map;
import java.util.UUID;

import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.itbank.app.controller.ws.AlertWSHandler;
import org.itbank.app.model.MemberDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

@Controller
public class JoinController {
	@Autowired
	MemberDao memberDao;

	@Autowired
	AlertWSHandler aws;	// 웹소켓 핸들러를 AutoWired 걸어서 연결 잡고.
	
	@Autowired
	JavaMailSender sender;
	
	@GetMapping(path = "/join")
	public String joinGetHandle(Model model) {
		model.addAttribute("section", "join");
		return "t_expr";
	}  
	
	@RequestMapping("/join/auth")
	@ResponseBody
	public String joinAuthHandle(@RequestBody String target, HttpSession session) {
		System.out.println("target : " + target);
		String key = UUID.randomUUID().toString().substring(0,13);
		session.setAttribute("authkey",key);
		try {
			MimeMessage msg = sender.createMimeMessage();
			msg.setRecipient(RecipientType.TO, new InternetAddress(target));
			msg.setSubject("[SPRING HUB] 인증키입니다. ");
			RestTemplate tm = new RestTemplate();
			// String text = tm.getForObject("/auth/mail", String.class);
			String text ="<h1>SPRING HUB</h1>";
			text +="가입진행절차에 따라 인증키를 보내드립니다.";
			text += "인증키 : <b>"+key+"</b>";
			//
			msg.setText(text,"utf-8","html");
			sender.send(msg);
			return "true";	
		}catch(Exception e) {
			System.out.println(e);
			return "false";
		}
	}
	

	@RequestMapping("/join/authCheck")
	@ResponseBody
	public String joinAuthCheckHandle(@RequestParam String key, HttpSession session) {
		System.out.println(key);
		System.out.println(session.getAttribute("authkey"));
		System.out.println(key.equals(session.getAttribute("authkey")));
		if(key.equals(session.getAttribute("authkey")) ) {
			return "YYYYY";
		}else {
			return "NNNNN";
		}
	}
	
	
	@PostMapping("/join")
	public String joinPostHandle(@RequestParam Map map, HttpSession session, Model model) {
		try {
			boolean b = memberDao.addOne(map);
			
			session.setAttribute("auth", map);
			session.setAttribute("auth_id", map.get("id"));
			
			/*
			 * AlertWSHandler를 통해서, 메세지를 보내보자. 
			 */
			aws.sendMessage("누군가 가입하였습니다"); 
			return "redirect:/";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("temp", map);
			model.addAttribute("section", "join");
			return "t_expr";
		}
	}

	@PostMapping("/signup_check/{mode}")
	public String signupHandle() {
		return "";
	}
}
