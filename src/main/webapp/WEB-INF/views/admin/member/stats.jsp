<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
      google.charts.load('current', {'packages':['line']});
      google.charts.setOnLoadCallback(drawChart);

    function drawChart() {
      var data = new google.visualization.DataTable();
      var today = new Date();
      var year = today.getFullYear();
      /* document.getElementById("test").innerHTML = year-1; */
      
      data.addColumn('string', 'Month');
      data.addColumn('number', year);
      data.addColumn('number', year-1);
      
      data.addRows([
        ["1월",  ${joinNum[0]}, ${joinNum2[0]}],
        ["2월",  ${joinNum[1]}, ${joinNum2[1]}],
        ["3월",  ${joinNum[2]}, ${joinNum2[2]}],
        ["4월",  ${joinNum[3]}, ${joinNum2[3]}],
        ["5월",  ${joinNum[4]}, ${joinNum2[4]}],
        ["6월",  ${joinNum[5]}, ${joinNum2[5]}],
        ["7월",  ${joinNum[6]}, ${joinNum2[6]}],
        ["8월",  ${joinNum[7]}, ${joinNum2[7]}],
        ["9월",  ${joinNum[8]}, ${joinNum2[8]}],
        ["10월", ${joinNum[9]}, ${joinNum2[9]}],
        ["11월", ${joinNum[10]}, ${joinNum2[10]}],
        ["12월",  ${joinNum[11]}, ${joinNum2[11]}]
      ]);

      var options = {
        chart: {
          title: '최근 2년 가입자 수 비교',
          subtitle: '월별 가입자 수(명)'
        },
        vAxis: {
            title: '가입자 수(명)'
          },
        width: 900,
        height: 500,         
        axes: {
          x: {
            0: {side: 'botton'}
          }
        },
      };

      var chart = new google.charts.Line(document.getElementById('line_top_x'));

      chart.draw(data, options);
    }
  </script>
</head>
<body>
	<div class="row" style="padding-left: 15px; width: 900px;">
		<h1 class="page-header">회원관리 > 통계</h1>
	</div>
	<div class="row">
		<div class="panel panel-default">
		        <div class="panel-body">
			<div id="test"></div>
			<div id="line_top_x"></div>
			</div>
		</div>
	</div>
</body>
</html>