<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<head>
<script type="text/javascript">
function delchk(){
    return confirm("삭제하시겠습니까?");
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
	<h1 class="page-header">카풀 신청 관리</h1>
</div>
<div class="row">
	<div class="panel panel-default">
		<div class="panel-heading">
        </div>
        <div class="panel-body">
			<div class="dataTable_wrapper">
				<div id="dataTables-example_wrapper"
					class="dataTables_wrapper form-inline dt-bootstrap no-footer">
					<div class="row" style="margin-bottom:5px;">
						<div class="col-sm-6">
							<a href="/rentacar/admin/carpool/attendlist.do?searchNum=0&isSearch="><button type="button" class="btn btn-outline btn-default">전체</button></a>													
						</div>
						<div class="col-sm-6" style="text-align:right;">
							<div class="dataTables_info" id="dataTables-example_info" role="status" aria-live="polite">총 신청자수 : ${totalCount}</div>
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
										<th style="width: 10%; text-align:center;">글번호</th>
										<th style="width: 10%; text-align:center;">작성자</th>
										<th style="width: 17%; text-align:center;">이메일</th>
										<th style="width: 15%; text-align:center;">작성자  전화번호</th>										
										<th style="width: 13%; text-align:center;">신청자</th>
										<th style="width: 15%; text-align:center;">이메일</th>
										<th style="width: 10%; text-align:center;">신청자  전화번호</th>
										<th style="width: 10%; text-align:center;">관리</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="attendList"  items="${attendList}" varStatus="stat">									
									<tr class="gradeA even" role="row">
										<td style="text-align:center;vertical-align:middle;">${attendList.no}</td>
										<td style="text-align:center;vertical-align:middle;">${attendList.apname}</td>
										<td style="text-align:center;vertical-align:middle;">${attendList.apemail}</td>
										<td style="text-align:center;vertical-align:middle;">${attendList.apphone}</td>
										<td style="text-align:center;vertical-align:middle;">${attendList.name}</td>
										<td style="text-align:center;vertical-align:middle;">${attendList.email}</td>									
										<td style="text-align:center;vertical-align:middle;">${attendList.phone}</td>									
										<td style="text-align:center;vertical-align:middle;">
										<c:url var="viewURL2" value="attenddelete.do" >
											<c:param name="email" value="${attendList.email }" />
											<c:param name="no" value="${attendList.no }" />							
										</c:url>	
										 <a href="${viewURL2}"><input type="image" src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Trash_font_awesome.svg/32px-Trash_font_awesome.svg.png" onclick="return delchk()"></a>
										 </td>									
									</tr> 
								</c:forEach>
																
								<!--  등록된 상품이 없을때 -->
									<c:if test="${fn:length(attendList) le 0}">
										<tr><td colspan="9" style="text-align:center;">등록된 게시물이 없습니다</td></tr>
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
									<input class="form-control" type="hidden" name="searchNum" id="searchNum" value="2" />
										<input class="form-control" type="text" name="isSearch" id="isSearch" />
										<span>
										<button type="submit" class="btn btn-default">신청자 검색</button>
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


