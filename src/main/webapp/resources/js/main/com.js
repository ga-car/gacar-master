//변수
var UserAgent = navigator.userAgent;

// 널체크
function checkNullStr(s){
	if (s.length+1 == s.split(" ").length) {		
		return false;
    	}
    	return true;
}


// 숫자인지 체크
function IsNum(numstr){
	var tempstr = "0123456789";
	for(var i=0;i<numstr.length;i++) 
	{
		if(tempstr.indexOf(numstr.charAt(i)) == -1) {
			return false;
		}
	}
	return true;
}
// 2014.12.29, 숫자인지 체크
function IsNum2(numstr){
	var pattern = /^[0-9]+$/;
	for(var i=0;i<numstr.length;i++) 
	{
		if(pattern.test(numstr.charAt(i))) {
			return false;
		}
	}
	return true;
}

// 2015.11.27
// 예약페이지 검색시 사용
// 앞뒤공백 제거
// 공백 두개이상 하나로 치환
function replaceAddrSpace( str ){
	return str.replace( /\s+|\s{2,}/g, ' ' ).replace( /^(\s+|\s{2,})|(\s+|\s{2,})$/g, '' );
}


//숫자인지 체크
function checkNum (object)
{
	with (object)
	{
		checkValue=object.value;
		realValue=0;
		if (checkValue == "")
			return true;
		if (!checkValue.match (/^[\d]+$/))
		{
				object.value=""
				object.focus();
				alert("숫자만 입력해 주세요.");
				return false;
		}else if ( checkValue == "0"){
		
				object.value=""
				object.focus();
				alert("'0' 이상만 가능 합니다.");
				return false;
		
		}
		return true;
	}
}

// 숫자,특수문자 불가 체크
function IsChar(aStr, aLen, aHan){
        var isValid = true;
        for (var i=0; i< aLen; i++){
          if (aHan == "ENG") {
             if (!( (aStr.charCodeAt(i) >= 65 && aStr.charCodeAt(i) <= 90 ) ||
                    (aStr.charCodeAt(i) >= 97 && aStr.charCodeAt(i) <= 122) )) {
                isValid = false;
                break;
             }
          } else if (aHan == "HAN") {
             if (!( aStr.charCodeAt(i) >  127 )  )  {
                isValid = false;
                break;
             }
          } else {
             if (!( (aStr.charCodeAt(i) >= 65 && aStr.charCodeAt(i) <= 90 ) ||
                    (aStr.charCodeAt(i) >= 97 && aStr.charCodeAt(i) <= 122) ||
                    (aStr.charCodeAt(i) >  127 ) ))  {
                isValid = false;
                break;
             }
          } 
        } 
        return isValid;
}




// 주민번호 유효성체크
function IsResId(id1, id2){
	a = Array(6);
	b = Array(7);

	for (var i=0; i<6; i++)
		a[i] = parseInt(id1.charAt(i));

	for (var j=0; j<7; j++)
		b[j] = parseInt(id2.charAt(j));

	ssntot = (a[0]*2)+(a[1]*3)+(a[2]*4)+(a[3]*5)+(a[4]*6)+(a[5]*7) + (b[0]*8)+(b[1]*9)+(b[2]*2)+(b[3]*3)+(b[4]*4)+(b[5]*5);
	ssnave = 11 - (ssntot%11);

	if (ssnave == 11) ssnave = 1;
	else if(ssnave == 10) ssnave = 0;

	if (b[6] == ssnave) return true;
	else return false;
}

// 이메일주소 유효성체크
function IsMailStr(aStr){
     tempstr = "0123456789abcdefghijklmnopqrstuvwxyz_-@.";
     str1cnt = 0;
     str2cnt = 0;
     for(i=0;i<aStr.length;i++) { 
       if(tempstr.indexOf(aStr.charAt(i)) == -1) return false;
       if(aStr.charAt(i) == '@')  str1cnt += 1;
       if(aStr.charAt(i) == '.')  str2cnt += 1;
     } 
     if (str1cnt != 1 || str2cnt < 1 || str2cnt > 2) return false;
     return true;
}

// 전화 지역번호 체크
function IsValidDDD(obj){
        if ( obj == '02'  || obj == '031' || obj == '032' || obj == '033' ||
             obj == '041' || obj == '042' || obj == '043' || obj == '051' ||
             obj == '052' || obj == '053' || obj == '054' || obj == '055' ||
             obj == '061' || obj == '062' || obj == '063' || obj == '064' ||
             obj == '011' || obj == '017' || obj == '016' || obj == '018' ||
             obj == '019'
           )
            return true;
        else
            return false;
}

