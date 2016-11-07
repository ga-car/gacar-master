<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script>
<link href="/rentacar/resources/admincss/bootstrap.min.css" rel="stylesheet">
<link href="/rentacar/resources/css/reset.css" rel="stylesheet">
<link href="/rentacar/resources/admincss/sb-admin-2.css" rel="stylesheet">
<style type="text/css">
.contents-wrap {
	margin: 30px 0 0 0;
	min-height: 500px;
}

.contents {
	margin: 60px 0 0 0;
}

.recode-wrap {
	text-align: right;
	color: #888;
}

.hit-wrap {
	color: #888;
	margin: 10px 0;
}

.viewForm {
	margin: 20px 0 0 0;
}
</style>

<!-- <script type="text/javascript">
function noticeDelete() {
	alert("삭제하겠습니까?");
	location.href='noticeDelete.dog?no=${carpoolModel.no}';
}
</script> -->
</head>

<body>
	<div id="wrapper">
		<div class="category_top">
			<ul>
				<li class="post1">커뮤니티</li>
				<li>></li>
				<li class="post2">공지사항</li>
			</ul>
		</div>
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">NOTICE</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<!-- /.panel-heading -->
						<div class="dataTable_wrapper">
							<table class="table table-striped table-bordered table-hover"
								id="dataTables-example">
								<thead>
									<tr class="danger">
										<th>${carpoolModel.subject }</th>
									</tr>
								</thead>
								<tbody>

									<tr>
										<td align=right><strong>${carpoolModel.name }</strong>&nbsp;&nbsp;|&nbsp;&nbsp;
										<fmt:formatDate value="${carpoolModel.regdate }" pattern="yyyy-MM-dd" /></td>
									</tr>
									<tr>
										<td align="center"><img src="http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/red_b.png">${carpoolModel.saddr }
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<img src="http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/blue_b.png">${carpoolModel.eaddr }</td>
									</tr>
								</tbody>
							</table>
							<table class="table table-striped table-bordered table-hover"
								id="dataTables-example">
								<tbody>
									<tr>
										<td align="center" width="100">목적</th>
										<td align="left">${carpoolModel.goal }</td>
										<td align="center" width="100">출발일시</td>
										<td align="left">${carpoolModel.startdate }</td>
									</tr>
									<tr>
										<td align="center" width="100">좌석수</th>
										<td align="left">${carpoolModel.pnum1 }/${carpoolModel.pnum2 }
										<c:if test="${carpoolModel.pnum1 != carpoolModel.pnum2 }">
										<button type="button" onclick="onAttend(${carpoolModel.no })" id="pnum1" name="pnum1" class="btn btn-primary">참가</button>
										</c:if>
										<td align="center" width="100">비용</td>
										<td align="left">${carpoolModel.charge }원</td>
									</tr>
									<tr>
										<td align="center" width="100">차내흡연</th>
										<td align="left">${carpoolModel.smoke }</td>
										<td align="center" width="100">보험가입종류</td>
										<td align="left">${carpoolModel.insure }</td>
									</tr>
									<tr>
										<td align="center" width="200">추가내용</td>
										<td align="left" colspan="3">${carpoolModel.content }</td>
									</tr>
								</tbody>
							</table>
							<div id="map" style="width:100%;height:350px;"></div>
						</div>
						<form class="viewForm" method="post">
							<input type="hidden" name="${carpoolModel.no }" />
							<%-- <input type="hidden" name="seq" value="${item.seq }" /> --%>
							<%-- <c:if test="${session_member_id == 'admin' }"> --%>
								<button type="button" onclick="onModify(${carpoolModel.no })"
									class="btn btn-primary">수정</button>
							<%-- </c:if> --%>
							<button type="button" onclick="onList()" class="btn btn-primary">목록</button>
							<button type="button" onclick="onDelete()" class="btn btn-primary">삭제</button>
						</form>

					</div>

				</div>
			</div>
		</div>
	</div>
	

<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=079b4daabc5db4153ba00f0a15d911f0&libraries=services"></script>
<script>
function onAttend() {
	alert("참가하겠습니까?");
	location.href='attend.do?no=${carpoolModel.no}';
}

function onDelete() {
	alert("삭제하겠습니까?");
	location.href='delete.do?no=${carpoolModel.no}';
}

var onModify = function(no){
	var form = $('.viewForm')[0];
	form.action = 'modify.do?no='+no;
	form.submit();
};
var onList = function(){
	location.href='list.do'
};

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = { 
    center: new daum.maps.LatLng("${carpoolModel.slat}", "${carpoolModel.slng}"), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};

//지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
var map = new daum.maps.Map(mapContainer, mapOption); 

/* var slat = document.getElementById('slat').value;
var slng = document.getElementById('slng').value;
var elat = document.getElementById('elat').value;
var slng = document.getElementById('elng').value; */



