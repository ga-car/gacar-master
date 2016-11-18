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

$('.searchOption').val($('.searchOptionVal').val());
var onWrite = function(){
	location.href = '/review/write.do'; 
};
var onList = function(){
	location.href = location.href;
};
var goPage = function(page){
	var form = $('.form-wrap')[0];
	$('.page').val(page);
	form.submit();
};

var onSearch = function(){
	var form = $('.form-wrap')[0];
	form.submit();
};

var onView = function(no){
	location.href='view.do?no='+no;
};

var onModify = function(no){
	location.href='/review/modify.do?no='+no;
};
</script>

<script type="text/javascript">

function reviewList() {
	if(confirm("목록으로 가시겠습니까?") == true){
		location.href='list.do';
	}else {
		return;
	}
}

function reviewDelete() {
	if(confirm("삭제 하시겠습니까?") == true){
		location.href='delete.do?no=${reviewModel.no}';
	}else {
		return;
	}
}


</script>

<script language="javascript"> 

//글자수 제한 체크 
function fnChkByte(obj, maxByte){
	var str = obj.value;
	var str_len = str.length;

	var rbyte = 0;
	var rlen = 0;
	var one_char = "";
	var str2 = "";

	for(var i=0; i<str_len; i++){
	one_char = str.charAt(i);
	if(escape(one_char).length > 4){
	    rbyte += 2;                                         //한글2Byte
	}else{
    	rbyte++;                                            //영문 등 나머지 1Byte
	}

	if(rbyte <= maxByte){
	    rlen = i+1;                                          //return할 문자열 갯수
	}
}

	if(rbyte > maxByte){
    	alert("한글 "+(maxByte/2)+"자 / 영문 "+maxByte+"자를 초과 입력할 수 없습니다.");
    	str2 = str.substr(0,rlen);                                  //문자열 자르기
    	obj.value = str2;
    	fnChkByte(obj, maxByte);
	}else{
    	document.getElementById('byteInfo').innerText = rbyte;
	}
	
	if(str.length == 0 && rlen == 0){
		alert("내용을 입력해 주세요");
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
       <li class="post1">커뮤니티</li><li>></li><li class="post2">이용후기</li>         
   </ul>
</div>

<div id="wrapper">
      <div id="page-wrapper">
         <div class="row">
            <div class="col-lg-12">
				<h3 class="page-header">REVIEW 상세보기</h3>
				<table class="table table-striped table-bordered table-hover"  id="dataTables-example">
					<caption>번호,제목,글쓴이,날짜,조회를 나타내는 공지사항 표</caption>
					
					<thead>
						<tr class="danger" >
							<th width="100">글제목</th>
							<td colspan=3>
								${reviewModel.subject}
								
							</td>
						</tr>
					</thead>
					
					<tbody>
						<tr><!-- 사용자 -->
							<th>사용자 ID</th>
							<td>
								<strong>
									${reviewModel.email}
								</strong>
							</td>
							<td>
								<strong>작성일</strong>
							</td>
							<td>
								<fmt:formatDate value="${reviewModel.regdate}" pattern="yyyy.MM.dd"/>
							</td>
							
						</tr>
						
						<tr><!-- 글내용 -->
							<th>글내용</th>
							<td colspan=3 height=450 style="padding: 0px !important;">
							<img src="/rentacar/resources/reviewUpload/${reviewModel.imagefile_savname}" onerror="this.src='/Project/resources/images/noimg_130.gif'" />
								<br/>${reviewModel.content}		
							</td>
						</tr>
						
					</tbody>
					
				</table>
			</div>
		</div>
	</div>
		<div class="menu-wrap">
				<!-- 수정 삭제 목록 버튼 -->
						<button type="button" onclick="reviewDelete();" class="btn btn-primary">삭제</button>
						<button type="button" onclick="reviewList();" class="btn btn-primary">목록</button>
				<!-- 수정 삭제 목록 버튼 -->
				</div>
	</div>

<br /><br />
</body>
</html>