// 전화번호 4자리로 채워줌(스페이스로 채움)("012"-->"012 ")
function GetFourDigit(v){
	var ret="";
	if(v.length==4){ ret=v; }
	else if(v.length==3){ ret=v+" "; }
	else if(v.length==2){ ret=v+"  "; }
	else{ ret=v+"   "; }
	return ret;
}

// 날짜형식체크
function IsDate(src){
	if(src.length==8){
		if(src.substring(4,6)<13){
			if(src.substring(6,8)>0 && src.substring(6,8)<32){
				return true;
			}
		}
	}
	return false;
}

// 공백 필드 체크 후 alert 메세지, 포커싱 처리
function feildCheck(field, msg, bForcus){
	if ( !checkNullStr(field.value)) {
		alert(msg);

		if(bForcus != null && bForcus){
			field.focus();
		}
	
		return false;
	}else{
		return true;
	}
}


//str은 모두 소문자여야하고 첫글자는 영문이어야 한다. 영문과 0~9, _ 는 허용한다. 
function CheckChar(str) { 
    strarr = new Array(str.length); 
    var flag = true; 
    for (i=0; i<str.length; i++) { 
        strarr[i] = str.charAt(i) 
        if (i==0) { 
            if (!((strarr[i]>='a')&&(strarr[i]<='z'))) { 
                flag = false; 
            } 
        } else { 
            if (!((strarr[i]>='a')&&(strarr[i]<='z')||(strarr[i]>='0')&&(strarr[i]<='9')||(!IsChar(strarr[i])))) { 
                flag = false; 
            } 
        } 
    } 
    if (flag) { 
        return true; 
    } else { 
        return false; 
    } 
} 

//str은  영어여야하고  영문과 0~9, _ 는 허용한다. 
function CheckChar1(str) { 
  strarr = new Array(str.length); 
  var flag = true; 
  for (i=0; i<str.length; i++) { 
      strarr[i] = str.charAt(i) 
      if (!((strarr[i]>='a')&&(strarr[i]<='z')||(strarr[i]>='A')&&(strarr[i]<='Z')||(strarr[i]>='0')&&(strarr[i]<='9'))) { 
    	  flag = false; 
      }
  }
  if (flag) { 
      return true; 
  } else { 
      return false; 
  } 
}
//str은 모두 영문소문자여야 한다. 
function CheckChar2(str) { 
    strarr = new Array(str.length); 
    var flag = true; 
    for (i=0; i<str.length; i++) { 
        strarr[i] = str.charAt(i) 
        if (!((strarr[i]>='a')&&(strarr[i]<='z'))) { 
            flag = false; 
        } 
    } 
    if (flag) { 
        return true; 
    } else { 
        return false; 
    } 
} 



//str은 한글이어야만 한다. 
function CheckHangul(str) { 
    strarr = new Array(str.length); 
    schar = new Array('/','.','>','<',',','?','}','{',' ','\\','|','(',')','+','='); 
    flag = true; 
    for (i=0; i<str.length; i++) { 
        for (j=0; j<schar.length; j++) { 
            if (schar[j] ==str.charAt(i)) { 
                flag = false; 
            } 
        } 
        strarr[i] = str.charAt(i) 
        if ((strarr[i] >=0) && (strarr[i] <=9)) { 
            flag = false; 
        } else if ((strarr[i] >='a') && (strarr[i] <='z')) { 
            flag = false; 
        } else if ((strarr[i] >='A') && (strarr[i] <='Z')) { 
            flag = false; 
        } else if ((escape(strarr[i]) > '%60') && (escape(strarr[i]) <'%80') ) { 
            flag = false; 
        } 
    } 
    if (flag) { 
        return true; 
    } else { 
        return false; 
    }
}

function isIncludeHangul(str){

	var check = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
	var chk_han = str.match(check);

	return ( chk_han != null );
}

//이메일 체크
function email_check(value)
{
	var flag = false; //true when validation successful.
	var msg = "";

	if (value == "") return flag; //입력값 없는 경우는 Pass

	var tsTarget = value;
	var regExpEmail = /^\w+((-|\.)\w+)*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]{2,4}$/;

	return regExpEmail.test(tsTarget);
}


