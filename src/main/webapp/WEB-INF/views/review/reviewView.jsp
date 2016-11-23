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

function reviewModify() {
	if(confirm("수정 하시겠습니까?") == true){
	location.href='modify.do?no=${reviewModel.no}';
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
<title>REVIEW</title> 
</head>
<body>
	<div id="article" class="content" role="main">
	<!-- 상단 시작 -->
		<div class="nav" role="navigation">
			<h4>이용후기</h4>
			<!-- 게시판 검색 시작 -->
			<div class="category-filter-wrapper">
				<div class="category-filter-wrapper">
					<form action="" name="category-filter-form"
						id="category-filter-form">
						<div class="category-filter-query pull-right">
							<div class="input-group input-group-sm">
								<input type="text" name="isSearch" id="isSearch"
									class="form-control" placeholder="검색어" value="" /> <span
									class="input-group-btn">
									<button type="submit" class="btn btn-default">
										<i class="fa fa-search"></i>
									</button>
								</span>
							</div>
						</div>
						<ul class="list-sort pull-left">
							<li><select name="searchNum" id="searchNum">
									<option value="0">제목</option>
									<option value="1">내용</option>
									<option value="2">글쓴이</option>
							</select></li>

						</ul>
						<input type="hidden" name="sort" id="category-sort-input"
							value="id" /> <input type="hidden" name="order"
							id="category-order-input" value="desc" />
					</form>
				</div>
			</div>
			<!-- 게시판 검색 끝 -->
		</div>
		<!-- 상단 끝 -->
		<!--게시판 뷰 시작-->
		<div class="panel panel-default clearfix">
			<!--작성 정보 시작-->
			<div class="panel-heading clearfix">
				
				<div class='avatar avatar-medium clearfix pull-left'>
					<!-- 제목 -->
					<h2 class="panel-title">${reviewModel.subject }</h2>
						<div class="content-identity-count">${reviewModel.email }</div>
				</div>
				<div class="content-identity pull-right">

							<!-- 작성자명 -->
						

							<!-- 조회수 -->
							<div class="content-identity-count">
								<i class="fa fa-eye"></i> ${reviewModel.readcount}
							</div>

							<!-- 작성일 -->
							<div class="content-identity-count">
								<span class="timeago"> <fmt:formatDate
										value="${reviewModel.regdate }" pattern="yy-MM-dd" />
								</span>
							</div>	
				</div>
				<!--작성자 정보 끝 -->
			</div>
			<!--작성 정보 끝-->
			<div class="content-container ">
				<div id="content-body" class="panel-body pull-left">
					<!-- 글내용 -->
				<div class='avatar avatar-medium clearfix pull-left'>
						<h6>이용 차량 : [${reviewModel.car }]</h6> 
				</div>	
				<div class='avatar avatar-medium clearfix pull-right'>
					<h6>이용 기간 : ${reviewModel.usedate }</h6> 
				</div>	
					<article class="content-text">${reviewModel.content }</article>
					<img src="/rentacar/resources/reviewUpload/${reviewModel.imagefile_savname}" onerror="this.style.display='none'" style="max-width: 100%; height: auto;"/>
				</div>
			</div>
		</div>
		<form class="viewForm" method="post">
			<input type="hidden" name="${reviewModel.no }" />
			<c:if test="${session_email == reviewModel.email || session_email == 'admin'}">	<!-- 관리자 혹은 글쓴이는 글 수정 , 삭제가능 -->
						<button type="button" onclick="reviewModify();" class="btn btn-primary">수정</button>
						<button type="button" onclick="reviewDelete();" class="btn btn-primary">삭제</button>
					</c:if>
						<button type="button" onclick="reviewList();" class="btn btn-primary">목록</button>
		</form>
		<!--게시판 뷰 끝-->
	</div>
</body>
</html>