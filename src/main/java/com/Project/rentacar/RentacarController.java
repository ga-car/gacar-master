package com.Project.rentacar;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/Rentacar")
public class RentacarController {
	
	@Resource
	private RentacarService rentacarService;
	
	private String Search;
	
	@RequestMapping(value = "/car/list.do", method = RequestMethod.GET)
	public ModelAndView listRentacarform(HttpServletRequest request) throws UnsupportedEncodingException {

		ModelAndView mav = new ModelAndView();
		
		List<RentacarModel> rentacarList;
		rentacarList = rentacarService.rentacarList();
		
		mav.addObject("rentacarList", rentacarList);
		mav.setViewName("carListForm");
		return mav;
	}
	@RequestMapping(value = "/car/list.do", method = RequestMethod.POST)
	public ModelAndView RentacarSearch(HttpServletRequest request) throws UnsupportedEncodingException{
		
		ModelAndView mav = new ModelAndView();
		
		List<RentacarModel> rentacarList;
		Search = request.getParameter("Search");
		rentacarList = rentacarService.rentacarSearchList(Search);
		mav.addObject("Search", Search);
		mav.addObject("rentacarList", rentacarList);
		mav.setViewName("carListForm");
		return mav;
	}
}
