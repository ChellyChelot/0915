package org.itbank.app.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/product")
public class ProductController {
	@Autowired
	org.itbank.app.model.ProductDao productDao; 
	
	@GetMapping("/show/{num}")
	public ModelAndView showHandle(@PathVariable String num) {
		ModelAndView mav = new ModelAndView("t_expr");
		mav.addObject("section", "product/show");
		mav.addObject("one", productDao.getOne(num));
		return mav;
	} 
	
	@GetMapping("/all")
	public ModelAndView allHandle() {
		ModelAndView mav = new ModelAndView("t_expr");
		mav.addObject("section", "product/all");
		mav.addObject("data", productDao.getAll());
		return mav;
	} 
	
	@GetMapping("/search")
	public ModelAndView allHandle(@RequestParam Map param) {
		System.out.println(param);
		ModelAndView mav = new ModelAndView("t_expr");
		mav.addObject("section", "product/all");
		mav.addObject("data", productDao.searchSome(param));
		return mav;
	}
	
	@GetMapping("/add")
	public String addGetHanle(Map map) {
			map.put("section", "product/add");
		return "t_expr";
	}
	
	@PostMapping("/add")
	public String addPost(@RequestParam Map param, Map model) {
		try {
			int r = productDao.addNew(param);
			model.put("rst", r);
			return "redirect:/product/all";
		}catch (Exception e) {
			model.put("rst", -1);
			model.put("section", "product/add");
			return "t_expr";
		}
	}
}





