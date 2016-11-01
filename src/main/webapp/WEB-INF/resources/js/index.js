// JavaScript Document

function passwdcheck() {
		if (!document.passwdcheckform.password.value) {
			alert("비밀번호를 입력하세요");
			document.passwdcheckform.password.focus();
			return false;
		}
		if (document.passwdcheckform.password.value != document.passwdcheckform.password2.value) {
			alert("비밀번호를 동일하게 입력하세요");
			document.passwdcheckform.password2.focus();
			return false;
		}
		if (confirm("탈퇴하겠습니까?")) {

		} else {
			alert("취소되었습니다");
			window.location.href = 'memberMF.action';
			return false;
		}
	}
function checkForm() {
	var ok1 = document.getElementById("OK1");
	var ok2 = document.getElementById("OK2");
	if (ok1.checked == true && ok2.checked == true)// 체크박스의 속성 checked속성이 true면
	{
		window.location.href = "joinForm.action"; // 다음페이지로이동 이동
	} else {
		alert("약관에 동의하셔야합니다.");
		return false;
	}
}
function findidcheckIt(){
	if (!document.findform.name.value) {
		alert("이름을 입력하세요");
		document.findform.name.focus();
		return false;
	}
	if(!document.findform.phone.value){
		alert("휴대폰번호를 입력하세요");
		document.findform.phone.focus();
		return false;
	}
}
function findid() {
	var url = "memberfindF.action";
	window
			.open(
					url,
					"post",
					"toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=400,height=250");
}
function findpasswordcheckIt(){
	if (!document.findpasswordform.id.value) {
		alert("아이디를 입력하세요");
		document.findpasswordform.id.focus();
		return false;
	}
	if (!document.findpasswordform.phone.value) {
		alert("휴대폰번호를 입력하세요");
		document.findpasswordform.phone.focus();
		return false;
	}
}
function findpassword() {
	var url = "memberpfindF.action";
	window
			.open(
					url,
					"post",
					"toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=400,height=250");
}
function begin() {
	document.loginform.id.focus();
}
function idCheck() {
	if (!document.idcheckform.id.value) {
		alert("아이디를 입력하세요");
		return false;
	}
}


function logout() {
	if (confirm("로그아웃 하시겠습니까?")) {
		alert("이용해주셔서 감사합니다");
		window.location.href = 'memberLO2.action';
	} else {
		alert("취소되었습니다");
	}
}
function zipCheck() {
	var url = "zipcodeF.action";
	window
			.open(
					url,
					"post",
					"toolbar=no,width=500,height=300,directoris=no,status=yes,scrollbars=yes,menubar=no");
}
function openConfirmId(joinform) {
	if (joinform.id.value == "") {
		alert("아이디를 입력하세요");
		return;
	}
	url = "checkForm.action?id=" + joinform.id.value;
	open(
			url,
			"confirm",
			"toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300,height=200");
}
function openmodifyPassword() {
	var url = "memberPMF.action";
	window
			.open(
					url,
					"post",
					"toolbar=no,width=400,height=250,directoris=no,status=yes,scrollbars=no,menubar=no");
}
function joinCheck() {
	if (!document.joinform.id.value) {
		alert("아이디를 입력하세요.");
		return false;
	}
	if (!document.joinform.password.value) {
		alert("비밀번호를 입력하세요");
		return false;
	}
	if (!document.joinform.password.value != !document.joinform.password2.value) {
		alert("비밀번호를 동일하게 입력하세요");
		return false;
	}
	if (!document.joinform.name.value) {
		alert("이름을 입력하세요");
		return false;
	}
	if (!document.joinform.jumin1.value || !document.joinform.jumin2.value) {
		alert("생일을 입력하세요");
		return false;
	}
	if (!document.joinform.phone.value) {
		alert("핸드폰 번호를 입력하세요");
		return false;
	}
	if (!document.joinform.zipcode.value) {
		alert("우편번호를 입력하세요");
		return false;
	}
	if (!document.joinform.address.value) {
		alert("주소를 입력하세요");
		return false;
	}
}
function back() {
	history.go(-1);
}
function checknum() {
	if (event.keyCode < 48 || event.keyCode > 57) {
		alert("숫자만 입력하세요");
		event.returnValue = false;
	}
}
function checkIt() {
	if (!document.loginform.id.value) {
		alert("아이디를 입력하세요");
		document.loginform.id.focus();
		return false;
	}
	if (!document.loginform.password.value) {
		alert("비밀번호를 입력하세요");
		document.loginform.password.focus();
		return false;
	}

}
function dongCheck() {
	if (document.zipform.area3.value == "") {
		alert("동 이름을 입력하세요");
		document.zipform.area3.focus();
		return;
	}
	document.zipform.submit();
}

function sendAddress(zipcode, area1, area2, area3, area4) {
	var address = area1 + " " + area2 + " " + area3 + " " + area4;
	opener.document.joinform.zipcode.value = zipcode;
	opener.document.joinform.addr1.value = address;
	self.close();
}


function ordersendAddress(zipcode, area1, area2, area3, area4) {
	var address = area1 + " " + area2 + " " + area3 + " " + area4;
	opener.document.orderForm.order_receive_zipcode.value = zipcode;
	opener.document.orderForm.order_receive_addr1.value = address;
	self.close();
}
function basketsendAddress(zipcode, area1, area2, area3, area4) {
	var address = area1 + " " + area2 + " " + area3 + " " + area4;
	opener.document.orderForm.order_receive_zipcode.value = zipcode;
	opener.document.orderForm.order_receive_address.value = address;
	self.close();
} 
