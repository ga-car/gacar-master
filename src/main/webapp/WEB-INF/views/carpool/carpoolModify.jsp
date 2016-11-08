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
				<h3 class="page-header">CARPOOL �۾���</h3>
				<table class="table table-striped table-bordered table-hover"  id="dataTables-example">
					<thead>
						<tr class="danger" >
							<th width="100">������</th>
							<td colspan=3>
								<input type="text" name="subject" value="${carpoolModel.subject}" size="67"/>
								<font color="red"><form:errors path="subject" /></font>
							</td>
						</tr>
					</thead>
					<tbody>
						<tr><!-- ����� -->
							<th>����� ID</th>
							<td>
								<strong>
									<%-- ${session_member_name} --%>
									<input type="text" name="name" value="${carpoolModel.name }"/>
								</strong>
							</td>
							<th>����Ͻ�</th>
							<td><input type="text" name="startdate" value="" id="datetimepicker"/></td>	
							<%-- <input type="hidden" name="name" value="${session_member_name }"/> --%>
						</tr>
						<tr>
							<th>����</th>
							<td><input type="text" name="goal" id="goal" value="${carpoolModel.goal }" /></td>
							<th>�Ⱓ</th>
							<td><input type="text" name="term" id="term" value="${carpoolModel.term }" /></td>
						</tr>
						<tr>
							<th>�¼���</th>
							<td><input type="text" name="pnum2" id="pnum2" value="${carpoolModel.pnum2 }" /></td>
							<th>���</th>
							<td><input type="text" name="charge" id="charge" value="${carpoolModel.charge }" /></td>
						</tr>
						<tr>
							<th>������</th>
							<td><input type="text" name="smoke" id="smoke" value="" /></td>
							<th>����</th>
							<td><select name="insure" id="insure">
    							<option value="���ι��">���ι��</option> 
    							<option value="���ι��">���ι��</option>
    							<option value="���ι��">���ι��</option>
								</select>
							</td>
						</tr>		
						<tr><!-- �۳��� -->
							<th>�߰�����</th>
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
						<th><input type="text" name="saddr" id="saddr" value="${carpoolModel.saddr}" placeholder="�ּ�"></th>
						<td><input type="button" onclick="addrSearch()" value="�����"><br></td>
						<th><input type="text" name="eaddr" id="eaddr" value="${carpoolModel.eaddr}" placeholder="�ּ�"></th>
						<td><input type="button" name="ezipcode" onclick="addrSearch1()" value="������"><br></td>
						</td>
						</tr>
					</tbody>	
				</table>
			</div>
		</div>
	</div>
	<div id="map" style="width:65%;height:300px;"></div>
	<!-- ��� �ۼ��Ϸ� ��ư -->
	<div class="menu-wrap">
		<button type="button" onclick="this.form.submit();" class="btn btn-primary">�ۼ��Ϸ�</button>
		<button type="button" onclick="onList();" class="btn btn-primary">���</button>
	</div>
	<!-- ��� �ۼ��Ϸ� ��ư -->
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
var mapContainer = document.getElementById('map'), // ������ ǥ���� div
   mapOption = {
     center: new daum.maps.LatLng(37.537187, 127.005476), // ������ �߽���ǥ
     level: 5 // ������ Ȯ�� ����
    };
//������ �̸� ����
var map = new daum.maps.Map(mapContainer, mapOption);
//�ּ�-��ǥ ��ȯ ��ü�� ����
var geocoder = new daum.maps.services.Geocoder();
var geocoder1 = new daum.maps.services.Geocoder();

var startSrc = 'http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/red_b.png', // ��� ��Ŀ�̹����� �ּ��Դϴ�    
startSize = new daum.maps.Size(50, 45), // ��� ��Ŀ�̹����� ũ���Դϴ� 
startOption = { 
offset: new daum.maps.Point(15, 43) // ��� ��Ŀ�̹������� ��Ŀ�� ��ǥ�� ��ġ��ų ��ǥ�� �����մϴ� (�⺻���� �̹����� ��� �Ʒ��Դϴ�)
};

// ��� ��Ŀ �̹����� �����մϴ�
var startImage = new daum.maps.MarkerImage(startSrc, startSize, startOption);

var startDragSrc = 'http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/red_drag.png', // ��� ��Ŀ�� �巡�� �̹��� �ּ��Դϴ�    
    startDragSize = new daum.maps.Size(50, 64), // ��� ��Ŀ�� �巡�� �̹��� ũ���Դϴ� 
    startDragOption = { 
        offset: new daum.maps.Point(15, 54) // ��� ��Ŀ�� �巡�� �̹������� ��Ŀ�� ��ǥ�� ��ġ��ų ��ǥ�� �����մϴ� (�⺻���� �̹����� ��� �Ʒ��Դϴ�)
    };