/** 숫자 인지 여부 **/
function isNumeric(s)
{
/*
     var isNum = /\d/;
     if( !isNum.test(s) ) return 0; 
     return 1;
*/
	var pattern = /^[0-9]+$/;
	return (pattern.test(s)) ? true : false;
}

/** 문자열의 바이트 길이를 되돌린다 **/ //호인 주석 : 특수 키와 소문자 영문자 영어만 1byte
function getByte(str) {
	
	if ( str == null || str == "" ) {
		return 0;
	}
	
    var len = 0;
    str = this != window ? this : str;
    for (j=0; j<str.length; j++) {
        var chr = str.charAt(j);
        len += (chr.charCodeAt() > 128) ? 2 : 1;
    }
    return len;
}


/**
70. 해당 객체의 입력값 검사 및 byte 수 검사
1. 숫자 / 한글 / 영문
2. byte 수
3. 다음 입력 박스
**/
function checkInputCondition(){

	var i = -1;
	var checkValue = "";
	var args = checkInputCondition.arguments;
	var oTargetObj = args[++i];
	var validType = args[++i];
	var valueByte = args[++i];
	var nextInput = args[++i];	

	checkValue = oTargetObj.value;
	var bResult = true;
	var errMsg = "";
	
	if ( checkValue == "" ){
	}else{
		if ( validType == "number" ){
			bResult = isNumeric(checkValue);
			errMsg = "숫자만 입력하세요.";
		}
		else if ( validType == "han" ){
			bResult = isHanOnly(checkValue);
			errMsg = "한글만 입력하세요.";
		}
		else if ( validType == "eng" ){
			bResult = isEnglishStr(checkValue);
			errMsg = "영문만 입력하세요.";
		}
		else{
		}
	}
	// 검사 결과
	if ( !bResult ){
		// alert(errMsg);
		try{
			oTargetObj.value = "";
			oTargetObj.focus();
		}
		catch(e){
		}
		return false;
	}

	checkValue = oTargetObj.value;
	var currentValueByte = getByte(checkValue);
	// alert(currentValueByte);
	if ( currentValueByte > valueByte ){
		alert("입력된 값의 길이는 " + valueByte + " 바이트 까지 가능합니다.");
		try{
			oTargetObj.focus();
		}
		catch(e){
		}
		return false;
	}
	else if ( currentValueByte == valueByte && nextInput != null ){
		try{
			nextInput.focus();
		}
		catch(e){
		}
	}

	return true;

}

/**
2011-07-14 박재영
정규식 치환이 잘 안되네 걍 div로 처리.
**/
function removeHtml2(html){
	var oBody = document.body;
	var oNewDiv = document.createElement("div");
	oBody.appendChild(oNewDiv);
	oNewDiv.innerHTML = html;
	return oNewDiv.innerText;
}


/** 문자열을 바이트 단위로 자른다. **/
function cut_str(str, length)
{
	var args = cut_str.arguments;
	var glueString = "";
	var bGlueString = false;
	if ( args.length == 3 )
	{
		glueString = args[2];
	}

	var tmpStr;
	var temp=0;
	var onechar;
	var tcount;
	var cutStr = "";
	tcount = 0;

	tmpStr = new String(str);
	temp = tmpStr.length;

	if ( getByte(str) > length )
	{
		bGlueString = true;
	}

	for(k=0;k<temp;k++)
	{
		var oneCharByte = getByte(tmpStr.charAt(k));

		if ( ( getByte(cutStr) + oneCharByte ) > length )
		{
		}
		else{
			cutStr += tmpStr.charAt(k);
		}
	}

	if ( bGlueString )
	{
		cutStr += glueString;
	}

	return cutStr;
}

/*
1000 자리 콤마 표시
*/
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

/*
support debug console
*/
function debugConsole(str){
		try{
			console.log(str);
		}catch(e){
		}
}

/*
 * 날짜 비교
 */
function getDate(date1, date2){
	var startDate = date1.split("-");
	var endDate = date2.split("-");
	
	var sDate = new Date(startDate[0], startDate[1], startDate[2]).valueOf();
	var eDate = new Date(endDate[0], endDate[1], endDate[2]).valueOf();
	
	if(sDate > eDate){
		return true;
	}else if(sDate == eDate){
		return false;
	}else{
		return false;
	}
}

