<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="/rentacar/resources/css/jquery.datetimepicker.css"/>
<style type="text/css">
.custom-date-style {
	background-color: red !important;
}
</style>
<body>
<form:form commandName="carpoolModel" action="write.do" method="post">
      <div id="page-wrapper">
         <div class="row">
            <div class="col-lg-12">
				<h3 class="page-header">CARPOOL 글쓰기</h3>
				<table class="table table-striped table-bordered table-hover"  id="dataTables-example">
					<thead>
						<tr class="danger" >
							<th width="100">글제목</th>
							<td colspan=3>
								<input type="text" name="subject" value="${carpoolModel.subject}" size="67"/>
								<font color="red"><form:errors path="subject" /></font>
							</td>
						</tr>
					</thead>
					<tbody>
						<tr><!-- 사용자 -->
							<th>사용자 ID</th>
							<td>
								<strong>
									<%-- ${session_member_name} --%>
									<input type="text" name="name" value="${carpoolModel.name }"/>
								</strong>
							</td>
							<th>출발일시</th>
							<td><input type="text" name="startdate" value="" id="datetimepicker"/></td>	
							<%-- <input type="hidden" name="name" value="${session_member_name }"/> --%>
						</tr>
						<tr>
							<th>목적</th>
							<td><input type="text" name="goal" id="goal" value="${carpoolModel.goal }" /></td>
							<th>기간</th>
							<td><input type="text" name="term" id="term" value="${carpoolModel.term }" /></td>
						</tr>
						<tr>
							<th>좌석수</th>
							<td><input type="text" name="pnum2" id="pnum2" value="${carpoolModel.pnum2 }" /></td>
							<th>비용</th>
							<td><input type="text" name="charge" id="charge" value="${carpoolModel.charge }" /></td>
						</tr>
						<tr>
							<th>차내흡연</th>
							<td><input type="text" name="smoke" id="smoke" value="" /></td>
							<th>보험</th>
							<td><select name="insure" id="insure">
    							<option value="대인배상Ⅰ">대인배상Ⅰ</option> 
    							<option value="대인배상Ⅱ">대인배상Ⅱ</option>
    							<option value="대인배상Ⅱ">대인배상Ⅱ</option>
								</select>
							</td>
						</tr>		
						<tr><!-- 글내용 -->
							<th>추가내용</th>
							<td colspan=3 height=150 style="padding: 0px !important;">
							   <textarea  name="content" style=" padding:3px; margin: 1px; width: 100%; height: 98%;"></textarea>
							   <font color="red"><form:errors path="content" /></font>
							</td>
						</tr>
					</tbody>	
				</table>
				<table class="table table-striped table-bordered table-hover"  id="dataTables-example">
					<tbody>
						<tr>
						<td width="100">
						<input type="hidden" name="slat" value="${carpoolModel.slat}" id="slat" />
						<input type="hidden" name="slng" value="${carpoolModel.slng}" id="slng" />
						<input type="hidden" name="elat" value="${carpoolModel.elat}" id="elat" />
						<input type="hidden" name="elng" value="${carpoolModel.elng}" id="elng" />
						</td>
						<th><input type="text" name="saddr" id="saddr" value="${carpoolModel.saddr}" placeholder="주소"></th>
						<td><input type="button" onclick="addrSearch()" value="출발지"><br></td>
						<th><input type="text" name="eaddr" id="eaddr" value="${carpoolModel.eaddr}" placeholder="주소"></th>
						<td><input type="button" name="ezipcode" onclick="addrSearch1()" value="도착지"><br></td>
						</td>
						</tr>
					</tbody>	
				</table>
			</div>
		</div>
	</div>
	<div id="map" style="width:65%;height:300px;"></div>
	<!-- 취소 작성완료 버튼 -->
	<div class="menu-wrap">
		<button type="button" onclick="this.form.submit();" class="btn btn-primary">작성완료</button>
		<button type="button" onclick="onList();" class="btn btn-primary">목록</button>
	</div>
	<!-- 취소 작성완료 버튼 -->
	<div class="row">
       	<div class="col-lg-12">
           <div class="panel panel-default"></div>
		</div>
	</div>
</form:form>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=079b4daabc5db4153ba00f0a15d911f0&libraries=services"></script> 
<script>
var onList = function(){
	location.href='list.do'
};
var mapContainer = document.getElementById('map'), // 지도를 표시할 div
   mapOption = {
     center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
     level: 5 // 지도의 확대 레벨
    };
//지도를 미리 생성
var map = new daum.maps.Map(mapContainer, mapOption);
//주소-좌표 변환 객체를 생성
var geocoder = new daum.maps.services.Geocoder();
var geocoder1 = new daum.maps.services.Geocoder();

