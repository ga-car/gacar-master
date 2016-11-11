package com.Project.qna;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.Project.util.Paging;
import com.Project.validator.qnaValidator;
import com.Project.validator.ReviewValidator;

@Controller
@RequestMapping("/qna")
public class qnaController {

	@Resource
	private qnaService qnaService;
	private int searchNum;
	private String sortNum;
	private String isSearch;

	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 5;
	private int blockPage = 5;
	private String pagingHtml;
	private Paging page;

	private int comment_count;
	private int commupdate1;
	private String commenter;

	@ModelAttribute("qnaModel")
	public qnaModel formBack() {
		return new qnaModel(); // 객체 생성후 반환
	}

	@RequestMapping(value = "/list.do")
	public ModelAndView qnaList(HttpServletRequest request, qnaModel qnaModel) throws UnsupportedEncodingException {
		ModelAndView mav = new ModelAndView();

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		List<qnaModel> list;
		list = qnaService.qnaList();

		/* 게시판 검색 */
		String isSearch = request.getParameter("isSearch");
		if(isSearch != null) isSearch = new String(isSearch.getBytes("8859_1"), "UTF-8");

		if (isSearch != null) {
			searchNum = Integer.parseInt(request.getParameter("searchNum"));

			if (searchNum == 0) {
				list = qnaService.qnaSearch0(isSearch);
			} else if (searchNum == 1) {
				list = qnaService.qnaSearch1(isSearch);
			} else if (searchNum == 2) {
				list = qnaService.qnaSearch2(isSearch);

			}
		}
		/* 답변 유무 카테고리 분류 */
		sortNum = request.getParameter("sortNum");

		if (sortNum == null) {
			System.out.println(sortNum);
			// 콤보박스가 입력이 안 된 상태
		} else {
			System.out.println(sortNum);
			// 콤보박스가 입력이 된 상태
			if (!(sortNum.equals("null"))) {
				if (sortNum.equals("1")) {
					list = qnaService.qnaReply1();
				} else if (sortNum.equals("2")) {
					list = qnaService.qnaReply2();
				}
			}

		}

		totalCount = list.size();
		page = new Paging(currentPage, totalCount, blockCount, blockPage, "list");
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = totalCount;

		if (page.getEndCount() < totalCount) {
			lastCount = page.getEndCount() + 1;
		}

		list = list.subList(page.getStartCount(), lastCount);

		int no = qnaModel.getNo();
		commupdate1 = qnaService.qnaCommUpdate1(no);

		mav.addObject("qnaModel", qnaModel);
		mav.setViewName("qnaView");

		mav.addObject("isSearch", isSearch);
		mav.addObject("searchNum", searchNum);
		mav.addObject("totalCount", totalCount);
		mav.addObject("pagingHtml", pagingHtml);
		mav.addObject("currentPage", currentPage);
		mav.addObject("list", list);
		mav.addObject("commupdate1", commupdate1);
		mav.setViewName("qnaList");
		return mav;
	}

	@RequestMapping(value = "/write.do", method = RequestMethod.GET)
	public ModelAndView qnaForm(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("qnaForm");
		return mav;
	}

	@RequestMapping(value = "/write.do", method = RequestMethod.POST)
	public ModelAndView qnaWrite(@ModelAttribute("qnaModel") qnaModel qnaModel, HttpServletRequest request,
			HttpSession session, BindingResult result) {

		ModelAndView mav = new ModelAndView();

		/* 벨리데이트 */
		new qnaValidator().validate(qnaModel, result);
		if (result.hasErrors()) {
			System.out.println("출력" + result.getErrorCount());
			mav.setViewName("qnaForm");
			return mav;
		}

		String contents = qnaModel.getContents().replaceAll("\r\n", "<br />");
		qnaModel.setContents(contents);

		if (qnaModel.getSecret() == null) {
			qnaModel.setSecret("0");
		} else {
			qnaModel.setSecret("1");
		}

		int no = qnaModel.getNo();

		qnaService.qnaWrite(qnaModel);
		qnaService.qnaCommUpdate1(no);

		mav.addObject("qnaModel", qnaModel);
		mav.setViewName("redirect:/qna/list.do");

		return mav;
	}

