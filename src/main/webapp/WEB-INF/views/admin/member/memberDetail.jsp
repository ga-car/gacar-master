<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<script type="text/javascript">
function delchk(){
		return confirm("탈퇴시키겠습니까?");
}
</script>

</head>

<body>
	<div id="container" style="overflow: scroll; width: 100%; height: 100%;">
		<div class="titleArea">
			<h2>
				<!-- <img src="/pet/resources/images/SkinImg/join.gif" alt="회원가입"> -->
			</h2>
		</div>
		<form:form commandName="mem" action="memberEnd.do" method="post" name="joinform" onSubmit="return authCheck();">
			<div class="boardWrite ">
				<h2>기본정보</h2>
				<div class="boardWrite "></div>
				<table border="1" summary="">
					<tbody>

						<tr>
							<th scope="row" id="nameTitle" width="135">이름</th>
							<td width="500">${mem.name}</td>
						</tr>

						<tr>
							<th scope="row">이메일</th>
							<td>${mem.email}</td>
						</tr>
						<tr>
							<th scope="row">비밀번호</th>
							<td>${mem.password}</td>
						</tr>

						<tr>
							<th scope="row">주소</th>
							<td>우편번호 - ${mem.zipcode} <br /> 상세주소 - ${mem.addr} ${mem.addr2}
							</td>
						</tr>

						<tr>
							<th scope="row">휴대전화</th>
							<td>${mem.phone}</td>
						</tr>
						<tr>
							<th scope="row">주민번호</th>
							<td>${mem.jumin1}- ${mem.jumin2}</td>
						</tr>
					</tbody>
				</table>
			</div>

			<div class="boardWrite2">
				<h2>부가정보</h2>
				<div class="boardWrite2">
					<font size="4"><strong>*면허정보</strong></font>
					<table border="1" summary="">
						<tr>
							<th scope="row" width="135">면허종류</th>
							<td width="500">${mem.licensetype}</td>
							<%-- <td width="150" height="40" valign="middle" align="center" class="body_grey_b">면허종류</td>
								<td width="740" valign="middle" class="indigo">${mem.licensetype}</td> --%>
						</tr>
						<tr>
							<th scope="row">면허번호</th>
							<td>${mem.licensenum}</td>
						</tr>
						<tr>
							<th scope="row">면허유효일자</th>
							<td>${mem.licensedate}</td>
						</tr>
					</table>
				</div>

				<div class="boardWrite2"></div>
				<font size="4"><strong>*차량정보</strong></font>
				<table border="1" summary="">
					<tr>
						<th scope="row" width="135">차량종류</th>
						<td width="500">${mem.cartype}</td>
					</tr>
					<tr>
						<th scope="row">차량번호</th>
						<td>${mem.carnum}</td>
					</tr>
				</table>

				<div class="boardWrite2"></div>
				<font size="4"><strong>*이용정보</strong></font>
				<table border="1" summary="">
					<tr>
						<th scope="row" width="135">포인트</th>
						<td width="500">${mem.point}</td>
					</tr>
					<tr>
						<th scope="row">등급</th>
						<td>${mem.memlevel}</td>
					</tr>
					<tr>
						<th scope="row">이용수</th>
						<td>${mem.usenum}</td>
					</tr>
					<tr>
						<th scope="row">가입일</th>
						<td><fmt:formatDate value="${mem.joindate}" pattern="YY.MM.dd HH:mm" /></td>
					</tr>
					<c:if test="${mem.deldate eq null}">
						<tr>
							<th scope="row">접속일</th>
							<td><fmt:formatDate value="${mem.accessdate}" pattern="YY.MM.dd HH:mm" /></td>
						</tr>
					</c:if>
					<c:if test="${mem.deldate ne null}">
						<tr>
							<th scope="row">탈퇴일</th>
							<td><fmt:formatDate value="${mem.deldate}" pattern="YY.MM.dd HH:mm" /></td>
						</tr>
					</c:if>
				</table>
			</div>


			<div class="btnArea" align="center">
				<br />
				<c:if test="${mem.deldate eq null}">
					<c:url var="viewURL" value="adminMemModify.do">
						<c:param name="email" value="${mem.email}" />
						<c:param name="currentPage" value="${currentPage}" />
					</c:url>
					<c:url var="viewURL2" value="adminMemDel.do">
						<c:param name="email" value="${mem.email}" />
					</c:url>
					<c:url var="viewURL3" value="memberList.do">
						<c:param name="currentPage" value="${currentPage}" />
					</c:url>
					<a href="${viewURL3}"><input type="button" value="목록" /></a>
					<a href="${viewURL}"><input type="button" value="수정" /></a>
					<a href="${viewURL2}"><input type="button" value="탈퇴" onclick="return delchk()" /></a>
				</c:if>

				<c:if test="${mem.deldate ne null}">
					<c:url var="viewURL" value="adminMemRestore.do">
						<c:param name="email" value="${mem.email}" />
					</c:url>
					<c:url var="viewURL2" value="adminMemDel2.do">
						<c:param name="email" value="${mem.email}" />
					</c:url>
					<a href="javascript:history.go(-1)"><input type="button" value="목록" /></a>
					<a href="${viewURL}"><input type="button" value="복원" /></a>
					<a href="${viewURL2}"><input type="button" value="완전삭제" /></a>
				</c:if>
			</div>
		</form:form>
	</div>

</body>
</html>