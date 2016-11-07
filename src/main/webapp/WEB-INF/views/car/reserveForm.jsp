<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="width: 800px; margin: auto;">
		<form enctype="multipart/form-data" method="post" name="reserveForm">
			<table width=800px border="0" cellpadding="1" cellspacing="1">
				<tr height=23px>
					<td width="800px" align="center" bgcolor="#FC5522" colspan="2"><font
						color="white" size="4">챠량 정보</font></td>
				</tr>
				<tr height=23px>
					<td width="100px" align="right" bgcolor="#FC5522"><font
						color="white" size="2">차량번호</font></td>
					<td width="700px" bgcolor="#FFFFFF" align="left">&nbsp;&nbsp;</td>
				</tr>
				<tr height=23px>
					<td width="100px" align="right" bgcolor="#FC5522"><font
						color="white" size="2">차종</font></td>
					<td width="700px" bgcolor="#FFFFFF" align="left">&nbsp;&nbsp;</td>
				</tr>
				<tr height=23px>
					<td width="100px" align="right" bgcolor="#FC5522"><font
						color="white" size="2">차량브랜드</font></td>
					<td width="700px" bgcolor="#FFFFFF" align="left">&nbsp;&nbsp;</td>
				</tr>
				<tr height=23px>
					<td width="100px" align="right" bgcolor="#FC5522"><font
						color="white" size="2">차량명</font></td>
					<td width="700px" bgcolor="#FFFFFF" align="left">&nbsp;&nbsp;</td>
				</tr>
				<tr height=23px>
					<td width="100px" align="right" bgcolor="#FC5522"><font
						color="white" size="2">인승</font></td>
					<td width="700px" bgcolor="#FFFFFF" align="left">&nbsp;&nbsp;</td>
				</tr>
				<tr height=23px>
					<td width="100px" align="right" bgcolor="#FC5522"><font
						color="white" size="2">요금</font></td>
					<td width="700px" bgcolor="#FFFFFF" align="left">&nbsp;&nbsp;</td>
				</tr>

				<tr>
					<td colspan=6>
				</tr>

				<tr>
					<td colspan=6>
				</tr>
				<tr height=23px>
					<td width="800px" align="center" bgcolor="#FC5522" colspan="2"><font
						color="white" size="4">예약정보</font></td>
				</tr>

				<tr>
					<td colspan=6>
				</tr>
				<tr height=23px>
					<td width="100px" align="right" bgcolor="#FC5522"><font
						color="white" size="2">시작</font></td>
					<td width="700px" bgcolor="#FFFFFF" align="left">&nbsp;&nbsp;</td>
				</tr>

				<tr>
					<td colspan=6>
				</tr>

				<tr height=23px>
					<td width="100px" align="right" bgcolor="#FC5522"><font
						color="white" size="2">종료</font></td>
					<td width="700px" bgcolor="#FFFFFF" align="left">&nbsp;&nbsp;</td>
				</tr>
			</table>

			<table width=80% border=0 cellpadding="0" cellspacing="1">
				<tr>
					<td height=10></td>
				</tr>
				<tr>
					<td height=10></td>
				</tr>


				<tr>
					<td colspan=6>
				</tr>

				<tr>
					<td colspan=6>
				</tr>


				<tr>
					<td colspan=6>
				</tr>
				<tr>
					<td colspan=6>
				</tr>

				<tr>
					<td align=center colspan=6><a href="javascript:checkIt()"><img
							src="<%=request.getContextPath()%>/reservation/image/btn_buy.png"
							border=0 /></a> &nbsp; <a
						href="penRead.action?pen_name=<s:property value="pen_name" />"><img
							src="<%=request.getContextPath()%>/reservation/image/btn_list.png"
							style="width: 84px; height: 25px; border: 0px;" /></a></td>
				</tr>

			</table>
		</form>
	</div>
</body>
</html>