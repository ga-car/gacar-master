<%@ page contentType="application/vnd.ms-excel; charset=utf-8"%>
 <meta http-equiv='Content-Type' content='application/vnd.ms-excel; charset=utf-8'/>
<%@ page import="java.util.*, java.text.*"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<head>
  <%
  	Date date = new Date();
    SimpleDateFormat simpleDate  = new SimpleDateFormat("yyyyMMddHHmmss");
    String strDate = simpleDate.format(date);
    response.setHeader("Content-Disposition","attachment;filename=member_"+strDate+".xls");
    response.setHeader("Content-Description", "JSP Generated Data");
%>
<%-- <%
/* String nowDate= DateUtil.getDate("yyyyMMddHHmmss"); */
String nowDate="member";
response.setHeader("Content-Type", "application/vnd.ms-excel;charset=utf-8");
response.setHeader("Content-Disposition", "attachment;filename=ExcelDownload_"+nowDate+".xls");
    
    %> --%>
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
	<h1 class="page-header">회원목록</h1>
</div>
<div class="row">
	<div class="panel panel-default">
        <div class="panel-body">
			<div class="dataTable_wrapper">
				<div id="dataTables-example_wrapper"
					class="dataTables_wrapper form-inline dt-bootstrap no-footer">
					<div class="row" style="margin-bottom:5px;">
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
									<tr role="row" style="border: 2px solid #bcbcbc;">
										<th style="width: 5%; text-align:center;">번호</th>
										<th style="width: 8%; text-align:center;">이메일</th>
										<th style="width: 7%; text-align:center;">이름</th>										
										<th style="width: 9%; text-align:center;">전화번호</th>
										<th style="width: 14%; text-align:center;">생년월일</th>
										<th style="width: 13%; text-align:center;">우편번호</th>
										<th style="width: 13%; text-align:center;">기본주소</th>
										<th style="width: 13%; text-align:center;">상세주소</th>
										<th style="width: 13%; text-align:center;">포인트</th>
										<th style="width: 10%; text-align:center;">등급</th>
										<th style="width: 10%; text-align:center;">가입일자</th>
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
									<tr class="gradeA even" role="row" style="border: 1px solid #bcbcbc;">
										<td style="text-align:center;vertical-align:middle;">${memList.num}</td>
										<td style="text-align:center;vertical-align:middle;">${memList.email}</td>
										<td style="text-align:center;vertical-align:middle;">${memList.name}</td>
										<c:set var="phone" value="${memList.phone}"/>
										<td style="text-align:center;vertical-align:middle;">${fn:substring(phone,0,3)}-${fn:substring(phone,3,7)}-${fn:substring(phone,7,11)}</td>
										<td style="text-align:center;vertical-align:middle;">${memList.jumin1}</td>						
										<td style="text-align:center;vertical-align:middle;">${memList.zipcode}</td>
										<td style="text-align:center;vertical-align:middle;">${memList.addr}</td>
										<td style="text-align:center;vertical-align:middle;">${memList.addr2}</td>
										<td style="text-align:center;vertical-align:middle;">${memList.point}</td>
										<td style="text-align:center;vertical-align:middle;">${memList.memlevel}</td>
										<td style="text-align:center;vertical-align:middle;"><fmt:formatDate value="${memList.joindate}" pattern="YY.MM.dd HH:mm" /></td>									
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

				</div>
			</div>
			<!-- /.table-responsive -->							
		</div>
	</div>
        <!-- /.panel -->   
</div>
