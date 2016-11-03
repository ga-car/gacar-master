<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">

function reviewList() {
	if(confirm("목록으로 가시겠습니까?") == true){
		location.href='reviewList.do';
	}else {
		return;
	}
}

</script>

<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script>
<link href="/rentacar/resources/admincss/bootstrap.min.css" rel="stylesheet">
<link href="/rentacar/resources/css/reset.css" rel="stylesheet">
<link href="/rentacar/resources/admincss/sb-admin-2.css" rel="stylesheet">
<!-- <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css"> -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css"> 

   .contents-wrap{margin:30px 0 0 0;min-height: 500px;}
   .contents{ margin: 60px 0 0 0;}
   .recode-wrap{text-align: right; color: #888;}
   .hit-wrap{color:#888; margin: 10px 0;}
   .viewForm{margin: 20px 0 0 0;}
   .menu-wrap{text-align: right;}
</style>
<title>REVIEW</title> 
</head>
<body>

<div class="category_top">
   <ul>
       <li class="post1">커뮤니티</li><li>></li><li class="post2">구매후기</li>         
   </ul>
</div>

<div id="wrapper">
<form:form commandName="reviewModel" action="/rentacar/reviewModifySuccess.do" enctype="multipart/form-data" method="post">
      <input type="hidden" name="no" value="${reviewModel.no}" />
      <div id="page-wrapper">
         <div class="row">
            <div class="col-lg-12">
				<h3 class="page-header">REVIEW 수정</h3>
				<table class="table table-striped table-bordered table-hover"  id="dataTables-example">
					<caption>번호,제목,글쓴이,날짜,조회를 나타내는 공지사항 표</caption>
					
					<thead>
						<tr class="danger" >
							<th width="100">글제목</th>
							<td colspan=3>
								<input type="textarea" name="subject" value="${reviewModel.subject}"/>
								<font color="red"><form:errors path="subject" /></font>
							</td>
					</tr>
					</thead>
					
					<tbody>
						<tr><!-- 사용자 -->
							<th>사용자 ID</th>
							<td>
								<strong>
									${session_email }
								</strong>
							</td>
							<td>
								<strong>작성일</strong>
							</td>
							<td>
								<fmt:formatDate value="${reviewModel.regdate}" pattern="yyyy.MM.dd"/>
							</td>
							<input type="hidden" name="email" value="${session_email }"/>
						</tr>
						
						<tr><!-- 글내용 -->
							<th>글내용</th>
							<td colspan=3 height=400 style="padding: 0px !important;">
							   <textarea name="content" value="${reviewModel.content}"
							   		style="margin: 3px; width: 100%; height: 100%;">${reviewModel.content}</textarea> 
							   <font color="red"><form:errors path="content" /></font>
							</td>
							
						</tr>
						
						<tr>
							<th width="100">현재 이미지 </th>
							<td colspan=3>
								<c:if test="${!empty reviewModel.imagefile_savname}">
                            		<img src="/rentacar/resources/reviewUpload/${reviewModel.imagefile_savname}" width="100" height="100" alt="" onerror="this.src='/rentacar/resources/images/noimg_130.gif'" /><input type="hidden"  name="imagefile_savname" value="${reviewModel.imagefile_savname}">
                           		</c:if>
                           	</td>
						</tr>
						
						
						<tr><!-- 파일 -->
							<th>파일</th>
							<td colspan=3>
								<input type="file" name="file" value="${reviewModel.imagefile_savname}"/>
							</td>	
						</tr>
						
					</tbody>
					
				</table>
			</div>
		</div>
	</div>
		
		<div class="row">
            <div class="col-lg-12">
            	<div class="panel panel-default">	
					
				
				
				<!-- 취소 작성완료 버튼 -->
				<div class="menu-wrap">
					<button type="button" onclick="this.form.submit();" class="btn btn-primary">작성완료</button>
					<button type="button" onclick="reviewList();" class="btn btn-primary">목록</button>
				</div>
				<!-- 취소 작성완료 버튼 -->
				</div>
				</div></div>
			 </form:form>
				
				<br/>
				<br/>
				<br/>
				<br/>
				</div>
				
				
				
			
			
	<!-- </div>
	
	</div>
	
</div> -->

</body>
</html>