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
<!-- <style type="text/css">
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
</style> -->
</head>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script>
<!-- <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script> -->
<!-- <link href="/rentacar/resources/admincss/bootstrap.min.css" rel="stylesheet">
<link href="/rentacar/resources/admincss/sb-admin-2.css" rel="stylesheet"> -->

<div class="row" style="padding-left:15px;width:900px;">    
	<h1 class="page-header">내가 쓴 이용후기</h1>
</div>
<div class="row">
	<div class="panel panel-default">
		<div class="panel-heading">
                         이용후기 보기, 삭제 기능하는 페이지입니다.
        </div>
        <div class="panel-body">
			<div class="dataTable_wrapper">
				<div id="dataTables-example_wrapper"
					class="dataTables_wrapper form-inline dt-bootstrap no-footer">
					<div class="row">
						<div class="col-sm-12">
							<table
								class="table table-striped table-bordered table-hover dataTable no-footer"
								id="dataTables-example" role="grid"
								aria-describedby="dataTables-example_info">
								<thead>
									<tr role="row">
										<th style="width: 7%; text-align:center;">번호</th>
										<th style="width: 50% ; text-align:center;">제목</th>
										<th style="width:15%; text-align:center;">작성자</th>										
										<th style="width:15%; text-align:center;">등록일자</th>
										<th style="width: 7%; text-align:center;">조회수</th>
										<th style="width: 8%; text-align:center;">삭제</th>
									</tr>
								</thead>
								<tbody>
								
								<c:forEach var="reviewList"  items="${reviewList}" >	
								 <c:if test="${session_email == reviewList.email}"> 
								<c:url var="viewURL" value="view.do">
										<c:param name="no" value="${reviewList.no}" />
									</c:url>  													
									<tr class="gradeA even" role="row">
										<td style="text-align:center;vertical-align:middle;">${reviewList.no}</td>
										<td style="text-align:center;vertical-align:middle;"><a href="${viewURL}">${reviewList.subject}</a></td>
										<td style="text-align:center;vertical-align:middle;">${reviewList.email}</td>
										<td style="text-align:center;vertical-align:middle;"><fmt:formatDate value="${reviewList.regdate}" pattern="YY.MM.dd HH:mm" /></td>
										<td style="text-align:center;vertical-align:middle;">${reviewList.readcount}</td>									
										<td style="text-align:center;vertical-align:middle;">									
										<c:url var="viewURL2" value="delete.do" >
											<c:param name="no" value="${reviewList.no }" />							
										</c:url>	
										 <a href="${viewURL2}"><input type="image" src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Trash_font_awesome.svg/32px-Trash_font_awesome.svg.png" onclick="return delchk()"></a></td>									
									</tr>
									 </c:if> 
								</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<div class="paging">
						${pagingHtml}
					</div>
				</div>
			</div>
			<!-- /.table-responsive -->							
		</div>
	</div>
        <!-- /.panel -->   
</div>
