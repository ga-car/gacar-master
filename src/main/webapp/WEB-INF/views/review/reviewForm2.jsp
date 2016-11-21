<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script>
<script type="text/javascript">
	function reviewList() {
		if (confirm("목록으로 가시겠습니까?") == true) {
			location.href = 'list.do';
			return;
		}
	}
</script>
</head>
<body>
	<!-- body 시작 -->
	<div id="article-create" class="content" role="main">
		<!-- 헤드글 시작 -->
		<div class="content-header">
			<h3>새 글 쓰기</h3>
		</div>
		<!-- 헤드글 끝 -->
		<div class="panel panel-default clearfix">
			<!-- form 정보 위치1 -->

			<!-- 유저이메일 시작 -->
			<div class="panel-heading clearfix">
				<div class="avatar avatar-medium clearfix pull-left">
					${session_email }</div>
				<input type="hidden" name="email" value="${session_email }" />
			</div>
			<!-- 유저이메일 끝 -->
			<!-- 글쓰기 창 시작 -->
			<div class="panel-body">
				<!-- form 정보 위치2 -->
				<form:form commandName="reviewModel" action="write.do"
					enctype="multipart/form-data" method="post">
					<fieldset class="form">
						<input type="hidden" name="categoryCode" value="questions"
							id="categoryCode">
						<!-- 글 제목 작성창 시작 -->
						<div class="form-group has-feedback">
							<div>
								<input type="textarea" name="subject" required=""
									value="${reviewModel.subject}" placeholder="제목을 입력해 주세요."
									class="form-control" id="title"> <font color="red"><form:errors
										path="subject" /></font>
								<!-- 벨리데이터 표시 -->
							</div>
						</div>
						<!-- 글 제목 작성창 끝 -->
						<!-- 글 내용 창 시작 -->
						<div class="form-group  has-feedback">

							<textarea name="content" id="content" rows="20"
								class="form-control input-block-level" style="display: none;"></textarea>
										<font color="red"><form:errors path="content" /></font><br />
										<!-- 벨리데이터 표시 -->
										<p>
											<br>
										</p>

									</div>

						
								</div>
								<div class="nav" role="navigation">
									<input type="file" name="file"
										value="${reviewModel.imagefile_savname}" />
								</div>

							</div>
							<!-- 글 내용 창 끝 -->
							<div class="nav" role="navigation">
								<fieldset class="buttons">
									<button type="button" onclick="this.form.submit();"
										class="create btn btn-success btn-wide pull-right">작성완료</button>
									<button type="button" onclick="reviewList();"
										class="btn btn-default btn-wide">목록</button>
								</fieldset>
							</div>
						</div>
			</div>
			</fieldset>
			</form:form>
		</div>
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