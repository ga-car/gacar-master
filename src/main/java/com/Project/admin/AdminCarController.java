
package com.Project.admin;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.Project.rentacar.RentacarModel;
@Controller
@RequestMapping(value="/admin")
public class AdminCarController {
	
	private AdminService adminService;   
	
	private List<RentacarModel> rentacarList = new ArrayList<RentacarModel>();

	@RequestMapping(value="/car/write.do", method=RequestMethod.GET)
	public String form(Model model) {
		/*return "admin/car/writeForm";*/
		return "carwriteForm";
	}
	@RequestMapping(value="/car/write.do", method=RequestMethod.POST)
	public String write(Model model, AdminService adminService ) {
		
		System.out.println("글쓰기 시작");
		
		return "carwriteForm";
	}
}
