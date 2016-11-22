<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script>

</head>

<body>
	<div id="list-article" class="content scaffold-list" role="main">
		<!-- 상단 시작 -->
		<div class="nav" role="navigation">
			<h4>고객센터 > 1:1 문의</h4>
		</div>
		<!-- 상단 끝 -->
		<!-- 게시판 글쓰기 시작 -->
		<div class="panel panel-default clearfix">
			<form:form commandName="qnaModel" action="/rentacar/qna/write.do"
				method="post">
				<div class="panel-heading clearfix">
					<div class="avatar avatar-medium clearfix pull-left">
						<div class="avatar-info">사용자 ID : ${session_email }</div>
						<input type="hidden" name="email" id="email"
							value="${session_email }" />
					</div>
				</div>
				<div class="panel-body">
					<fieldset class="form">
						<div class="form-group has-feedback">
							<div>
								<strong>제목</strong> <input type="textarea" name="subject"
									required="" value="${qnaModel.subject}"
									placeholder="제목을 입력해 주세요." class="form-control" id="subject">
								<font color="red"><form:errors path="subject" /></font>
								<!-- 벨리데이터 표시 -->
							</div>
						</div>
						<div class="form-group  has-feedback">
							<div class="note-editor panel panel-default">
								<div class="note-editing-area">
									<textarea name="cenater" id="cenater" class="note-codable"></textarea>
									<div class="note-editable panel-body" contenteditable="true"
										data-placeholder="내용을 입력해 주세요."
										style="height: 300px; max-height: 860px;">
										<p>
											<br>
										</p>

									</div>
								</div>
							</div>
							<div class="nav" role="navigation">
								<fieldset class="buttons">
									<button type="button" onclick="this.form.submit();"
										class="create btn btn-success btn-wide pull-right">작성완료</button>
								</fieldset>
							</div>
					</fieldset>

				</div>
			</form:form>
		</div>
		<!-- 게시판 글쓰기 끝 -->
		<!-- 게시판 리스트 시작 -->
		<div class="panel panel-default">
			<ul class="list-group">
				<c:forEach var="list" items="${수정list}">
					<c:url var="viewURL" value="view.do">
						<c:param name="no" value="${list.no }" />
						<c:param name="currentPage" value="${currentPage }" />
					</c:url>
					<li class="list-group-item  list-group-has-note clearfix">
						<div class="list-title-wrapper clearfix">
							<div class="list-tag clearfix">
								<span class="list-group-item-text article-id">${list.no}</span>
							</div>
							<h3 class="list-group-item-heading ">
								<c:if test="${list.imagefile_savname != 'NULL'}">
									<a href="${viewURL}"> =${list.subject}<img
										src="/rentacar/resources/images/reviewImage.PNG" width="20"
										height="20">&nbsp;
									</a>
								</c:if>
								<c:if test="${list.imagefile_savname == 'NULL'}">
									<a href="${viewURL}"> ${list.subject}</a>
								</c:if>
							</h3>
						</div>
						<div class="list-summary-wrapper clearfix">
							<div class="list-group-item-summary clearfix">
								<ul>
									<li class=""><i class="item-icon fa fa-eye"></i>${list.readcount}</li>
								</ul>
							</div>
						</div>
						<div class="list-group-item-author clearfix">
							<div class='avatar avatar-list clearfix '>
								<div class="avatar-info">
									${list.email}
									<div class="date-created">
										<fmt:formatDate value="${list.regdate}" pattern="yyyy.MM.dd" />
									</div>
								</div>
							</div>
						</div>
					</li>
				</c:forEach>
			</ul>
			<ul class="list-group">
				<c:if test="${fn:length(reviewList) le 0}">
					<br />
					<center>등록된 게시물이 없습니다</center>
					<br />
				</c:if>
			</ul>
		</div>
		<!-- 게시판 리스트 끝 -->
		<!-- 글목록 버튼 시작 -->
		<div class="menu-wrap pull-left">
			<button type="button" onclick="onList()" class="btn btn-primary">목록</button>
		</div>
		<!-- 글목록 버튼 끝 -->
		<!-- 페이지 넘버 시작 -->
		<div class="paging">${pagingHtml}</div>
		<!-- 페이지 넘버 끝 -->
	</div>


