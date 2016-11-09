package com.Project.rentacar;

import java.io.UnsupportedEncodingException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/car")
public class RentacarController {

	@Resource
	private RentacarService rentacarService;

	private String car_lat = String.valueOf(37.4849649737);
	private String car_lng = String.valueOf(127.0347567814);
	private String car_dt1;
	private String car_dt2;
	private String car_no;
	private long Day;
	private long Hours;
	private long Price;
	SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm");

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

		car_no = new String(request.getParameter("car_no").getBytes("8859_1"), "utf8");
		RentacarModel rentacarOne;
		rentacarOne = rentacarService.rentacarOneView(car_no);
		if (request.getParameter("car_dt1") != null || request.getParameter("car_dt2") != null) {
			car_dt1 = request.getParameter("car_dt1");
			car_dt2 = request.getParameter("car_dt2");
			mav.addObject("car_dt1", car_dt1);
			mav.addObject("car_dt2", car_dt2);

			Date nowDate = format.parse(car_dt1, new ParsePosition(0));
			Date expiryDate = format.parse(car_dt2, new ParsePosition(0));

			Day = (expiryDate.getTime() - nowDate.getTime()) / 1000 / 60 / 60 / 24;
			Hours = (expiryDate.getTime() - nowDate.getTime()) / 1000 / 60 / 60 % 24;
			Price = (Day * 24 + Hours) * Integer.valueOf(rentacarOne.getCar_charge());
			mav.addObject("Day", Day);
			mav.addObject("Hours", Hours);
			mav.addObject("Price", Price);
		}
		mav.addObject("rentacarOne", rentacarOne);
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
	@RequestMapping(value = "/reserveChangeForm.do", method = RequestMethod.GET)
	public ModelAndView reserveChangeform(HttpServletRequest request) throws UnsupportedEncodingException {
		ModelAndView mav = new ModelAndView();
		car_no = new String(request.getParameter("car_no").getBytes("8859_1"), "utf8");

		mav.addObject("car_no", car_no);
		mav.setViewName("car/reserveChangeForm");
		return mav;
	}


}
