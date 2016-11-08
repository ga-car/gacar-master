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
@RequestMapping(value = "/car")
public class RentacarController {

	@Resource
	private RentacarService rentacarService;

	private String car_lat = String.valueOf(37.4849649737);
	private String car_lng = String.valueOf(127.0347567814);
	private String car_no;

	@RequestMapping(value = "/list.do")
	public ModelAndView listRentacarform(RentacarModel rentacarModel, HttpServletRequest request)
			throws UnsupportedEncodingException {

		ModelAndView mav = new ModelAndView();

		List<RentacarModel> rentacarList;
		List<RentacarModel> rentacarLatLng;

		if (request.getParameter("car_lat") != null || request.getParameter("car_lng") != null) {
			car_lat = request.getParameter("car_lat");
			car_lng = request.getParameter("car_lng");
			rentacarModel.setCar_lat(car_lat);
			rentacarModel.setCar_lng(car_lng);

			rentacarLatLng = rentacarService.rentacarLatLng(rentacarModel);

			mav.addObject("rentacarLatlng", rentacarLatLng);
		}

		rentacarList = rentacarService.rentacarList();

		mav.addObject("car_lat", car_lat);
		mav.addObject("car_lng", car_lng);
		mav.addObject("rentacarList", rentacarList);
		mav.setViewName("carListForm");
		return mav;
	}

	@RequestMapping(value = "/reserve.do", method = RequestMethod.GET)
	public ModelAndView listReserveform(HttpServletRequest request) throws UnsupportedEncodingException {
		ModelAndView mav = new ModelAndView();

		car_no = request.getParameter("car_no");

		List<RentacarModel> rentacarList;
		
		rentacarList = rentacarService.rentacarOneView(car_no);
		
		mav.addObject("rentacarList", rentacarList);
		mav.setViewName("carReserveForm");
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