var startPosition = new daum.maps.LatLng(33.450701, 126.570667); 

//��� ��Ŀ�� �����մϴ�
var startMarker = new daum.maps.Marker({
 map: map, // ��� ��Ŀ�� ���� ���� ǥ�õǵ��� �����մϴ�
 position: startPosition,
 draggable: false, // ��� ��Ŀ�� �巡�� �����ϵ��� �����մϴ�
 image: startImage // ��� ��Ŀ�̹����� �����մϴ�
});

var arrivePosition = new daum.maps.LatLng(33.450701, 126.572667);    

var arriveSrc = 'http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/blue_b.png', // ���� ��Ŀ�̹��� �ּ��Դϴ�    
arriveSize = new daum.maps.Size(50, 45), // ���� ��Ŀ�̹����� ũ���Դϴ� 
arriveOption = { 
    offset: new daum.maps.Point(15, 43) // ���� ��Ŀ�̹������� ��Ŀ�� ��ǥ�� ��ġ��ų ��ǥ�� �����մϴ� (�⺻���� �̹����� ��� �Ʒ��Դϴ�)
};

// ���� ��Ŀ �̹����� �����մϴ�
var arriveImage = new daum.maps.MarkerImage(arriveSrc, arriveSize, arriveOption);

var arriveDragSrc = 'http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/blue_drag.png', // ���� ��Ŀ�� �巡�� �̹��� �ּ��Դϴ�    
    arriveDragSize = new daum.maps.Size(50, 64), // ���� ��Ŀ�� �巡�� �̹��� ũ���Դϴ� 
    arriveDragOption = { 
        offset: new daum.maps.Point(15, 54) // ���� ��Ŀ�� �巡�� �̹������� ��Ŀ�� ��ǥ�� ��ġ��ų ��ǥ�� �����մϴ� (�⺻���� �̹����� ��� �Ʒ��Դϴ�)
    };
 
// ���� ��Ŀ�� �����մϴ� 
var arriveMarker = new daum.maps.Marker({  
    map: map, // ���� ��Ŀ�� ���� ���� ǥ�õǵ��� �����մϴ�
    position: arrivePosition,
    draggable: true, // ���� ��Ŀ�� �巡�� �����ϵ��� �����մϴ�
    image: arriveImage // ���� ��Ŀ�̹����� �����մϴ�
});

function addrSearch() {
	var frm = eval("document.infoinput");
        new daum.Postcode({
            oncomplete: function(data) {
                // �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
                var fullAddr = data.address; // ���� �ּ� ����
                var extraAddr = ''; // ������ �ּ� ����

                // �ּ� ������ �ش� �ʵ忡 �ִ´�.
                document.getElementById("saddr").value = fullAddr;
            
                
                // �ּҷ� ��ǥ�� �˻�
                geocoder1.addr2coord(data.address, function(status, result) {
                    // ���������� �˻��� �Ϸ������
                    if (status === daum.maps.services.Status.OK) {
                        // �ش� �ּҿ� ���� ��ǥ�� �޾Ƽ�
                        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
                        
                        document.getElementById("slat").value = coords.getLat();
                        document.getElementById("slng").value = coords.getLng(); 
                        
                        // ������ �����ش�.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // ���� �߽��� �����Ѵ�.
                        map.setCenter(coords);
                        // ��Ŀ�� ��������� ���� ��ġ�� �ű��.
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
                // �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
                var fullAddr1 = data1.address; // ���� �ּ� ����
                var extraAddr1 = ''; // ������ �ּ� ����

                // �ּ� ������ �ش� �ʵ忡 �ִ´�.
                document.getElementById("eaddr").value = fullAddr1;
                // �ּҷ� ��ǥ�� �˻�
                geocoder1.addr2coord(data1.address, function(status1, result1) {
                    // ���������� �˻��� �Ϸ������
                    if (status1 === daum.maps.services.Status.OK) {
                        // �ش� �ּҿ� ���� ��ǥ�� �޾Ƽ�
                        var coords1 = new daum.maps.LatLng(result1.addr[0].lat, result1.addr[0].lng);
                        
                     document.getElementById("elat").value = coords1.getLat();
                     document.getElementById("elng").value = coords1.getLng(); 
                       
                        // ������ �����ش�.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // ���� �߽��� �����Ѵ�.
                        map.setCenter(coords1);
                        // ��Ŀ�� ��������� ���� ��ġ�� �ű��.
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
