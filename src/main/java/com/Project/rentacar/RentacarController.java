package com.Project.rentacar;

import java.io.UnsupportedEncodingException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.Project.util.Paging;

@Controller
@RequestMapping(value = "/car")
public class RentacarController {

	@Resource
	private RentacarService rentacarService;

	private String car_lat = String.valueOf(37.4849649737);
	private String car_lng = String.valueOf(127.0347567814);
	private String car_addr;
	private String car_dt1;
	private String car_dt2;
	private String car_no;
	private String alert;
	private long Day;
	private long Hours;
	private long Price1;
	private long Price2;

	Date expirySt_day;
	Date expiryEnd_day;
	private String Day2;
	private List<String> expiryDate = new ArrayList<String>();

	Date currentTime = new Date();
	SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");

	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 10;
	private int blockPage = 5;
	private String pagingHtml;
	private Paging page;

	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	public ModelAndView listRentacarForm(RentacarModel rentacarModel, HttpServletRequest request)
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
		if (request.getParameter("car_addr") != null && request.getParameter("car_addr") != "") {
			car_addr = request.getParameter("car_addr");
			rentacarList = rentacarService.rentacarSearchList(car_addr);
			if (rentacarList.size() <= 0) {
				alert = "검색 결과가 존재하지 않습니다.";
			} else {
				car_lat = rentacarList.get(0).getCar_lat();
				car_lng = rentacarList.get(0).getCar_lng();
				alert = "";
			}
		} else {
			rentacarList = rentacarService.rentacarList();
			alert = "";
		}

		mav.addObject("alert", alert);
		mav.addObject("car_lat", car_lat);
		mav.addObject("car_lng", car_lng);
		mav.addObject("rentacarList", rentacarList);
		mav.setViewName("carListForm");
		return mav;
	}

	@RequestMapping(value = "/reserve.do", method = RequestMethod.GET)
	public ModelAndView reserveForm(HttpServletRequest request) throws UnsupportedEncodingException {
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
			Price1 = (Day * 24) * Integer.valueOf(rentacarOne.getCar_charge());
			Price2 = (Day * 24) * (Integer.valueOf(rentacarOne.getCar_charge()) + 400);
			mav.addObject("Day", Day);
			mav.addObject("Price1", Price1);
			mav.addObject("Price2", Price2);
		}
		mav.addObject("rentacarOne", rentacarOne);
		mav.setViewName("carReserveForm");
		return mav;
	}

	@RequestMapping(value = "/reserve.do", method = RequestMethod.POST)
	public ModelAndView reserveChange(HttpServletRequest request,
			@ModelAttribute("reserveModel") ReserveModel reserveModel) throws UnsupportedEncodingException {
		ModelAndView mav = new ModelAndView();
		System.out.printf("%s", reserveModel.getReserve_car_no());
		System.out.printf("%s", reserveModel.getReserve_mem_no());
		System.out.printf("%s", reserveModel.getReserve_sdate());
		System.out.printf("%s", reserveModel.getReserve_edate());
		System.out.printf("%s", reserveModel.getReserve_slat());
		System.out.printf("%s", reserveModel.getReserve_slng());
		System.out.printf("%s", reserveModel.getReserve_price());
		System.out.printf("%s", reserveModel.getReserve_insure());

		rentacarService.insertReserve(reserveModel);
		mav.setViewName("redirect:reserveList.do");
		return mav;
	}

	@RequestMapping(value = "/reserveChangeForm.do", method = RequestMethod.GET)
	public ModelAndView reserveChangeForm(HttpServletRequest request) throws UnsupportedEncodingException {
		ModelAndView mav = new ModelAndView();
		car_no = new String(request.getParameter("car_no").getBytes("8859_1"), "utf8");
		String rTime = format.format(currentTime);
		List<ReserveModel> reserveList;

		reserveList = rentacarService.reserveCarList(car_no);

		if (reserveList.size() > 0) {
			for (int i = 0; i < reserveList.size(); i++) {
				expirySt_day = format.parse(reserveList.get(i).getReserve_sdate(), new ParsePosition(0));
				expiryEnd_day = format.parse(reserveList.get(i).getReserve_edate(), new ParsePosition(0));
				expiryEnd_day = new Date(expiryEnd_day.getTime() + (long) (1000 * 60 * 60 * 24));
				do {
					Day2 = format.format(expirySt_day);
					expiryDate.add(Day2);
					expirySt_day = new Date(expirySt_day.getTime() + (long) (1000 * 60 * 60 * 24));
				} while (expirySt_day.before(expiryEnd_day));
			}
		}

		mav.addObject("expiryDate", expiryDate);
		mav.addObject("rTime", rTime);
		mav.addObject("car_no", car_no);
		mav.setViewName("car/reserveChangeForm");
		return mav;
	}

	@RequestMapping(value = "/reserveList.do", method = RequestMethod.GET)
	public ModelAndView reserveListForm(HttpServletRequest request, HttpSession session)
			throws UnsupportedEncodingException {

		ModelAndView mav = new ModelAndView();

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		List<ReserveModel> reserveList;
		List<RentacarModel> rentacarList;

		reserveList = rentacarService.reserveList(session.getAttribute("session_num"));
		rentacarList = rentacarService.rentacarList();
		String rTime = format.format(currentTime);
		totalCount = reserveList.size();

		page = new Paging(currentPage, totalCount, blockCount, blockPage, "reserveList");
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		reserveList = reserveList.subList(page.getStartCount(), lastCount);

		mav.addObject("totalCount", totalCount);
		mav.addObject("pagingHtml", pagingHtml);
		mav.addObject("currentPage", currentPage);
		mav.addObject("rTime", rTime);
		mav.addObject("rentacarList", rentacarList);
		mav.addObject("reserveList", reserveList);
		mav.setViewName("reserveListForm");
		return mav;
	}

	@RequestMapping(value = "/reserveDelete.do", method = RequestMethod.GET)
	public ModelAndView reserveDelete(ReserveModel reserveModel, HttpServletRequest request, HttpSession session)
			throws UnsupportedEncodingException {
		ModelAndView mav = new ModelAndView();
		reserveModel.setReserve_mem_no(Integer.parseInt(String.valueOf(session.getAttribute("session_num"))));
		reserveModel.setReserve_no(Integer.parseInt(request.getParameter("reserve_no")));
		rentacarService.reserveDelete(reserveModel);
		mav.setViewName("redirect:reserveList.do");
		return mav;
	}
}
