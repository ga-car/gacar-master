package com.Project.admin;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
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


import com.Project.util.Paging;
import com.Project.review.ReviewModel;
import com.Project.review.ReviewService;
/*import com.Project.validator.ReviewValidator;*/


@Controller
@RequestMapping("/admin/review")
public class adminReviewController {
	/*이거 경로 바꾸기 */
	private static final String uploadPath = "C:\\java\\GACAR\\src\\main\\webapp\\resources\\reviewUpload\\";
	
	@Resource
	private ReviewService reviewService;

	private ReviewService review;
	private int searchNum;
	private String isSearch;
	
	private int currentPage = 1;	 
	private int totalCount; 		 
	private int blockCount = 5;	 
	private int blockPage = 5; 	 
	private String pagingHtml;  
	private Paging page;
	
	@ModelAttribute
	public ReviewModel formBack() {
		return new ReviewModel();
	}
	
	/*/////////////////////////////////////�۸��/////////////////////////////////////*/
	@RequestMapping(value="/list.do")
	public ModelAndView reviewList(HttpServletRequest request) throws UnsupportedEncodingException{
		
		ModelAndView mav = new ModelAndView();
		
		if(request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() || request.getParameter("currentPage").equals("0")) {
            currentPage = 1;
        } else {
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
        }
		
		List<ReviewModel> reviewList = null;
		
		String isSearch = request.getParameter("isSearch");
		if(isSearch != null) isSearch = new String(isSearch.getBytes("8859_1"), "UTF-8");
		
		if(isSearch != null)
		{
			searchNum = Integer.parseInt(request.getParameter("searchNum"));
			
			if(searchNum==0)
				reviewList = reviewService.reviewSearch0(isSearch);
			else if(searchNum==1)
				reviewList = reviewService.reviewSearch1(isSearch);
			else if(searchNum==2)
				reviewList = reviewService.reviewSearch2(isSearch);
		
			totalCount = reviewList.size();
			page = new Paging(currentPage, totalCount, blockCount, blockPage, "list", searchNum, isSearch);
			pagingHtml = page.getPagingHtml().toString();
		
			int lastCount = totalCount;
		
			if(page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;
			
			reviewList = reviewList.subList(page.getStartCount(), lastCount);
		
			mav.addObject("isSearch", isSearch);
			mav.addObject("searchNum", searchNum);
			mav.addObject("totalCount", totalCount);
			mav.addObject("pagingHtml", pagingHtml);
			mav.addObject("currentPage", currentPage);
			mav.addObject("reviewList", reviewList);
			mav.setViewName("adminreviewList");
			return mav;
		}
		
		reviewList = reviewService.reviewList();
		
		totalCount = reviewList.size();
		
		page = new Paging(currentPage, totalCount, blockCount, blockPage, "list");
		pagingHtml=page.getPagingHtml().toString();
		
		int lastCount = totalCount;
		 
		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;
		 
		reviewList = reviewList.subList(page.getStartCount(), lastCount);
		
		mav.addObject("totalCount", totalCount);
		mav.addObject("pagingHtml", pagingHtml);
		mav.addObject("currentPage", currentPage);
		mav.addObject("reviewList", reviewList);
		mav.setViewName("adminreviewList");
		return mav;
	}
	
	/*/////////////////////////////////////�۾��� �� �̵�/////////////////////////////////////*/
	@RequestMapping(value="/write.do", method=RequestMethod.GET)
	public ModelAndView reviewForm(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("reviewWrite");
		return mav;
	}
	
	/*/////////////////////////////�۾���/////////////////////////////////////*/
	@RequestMapping(value="/write.do", method=RequestMethod.POST)
	public String reviewWrite(ReviewModel reviewModel,  BindingResult result,
			MultipartHttpServletRequest multipartHttpServletRequest) throws Exception, Exception{
		ModelAndView mav = new ModelAndView();
		/*��������Ʈ*/
		/*new ReviewValidator().validate(reviewModel, result);*/
		if(result.hasErrors()) {
			mav.setViewName("reviewWrite");
			return "reviewWrite";
		}
		
		/*�ٹٲ�*/
		String content = reviewModel.getContent().replaceAll("\r\n", "<br />");
		reviewModel.setContent(content);
				
		//���ε�
		MultipartFile multipartFile = multipartHttpServletRequest.getFile("file");
    	String filename = multipartFile.getOriginalFilename();
        	if (filename != ""){ 
			    reviewModel.setImagefile_savname(System.currentTimeMillis()+"_"+multipartFile.getOriginalFilename());
			    String savimagename = System.currentTimeMillis()+"_"+multipartFile.getOriginalFilename();
		        FileCopyUtils.copy(multipartFile.getInputStream(), new FileOutputStream(uploadPath+"/"+savimagename));
		        reviewModel.setImagefile_savname(savimagename);
        	}else{
        		reviewModel.setImagefile_savname("NULL");		
        	}
		
		reviewService.reviewWrite(reviewModel);
	
		mav.setViewName("redirect:list.do");
		
		return "redirect:list.do";
	}
	
	@RequestMapping("/view.do")
	public ModelAndView reviewView(HttpServletRequest request){			   
		ModelAndView mav = new ModelAndView();
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		ReviewModel reviewModel = reviewService.reviewView(no);
		reviewService.reviewUpdateReadhit(no);

		mav.addObject("reviewModel", reviewModel);
		mav.setViewName("adminreviewView");
		
		return mav;
	}
	
	/*/////////////////////////////////////�ۻ���/////////////////////////////////////*/
	@RequestMapping("/delete.do")
	public ModelAndView reviewDelete(HttpServletRequest request){
		
		ModelAndView mav = new ModelAndView();
		int no = Integer.parseInt(request.getParameter("no"));
		reviewService.reviewDelete(no);
	/*	reviewService.reviewallcommDelete(no);*/
		mav.setViewName("redirect:list.do");
		
		return mav;	
	}
}
