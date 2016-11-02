<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link href="/rentacar/resources/admincss/bootstrap.min.css"
	rel="stylesheet">
<link href="/rentacar/resources/admincss/sb-admin-2.css"
	rel="stylesheet">
<title>Q&A 게시판</title>
<style type="text/css">
thead>tr>th {
	text-align: center;
}

tbody>tr>td:nth-child(1) {
	width: 80px;
	text-align: center;
}

tbody>tr>td:nth-child(3) {
	width: 110px;
	text-align: center;
}

tbody>tr>td:nth-child(4) {
	width: 130px;
	text-align: center;
}

tbody>tr>td:nth-child(5) {
	width: 70px;
	text-align: center;
}

tbody>tr:HOVER {
	color: #da8c92;
	cursor: pointer;
}

.menu-wrap {
	text-align: right;
}

.form-wrap {
	text-align: center;
}
</style>
</head>

<body>

	<div class="category_top">
		<ul>
			<li class="post1">커뮤니티</li>
			<li>></li>
			<li class="post2">Q&A</li>
		</ul>
	</div>
	<div id="wrapper">
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<div class="page-header">
						<img src="/rentacar/resources/images/SkinImg/1.jpg"> <strong><font
							size="6px">Q&A</font></strong>&nbsp;&nbsp; <font color="red">질문&답변
							게시판입니다.</font>
					</div>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<!-- /.panel-heading -->
						<div class="dataTable_wrapper" style="margin: 5px;">
							<div style="margin: 5px;">
								<a href="/rentacar/qna/qnaList.do"><button type="button"
										class="btn btn-outline btn-default">전체</button></a>
								<c:if test="${session_email == 'admin'}">
									<select class="form-control" name="replyNum"
										onchange="window.open(value,'_self');"
										style="width: 120px; display: inline-block;">
										<option value="/rentacar/qna/qnaList.do?replyNum=null">-답변분류-</option>
										<option value="/rentacar/qna/qnaList.do?replyNum=1">답변
											완료</option>
										<option value="/rentacar/qna/qnaList.do?replyNum=2">답변
											전</option>
									</select>
								</c:if>
							</div>
						</div>
						<table class="table table-striped table-bordered table-hover"
							id="dataTables-example">
							<thead>
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
									<c:url var="viewURL" value="qnaView.do">
										<c:param name="no" value="${list.no}" />
									</c:url>
									<tr class="odd gradeX">
										<c:if test="${list.email == 'admin'}">
											<td align="center"><img
												src="/rentacar/resources/images/adminwrite.png"
												style="width: 30px;"></td>
										</c:if>
										<c:if test="${list.email != 'admin'}">
											<td align="center">${list.no}</td>
										</c:if>
										<td style="text-align: left; padding-left: 20px;">
											<!-- 제목 옆에 있는 코맨트수가 0이 아니면 댓글 개수가 출력이 된다. --> <c:if
												test="${list.commcount != 0 }">
												<!--    //비밀글이 아니면 모든 리스트를 볼 수 있고, -->
												<c:if test="${list.secret=='0'}">
													<a href="${viewURL}">${list.subject}
														[${list.commcount}]</a>
												</c:if>
												<!--          //비밀글이면 자물쇠 아이콘을 띄우고, 비밀번호와 상관없이 작성자 아이디가 같을때만 볼 수 있다. -->
												<c:if test="${list.secret=='1'}">
													<img src="/rentacar/resources/images/icon_secret.gif">

													<c:if test="${list.email != session_email}">
														<c:if test="${session_email == 'admin'}">
															<a href="${viewURL}">${list.subject}
																[${list.commcount}]</a>
														</c:if>
														<c:if test="${session_email != 'admin'}">
                           ${list.subject} [${list.commcount}]
                        </c:if>
													</c:if>
													<c:if test="${list.email == session_email}">
														<a href="${viewURL}">${list.subject}
															[${list.commcount}]</a>
													</c:if>

													<%-- 로그인 관련 주석처리해둠 --%>
													<c:if test="${session_email == 'admin'}">
														<a href="${viewURL}">${list.subject}
															(${list.commcount})</a>
													</c:if>
												</c:if>
											</c:if> <!-- 코맨트수가 0이면 갯수가 출력이 안된다. --> <c:if
												test="${list.commcount == 0 }">
												<!--    //비밀글이 아니면 모든 리스트를 볼 수 있고, -->
												<c:if test="${list.secret=='0'}">
													<a href="${viewURL}">${list.subject} </a>
												</c:if>
												<!--          //비밀글이면 자물쇠 아이콘을 띄우고, 비밀번호와 상관없이 작성자 아이디가 같을때만 볼 수 있다. -->
												<c:if test="${list.secret=='1'}">
													<img src="/rentacar/resources/images/icon_secret.gif">

													<c:if test="${list.email != session_email}">
														<c:if test="${session_email == 'admin'}">
															<a href="${viewURL}">${list.subject} </a>
														</c:if>
														<c:if test="${session_email != 'admin'}">
														 ${list.subject}
														 </c:if>
													</c:if>

													<c:if test="${list.email == session_email}">
														<a href="${viewURL}">${list.subject}</a>
													</c:if>
													<c:if test="${session_email == 'admin'}">
														<a href="${viewURL}">${list.subject}
															(${list.commcount})</a>
													</c:if>
												</c:if>
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
						</table>
					</div>



					<div class="menu-wrap" style="margin-right: 50px;">
						<br />
						<!-- 로그인 하지 않으면 글쓰기를 할 수 없다. -->
						<c:if test="${session_email != null }">
							<input class="btn btn-primary" type="submit" value="글쓰기"
								onclick="javascript:location.href='qnaWrite.do'" />
						</c:if>
					</div>


					<!-- DB상 게시물이 없으면 보여주는 것 -->
					<c:if test="${fn:length(list) le 0}">
						<br />
						<center>등록된 게시물이 없습니다</center>
						<br />
					</c:if>

					<div class="paging">${pagingHtml}</div>


					<!-- 검색 기능 -->
					<div class="row">
						<div style="text-align: center;">
							<div id="dataTables-example_filter" class="dataTables_filter">
								<form action="">
									<select class="searchOption btn btn-default " name="searchNum"
										id="searchNum">
										<option value="0">제목</option>
										<option value="1">내용</option>
										<option value="2">글쓴이</option>
									</select><input type="text" name="isSearch" id="isSearch"
										style="margin-left: 15px; width: 200px; height: 36px; border-radius: 5px 5px 5px 5px;" />
									<span class="btn btnC_03 btnP_04 mr10"> <input
										type="submit" value="검색"
										style="font-size: 14px; padding-bottom: 20; vertical-align: middle; height: 36px;" />
									</span>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>

</html>