$(function () {
	/**
	 * @author      : 박진수
	 * @date        : 2014. 8. 10.
	 * @description : 달력
	 */
	//조회기간설정의 시작날짜설정
	$(".calDt").datepicker({
		showOn : "button",
		//defaultDate : new Date(),
		buttonImage : __globalContextPath + "/images/admin/calendar.gif", //버튼이미지에 사용할 이미지 경로
		buttonImageOnly : false, //버튼이미지를 나오게 한다.
		buttonText: "조회날짜",
		monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ], // 월 한글로 출력
		monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ], // 월 한글로 출력
		dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ], // 요일 한글로 출력
		dateFormat : 'yy-mm-dd', //데이터 포멧형식
		nextText: '다음 달', // next 아이콘의 툴팁.
		prevText: '이전 달', // prev 아이콘의 툴팁.
		//minDate : interval1+'d', //오늘부터 과거 몇일까지 선택 할 수 있다.
		//maxDate : interval2+'d', //오늘부터 미래 몇일까지 선택 할 수 있다.
		changeYear : true, //년별로 선택 할 수 있다.
		changeMonth : true, //달별로 선택 할 수 있다.
		showMonthAfterYear : true, //년 뒤에 월 표시
		showOtherMonths : true, //이번달 달력안에 상/하 빈칸이 있을경우 전달/다음달 일로 채워준다.
		selectOtherMonths : true,
		numberOfMonths : 1, //오늘부터 3달치의 달력을 보여준다.
		showButtonPanel : false//오늘 날짜로 돌아가는 버튼 및 닫기 버튼을 생성한다.
		//onSelect : function(dateText){ calCheck($(this), dateText); }
	});

	//$(".calDt").val($.datepicker.formatDate('yy-mm-dd', new Date())); 
	
	/**
	 * @author      : 박진수
	 * @date        : 2014. 8. 12.
	 * @description : 체크박스 전체선택/전체해체 
	 * 				  체크박스 선택시 체크 박스 전체가 선택 되면 전체 선택 박스 체크 그렇지 않으면 전체 체크 박스 해제
	 * 			      규칙 - class="chkList"추가, 전체 체크 박스는 id는 맨 뒤에 All 포함하여 만들고 하위 체크박스 name은 전체 체크박스 id이름에 'All' 대신 'Row'를 넣는다.
	 *                예) id="sampleCheckAll"(전체 체크 박스), name="sampleCheckRow"(하위 체크박스)
	*/
	$(".chkList").bind("click", function(obj){

		//전체 체크 박스 여부 구분
		if((obj.target.id != null && obj.target.id != "") && obj.target.id.indexOf("All") > -1)	
		{	
			//체크박스 전체선택/전체해체 
			var chkNm = obj.target.id.replace("All", "Row");
			if($("#"+ obj.target.id).is(":checked"))
			{
				for(var i = 0 ; i < $("input[name=" + chkNm + "]").length ; i++)
				{
					$("input[name=" + chkNm + "]")[i].checked = true;
				}
			}
			else
			{
				for(var i = 0 ; i < $("input[name=" + chkNm + "]").length ; i++)
				{
					$("input[name=" + chkNm + "]")[i].checked = false;
				}
			}
		}
		if((obj.target.name != null && obj.target.name != "") && obj.target.name.indexOf("Row") > -1)
		{
			//체크박스 선택시 체크 박스 전체가 선택 되면 전체 선택 박스 체크 그렇지 않으면 전체 체크 박스 해제
			var chkId = obj.target.name.replace("Row", "All");
			if($("input[name=" + obj.target.name + "]").length == $("input[name=" + obj.target.name + "]:checkbox:checked").length)
			{
				$("#"+ chkId)[0].checked = true;
			}
			else
			{
				$("#"+ chkId)[0].checked = false;
			}
		}
	});

	
});
/**
 * @author      : 박진수
 * @date        : 2014. 8. 12.
 * 문자열 길이값 반환 한글 포함
 */
function getByteStrLength(str)
{
	var len = 0;
	if(str == null)
	{
		return 0;
	}
	for(var i = 0 ; i < str.length ; i++)
	{
		var c = escape(str.charAt(i));
		if(c.length == 1) 
		{
			len++;
		}
		else if(c.indexOf("%u") > -1)
		{
			len += 2;
		
		}
		else if(c.indexOf("%") > -1)
		{
			len += c.length/3;
		}
		if(c == "%0D")
		{
			len += 1;
		}
		if(c == "%0A")
		{
			len += 1;
		}
	}
	return len;
}

/**
 * @author      : 박진수
 * @date        : 2014. 8. 25.
 * @description : 이미지 파일 여부
 * obj : 해당 파일의 value 값
 * 예) <input type="file" name="imgFile" value onchange="fileValidation(this.value);" />
 */
