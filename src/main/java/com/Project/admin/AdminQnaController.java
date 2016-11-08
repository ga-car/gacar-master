package com.Project.admin;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.Project.qna.qnaCommModel;
import com.Project.qna.qnaModel;
import com.Project.qna.qnaService;
import com.Project.util.Paging;

@Controller
@RequestMapping(value = "/admin/qna")
public class AdminQnaController {

	private int searchNum;
	private String isSearch;
	private int currentPage = 1;	 
	private int totalCount; 		 
	private int blockCount = 7;	 
	private int blockPage = 5; 	 
	private String pagingHtml;  
	private Paging page;
	private int comment_count;
	private String commenter;

	//Q&A 관리자 리스트
	@Resource
	private qnaService qnaService;

	@RequestMapping(value="/list.do")
	public ModelAndView qnaList(HttpServletRequest request, qnaModel qnaModel){
		ModelAndView mav = new ModelAndView();
		if(request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() || request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		int commupdate1;
		List<qnaModel> list;
		list = qnaService.qnaList();

		isSearch = request.getParameter("isSearch");

		if(isSearch != null)		{
			searchNum = Integer.parseInt(request.getParameter("searchNum"));

			if(searchNum==0){
				list = qnaService.qnaSearch0(isSearch);
			}else if(searchNum==1){
				list =  qnaService.qnaSearch1(isSearch);
			}else if(searchNum==2){
				list =  qnaService.qnaSearch2(isSearch);
			}
		}

		totalCount = list.size();
		page = new Paging(currentPage, totalCount, blockCount, blockPage, "qnaAdmin");
		pagingHtml=page.getPagingHtml().toString();  

		int lastCount = totalCount;

		if (page.getEndCount() < totalCount){
			lastCount = page.getEndCount() + 1;}

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
		mav.addObject("commupdate1",commupdate1);
		mav.setViewName("qnaAdmin");
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
		mav.setViewName("qnaAdminView");

		return mav;
	}

	//qna 관리자 삭제
	@RequestMapping(value="/delete.do")
	public ModelAndView qnaDelete(HttpServletRequest request, qnaModel qnaModel){			   
		ModelAndView mav = new ModelAndView();

		qnaService.qnaDelete(qnaModel.getNo());
		qnaService.qnaAllCommDelete(qnaModel.getNo());
		mav.setViewName("redirect:list.do");
		return mav;
	}
	//qna 관리자 댓글
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
		mav.setViewName("redirect:/admin/qna/view.do?no=" + qnaCommModel.getContent_num());

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

		mav.setViewName("redirect:/admin/qna/view.do?no=" + no);

		return mav;
	}


}