<%-- 	<!-- 답변상태 -->

	<select class="form-control" name="sortNum"
		onchange="window.open(value,'_self');"
		style="width: 120px; display: inline-block;">
		<option value="/rentacar/qna/list.do?sortNum=null">-답변분류-</option>
		<option value="/rentacar/qna/list.do?sortNum=1">답변 완료</option>
		<option value="/rentacar/qna/list.do?sortNum=2">답변 전</option>
	</select>



	<table class="table table-striped table-bordered table-hover"
		id="dataTables-example">
		<thead>
			<!-- 글번호 글제목 작성자 작성일 -->
			<tr class="danger">
				<th width="11%">글번호</th>
				<th width="50%">제목 (댓글 개수)</th>
				<th width="14%">작성자</th>
				<th width="14%">작성일</th>
				<th width="11%">조회수</th>
			</tr>
		</thead>
		<tbody>

			<c:forEach var="list" items="${list}">
				<c:url var="viewURL" value="view.do">
					<c:param name="no" value="${list.no}" />
				</c:url>
				<!-- 관리자 -->
				<c:if test="${session_email == 'admin'}">


					<tr>
						<!-- 글번호 -->
						<td align="center">${list.no}</td>

						<!-- 제목[댓글수] -->
						<td style="text-align: left; padding-left: 20px;">
							<!-- 제목 옆에 있는 코맨트수가 0이 아니면 댓글 개수가 출력이 된다. --> <c:if
								test="${list.commcount != 0 }">
								<a href="${viewURL}">${list.subject} [${list.commcount}]</a>
							</c:if> <!-- 코맨트수가 0이면 갯수가 출력이 안된다. --> <c:if
								test="${list.commcount == 0 }">
								<a href="${viewURL}">${list.subject} </a>
							</c:if> <!-- 관리자가 1개 이상의 댓글을 달면 답변완료라는 이미지가 뜬다 --> <c:if
								test="${list.admin>=1}">
								<img src="/rentacar/resources/images/consult_end.gif">
							</c:if>
						</td>

						<!-- 작성자 -->
						<td align="center">${list.email}</td>
						<!-- 작성일 -->
						<td><fmt:formatDate value="${list.regdate}"
								pattern="YYYY-MM-dd, hh:mm" /></td>
						<!-- 조회수 -->
						<td align="center">${list.readcount}</td>

					</tr>

				</c:if>

				<!-- 본인 -->


				<tr>
					<!-- 글번호 -->
					<td align="center">${list.no}</td>

					<!-- 제목[댓글수] -->
					<td style="text-align: left; padding-left: 20px;">
						<!-- 제목 옆에 있는 코맨트수가 0이 아니면 댓글 개수가 출력이 된다. --> <c:if
							test="${list.commcount != 0 }">
							<a href="${viewURL}">${list.subject} [${list.commcount}]</a>
						</c:if> <!-- 코맨트수가 0이면 갯수가 출력이 안된다. --> <c:if
							test="${list.commcount == 0 }">
							<a href="${viewURL}">${list.subject} </a>
						</c:if> <!-- 관리자가 1개 이상의 댓글을 달면 답변완료라는 이미지가 뜬다 --> <c:if
							test="${list.admin>=1}">
							<img src="/rentacar/resources/images/consult_end.gif">
						</c:if>
					</td>

					<!-- 작성자 -->
					<td align="center">${list.email}</td>
					<!-- 작성일 -->
					<td><fmt:formatDate value="${list.regdate}"
							pattern="YYYY-MM-dd, hh:mm" /></td>
					<!-- 조회수 -->
					<td align="center">${list.readcount}</td>
				</tr>



			</c:forEach>


		</tbody>
	</table> --%>

</body>
<script type="text/javascript">
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : oEditors,
		elPlaceHolder : document.getElementById('txtContent'), // html editor가 들어갈 textarea id
		sSkinURI : "/rentacar/resources/se/SmartEditor2Skin.html", // html editor가 skin url
		fOnAppLoad : function() {
			//수정모드를 구현할 때 사용할 부분. 로딩이 끝난 후 값이 체워지게 하는 구현을 하면 된다.
			var subject = '${reviewModel.subject}';
			var content = '${reviewModel.content}'; //db에서 불러온 값을 여기에서 체워넣으면 됨.
			document.getElementById("title").value = subject;
			oEditors.getById["txtContent"].exec("PASTE_HTML", [ content ]); //로딩이 끝나면 contents를 txtContent에 넣음
		},
		fCreator : "createSEditor2"
	});

	var onWrite = function() {
		oEditors.getById["txtContent"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됨
		var boardWriteForm = document.getElementById("boardWriteForm");
		boardWriteForm.action = "/rentacar/review/write.do";
		boardWriteForm.submit();
	};

	var onModify = function() {
		oEditors.getById["txtContent"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됨
		var boardWriteForm = document.getElementById("boardWriteForm");
		boardWriteForm.action = "/rentacar/review/modifySuccess.do";
		boardWriteForm.submit();
	};

	var pasteHTML = function(imagefile_savname) {
		var sHTML = '<img src="rentacar/resources/reviewUpload/'+imagefile_savname+'">';/* ${pageContext.request.contextPath} */
		oEditors.getById["txtContent"].exec("PASTE_HTML", [ sHTML ]);
	};
</script>
</html>
