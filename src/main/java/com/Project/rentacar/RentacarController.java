package com.Project.rentacar;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/Rentacar")
public class RentacarController {

	@Resource
	private RentacarService rentacarService;

	private String lat = String.valueOf(37.4849649737);
	private String lng = String.valueOf(127.0347567814);

	@RequestMapping(value = "/car/list.do", method = RequestMethod.GET)
	public ModelAndView listRentacarform(RentacarModel rentacarModel, HttpServletRequest request)
			throws UnsupportedEncodingException {

		ModelAndView mav = new ModelAndView();

		List<RentacarModel> rentacarList;
		List<RentacarModel> rentacarLatLng;
		
		if (request.getParameter("car_lat") != null || request.getParameter("car_lng") != null) {
			lat = request.getParameter("car_lat");
			lng = request.getParameter("car_lng");
			rentacarModel.setCar_lat(lat);
			rentacarModel.setCar_lng(lng);

			rentacarLatLng = rentacarService.rentacarLatLng(rentacarModel);

			mav.addObject("rentacarLatlng", rentacarLatLng);
		}

		rentacarList = rentacarService.rentacarList();
		
		mav.addObject("car_lat", lat);
		mav.addObject("car_lng", lng);
		mav.addObject("rentacarList", rentacarList);
		mav.setViewName("carListForm");
		return mav;
	}
	/*
	 * @RequestMapping(value = "/car/list.do", method = RequestMethod.POST)
	 * public ModelAndView RentacarSearch(HttpServletRequest request) throws
	 * UnsupportedEncodingException{
	 * 
	 * ModelAndView mav = new ModelAndView();
	 * 
	 * List<RentacarModel> rentacarList; Search =
	 * request.getParameter("Search"); rentacarList =
	 * rentacarService.rentacarSearchList(Search); mav.addObject("Search",
	 * Search); mav.addObject("rentacarList", rentacarList);
	 * mav.setViewName("carListForm"); return mav; }
	 */
}
