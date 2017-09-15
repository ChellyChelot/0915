package org.itbank.app.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.itbank.app.model.MemberDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/my")
public class MemberController {
	@Autowired
	MemberDao memberDao;

	@GetMapping("/profile")
	public ModelAndView profileHandle() {
		ModelAndView mav = new ModelAndView("t_expr");
		mav.addObject("section", "my/profile");
		return mav;
	}
	
	
	@GetMapping("/info")
	public String infoHandle(Model model, HttpSession session) {
		Map map = (Map) session.getAttribute("auth");
		model.addAttribute("section", "my/info");
		return "t_expr";
	}

	@PostMapping("/info")
	public String infoPostHandle() {
		return "t_expr";
	}

}
