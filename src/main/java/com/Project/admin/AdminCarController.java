package com.Project.admin;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.Project.rentacar.RentacarModel;

@Controller
@RequestMapping(value = "/admin")
public class AdminCarController {

	private AdminService adminService;

	String uploadPath = "F:\\";

	private List<RentacarModel> rentacarModel = new ArrayList<RentacarModel>();

	@RequestMapping(value = "/car/write.do", method = RequestMethod.GET)
	public ModelAndView insertRentacarform() {
		/* return "admin/car/writeForm"; */
		ModelAndView mav = new ModelAndView();
		mav.setViewName("carWriteForm");
		return mav;
	}

	@RequestMapping(value = "/car/write.do", method = RequestMethod.POST)
	public ModelAndView noticeWrite(@ModelAttribute("rentacarModel") RentacarModel rentacarModel, BindingResult result,
			MultipartHttpServletRequest multipartHttpServletRequest, HttpSession session)
			throws FileNotFoundException, IOException {

		System.out.println("글쓰기 시작");

		ModelAndView mav = new ModelAndView();
		
		MultipartFile multipartFile = multipartHttpServletRequest.getFile("car_image");
		String filename = multipartFile.getOriginalFilename();

		if (filename != "") {
			rentacarModel.setCar_image(System.currentTimeMillis() + "_" + multipartFile.getOriginalFilename());
			String savimagename = System.currentTimeMillis() + "_" + multipartFile.getOriginalFilename();
			FileCopyUtils.copy(multipartFile.getInputStream(), new FileOutputStream(uploadPath + "/" + savimagename));
		} else {
			rentacarModel.setCar_image("NULL");
		}
		
		System.out.printf("%s \n", rentacarModel.getCar_lat());
		System.out.printf("%s \n", rentacarModel.getCar_image());
		/*adminService.insertRentacar(rentacarModel);*/

		mav.addObject("rentacarModel", rentacarModel);
		mav.setViewName("redirect:write.do");
		return mav;
	}
}
