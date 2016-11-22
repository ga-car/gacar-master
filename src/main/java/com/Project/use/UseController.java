package com.Project.use;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UseController {
	
	ModelAndView mav = new ModelAndView();
	
	@RequestMapping("/gacarIs.do")
	public ModelAndView gacarIs() {
		mav.setViewName("gacarIs");
		return mav;
	}
	
	@RequestMapping("/method.do")
	public ModelAndView method() {
		mav.setViewName("method");
		return mav;
	}
	
	@RequestMapping("/manner.do")
	public ModelAndView manner() {
		mav.setViewName("manner");
		return mav;
	}
	
	@RequestMapping("/rule.do")
	public ModelAndView rule() {
		mav.setViewName("rule");
		return mav;
	}
	
	@RequestMapping("/charge.do")
	public ModelAndView charge() {
		mav.setViewName("charge");
		return mav;
	}

}