function fileValidation(obj)
{
	
	var pathpoint = obj.lastIndexOf('.');
	var filepoint = obj.substring(pathpoint + 1, obj.length);
	var filetype = filepoint.toLowerCase();
	if(obj != null && obj != "")
	{
		if (filetype == 'jpg' || filetype == 'gif' || filetype == 'png' || filetype == 'jpeg' || filetype == 'bmp') {
			return true;
		} else {
			alert('이미지 파일만 가능합니다.');
			fileReset();
			return false;
		}
	}
	else
	{
		return true;
	}
}

/**
 * @author      : 박진수
 * @date        : 2014. 8. 25.
 * @description : 파일 리셋 
 */
function fileReset()
{
	//debugConsole(UserAgent);

	if(UserAgent.indexOf("MSIE") > -1) {
        $("input[type='file']").replaceWith( $("input[type='file']").clone(true) );
	}
	else 
	{
	    $("input[type='file']").val("");
	}
}


/**
 * @author 유정석
 * @description 완성형 한글 체크
 * @param {String} s 체크할 문자열
 * @return {Boolean}
 * */
function checkCompletedHangul( s ){
	var ustr = escape( s ),
	c,
	result;

	if( ustr.indexOf( '%' ) > -1 ){
		ustr = ustr.replace( /\%/gi, '\\' );
	}
	
	var i=0, len=s.length;
	for( ;i<len;i+=1 ){
		c = (s.substr(i, 1)).charCodeAt();
		if (c >= 0xAC00 && c <= 0xD7AF){ // 완성형 한글
			result = true;
		}else if( c >= 0x3130 && c <= 0x318F ) { // 완성형 아님
			result = false;
			break;
		}else{ // 한글아님
			result = false;
			break;
		};
	}
	return result;
}
/**
 * 아이디 정책
 * @param id
 * @returns {Boolean}
 */
function canUseUserIdPattern(id){
	
	var regExpId = /[^0-9^a-z]/g;
	var bTest = regExpId.test(id);
	
	return !bTest;
}

/**
 * 아이디 마스킹 처리
 * @param id
 * @returns {String}
 */
function maskId( id ) {
	var maskedId = id;
	var regEx = /^\w+((-|\.)\w+)*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]{2,4}$/;

	if ( maskedId != "" ) {
		if ( regEx.test(maskedId) ) {	// email 형식
			var arr = maskedId.split("@");
			var len = arr[0].length;
			var starSt = "";
			var i = 0;
			if ( len < 3 ) {
				for ( i=0; i< len; i++ ) {
					starSt += "*";
				}
			} else {
				starSt = arr[0].substring(0, len-2) + "**";
			}
			arr[0] = starSt;
			maskedId = arr.join("@");
		} else {	// 일반 id
			maskedId = maskedId.substring(0, (maskedId.length-2)) + "**";
		}
	}
	return maskedId;
}

/**
 * 이름 마스킹 처리
 * @param name
 * @returns {String}
 */
function maskName( name ) {
	var maskedNm = name;
	var regEx = /\(+[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|A-Za-z0-9]+\)+/;

	if ( maskedNm != "" ) {
		if ( regEx.test(maskedNm) ) {	// 괄호있음
			var sIdx = maskedNm.indexOf("(") + 1;
			var eIdx = maskedNm.indexOf(")");
			var sliceSt = maskedNm.slice( sIdx, eIdx );	// 변환할 문자열
			
			var len = sliceSt.length;
			var starSt = "";
			var i = 0;
			for ( i=0; i< len; i++ ) {
				starSt += "*";
			}
			maskedNm = maskedNm.replace( sliceSt, starSt );
		} else {	// 일반 id
			if ( maskedNm.length == 2 ) {
				maskedNm = maskedNm.substring(0, 1) + "*";
			} else if ( maskedNm.length == 3 ) {
				maskedNm = maskedNm.substring(0, 1) + "*" + maskedNm.substring(2, 3);
			} else if ( maskedNm.length == 4 ) {
				maskedNm = maskedNm.substring(0, 2) + "*" + maskedNm.substring(3, 4);
			} else if ( maskedNm.length == 5 ) {
				maskedNm = maskedNm.substring(0, 2) + "**" + maskedNm.substring(4, 5);
			} else {
				maskedNm = maskedNm.substring(0, 2) + "***" + maskedNm.substring(5);
			}
		}
	}
	return maskedNm;
}


