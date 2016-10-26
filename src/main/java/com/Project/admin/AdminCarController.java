package com.Project.admin;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.junit.runner.Request;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.Project.rentacar.RentacarModel;


@Controller
@RequestMapping(value = "/admin")
public class AdminCarController {
	
	

	private List<RentacarModel> rentacarModel= new ArrayList<RentacarModel>();

	@RequestMapping(value = "/car/write.do", method = RequestMethod.GET)
	public String insertRentacarform() {
		/* return "admin/car/writeForm"; */
		return "carwriteForm";
	}
	@RequestMapping(value = "/car/write.do", method = RequestMethod.POST)
	
	public ModelAndView noticeWrite(@ModelAttribute("noticeModel") RentacarModel rentacarModel, BindingResult result, 
			HttpServletRequest request, HttpSession session){
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("rentacarModel", rentacarModel);
		mav.setViewName("carwriteForm");
		
		return mav;
	}
}
