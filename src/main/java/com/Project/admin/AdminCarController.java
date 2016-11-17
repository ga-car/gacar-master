package com.Project.admin;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
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
import com.Project.rentacar.ReserveModel;
import com.Project.util.Paging;

@Controller
@RequestMapping(value = "/admin")
public class AdminCarController {

	@Resource
	private AdminService adminService;

	ModelAndView mav = new ModelAndView();
	String uploadPath = "F:\\project\\gacar-master\\src\\main\\webapp\\resources\\carUpload";

	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 10;
	private int blockPage = 5;
	private String pagingHtml;
	private Paging page;

	Date currentTime = new Date();
	SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm");

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
		List<RentacarModel> rentacarList;
		rentacarList = adminService.rentacarAdminList();
		mav.addObject("rentacarList", rentacarList);
		mav.setViewName("AdmincarWriteForm");
		return mav;
	}

	@RequestMapping(value = "/car/write.do", method = RequestMethod.POST)
	public ModelAndView insertRentacar(@ModelAttribute("rentacarModel") RentacarModel rentacarModel,
			BindingResult result, MultipartHttpServletRequest multipartHttpServletRequest, HttpSession session)
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

	@RequestMapping(value = "/car/delete.do", method = RequestMethod.GET)
	public ModelAndView deleteRentacar(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		adminService.deleteRentacar(request.getParameter("car_no"));
		mav.setViewName("redirect:list.do");
		return mav;
	}

	@RequestMapping(value = "/car/reserveList.do", method = RequestMethod.GET)
	public ModelAndView listReserveForm(HttpServletRequest request, HttpSession session)
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

		reserveList = adminService.reserveAdminList();
		rentacarList = adminService.rentacarAdminList();
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
		mav.setViewName("AdminreserveListForm");
		return mav;
	}

	@RequestMapping(value = "/car/reserveModify.do", method = RequestMethod.GET)
	public ModelAndView ModifyReserveForm(HttpServletRequest request, HttpSession session)
			throws UnsupportedEncodingException {
		ModelAndView mav = new ModelAndView();
		ReserveModel reserveOne;
		RentacarModel rentacarOne;
		reserveOne = adminService.reserveAdminModify(Integer.parseInt(request.getParameter("reserve_no")));
		rentacarOne = adminService.rentacarAdminOne(reserveOne.getReserve_car_no());

		mav.addObject("rentacarOne", rentacarOne);
		mav.addObject("reserveOne", reserveOne);
		mav.setViewName("AdminreserveModifyForm");
		return mav;
	}

	@RequestMapping(value = "/car/reserveModifyCar.do", method = RequestMethod.GET)
	public ModelAndView ModifyReserveCarForm(HttpServletRequest request, HttpSession session)
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

		reserveList = adminService.reserveAdminList();
		rentacarList = adminService.rentacarAdminList();
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
		mav.setViewName("admin/car/reserveModifyCar");
		return mav;
	}

	@RequestMapping(value = "/car/reserveDelete.do", method = RequestMethod.GET)
	public ModelAndView reserveDelete(HttpServletRequest request, HttpSession session)
			throws UnsupportedEncodingException {
		ModelAndView mav = new ModelAndView();
		adminService.reserveDelete(Integer.parseInt(request.getParameter("reserve_no")));
		mav.setViewName("redirect:reserveList.do");
		return mav;
	}
}
