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
		location.href='list.do';
		return;
	}
}

</script>

<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script>
<link href="/rentacar/resources/admincss/bootstrap.min.css" rel="stylesheet">
<link href="/rentacar/resources/css/reset.css" rel="stylesheet">
<link href="/rentacar/resources/admincss/sb-admin-2.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css"> 

   .contents-wrap{margin:30px 0 0 0;min-height: 500px;}
   .contents{ margin: 60px 0 0 0;}
   .recode-wrap{text-align: right; color: #888;}
   .hit-wrap{color:#888; margin: 10px 0;}
   .viewForm{margin: 20px 0 0 0;}
</style>
<title>REVIEW</title> 
</head>


<body>

<div class="category_top">
   <ul>
       <li class="post1">커뮤니티</li><li>>></li><li class="post2">구매후기</li>         
   </ul>
</div>
<div id="wrapper">
<form:form commandName="reviewModel" action="write.do" enctype="multipart/form-data"	method="post">
      <div id="page-wrapper">
         <div class="row">
            <div class="col-lg-12">
				<h3 class="page-header"> 글쓰기</h3>
				<table class="table table-striped table-bordered table-hover"  id="dataTables-example">
					<caption>번호,제목,글쓴이,날짜,조회를 나타내는 공지사항 표</caption>
					
					<thead>
						<tr class="danger" >
							<th width="100">글제목</th>
							<td colspan=3>
								<input type="textarea" style=" width: 500px; " name="subject" value="${reviewModel.subject}"/>
								<font color="red"><form:errors path="subject" /></font><!-- 벨리데이터 표시 -->
							</td>
						</tr>
					</thead>
					
					<tbody>
						<tr><!-- 사용자 -->
							<th>사용자 ID</th>
							<td colspan=3>
								<strong>
									${session_email }
								</strong>
							</td>
							<input type="hidden" name="email" value="${session_email }"/>
						</tr>
						
						<tr><!-- 글내용 -->
							<th>글내용</th>
							<td colspan=3 height=450 style="padding: 0px !important;">
							   <textarea  name="content" style=" padding:3px; margin: 1px; width: 100%; height: 98%;"></textarea>
							   <font color="red"><form:errors path="content" /></font><br/><!-- 벨리데이터 표시 -->
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
		<!-- 취소 작성완료 버튼 -->
				<div class="menu-wrap" style="text-align: right;">
					<button type="button" onclick="this.form.submit();" class="btn btn-primary">작성완료</button>
					<button type="button" onclick="reviewList();" class="btn btn-primary">목록</button>
				</div>
	
			 </form:form>
				
				<br/>
				<br/>
				<br/>
				<br/>
				</div>


</body>
<script type="text/javascript">
var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: document.getElementById('txtContent'), // html editor가 들어갈 textarea id
	sSkinURI: "/rentacar/resources/se/SmartEditor2Skin.html",  // html editor가 skin url
	fOnAppLoad: function () { 
        //수정모드를 구현할 때 사용할 부분. 로딩이 끝난 후 값이 체워지게 하는 구현을 하면 된다.
         var subject = '${reviewModel.subject}';               
         var content = '${reviewModel.content}';         //db에서 불러온 값을 여기에서 체워넣으면 됨.
         document.getElementById("title").value = subject;     
         oEditors.getById["txtContent"].exec("PASTE_HTML", [content]); //로딩이 끝나면 contents를 txtContent에 넣음
     },
     fCreator: "createSEditor2"
 });

var onWrite = function(){
	oEditors.getById["txtContent"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됨
	var boardWriteForm = document.getElementById("boardWriteForm");  
	boardWriteForm.action ="/rentacar/review/write.do";              
	boardWriteForm.submit();  
};

var onModify = function(){
	oEditors.getById["txtContent"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됨
	var boardWriteForm = document.getElementById("boardWriteForm");  
	boardWriteForm.action ="/rentacar/review/modifySuccess.do";              
	boardWriteForm.submit();  
};

var pasteHTML = function(imagefile_savname){
    var sHTML = '<img src="rentacar/resources/reviewUpload/'+imagefile_savname+'">';/* ${pageContext.request.contextPath} */
    oEditors.getById["txtContent"].exec("PASTE_HTML", [sHTML]);
};
</script>
</html>