	@RequestMapping(value = "/modify.do")
	public ModelAndView qnaModifyForm(HttpServletRequest request, qnaModel qnaModel) {
		ModelAndView mav = new ModelAndView();
		qnaModel = qnaService.qnaView(qnaModel.getNo());
		String contents = qnaModel.getContents().replaceAll("\r\n", "<br />");
		qnaModel.setContents(contents);

		if (qnaModel.getSecret().equals("0"))
			qnaModel.setSecret("false");
		else {
			qnaModel.setSecret("true");
		}

		mav.addObject("qnaModel", qnaModel);
		mav.setViewName("qnaModify");

		return mav;
	}

	@RequestMapping("/modifySuccess.do")
	public ModelAndView qnaModify(@ModelAttribute("qnaModel") qnaModel qnaModel, HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();
		String contents = qnaModel.getContents().replaceAll("\r\n", "<br />");
		qnaModel.setContents(contents);

		if (qnaModel.getSecret() == null) {
			qnaModel.setSecret("0");
		} else {
			qnaModel.setSecret("1");
		}

		qnaService.qnaModify(qnaModel);

		mav.setViewName("redirect:/qna/view.do?no=" + qnaModel.getNo());
		return mav;
	}

	@RequestMapping(value = "/view.do")
	public ModelAndView qnaView(HttpServletRequest request, qnaModel qnaModel) {
		ModelAndView mav = new ModelAndView();

		int no = qnaModel.getNo();

		qnaService.qnaView(no);
		qnaModel = qnaService.qnaView(no);
		qnaService.qnaUpdateReadcount(no);
		comment_count = qnaService.qnaCommCount(no);
		List<qnaCommModel> qnaCommList;
		qnaCommList = qnaService.qnaCommList(no);

		/* 댓글 세기 */
		comment_count = qnaCommList.size();

		mav.addObject("CommList", qnaCommList);
		mav.addObject("comment_count", comment_count);
		mav.addObject("qnaModel", qnaModel);
		mav.setViewName("qnaView");

		return mav;
	}

	@RequestMapping(value = "/commWrite.do", method = RequestMethod.POST)
	public ModelAndView qnaCommWrite(qnaCommModel qnaCommModel, qnaModel qnaModel, HttpServletRequest request,
			HttpSession session) {

		int no = qnaCommModel.getContent_num();

		ModelAndView mav = new ModelAndView();
		String commentt = qnaCommModel.getCommentt().replaceAll("\r\n", "<br />");
		qnaCommModel.setCommentt(commentt);

		qnaService.qnaCommWrite(qnaCommModel);
		qnaService.qnaCommUpdate1(no);
		commenter = qnaCommModel.getCommenter();
		System.out.println(commenter);

		if (commenter.equals("admin")) {
			qnaService.AdminUpdateReply(no);
		}
		mav.setViewName("redirect:/qna/view.do?no=" + qnaCommModel.getContent_num());

		return mav;
	}

	@RequestMapping(value = "/delete.do")
	public ModelAndView qnaDelete(HttpServletRequest request, qnaModel qnaModel) {
		ModelAndView mav = new ModelAndView();

		qnaService.qnaDelete(qnaModel.getNo());
		qnaService.qnaAllCommDelete(qnaModel.getNo());
		mav.setViewName("redirect:/qna/list.do");

		return mav;
	}

	@RequestMapping(value = "/commDelete.do", method = RequestMethod.GET)
	public ModelAndView qnaCommDelete(HttpServletRequest request, qnaCommModel qnaCommModel, qnaModel qnaModel,
			HttpSession session) {
		ModelAndView mav = new ModelAndView();

		// System.out.println("시작할때 댓글번호 : " + qnaCommModel.getComment_num());
		// System.out.println("댓글쓴사람 : "+
		// session.getAttribute("session_email"));

		int no = qnaModel.getNo();

		qnaService.qnaCommDelete(qnaCommModel);
		// 지우는SQL 실행

		qnaService.qnaView(no);
		qnaService.qnaCommUpdate2(no);
		commenter = (String) session.getAttribute("session_email");
		// System.out.println("쿼리실행후 코멘터"+commenter);

		if (commenter.equals("admin")) {
			// System.out.println("if문 진입");
			qnaService.AdminDeleteReply(no);
		}

		mav.setViewName("redirect:/qna/view.do?no=" + no);

		return mav;
	}

}