/* 	var onModify = function(no){
		var form = $('.viewForm')[0];
		form.action = 'noticeModify.dog?no='+no;
		form.submit();
	}; */

	/*
	    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	        mapOption = {
	            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
	            level: 5 // 지도의 확대 레벨
	        };

	    //지도를 미리 생성
	    var map = new daum.maps.Map(mapContainer, mapOption); */
	    //주소-좌표 변환 객체를 생성
	   /*  var geocoder = new daum.maps.services.Geocoder();
	    
	    var geocoder1 = new daum.maps.services.Geocoder(); */
	    //마커를 미리 생성
	/*     var marker = new daum.maps.Marker({
	        position: new daum.maps.LatLng(37.537187, 127.005476),
	        map: map
	        
	    }); */
	    
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

	var startPosition = new daum.maps.LatLng("${carpoolModel.slat}", "${carpoolModel.slng}"); 

	//출발 마커를 생성합니다
	var startMarker = new daum.maps.Marker({
	 map: map, // 출발 마커가 지도 위에 표시되도록 설정합니다
	 position: startPosition,
	 draggable: false, // 출발 마커가 드래그 가능하도록 설정합니다
	 image: startImage // 출발 마커이미지를 설정합니다
	});

	var arrivePosition = new daum.maps.LatLng("${carpoolModel.elat}", "${carpoolModel.elng}");    

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
	    draggable: false, // 도착 마커가 드래그 가능하도록 설정합니다
	    image: arriveImage // 도착 마커이미지를 설정합니다
	});
	
	
	
	var points = [
	              new daum.maps.LatLng("${carpoolModel.slat}", "${carpoolModel.slng}"),
	              new daum.maps.LatLng("${carpoolModel.elat}", "${carpoolModel.elng}")
	          ];

	          // 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
	          var bounds = new daum.maps.LatLngBounds();    

	          var i, marker;
	          for (i = 0; i < points.length; i++) {
	              // 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다
	              /* marker =     new daum.maps.Marker({ position : points[i] });
	              marker.setMap(map); */
	              
	              // LatLngBounds 객체에 좌표를 추가합니다
	              bounds.extend(points[i]);
	              map.setBounds(bounds);
	          }
	          
			//지도에 선표시
	          var polyline = new daum.maps.Polyline({
	  			map: map, // 선을 표시할 지도 객체 
	  			path: [ // 선을 구성하는 좌표 배열
	  				new daum.maps.LatLng("${carpoolModel.slat}", "${carpoolModel.slng}"),
	  				new daum.maps.LatLng("${carpoolModel.elat}", "${carpoolModel.elng}")
	  				
	  			],
	  			strokeWeight: 3, // 선의 두께
	  			strokeColor: '#FF0000', // 선 색
	  			strokeOpacity: 0.9, // 선 투명도
	  			strokeStyle: 'solid' // 선 스타일
	  		});	


	/*     function sample5_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var fullAddr = data.address; // 최종 주소 변수
	                var extraAddr = ''; // 조합형 주소 변수

	                // 기본 주소가 도로명 타입일때 조합한다.
	                if(data.addressType === 'R'){
	                    //법정동명이 있을 경우 추가한다.
	                    if(data.bname !== ''){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있을 경우 추가한다.
	                    if(data.buildingName !== ''){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
	                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	                }

	                // 주소 정보를 해당 필드에 넣는다.
	                document.getElementById("sample5_address").value = fullAddr;
	                
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
	    
	    function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data1) {
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var fullAddr1 = data1.address; // 최종 주소 변수
	                var extraAddr1 = ''; // 조합형 주소 변수

	                // 기본 주소가 도로명 타입일때 조합한다.
	                if(data1.addressType === 'R'){
	                    //법정동명이 있을 경우 추가한다.
	                    if(data1.bname !== ''){
	                        extraAddr1 += data1.bname;
	                    }
	                    // 건물명이 있을 경우 추가한다.
	                    if(data1.buildingName !== ''){
	                        extraAddr1 += (extraAddr1 !== '' ? ', ' + data1.buildingName : data1.buildingName);
	                    }
	                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
	                    fullAddr1 += (extraAddr1 !== '' ? ' ('+ extraAddr1 +')' : '');
	                }

	                // 주소 정보를 해당 필드에 넣는다.
	                document.getElementById("sample6_address").value = fullAddr1;
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
	    
	    function getDistanceFromLatLonInKm(slat,slng,elat,elng) {
	        function deg2rad(deg) {
	            return deg * (Math.PI/180)
	        }

	        var R = 6371; // Radius of the earth in km
	        var dLat = deg2rad(elat-slat);  // deg2rad below
	        var dLon = deg2rad(elng-slng);
	        var a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.cos(deg2rad(slat)) * Math.cos(deg2rad(elat)) * Math.sin(dLon/2) * Math.sin(dLon/2);
	        var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
	        var d = R * c; // Distance in km
	        return d;
	    } */
	    </script>
	    
</body>
</html>


