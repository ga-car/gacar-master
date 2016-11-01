<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="container">
	<div class="contents1">

		<form action="memberIdFind.dog" method="post" name="memberFindForm"
			onsubmit="return memberFindChk()">
			<fieldset>
				<h3>이메일 찾기</h3>

				<div class="findId">
					<table>

						<colgroup>
							<col style="width: 120px;" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">이름</th>
								<td><input type="text" class="txt w220" name="name" /></td>
							</tr>
							<tr>
								<th scope="row">생년월일</th>
								<td><input type="text" class="txt w220" name="email" /></td>
							</tr>
						</tbody>
					</table>
				</div>
				
	
				
				<div class="btn_type_04" align="center">
					<span class="btn btnC_04 btnF_02"> <input type="submit" value="이메일 찾기" />
					</span>
				</div>
			</fieldset>
		</form>
	</div>
</div>

<div id="emailvalue">
	
</div>

<br/>
<div id="container">
	<div class="contents1">
		
		<form action="memberPwFind.dog" method="post" name="memberPwFindForm" onsubmit="return memberFindChk()" >
			<fieldset>
			 <h3>비밀번호 찾기</center></h3>
				
				<div class="findId">
					<table>
						
						<colgroup>
							<col style="width:120px;" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">이름</th>
								<td>
									<input type="text" class="txt w220" name="name" />
								</td>
							</tr>
							<tr>
								<th scope="row">이메일</th>
								<td>
									<input type="text" class="txt w220" name="email" />
								</td>
							</tr>
							<tr>
								<th scope="row">휴대번호</th>
								<td>
									<input type="text" class="txt w220" name="phone" />
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="btn_type_04" align="center">
					
					<span class="btn btnC_04 btnF_02" align="center">
						<input type="submit" value="비밀번호 찾기" />
					</span>	
				</div>
			</fieldset>
			<!-- <a href="javascript:this.close();">닫기</a> -->
			<div class="go_login" align="center">
			<a href="#" onclick="window.history.back();">로그인</a>
			</div>	
		</form>
	</div>
</div>
</body>
</html>