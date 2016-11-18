<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<?xml version="1.0" encoding="utf-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="/pet/resources/css/style.css" rel="stylesheet" type="text/css">
<script language="JavaScript">
	function dongCheck(){
		if(document.zipForm.area3.value==""){
			alert("동이름을 입력하세요");
			document.zipForm.area3.focus();
			return;
		}
		document.zipForm.submit();
	}
	function sendAddress(zipcode,area1,area2,area3,area4){
		var address = area1+" "+area2+" "+area3+" "+area4;
		
		opener.document.joinform.zipcode.value=zipcode;
		opener.document.joinform.addr.value=address;
		opener.document.joinform.addr2.focus();
		self.close();
	}
</script>
<title>주소/우편번호 검색</title>
</head>

 <body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload="zipForm.text.focus()">
 	<form name="zipForm" method="post" action="zipcodeCheck.do">
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="BTABLE">

	    <tr>
        <td height="30">&nbsp; 
        
        <font class="BFONT2"><b>우편번호 검색</b></font></td>
    </tr>
    <tr><td height="40"></td></tr>
    <tr>
        <td align="center">
            동이름 입력: <input type="text" name="area3"  size="20" maxlength="30"/>
            <input type="button" value="검 색" onclick="dongCheck();"/>
            <input type="hidden" name="check" value="n"/>
        </td>
    </tr>
    
    <tr><td height="30"></td></tr>
    <tr class="d">
   		<td height="40" align="center">
          	<b>동</b> 으로 검색해 주세요.<br/>
            <font color="#0000FF">(예: 상일동/둔촌2동/가산동)</font>
        </td>
    </tr>
    </form>

	<c:if test="${chk==0}">
  <tr><td align="center"><br/>검색된 결과가 없습니다.</td></tr>
</c:if>
<c:if test="${chk==1}">
     <tr class="BTD">
        <td align="center">
        	검색결과가 나오면 맞는 부분을 클릭하시면 <br/>
        	자동으로 주소와 우편번호란에 채워집니다
        </td>
     </tr>   
 
<br/>
   <c:forEach items="${zipcode}" var="stat">
     <%-- <c:forEach var="i" begin="${zipcodeList.size}" end="0"> --%>
	  <tr><td>
	  <a href="javascript:sendAddress('${stat.zipcode}','${stat.area1}','${stat.area2}','${stat.area3}','${stat.area4}')">
	  ${stat.zipcode}&nbsp; ${stat.area1}&nbsp; ${stat.area2}&nbsp;  ${stat.area3}&nbsp;  ${stat.area4}&nbsp; 
</a>
	  <br/>
	  </td>
	  </tr>
</c:forEach> 
		
</c:if>


<tr><td align="center"><br/><a href="javascript:this.close();">닫기</a></td></tr>


</table>

</body>


</html>
