<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
* { margin:0; padding:4px; }
ul,li { list-style:none; }
a { text-decoration:none; color:#000; }
.tab { border:1px solid #ddd; border-left:none; background:#fff; overflow:hidden; }
.tab li { float:left; width:50%; text-align:center; box-sizing:border-box; }
.tab li { display:inline-block; padding:20px; cursor:pointer; }
.tab li.on { background-color:#eee; color:#f00; }
.tab_con { clear:both; margin-top:2px; border:2px solid #ddd; }
.tab_con .find { display:none; background:#fff; line-height:50px; text-align:center; }
.tab_con .find th {float:left; width:70px; margin-bottom:20px; text-align:left; clear:both; line-height:1.2;}
.tab_con .find td {float:left; width:145px; margin-bottom:10px; text-align:left;}
.tab_con .find td.txt {float:left; width:70x; margin-bottom:10px; text-align:left}
.tab_con .find .btn {margin:30px 30px; padding:30px 0 0 18px;}
.tab_con .find .Found {margin:0px 3px;}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js" ></script>
<script	type="text/javascript">
	function valueCheck(){
		/* if(document.emailFindForm.name.value==""){
			alert("이름을 입력해주세요");
			return false;
		} */
		 if($("#name").val()==""){
			alert("이름을 입력해주세요.");
			return false;
		}
		if($('#jumin1').val()==""){
			alert("생년월일을 입력해주세요.");
			return false;
		}
	}
	
	function valueCheck2(){
		/* if(document.emailFindForm.name.value==""){
			alert("이름을 입력해주세요");
			return false;
		} */
		 if($("#name2").val()==""){
			alert("이름을 입력해주세요.");
			return false;
		}
		if($('#mailcheck').val()=="인증전"){
			alert("이메일 인증을 해주세요.");
			return false;
		}
/* 		if($('#phone').val()==""){
			alert("전화번호를 입력해주세요.");
			return false;
		} */
	}
	
	function numCheck() {
		if (isNaN(document.getElementById("jumin1").value)) {
		//	alert("숫자만 입력 가능합니다.");
			document.getElementById("jumin1").value = document.getElementById("jumin1").value.slice(0, -1);
		}
	}
	
	function openAuth(){
		if (document.getElementById("email").value == "") {
	    	  alert("이메일을 입력하세요");
	    	  return false;
	      }
		/* if(document.getElementById("mailcheck").value == "인증완료"){
			document.joinform.email.value="";
			document.joinform.email.readOnly=false;
			document.getElementById("mailauth").value="이메일인증";
			document.getElementById("mailcheck").value="인증전";
		}*/else{
			var email=document.getElementById("email").value
			var url="emailAuth2.do?email=" + email;
		
			open(url, "이메일인증","toolbar=no, location=no, status=no, menubar=no, scrollbars=yes, resizable=no, width=410, height=400");
		}
	}
	$(document).ready(function(){
		/* var foundEValue = ${mem.email};
		var isEfound = ${isEmailFind};
		var foundPValue = ${mem.password};
		var isPfound = ${isPwFind}; */
		
var i = 0;
		
		if($("#eValue").val()!="" && $("#find").val()==1){
			i = 0;
			document.getElementById("emailFound").style.display="";		
		} else {
			document.getElementById("emailFound").style.display="none";
		}
		if($("#find").val()==-1){
			i = 0;
			alert("일치하는 정보가 없습니다.");
		}
		
		if($("#pValue").val()!="" && $("#find").val()==2){
			document.getElementById("pwFound").style.display="";
			i = 1;
		} else {
			document.getElementById("pwFound").style.display="none";
		}
		if($("#find").val()==-2){
			alert("일치하는 정보가 없습니다.");
			i = 1;
		}
		/* if($("#find").val()==-2){
			alert("일치하는 정보가 없습니다.");
		} */
		
		tab('#tab',i);	
	});

	function tab(e, num){
	    var num = num || 0;
	    var menu = $(e).children();
	    var con = $(e+'_con').children();
	    var select = $(menu).eq(num);
	    var i = num;

	    select.addClass('on');
	    con.eq(num).show();

	    menu.click(function(){
	        if(select!==null){
	            select.removeClass("on");
	            document.getElementById("emailFound").style.display="none";
	            document.getElementById("pwFound").style.display="none";
	            con.eq(i).hide();
	        }

	        select = $(this);	
	        i = $(this).index();

	        select.addClass('on');
	        con.eq(i).show();
	    });
	}
</script>
</head>
<body>

	<ul class="tab" id="tab">
		<li>이메일 찾기</li>
		<li>비밀번호 찾기</li>
	</ul>
	
	<div class="tab_con" id="tab_con">
		<div class="find">
		<form action="emailFind.do" method="post" name="emailFindForm" onsubmit="return valueCheck()">
		<input type="hidden" value="${mem.email}" id="eValue"/>
		<input type="hidden" value="${isFind}" id="find"/>
		<input type="hidden" value="${mem.password}" id="pValue"/>
			<fieldset>	
				<h3>이메일  찾기</h3>
					<table>
						<tbody>
							<tr>
								<th scope="row">이름</th>
								<td><input type="text" class="txt w220" name="name" id="name"/></td>
							</tr>
							<tr>
								<th scope="row">생년월일</th>
								<td>
									<input type="text" class="txt w220" onkeyup="numCheck()" name="jumin1" id="jumin1" maxlength="6"/>
								</td>
								<td>
									<!-- <input type="text" value="  (주민번호 앞 6자리)"readonly style="background-color:transparent;border:0 solid black;"/> -->
								</td>
				
							</tr>
						</tbody>
					</table>
				<div class="btn_type_04" align="center">
					<span class="btn btnC_04 btnF_02"> <input type="submit" value="이메일 찾기" />
					</span>
				</div>
				<div class="Found" id="emailFound">
					${mem.name}님의 이메일 주소는 <strong>${mem.email}</strong>입니다.
				</div>
			</fieldset>
		</form>
		<div id="emailvalue" style="display:none"> </div>
		</div>
	
		<div class="find">
			<form action="pwFind.do" method="post" name="pwFindForm" onsubmit="return valueCheck2()" >
			<fieldset>
			 <h3>비밀번호 찾기</h3>
					<table>
						<tbody>
							<tr>
								<th scope="row">이름</th>
								<td>
									<input type="text" class="txt w220" name="name" id="name2"/>
								</td>
							</tr>
							<tr>
								<th scope="row">이메일</th>
								<td>
									<input type="text" class="txt w220" name="email" id="email" />
								</td>
								<td>
									<input type ="button" value="이메일인증" id="mailauth" onclick="openAuth()"/>
								</td>
								<td>
									<input type="text" name="mailcheck" id="mailcheck" value="인증전" readonly size="3" style="width:100%;background-color:transparent;border:0 solid black;"/>
								</td>
							</tr>
<!-- 							<tr>
								<th scope="row">휴대번호</th>
								<td>
									<input type="text" class="txt w220" onkeyup="numCheck()" name="phone" id="phone"/>(-없이 숫자만)
								</td>
							</tr> -->
						</tbody>
					</table>
				<div class="btn_type_04" align="center">
					<span class="btn btnC_04 btnF_02"> <input type="submit" value="비밀번호 찾기" />
				</span>
				</div>
				
				<div class="Found" id="pwFound">
					${mem.name}님의 비밀번호는 <strong>${mem.password}</strong>입니다.
				</div>
			</fieldset>
		</form>
		</div>
	</div>
</body>
</html>