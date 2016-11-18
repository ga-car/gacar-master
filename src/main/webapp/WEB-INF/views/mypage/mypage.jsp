<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-1.9.1.js"/>
<!-- <script src="http://code.jquery.com/jquery-migrate-1.1.0.js"/>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link href="/rentacar/resources/admincss/bootstrap.min.css" rel="stylesheet">
<link href="/rentacar/resources/admincss/sb-admin-2.css" rel="stylesheet">
<title>mypage 메인</title> -->
</head>
<body>
<div class="category_top">
   <ul>
       <li class="post1">커뮤니티</li><li>></li><li class="post2">이용후기에 내가 쓴 글</li>         
   </ul>
</div>
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="dataTable_wrapper">
							<table class="table table-striped table-bordered table-hover"
								id="dataTables-example">
								<thead>
									<tr role="row">
										<th style="width: 10%; text-align: center;">번호</th>
										<th style="width: 40%; text-align: center;">제목 [댓글갯수]</th>
										<th style="width: 10%; text-align: center;">작성자</th>
										<th style="width: 15%; text-align: center;">등록일자</th>
										<th style="width: 7%; text-align: center;">조회수</th>
										<th style="width: 8%; text-align: center;">관리</th>
									</tr>
								</thead>
								
								<tbody>
									<c:forEach var="list" items="${reviewList}">
										<c:url var="viewURL" value="view.do" >
											<c:param name="no" value="${list.no }" />
										    <c:param name="currentPage" value="${currentPage }" />
										</c:url>
										<c:if test="${session_email == list.email && lise.email != admin}">

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
									</c:forEach>

								</tbody>
							</table>
						</div>
						
					</div>
				</div>
			</div>

			<c:if test="${fn:length(reviewList) le 0}">
				<br />
				<center>등록된 게시물이 없습니다</center>
				<br />
			</c:if>
		</div>
</body>
</html>