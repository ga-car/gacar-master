<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script>
<link href="/rentacar/resources/admincss/bootstrap.min.css" rel="stylesheet">
<link href="/rentacar/resources/css/reset.css" rel="stylesheet">
<link href="/rentacar/resources/admincss/sb-admin-2.css" rel="stylesheet">
<!-- <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css"> -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
#boardWriteForm {
	margin: 30px 0;
}

.menu-wrap {
	text-align: right;
	margin-right: 50px;
}

.contents-wrap {
	margin: 30px 0 0 0;
	min-height: 500px;
}

.contents {
	margin: 60px 0 0 0;
}

.recode-wrap {
	text-align: right;
	color: #888;
}

.hit-wrap {
	color: #888;
	margin: 10px 0;
}

.viewForm {
	margin: 20px 0 0 0;
}
</style>
<title>Q&A</title>
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
		<form:form commandName="qnaModel" action="/rentacar/qna/qnaWrite.do"
			method="post">
			<div id="page-wrapper">
				<div class="row">
					<div class="col-lg-12">
						<h3 class="page-header">
							<br />Q&A 등록
						</h3>
						<table class="table table-striped table-bordered table-hover"
							id="dataTables-example">
							<thead>
								<tr class="danger">
									<th width="15%" align="center">글제목</th>
									<td colspan=5><form:input path="subject" theme="simple" />
										<font color="red"><form:errors path="subject" /></font></td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th>작성날짜</th>
									<td><fmt:formatDate value="${list.regdate}"
											pattern="yyyy.MM.dd, hh:mm" /> <c:set var="now"
											value="<%=new java.util.Date()%>" /> <fmt:formatDate
											value="${now}" type="both" dateStyle="short"
											timeStyle="short" /></td>
									<th>비밀글여부</th>
									<td width="20%"><form:checkbox path="secret"
											value="secret" /></td>
									<form:input type="hidden" path="email"
										value="${session_email }" />
									<th>사용자 ID</th>
									<td align="left"><strong>${session_email}</strong></td>
								</tr>
								<tr>
									<th colspan=6>글내용<font color="red" align="center"><form:errors
												path="contents" /></font></th>
								</tr>
								<tr>
									<td colspan=6 height=300 style="padding: 0px !important;">
										<form:textarea path="contents" theme="simple"
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

							<span> <input type="submit" value="작성완료"
								class="btn btn-primary"
								style="font-size: 14px; padding: 5px; height: 36px; vertical-align: middle;" />
							</span> <span onclick="history.go(-1);"> <input type="button"
								value="취소" class="btn btn-primary"
								style="font-size: 14px; padding: 5px; margin-left: 5px; height: 36px; vertical-align: middle;" />
							</span>
						</div>
					</div>
				</div>
			</div>
		</form:form>
	</div>
</body>
</html>