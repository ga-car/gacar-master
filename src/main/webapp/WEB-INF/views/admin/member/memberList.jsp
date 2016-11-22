<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<head>
<script type="text/javascript">
function delchk(){
		return confirm("탈퇴시키겠습니까?");
}
</script>
<style type="text/css">
.paging{text-align:center;height:32px;margin-top:5px;margin-bottom:15px;}
.paging a,
.paging strong{display:inline-block;width:36px;height:32px;line-height:28px;font-size:14px;border:1px solid #e0e0e0;margin-left:5px;
-webkit-border-radius:3px;
   -moz-border-radius:3px;
		border-radius:3px;
-webkit-box-shadow:1px 1px 1px 0px rgba(235,235,235,1);
	-moz-box-shadow:1px 1px 1px 0px rgba(235,235,235,1);
		  box-shadow:1px 1px 1px 0px rgba(235,235,235,1);
}
.paging a:first-child{margin-left:0;}
.paging strong{color:#fff;background:#337AB7;border:1px solid #337AB7;}
.paging .page_arw{font-size:11px;line-height:30px;}
</style>
</head>

<div class="row" style="padding-left:15px;width:900px;">    
	<h1 class="page-header">회원관리 > 회원목록</h1>
</div>
<div class="row">
	<div class="panel panel-default">
		<div class="panel-heading">
                         검색, 수정, 탈퇴 기능하는 페이지입니다.
        </div>
        <div class="panel-body">
			<div class="dataTable_wrapper">
				<div id="dataTables-example_wrapper"
					class="dataTables_wrapper form-inline dt-bootstrap no-footer">
					<div class="row" style="margin-bottom:5px;">
						<div class="col-sm-6">
						<a href="/rentacar/admin/memberList.do"><button type="button" class="btn btn-outline btn-default">전체보기</button></a> &nbsp;&nbsp;&nbsp;
						<c:if test ="${isSearch eq null}">
							<a href="/rentacar/admin/memberList.do?sortNum=0"><button type="button" class="btn btn-outline btn-default">이름순</button></a>
							<a href="/rentacar/admin/memberList.do?sortNum=1"><button type="button" class="btn btn-outline btn-default">가입순</button></a>	
						</c:if>
						<c:if test ="${isSearch ne null}">
							<a href="/rentacar/admin/memberList.do?searchNum=${searchNum}&isSearch=${isSearch}&sortNum=0"><button type="button" class="btn btn-outline btn-default">이름순</button></a>
							<a href="/rentacar/admin/memberList.do?searchNum=${searchNum}&isSearch=${isSearch}&sortNum=1"><button type="button" class="btn btn-outline btn-default">가입순</button></a>	
						</c:if>
							<button type="button" style="float:right;"  onClick="window.location='/rentacar/admin/excel.do'">엑셀 다운로드</button>
						</div>
						<div class="col-sm-6" style="text-align:right;">
							<div class="dataTables_info" id="dataTables-example_info" role="status" aria-live="polite">총 회원수 : ${totalCount}</div>
						</div>
						
					</div>
					<div class="row">
						<div class="col-sm-12">
							<table
								class="table table-striped table-bordered table-hover dataTable no-footer"
								id="dataTables-example" role="grid"
								aria-describedby="dataTables-example_info">
								<thead>
									<tr role="row">
										<th style="width: 5%; text-align:center;">번호</th>
										<th style="width: 8%; text-align:center;">이메일</th>
										<th style="width: 7%; text-align:center;">이름</th>										
										<th style="width: 9%; text-align:center;">전화번호</th>
										<th style="width: 14%; text-align:center;">생년월일</th>
										<th style="width: 10%; text-align:center;">가입일자</th>
										<th style="width: 13%; text-align:center;">관리</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="memList"  items="${memList}" varStatus="stat">
								<c:url var="viewURL" value="adminMemModify.do" >
									<c:param name="email" value="${memList.email}" />
									<c:param name="currentPage" value="${currentPage}" />
								</c:url>
								<c:url var="viewURL3" value="adminMemDetail.do" >
									<c:param name="email" value="${memList.email}" />
									<c:param name="currentPage" value="${currentPage}" />
								</c:url>								
									<tr class="gradeA even" role="row">
										<td style="text-align:center;vertical-align:middle;"><a href="${viewURL3}">${memList.num}</a></td>
										<td style="text-align:center;vertical-align:middle;">${memList.email}</td>
										<td style="text-align:center;vertical-align:middle;">${memList.name}</td>
										<td style="text-align:center;vertical-align:middle;">${memList.phone}</td>
										<td style="text-align:center;vertical-align:middle;">${memList.jumin1}</td>						
										<td style="text-align:center;vertical-align:middle;"><fmt:formatDate value="${memList.joindate}" pattern="YY.MM.dd HH:mm" /></td>
										<td style="text-align:center;vertical-align:middle;">
											<a href="${viewURL}"><input type="image" src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Cog_font_awesome.svg/32px-Cog_font_awesome.svg.png"></a>&nbsp;&nbsp;								
											<c:url var="viewURL2" value="adminMemDel.do" >
												<c:param name="email" value="${memList.email}" />							
											</c:url>
											<c:if test="${memList.email ne 'admin'}">
										 		<a href="${viewURL2}"><input type="image" src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Trash_font_awesome.svg/32px-Trash_font_awesome.svg.png" onclick="return delchk()"></a>
											 </c:if>
										</td> 									
									</tr>
								</c:forEach>
								<!--  등록된 회원이 없을때 -->
									<c:if test="${fn:length(memList) le 0}">
										<tr><td colspan="9" style="text-align:center;">등록된 회원이 없습니다</td></tr>
									</c:if>
								</tbody>
							</table>
						</div>
					</div>
					<div class="paging">
						${pagingHtml}
					</div>
					<div class="row">
							<div style="text-align:center;">
								<div id="dataTables-example_filter" class="dataTables_filter">
									<form action="">
									<select class="form-control" name="searchNum" id="searchNum">
										<option value="1">이름</option>
										<option value="2">이메일</option>
									</select>
										<input class="form-control" type="text" name="isSearch" id="isSearch"/>
										<span>
										<button type="submit" class="btn btn-default">검색</button>
										</span>
									</form>
								</div>							
							</div>
							
					</div>
				</div>
			</div>
			<!-- /.table-responsive -->							
		</div>
	</div>
        <!-- /.panel -->   
</div>