$.fn.joinText = function( de ){
    var str = '',
    de = de || '';
    this.each(function( i, item ){
        if( i > 0 ){
           str += de;   
        }
        str += $( item ).text();
    });
    
    return( str );
 };
 
 
 $.fn.noautocomplete = function( state ){
	 this.each( function( i, item ){
		 if( state === undefined || ('on off default').indexOf( state ) < 0 ){
			 $(item).attr('autocomplete', 'off'); 
		 }else{
			 $(item).attr('autocomplete', state);
		 }
//		 console.log( $(item) );
	 } );
	 return this;
 }
 
 
 /**
 * 데이트 객체와 포맷형식을 넘겨주면 날짜및시간을 포맷에 따라 반환함.
 * ex) yyyy-MM-dd(E) HH:mm > 2016-03-29(화) 00:00
 * ex) yy-M-d(E요일) HH/mm > 16-3-29(화) 00/00
 * 
 * @author 유정석
 * @date : 2016-03 - 29
 * @param dt {DATE}  Date 객체
 * @param format {String} 포맷 문자열
 * @param days {Array} 요일 배열 [ 일, ... , 토 ]
 * @return String
 * 
 * 연 : yyyy 또는 yy
 * 월 : MM 또는 M
 * 일 : dd 또는 d
 * 요일 : E ( 요일은 days 파라미터로 매칭 ) 
 * 시 : HH 또는 H
 * 분 : mm 또는 m
 * */
function getDateFormatString( dt, format, days ){
	days = days || ['일', '월', '화', '수', '목', '금', '토'];
	var y = dt.getFullYear(),
		m = dt.getMonth()+1,
		d = dt.getDate(),
		da = days[dt.getDay()],
		h = dt.getHours(),
		mi = dt.getMinutes(),
		str = format,
		fexp = new RegExp( format );
	//
	function fd( n ){
		if( Number( n )<10 ){
			return '0' + n; 
		}
		return '' + n;
	}
	//
	function fr( reg, v ){
		var arr = format.match(reg);
		if( !!arr ){
			var r = arr[0];
			if( r.length == 2 ){
				return fd( v );
			}else{
				return v;
			}
		}else{
			return '';
		}
	}
	//
	if( /y+/.test(format) ){
		str = str.replace( /y+/, function( c ){
			if( c.length ==2 ){
				return y.slice(2, y.length);
			};
			return y;
		} );
	}
	//
	str = str.replace( /M+/, fr( /M+/, m ) );
	str = str.replace( /d+/, fr( /d+/, d ) );
	str = str.replace( /E/, fr( /E/, da ) );
	str = str.replace( /H+/, fr( /H+/, h ) );
	str = str.replace( /m+/, fr( /m+/, mi ) );
	
	return str;
}



/* 
 * 같은 값이 있는 열을 병합함
 * 사용법 : $('#테이블 ID').rowspan(0);
 */     
$.fn.rowspan = function(colIdx, isStats) {       
	return this.each(function(){      
		var that;     
		$('tr', this).each(function(row) {      
			$('td:eq('+colIdx+')', this).filter(':visible').each(function(col) {
				
				if ($(this).html() == $(that).html()
					&& (!isStats 
							|| isStats && $(this).prev().html() == $(that).prev().html()
							)
					) {            
					rowspan = $(that).attr("rowspan") || 1;
					rowspan = Number(rowspan)+1;

					$(that).attr("rowspan",rowspan);
					
					// do your action for the colspan cell here            
					$(this).hide();
					
					//$(this).remove(); 
					// do your action for the old cell here
					
				} else {            
					that = this;         
				}          
				
				// set the that if not already set
				that = (that == null) ? this : that;      
			});     
		});    
	});  
}; 

/* 
 * 같은 값이 있는 행을 병합함
 * 사용법 : $('#테이블 ID').colspan(0);
 */   
$.fn.colspan = function(rowIdx) {
	return this.each(function(){
		
		var that;
		$('tr', this).filter(":eq("+rowIdx+")").each(function(row) {
			$(this).find('th').filter(':visible').each(function(col) {
				if ($(this).html() == $(that).html()) {
					colspan = $(that).attr("colSpan") || 1;
					colspan = Number(colspan)+1;
					
					$(that).attr("colSpan",colspan);
					$(this).hide(); // .remove();
				} else {
					that = this;
				}
				
				// set the that if not already set
				that = (that == null) ? this : that;
				
			});
		});
	});
}