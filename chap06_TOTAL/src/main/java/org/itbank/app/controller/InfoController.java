package org.itbank.app.controller;

import java.util.*;

import org.itbank.app.model.MemberDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class InfoController {
	@Autowired
	MemberDao memberDao;

	@RequestMapping("/info/mlist")
	public ModelAndView mlistHandle(@RequestParam(name = "page", defaultValue = "1") int page) {
		ModelAndView mav = new ModelAndView("t_expr");
		mav.addObject("section", "info/memberlist");
		Map p = new HashMap();
		
		p.put("start", (page-1)*5 +1 );	// (page-1)*5 +1 
		p.put("end", page*5);	// 기본적으로는 이렇게 한다.

		mav.addObject("mlist", memberDao.readSomeMemberWithLatestProfile(p));

		return mav;
	}

}
