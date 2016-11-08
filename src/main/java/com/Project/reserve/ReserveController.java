package com.Project.reserve;

import java.io.UnsupportedEncodingException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/reserve")
public class ReserveController {

	@Resource
	private ReserveService reserveService;

	@RequestMapping(value = "complete.do", method = RequestMethod.POST)
	public ModelAndView reserveChange(ReserveModel reserveModel, HttpServletRequest request) throws UnsupportedEncodingException {
		ModelAndView mav = new ModelAndView();
		
		reserveService.insertReserve(reserveModel);
		
		mav.setViewName("car/reserveChangeForm");
		return mav;
	}

}
