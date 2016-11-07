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
				<li class="post1">CarPool</li>
				<li>></li>
				<li class="post2">타세요</li>
			</ul>
		</div>
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">CarPool</h1>
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
							<div id="map" style="width:100%;height:300px;"></div>
						</div>
						<form class="viewForm" method="post">
							<input type="hidden" name="${carpoolModel.no }" />
							<%-- <input type="hidden" name="seq" value="${item.seq }" /> --%>
							<%-- <c:if test="${session_name == carpoolModel.name }"> --%>
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

	  </script>   
</body>
</html>


