<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript">

var onComment = function(){
	var form = $('.commentForm')[0];
	form.action = 'commWrite.do';
	if(form.commentt.value == ""){
		alert("내용을 입력해주세요");
	}else{
		form.submit();
	}
	
	 //넘기는 부분
	}
function qnaDelete() {
	if(confirm("삭제 하시겠습니까?") == true){
		location.href='delete.do?no=${qnaModel.no}';
	}else {
		return;
	}
}

function qnaModify() {
	if(confirm("수정 하시겠습니까?") == true){
	location.href='modify.do?no=${qnaModel.no}';
	}else {
		return;
	}
}
function qnaCommDelete(num) {
	if(confirm("댓글을 삭제 하시겠습니까?") == true){
		location.href='commDelete.do?comment_num='+ num+'&no=${qnaModel.no}';
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
}
</script>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script>
<title>Q&A</title>
</head>
<body>
	<div id="article" class="content" role="main">
		<!-- 상단 시작 -->
		<div class="nav" role="navigation">
			<h4>고객센터 > 공지사항 > ${qnaModel.subject }</h4>
		</div>
		<!-- 상단 끝 -->
		<!--게시판 뷰 시작-->
		<div class="panel panel-default clearfix">
			<!--작성 정보 시작-->
			<div class="panel-heading clearfix">
				<div class='avatar avatar-medium clearfix pull-left'>
					<!-- 제목 -->
					<h2 class="panel-title">${qnaModel.subject }</h2>
				</div>
				<div class="content-identity pull-right">

					<!-- 작성자명 -->
					<div class="content-identity-count">${qnaModel.email}</div>

					<!-- 조회수 -->
					<div class="content-identity-count">
						<i class="fa fa-eye"></i> ${qnaModel.readcount}
					</div>


					<!-- 작성일 -->
					<div class="content-identity-count">
						<span class="timeago"> <fmt:formatDate
								value="${qnaModel.regdate }" pattern="yy-MM-dd" />
						</span>
					</div>


				</div>
				<!--작성자 정보 끝 -->
			</div>
			<!--작성 정보 끝-->
			<div class="content-container ">
				<div id="content-body" class="panel-body pull-left">
					<!-- 글내용 -->
					<article class="content-text">${qnaModel.contents }</article>

				</div>
			</div>
		</div>
		<form class="viewForm" method="post">
			<input type="hidden" name="${qnaModel.no }" />
			<%-- <input type="hidden" name="seq" value="${item.seq }" /> --%>
			<c:if test="${session_member_id == 'admin' }">
				<button type="button" onclick="onModify(${qnaModel.no })"
					class="btn btn-primary">수정</button>
			</c:if>
			<button type="button" onclick="onList()" class="btn btn-primary">목록</button>
		</form>
		<!--게시판 뷰 끝-->

		<div class="panel panel-default clearfix">
			<!-- List group -->
			<ul class="list-group">

				<li id="note-title" class="list-group-item note-title">
					<h3 class="panel-title">
						댓글 <span id="note-count">[댓글 수]</span>
					</h3>
				</li>

				<li class="list-group-item note-item clearfix" id="note-1142581">
					<form action="/content/update/1142581" method="post"
						data-id="1142581" class="note-update-form">
						<input type="hidden" name="_method" value="PUT" id="_method" />
						<div class="content-body panel-body pull-left">
							<div class='avatar avatar-medium clearfix '>
								<a href='/user/info/21499' class='avatar-photo'> <img
									src='//www.gravatar.com/avatar/0efee14839e7e4da52f1f52dd33dd5f2?d=identicon&s=40' /></a>
								<div class="avatar-info">
									<a class="nickname" href="/user/info/21499">pannet15</a>
									<div class="activity">
										<span class="fa fa-flash"></span> 537
									</div>
									<div class="date-created">
										<span class="timeago" title="2016-11-16 17:16:41.0">2016-11-16
											17:16:41.0</span>
									</div>
								</div>
							</div>
							<fieldset class="form">
								<article id="note-text-1142581"
									class="list-group-item-text note-text"> [댓글내용] </article>
							</fieldset>
						</div>
					</form>

					<form action="/content/delete/1142581" method="post"
						id="note-delete-form-1142581">
						<input type="hidden" name="_method" value="DELETE" id="_method" />
					</form>
				</li>
				<li class="list-group-item note-form clearfix">


					<div class="panel-body">
						<h5 class="text-center">
							<a href="/login/auth?redirectUrl=%2Farticle%2F360475"
								class="link">로그인</a>을 하시면 댓글을 등록할 수 있습니다.
						</h5>
					</div>


				</li>
				<!-- 댓글 쓰기 폼 시작 -->
				<li class="list-group-item note-form clearfix">

					<form action="/article/addNote/361528" method="post"
						class="note-create-form">

						<div class="content-body panel-body pull-left">
							<div style="margin-left: 5px;">


								<div class="avatar avatar-medium clearfix ">
									<a href="/user/info/49756" class="avatar-photo"><img
										src="//www.gravatar.com/avatar/1c3ecba7722e67b1b5db8d4facd36d1a?d=identicon&amp;s=40"></a>
									<div class="avatar-info">
										<a class="nickname" href="/user/info/49756">푸른바다생각</a>
										<div class="activity block">
											<span class="fa fa-flash"></span> 0
										</div>
									</div>
								</div>

							</div>
							<fieldset class="form">
								<input type="hidden" name="note.textType" value="HTML"
									id="note.textType">
								<textarea name="note.text" id="note-create" placeholder="댓글 쓰기"
									class="form-control" style="display: none;"></textarea>
								<div class="note-editor panel panel-default">
									<div class="note-editing-area">

										<textarea class="note-codable"></textarea>
										<div class="note-editable panel-body" contenteditable="true"
											data-placeholder="댓글 쓰기" style="height: 300px;">
											<p>
												<br>
											</p>
										</div>
									</div>

								</div>
							</fieldset>
						</div>
						<div class="content-function-cog note-submit-buttons clearfix">
							<p>
								<a href="javascript://" id="note-create-cancel-btn"
									class="btn btn-default btn-wide" style="">취소</a>
							</p>
							<input type="submit" name="create" id="btn-create-btn"
								class="btn btn-success btn-wide" value=" 등록">
						</div>
					</form>


				</li>

				<!-- 댓글 쓰기 폼 끝 -->

			</ul>
		</div>

	</div>
	<!-- 댓글쓰는 창	 -->
	<div class="inner">
		<form class="commentForm" method="post"
			onsubmit="return validation();">
			<input type="hidden" name="content_num" value="${qnaModel.no}" /> <input
				type="hidden" name="commenter" value="${session_email}" />
			<div class="reply_grp">
				<div class="reply_form">

					<div class="reply_write">
						<div class="textarea_grp" style="width: 1000px;">
							<!-- 로그인안했을 때 보여주는 댓글 요청 내용 -->
							<br />
							<c:if test="${session_email == null}">
								<input type="text"
									style="align: center; margin: 10px; width: 950px; height: 55px;"
									value="로그인 후에  댓글 작성이 가능합니다." readonly="readonly" />
							</c:if>
							<!-- 댓글 쓰는 창 -->
							<c:if test="${session_email != null}">
								<!-- 글자 수 제한 -->
								<textarea name="commentt" style="width: 885px; height: 55px;"
									onKeyUp="javascript:fnChkByte(this,'200')"></textarea>
								<button type="button" class="btn1 btn-primary1"
									onclick="onComment()">입력</button>
								<div style="margin-bottom: 10px;">
									<br />&nbsp;&nbsp;&nbsp;<span id="byteInfo">0</span>/200Byte
								</div>
							</c:if>
						</div>
					</div>
					<p class="reply_num">
						<strong>댓글 총 개수 : ${comment_count}</strong>
					</p>
				</div>

				<!-- 댓글 차례로 보여주는 창 -->
				<c:forEach var="list" items="${CommList}">
					<div style="margin-bottom: 50px;">
						<div class="reply_view">
							<div class="reply_tit">
								<p class="tit">
									<strong>${list.commenter}</strong>님
									<fmt:formatDate value="${list.reg_date}" pattern="yy.MM.dd"></fmt:formatDate>
									<span class="ip"></span>
								</p>
								<!-- 입력되어 있는 작성자와 아이디가 같거나, 아이디가 admin 일때만 삭제  창을 띄운다. -->
								<c:if
									test="${session_email == list.commenter || session_email == 'admin'}">
									<td align="left">
										<%-- <input type="button" onclick="qnaCommDelete(${list.comment_num},${session_email})&qnaCommUpdate2(${list.content_num})"  value="삭제" class="btn btnC_01 btnP_02"/> --%>
										<a
										href="commDelete.do?comment_num=${list.comment_num}&no=${qnaModel.no}&commenter=${list.commenter}">
											<input type="button"
											onclick="qnaCommDelete(${list.comment_num})" value="삭제"
											class="btn btnC_01 btnP_02" />
									</a>
									</td>
									<!-- 						<span class="btn btnC_05 reply_btn">	삭제</span> -->
								</c:if>
							</div>
							<div class="reply_cts">
								<p>${list.commentt}</p>
								<br />
							</div>
						</div>
					</div>
				</c:forEach>

			</div>
		</form>
		<c:if test="${fn:length(CommList) le 0}">
			<br />
			<center>등록된 댓글이 없습니다</center>
			<br />
		</c:if>
	</div>
</body>


<script type="text/javascript">
/* 	var onModify = function(no){
		var form = $('.viewForm')[0];
		form.action = 'noticeModify.dog?no='+no;
		form.submit();
	}; */
	
	var onList = function(){
		location.href='list.do'
	};
</script>
</html>

