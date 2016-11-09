<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>

</head>

<body>
	<div id="container" style="overflow: scroll; width: 100%; height: 100%;">
		<div class="contents1">
			<form:form commandName="mem" action="memberEnd.do" method="post" name="joinform" onSubmit="return authCheck();">
				<div class="boardWrite ">
					<h2>관리자정보</h2>
					<div class="boardWrite "></div>
					<table border="1" summary="">
						<tbody>
							<tr>
								<th scope="row" width="135">이름</th>
								<td width="300">${mem.name}</td>
							</tr>

							<tr>
								<th scope="row">아이디</th>
								<td>${mem.email}</td>
							</tr>

							<tr>
								<th scope="row">비밀번호</th>
								<td>${mem.password}</td>
							</tr>
							<tr>
								<th scope="row">접속일</th>
								<td><fmt:formatDate value="${mem.accessdate}" pattern="YY.MM.dd HH:mm" /></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="btnArea" align="center">
					<br />
						<c:url var="viewURL" value="adminInfoModify.do">
							<c:param name="email" value="${mem.email}" />
						</c:url>
						<a href="${viewURL}"><input type="button" value="수정" /></a>
				</div>
			</form:form>
		</div>
	</div>
</body>
</html>