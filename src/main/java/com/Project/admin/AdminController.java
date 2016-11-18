package com.Project.admin;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import com.Project.member.MemberModel;
import com.Project.admin.AdminService;
import com.Project.member.MemberService;
import com.Project.util.Paging;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {

	@Resource
	private AdminService adminService;

	@Resource
	private MemberService memberService;

	ModelAndView mav = new ModelAndView();

	// 페이징
	private int searchNum;
	private String sortNum;
	private String isSearch;

	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 7;
	private int blockPage = 5;
	private String pagingHtml;
	private Paging page;

	@RequestMapping(value = "/main.do")
	public ModelAndView adminLogin(HttpSession session) throws Exception {
		String admin = (String) session.getAttribute("session_email");

		if (admin == null) {
			mav.addObject("invalid", 1);
			mav.setViewName("main");
			return mav;
		} else {
			mav.setViewName("adminMain");
			return mav;
		}
	}

	// 회원목록
	@RequestMapping("memberList.do")
	public ModelAndView memList(HttpServletRequest request) throws Exception {

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		List<MemberModel> memList = adminService.memberList();

		// 멤버검색
		isSearch = request.getParameter("isSearch");
		if (isSearch != null) {
			searchNum = Integer.parseInt(request.getParameter("searchNum"));

			if (searchNum == 1)
				memList = adminService.memberSearch1(isSearch);
			if (searchNum == 2)
				memList = adminService.memberSearch2(isSearch);
			totalCount = memList.size();
			page = new Paging(currentPage, totalCount, blockCount, blockPage, "memberList", searchNum, isSearch);

			sortNum = request.getParameter("sortNum");
			if (sortNum != null) {
				if (sortNum.equals("0")) {
					memList = adminService.memberSort0(searchNum,isSearch);
				}
				if (sortNum.equals("1")) {
					memList = adminService.memberSort1(searchNum,isSearch);
				}
				mav.addObject("sortNum", sortNum);
				page = new Paging(currentPage, totalCount, blockCount, blockPage, "memberList", searchNum, isSearch, sortNum);
			}
			
			
			
			pagingHtml = page.getPagingHtml().toString();
			
			int lastCount = totalCount;

			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;

			memList = memList.subList(page.getStartCount(), lastCount);

			mav.addObject("isSearch", isSearch);
			mav.addObject("searchNum", searchNum);
			mav.addObject("totalCount", totalCount);
			mav.addObject("pagingHtml", pagingHtml);
			mav.addObject("currentPage", currentPage);
			mav.addObject("memList", memList);
			mav.setViewName("memberList");
			return mav;
		}
		
		sortNum = request.getParameter("sortNum");
		if (sortNum != null) {
			if (sortNum.equals("0")) {
				memList = adminService.memberSort0();
			}
			if (sortNum.equals("1")) {
				memList = adminService.memberSort1();
			}
			
			totalCount = memList.size();
			page = new Paging(currentPage, totalCount, blockCount, blockPage, "memberList", sortNum);
			pagingHtml = page.getPagingHtml().toString();

			int lastCount = totalCount;

			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;

			memList = memList.subList(page.getStartCount(), lastCount);

			mav.addObject("isSearch", null);
			mav.addObject("searchNum", 0);
			mav.addObject("sortNum", sortNum);
			mav.addObject("totalCount", totalCount);
			mav.addObject("pagingHtml", pagingHtml);
			mav.addObject("currentPage", currentPage);
			mav.addObject("memList", memList);
			mav.setViewName("memberList");
			return mav;
		}
		
		totalCount = memList.size();

		page = new Paging(currentPage, totalCount, blockCount, blockPage, "memberList");
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		memList = memList.subList(page.getStartCount(), lastCount);

		mav.addObject("isSearch", null);
		mav.addObject("searchNum", 0);
		mav.addObject("totalCount", totalCount);
		mav.addObject("pagingHtml", pagingHtml);
		mav.addObject("currentPage", currentPage);

		mav.addObject("memList", memList);
		mav.setViewName("memberList");

		return mav;
	}

	@RequestMapping("withdrawList.do")
	public ModelAndView withdrawList(HttpServletRequest request) throws Exception {

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		List<MemberModel> memList = adminService.withdrawList();

		// 멤버검색
		isSearch = request.getParameter("isSearch");
		if (isSearch != null) {
			searchNum = Integer.parseInt(request.getParameter("searchNum"));

			if (searchNum == 1)
				memList = adminService.withdrawSearch1(isSearch);
			if (searchNum == 2)
				memList = adminService.withdrawSearch2(isSearch);

			totalCount = memList.size();
			page = new Paging(currentPage, totalCount, blockCount, blockPage, "withdrawList", searchNum, isSearch);
			pagingHtml = page.getPagingHtml().toString();

			int lastCount = totalCount;

			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;

			memList = memList.subList(page.getStartCount(), lastCount);

			mav.addObject("isSearch", isSearch);
			mav.addObject("searchNum", searchNum);
			mav.addObject("totalCount", totalCount);
			mav.addObject("pagingHtml", pagingHtml);
			mav.addObject("currentPage", currentPage);
			mav.addObject("memList", memList);
			mav.setViewName("withdrawList");
			return mav;
		}

		totalCount = memList.size();

		page = new Paging(currentPage, totalCount, blockCount, blockPage, "withdrawList");
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		memList = memList.subList(page.getStartCount(), lastCount);

		mav.addObject("totalCount", totalCount);
		mav.addObject("pagingHtml", pagingHtml);
		mav.addObject("currentPage", currentPage);

		mav.addObject("memList", memList);
		mav.setViewName("withdrawList");

		return mav;
	}

	// 회원삭제하기
	@RequestMapping("adminMemDel.do")
	public ModelAndView memberDel(HttpServletRequest request) {
		Date deldate = new Date();
		/* System.out.println("현재시간: " + deldate); */
		String email = request.getParameter("email");

		memberService.updateDelMem(email);
		mav.setViewName("redirect:memberList.do");

		return mav;
	}

	@RequestMapping("adminMemDel2.do")
	public ModelAndView memberDel2(HttpServletRequest request) {
		String email = request.getParameter("email");

		adminService.deleteMem(email);
		mav.setViewName("redirect:withdrawList.do");

		return mav;
	}

	@RequestMapping("adminMemRestore.do")
	public ModelAndView memberRestore(HttpServletRequest request) {
		String email = request.getParameter("email");

		adminService.updateRestoreMem(email);
		mav.setViewName("redirect:withdrawList.do");

		return mav;
	}

	@RequestMapping("adminMemDetail.do")
	public ModelAndView memberDetail(HttpServletRequest request) {
		String email = request.getParameter("email");
		String currentPage = request.getParameter("currentPage");
		MemberModel mem = memberService.getMember(email);
		mav.addObject("currentPage", currentPage);
		mav.addObject("mem", mem);
		mav.setViewName("adminMemDetail");

		return mav;
	}

	@RequestMapping("adminMemModify.do")
	public ModelAndView memberModify(HttpServletRequest request) {
		String email = request.getParameter("email");
		String currentPage = request.getParameter("currentPage");
		MemberModel mem = memberService.getMember(email);
		mav.addObject("currentPage", currentPage);
		mav.addObject("mem", mem);
		mav.setViewName("adminMemModify");

		return mav;
	}

	@RequestMapping(value = "adminMemModify.do", method = RequestMethod.POST)
	public ModelAndView memberModify(@ModelAttribute("mem") MemberModel mem, HttpServletRequest request) {
		String email = request.getParameter("email");
		String currentPage = request.getParameter("currentPage");
		/* System.out.println("이메일값:"+ email); */
		adminService.adminUpdateMem(mem);
		mav.addObject("currentPage", currentPage);
		mav.setViewName("redirect:adminMemDetail.do?email=" + email);

		return mav;
	}

	@RequestMapping("adminInfoDetail.do")
	public ModelAndView adminDetail(HttpSession session) {
		String admin = (String) session.getAttribute("session_email");
		MemberModel mem = memberService.getMember(admin);
		mav.addObject("mem", mem);
		mav.setViewName("adminInfoDetail");

		return mav;
	}

	@RequestMapping(value = "/adminInfoModify.do")
	public ModelAndView adminInfoModify(@ModelAttribute("mem") MemberModel mem, BindingResult result,
			HttpSession session, HttpServletRequest request) {
		int pwchange = 0;
		String admin = request.getParameter("email");
		mem = memberService.getMember(admin);
		mav.addObject("mem", mem);
		mav.addObject("pwchange", pwchange);
		mav.setViewName("adminInfoModify");

		return mav;
	}

	@RequestMapping(value = "/adminInfoModify.do", method = RequestMethod.POST)
	public ModelAndView adminInfoModify(@ModelAttribute("mem") MemberModel mem, BindingResult result,
			HttpSession session) {
		String admin = (String) session.getAttribute("session_email");
		MemberModel memPre = memberService.getMember(admin);
		String pwPre = memPre.getPassword();
		mem.setEmail(admin);
		String pw = mem.getPassword();
		int pwchange = 0;
		if (pw.equals(pwPre)) {
			pwchange = -1;
		} else {
			pwchange = 1;
			adminService.adminUpdate(mem);
			session.invalidate();
		}
		mav.addObject("pwchange", pwchange);
		mav.setViewName("adminInfoModify");
		return mav;
	}


	@RequestMapping("stats.do")
	public ModelAndView stats(HttpServletRequest request) {
		SimpleDateFormat form = new SimpleDateFormat("MM");
		SimpleDateFormat form2 = new SimpleDateFormat("YYY");
		List<MemberModel> memList = adminService.totalList();
		List<String> join = new ArrayList<String>();
		List<Integer> joinNum = new ArrayList<Integer>();
		List<Integer> joinNum2 = new ArrayList<Integer>();
		int[] count = new int[12];
		int[] count2 = new int[12];
		for (int i = 0; i < 12; i++) {
			joinNum.add(0);
			joinNum2.add(0);
			count[i] = 0;
			count2[i] = 0;
		}
		for (int i = 0; i < memList.size(); i++) {
			int temp = Integer.parseInt(form2.format(memList.get(i).getJoindate()));
			Date nowDate = new Date();
			Calendar cal = Calendar.getInstance();

			GregorianCalendar today = new GregorianCalendar();
			int year = today.get(today.YEAR);

			join.add(form.format(memList.get(i).getJoindate()));

			if (temp == year - 1) {
				if (form.format(memList.get(i).getJoindate()).equals("01")) {
					++count2[0];
					joinNum2.set(0, count2[0]);
				}
				if (form.format(memList.get(i).getJoindate()).equals("02")) {
					++count2[1];
					joinNum2.set(1, count2[1]);
				}
				if (form.format(memList.get(i).getJoindate()).equals("03")) {
					++count2[2];
					joinNum2.set(2, count2[2]);
				}
				if (form.format(memList.get(i).getJoindate()).equals("04")) {
					++count2[3];
					joinNum2.set(3, count2[3]);
				}
				if (form.format(memList.get(i).getJoindate()).equals("05")) {
					++count2[4];
					joinNum2.set(4, count2[4]);
				}
				if (form.format(memList.get(i).getJoindate()).equals("06")) {
					++count2[5];
					joinNum2.set(5, count2[5]);
				}
				if (form.format(memList.get(i).getJoindate()).equals("07")) {
					++count2[6];
					joinNum2.set(6, count2[6]);
				}
				if (form.format(memList.get(i).getJoindate()).equals("08")) {
					++count2[7];
					joinNum2.set(7, count2[7]);
				}
				if (form.format(memList.get(i).getJoindate()).equals("09")) {
					++count2[8];
					joinNum2.set(8, count2[8]);
				}
				if (form.format(memList.get(i).getJoindate()).equals("10")) {
					++count2[9];
					joinNum.set(9, count2[9]);

				}
				if (form.format(memList.get(i).getJoindate()).equals("11")) {
					++count2[10];
					joinNum2.set(10, count2[10]);
				}
				if (form.format(memList.get(i).getJoindate()).equals("12")) {
					++count2[11];
					joinNum.set(11, count2[11]);
				}
			}
			if (temp == year) {
				if (form.format(memList.get(i).getJoindate()).equals("01")) {
					++count[0];
					joinNum.set(0, count[0]);
				}
				if (form.format(memList.get(i).getJoindate()).equals("02")) {
					++count[1];
					joinNum.set(1, count[1]);
				}
				if (form.format(memList.get(i).getJoindate()).equals("03")) {
					++count[2];
					joinNum.set(2, count[2]);
				}
				if (form.format(memList.get(i).getJoindate()).equals("04")) {
					++count[3];
					joinNum.set(3, count[3]);
				}
				if (form.format(memList.get(i).getJoindate()).equals("05")) {
					++count[4];
					joinNum.set(4, count[4]);
				}
				if (form.format(memList.get(i).getJoindate()).equals("06")) {
					++count[5];
					joinNum.set(5, count[5]);
				}
				if (form.format(memList.get(i).getJoindate()).equals("07")) {
					++count[6];
					joinNum.set(6, count[6]);
				}
				if (form.format(memList.get(i).getJoindate()).equals("08")) {
					++count[7];
					joinNum.set(7, count[7]);
				}
				if (form.format(memList.get(i).getJoindate()).equals("09")) {
					++count[8];
					joinNum.set(8, count[8]);
				}
				if (form.format(memList.get(i).getJoindate()).equals("10")) {
					++count[9];
					joinNum.set(9, count[9]);

				}
				if (form.format(memList.get(i).getJoindate()).equals("11")) {
					++count[10];
					joinNum.set(10, count[10]);
				}
				if (form.format(memList.get(i).getJoindate()).equals("12")) {
					++count[11];
					joinNum.set(11, count[11]);
				}
			}

		}

		mav.addObject("joinNum2", joinNum2);
		mav.addObject("joinNum", joinNum);

		mav.setViewName("stats");
		return mav;
	}

	@RequestMapping("/excel.do")
	public ModelAndView excelDown(HttpServletRequest request) {

		List<MemberModel> memList = adminService.memberList();

		mav.addObject("memList", memList);
		mav.setViewName("/admin/member/memberList2");

		return mav;
	}
}
