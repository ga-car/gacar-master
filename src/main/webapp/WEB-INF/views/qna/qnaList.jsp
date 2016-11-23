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
</head>

<body>
	<div id="list-article" class="content scaffold-list" role="main">
		<!-- 상단 시작 -->
		<div class="nav" role="navigation">
			<h4>고객센터 > 1:1 문의</h4>
		</div>
		<!-- 상단 끝 -->
	
	<div id="wrapper">
		<div id="page-wrapper">
			<div class="row">
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<!-- /.panel-heading -->
						<div class="dataTable_wrapper" style="margin: 5px;">
							<div style="margin: 5px;">
								<!-- #@#@#@#@#@#@#@#글쓰기폼 시작@#@#@#@#@#@#@#@#@#@# -->

								<div id="wrapper">
									<form:form commandName="qnaModel"
										action="/rentacar/qna/write.do" method="post">
										<div id="page-wrapper">
											<div class="row">
												<div class="col-lg-12">
													<table width="90%"
														class="table table-striped table-bordered table-hover"
														id="dataTables-example">
														<thead>
															<tr class="danger">
																<strong>제목</strong>
																<form:input path="subject" theme="simple" size="100%" />
																<font color="red"><form:errors path="subject" /></font>
															</tr>
														</thead>
														<tbody>
															<tr>
																<form:input type="hidden" path="email"
																	value="${session_email}" />
																<th>사용자 ID</th>
																<td align="left"><strong>${session_email}</strong></td>
															</tr>
															<tr>
																<th colspan=6>글내용<font color="red" align="cenater">
																		<form:errors path="contents" />
																</font></th>
															</tr>
															<tr>
																<td colspan=6 height=300
																	style="padding: 0px !important;"><form:textarea
																		path="contents" theme="simple"
																		style="padding:3px; margin:0px; width: 100%; height: 100%;" />
																</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
											<br />
											<div class="row">
												<div class="col-lg-12">
													<div class="menu-wrap">
														<c:if test="${session_email != null }">
															<span> <input type="submit" value="작성완료"
																class="btn btn-primary"
																style="font-size: 14px; padding: 5px; height: 36px; vertical-align: middle;" />
															</span>
															<span onclick="history.go(-1);"> <input
																type="button" value="취소" class="btn btn-primary"
																style="font-size: 14px; padding: 5px; height: 36px; vertical-align: middle;" />
															</span>
														</c:if>
													</div>
												</div>
											</div>
										</div>
									</form:form>
								</div>

								<!-- #@#@#@#@#@#@#@#글쓰기폼 끝@#@#@#@#@#@#@#@#@#@# -->
								<!-- 답변상태 -->

								<select class="form-control" name="sortNum" onchange="window.open(value,'_self');"
									style="width: 120px; display: inline-block;">
									<option value="/rentacar/qna/list.do?sortNum=null">-답변분류-</option>
									<option value="/rentacar/qna/list.do?sortNum=1">답변 완료</option>
									<option value="/rentacar/qna/list.do?sortNum=2">답변 전</option>
								</select>
							</div>
						</div>
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
													<a href="${viewURL}">${list.subject}
														[${list.commcount}]</a>
												</c:if> <!-- 코맨트수가 0이면 갯수가 출력이 안된다. --> <c:if
													test="${list.commcount == 0 }">
													<a href="${viewURL}">${list.subject} </a>
												</c:if> <!-- 관리자가 1개 이상의 댓글을 달면 답변완료라는 이미지가 뜬다 --> <c:if
													test="${list.admin>=1}">
													<img src="/rentacar/resources/images/end.png">
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
														<a href="${viewURL}">${list.subject}
															[${list.commcount}]</a>
													</c:if> <!-- 코맨트수가 0이면 갯수가 출력이 안된다. --> <c:if
														test="${list.commcount == 0 }">
														<a href="${viewURL}">${list.subject} </a>
													</c:if> <!-- 관리자가 1개 이상의 댓글을 달면 답변완료라는 이미지가 뜬다 --> <c:if
														test="${list.admin>=1}">
														<img src="/rentacar/resources/images/end.png" width="20px">
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
					<div class="paging" " style="text-align: center;" >${pagingHtml}</div>
				</div>
			</div>
		</div>
</body>

</html>
