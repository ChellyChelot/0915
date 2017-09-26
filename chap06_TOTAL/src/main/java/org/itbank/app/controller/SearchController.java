package org.itbank.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/member")
public class SearchController {
	@RequestMapping("/search")
	public ModelAndView searchIdHandle() {
		ModelAndView mav = new ModelAndView("t_expr");
		mav.addObject("section", "member/search");
	return mav;
	}
}
