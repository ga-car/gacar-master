package com.Project.admin;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.Project.util.Paging;

@Controller
@RequestMapping(value = "/admin")
public class AdminCarController {

	@Resource
	private AdminService adminService;
	
	ModelAndView mav = new ModelAndView();
	
	String uploadPath = "F:\\";
	
	private int currentPage = 1;	 
	private int totalCount; 		 
	private int blockCount = 10;	 
	private int blockPage = 5; 	 
	private String pagingHtml;  
	private Paging page;

	@RequestMapping(value = "/car/list.do", method = RequestMethod.GET)
	public ModelAndView listRentacarform(HttpServletRequest request) throws UnsupportedEncodingException {

		ModelAndView mav = new ModelAndView();

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		List<RentacarModel> rentacarList;
		
		rentacarList = adminService.rentacarAdminList();

		totalCount = rentacarList.size();

		page = new Paging(currentPage, totalCount, blockCount, blockPage, "list");
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		rentacarList = rentacarList.subList(page.getStartCount(), lastCount);

		mav.addObject("totalCount", totalCount);
		mav.addObject("pagingHtml", pagingHtml);
		mav.addObject("currentPage", currentPage);
		mav.addObject("rentacarList", rentacarList);
		mav.setViewName("AdmincarListForm");
		return mav;
	}

	@RequestMapping(value = "/car/write.do", method = RequestMethod.GET)
	public ModelAndView insertRentacarform() {
		/* return "admin/car/writeForm"; */
		ModelAndView mav = new ModelAndView();
		mav.setViewName("AdmincarWriteForm");
		return mav;
	}

	@RequestMapping(value = "/car/write.do", method = RequestMethod.POST)
	public ModelAndView noticeWrite(@ModelAttribute("rentacarModel") RentacarModel rentacarModel, BindingResult result,
			MultipartHttpServletRequest multipartHttpServletRequest, HttpSession session)
			throws FileNotFoundException, IOException {

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

		/* adminService.insertRentacar(rentacarModel); */
		adminService.insertRentacar(rentacarModel);

		mav.setViewName("redirect:list.do");
		return mav;
	}
}