var startSrc = 'http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/red_b.png', // 출발 마커이미지의 주소입니다    
startSize = new daum.maps.Size(50, 45), // 출발 마커이미지의 크기입니다 
startOption = { 
offset: new daum.maps.Point(15, 43) // 출발 마커이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
};

// 출발 마커 이미지를 생성합니다
var startImage = new daum.maps.MarkerImage(startSrc, startSize, startOption);

var startDragSrc = 'http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/red_drag.png', // 출발 마커의 드래그 이미지 주소입니다    
    startDragSize = new daum.maps.Size(50, 64), // 출발 마커의 드래그 이미지 크기입니다 
    startDragOption = { 
        offset: new daum.maps.Point(15, 54) // 출발 마커의 드래그 이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
    };

var startPosition = new daum.maps.LatLng(33.450701, 126.570667); 

//출발 마커를 생성합니다
var startMarker = new daum.maps.Marker({
 map: map, // 출발 마커가 지도 위에 표시되도록 설정합니다
 position: startPosition,
 draggable: false, // 출발 마커가 드래그 가능하도록 설정합니다
 image: startImage // 출발 마커이미지를 설정합니다
});

var arrivePosition = new daum.maps.LatLng(33.450701, 126.572667);    

var arriveSrc = 'http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/blue_b.png', // 도착 마커이미지 주소입니다    
arriveSize = new daum.maps.Size(50, 45), // 도착 마커이미지의 크기입니다 
arriveOption = { 
    offset: new daum.maps.Point(15, 43) // 도착 마커이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
};

// 도착 마커 이미지를 생성합니다
var arriveImage = new daum.maps.MarkerImage(arriveSrc, arriveSize, arriveOption);

var arriveDragSrc = 'http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/blue_drag.png', // 도착 마커의 드래그 이미지 주소입니다    
    arriveDragSize = new daum.maps.Size(50, 64), // 도착 마커의 드래그 이미지 크기입니다 
    arriveDragOption = { 
        offset: new daum.maps.Point(15, 54) // 도착 마커의 드래그 이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
    };
 
// 도착 마커를 생성합니다 
var arriveMarker = new daum.maps.Marker({  
    map: map, // 도착 마커가 지도 위에 표시되도록 설정합니다
    position: arrivePosition,
    draggable: true, // 도착 마커가 드래그 가능하도록 설정합니다
    image: arriveImage // 도착 마커이미지를 설정합니다
});

function addrSearch() {
	var frm = eval("document.infoinput");
        new daum.Postcode({
            oncomplete: function(data) {
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("saddr").value = fullAddr;
            
                
                // 주소로 좌표를 검색
                geocoder1.addr2coord(data.address, function(status, result) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {
                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
                        
                        document.getElementById("slat").value = coords.getLat();
                        document.getElementById("slng").value = coords.getLng(); 
                        
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        startMarker.setPosition(coords)
                    }
                });
            }
        }).open();
    } 
    function addrSearch1() {
		var frm = eval("document.infoinput"); 
        new daum.Postcode({
            oncomplete: function(data1) {
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr1 = data1.address; // 최종 주소 변수
                var extraAddr1 = ''; // 조합형 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("eaddr").value = fullAddr1;
                // 주소로 좌표를 검색
                geocoder1.addr2coord(data1.address, function(status1, result1) {
                    // 정상적으로 검색이 완료됐으면
                    if (status1 === daum.maps.services.Status.OK) {
                        // 해당 주소에 대한 좌표를 받아서
                        var coords1 = new daum.maps.LatLng(result1.addr[0].lat, result1.addr[0].lng);
                        
                     document.getElementById("elat").value = coords1.getLat();
                     document.getElementById("elng").value = coords1.getLng(); 
                       
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords1);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        arriveMarker.setPosition(coords1)
                    }
                });
            }
        }).open();
    }
    
</script>
<script src="/rentacar/resources/js/jquery.js"></script>
<script src="/rentacar/resources/js/jquery.datetimepicker.js"></script>
<script>
var today = new Date();
var dd = today.getDate();
var mm = today.getMonth()+1; //January is 0!
var yyyy = today.getFullYear();

if(dd<10) {
    dd='0'+dd
} 

if(mm<10) {
    mm='0'+mm
} 

today = mm+'/'+dd+'/'+yyyy;

$('#datetimepicker').datetimepicker({
	dayOfWeekStart : 1,
	lang:'ko',
	disabledDates:['1986/01/08','1986/01/09','1986/01/10'],
	startDate:	'document.write(today);'
});
$('#datetimepicker').datetimepicker({value:'document.write(today);',step:10});

$('.some_class').datetimepicker();

$('#default_datetimepicker').datetimepicker({
	formatTime:'H:i',
	formatDate:'d.m.Y',
	//defaultDate:'8.12.1986', // it's my birthday
	defaultDate:'+03.01.1970', // it's my birthday
	defaultTime:'10:00',
	timepickerScrollbar:false
});
</script>
</body>
</html>
