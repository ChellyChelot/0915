package org.itbank.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/my")
public class MemberController {
	@GetMapping("/info")
	public String infoHandle() {
		System.out.println();
		return "t_expr"; 
	}
	@PostMapping("/info")
	public String infoPostHandle() {
		return "t_expr"; 
	}
}
