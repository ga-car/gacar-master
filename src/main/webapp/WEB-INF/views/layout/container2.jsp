<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="Ko" lang="Ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<script type="text/javascript"
	src="/rentacar/resources/js/main/contextPath.jsp"></script>

<script type="text/javascript"
	src="/rentacar/resources/js/main/encypt.sha1.js"></script>
<script type="text/javascript"
	src="/rentacar/resources/js/main/jquery-1.9.1.js"></script>
<script type="text/javascript"
	src="/rentacar/resources/js/main/jquery-ui-1.9.1.custom.js"></script>
<script type="text/javascript" src="/rentacar/resources/js/main/com.js"></script>

<link type="text/css" rel="stylesheet" media="all"
	href="/rentacar/resources/css/use/use_common.css" />
<link type="text/css" rel="stylesheet" media="all"
	href="/rentacar/resources/css/main/master.css" />
<link type="text/css" rel="stylesheet" media="all"
	href="/rentacar/resources/css/use/use_layout.css" />
<link type="text/css" rel="stylesheet" media="all"
	href="/rentacar/resources/css/use/main.css" />

<script type="text/javascript">
	//<![CDATA[
	$(function() {
		moveBestPage(1);

		$("#chkGeo").bind("click", function() {
			if ($(this).is(":checked")) {
				goSearch3();
			}
		});
	});

	function closeHotBanner() {
		$("#hotBanner").hide();
	}

	function prePage(pageNum) {
		moveBestPage(pageNum - 1);
	}

	function nextPage(pageNum) {
		moveBestPage(pageNum + 1);
	}

	function moveBestPage(gotoPage) {
		$.ajax({
			type : "get",
			url : __globalContextPath + "/review/list.do",
			data : {
				"gotoPage" : gotoPage
			},
			//async: false,
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(data) {
				$("#afterUse").html(data);
				$(".tab.menu1").addClass("on");
				$(".tab.menu2.lst").removeClass("on");
				$(".tab.menu1").parent().find(".tabview").show();
				$(".tab.menu2.lst").parent().find(".tabview").hide();
			}
		});
	}

	function goSpecialGoods() {
		$(".tab.menu1").removeClass("on");
		$(".tab.menu2.lst").addClass("on");
		$(".tab.menu1").parent().find(".tabview").hide();
		$(".tab.menu2.lst").parent().find(".tabview").show();
	}

	//]]>
</script>
</head>

<body>
	<div class="mainview-box">
		<div class="main-visualbox">
			<div id="sequence">
				<div class="visual_car">
					<div class="wheel_a">
						<div id="wheel1" class="wheel">
							<img src="/rentacar/resources/images/main/wheels_1.png" alt="" />
						</div>
					</div>
					<div class="wheel_b">
						<div id="wheel2" class="wheel">
							<img src="/rentacar/resources/images/main/wheels_1.png" alt="" />
						</div>
					</div>
				</div>
				<ul class="sequence-canvas">
					<li><img
						src="/rentacar/resources/images/main/visual_01_02.png" alt="" />
						<div class="frame1_txt step">
							<img
								src="/rentacar/resources/images/main/visual_01_txt_20160802.png"
								alt="" />
						</div>
						<div class="frame1_cloud step">
							<img src="/rentacar/resources/images/main/visual_01_cloud.png"
								alt="" />
						</div>
						<div class="frame1_hand step">
							<img src="/rentacar/resources/images/main/visual_01_03.png"
								alt="" />
						</div></li>
					<li><img
						src="/rentacar/resources/images/main/visual_02_01.png" alt="" />
						<div class="frame2_txt step">
							<img src="/rentacar/resources/images/main/visual_02_txt.png"
								alt="" />
						</div>
						<div class="frame2_cloud step">
							<img src="/rentacar/resources/images/main/visual_02_cloud.png"
								alt="" />
						</div></li>
					<li><img
						src="/rentacar/resources/images/main/visual_03_01.png" alt="" />
						<div class="frame3_txt step">
							<img src="/rentacar/resources/images/main/visual_03_txt.png"
								alt="" />
						</div>
						<div class="frame3_cloud step">
							<img src="/rentacar/resources/images/main/visual_03_cloud.png"
								alt="" />
						</div></li>
					<li><img
						src="/rentacar/resources/images/main/visual_04_01.png" alt="" />
						<div class="frame4_txt step">
							<img src="/rentacar/resources/images/main/visual_04_txt.png"
								alt="" />
						</div>
						<div class="frame4_cloud step">
							<img src="/rentacar/resources/images/main/visual_04_cloud.png"
								alt="" />
						</div></li>
					<li><img
						src="/rentacar/resources/images/main/visual_05_01.png" alt="" />
						<div class="frame5_txt step">
							<img src="/rentacar/resources/images/main/visual_05_txt.png"
								alt="" />
						</div>
						<div class="frame5_cloud step">
							<img src="/rentacar/resources/images/main/visual_04_cloud.png"
								alt="" />
						</div></li>
					<li><img
						src="/rentacar/resources/images/main/visual_06_01.png" alt="" />
						<div class="frame6_txt step">
							<img src="/rentacar/resources/images/main/visual_06_txt.png"
								alt="" />
						</div>
						<div class="frame6_cloud step">
							<img src="/rentacar/resources/images/main/visual_04_cloud.png"
								alt="" />
						</div></li>
				</ul>
				<div class="control">
					<span class="button" id="control_stop"><button type="button"
							class="stop">stop</button></span> <span class="button" id="control_play"
						style="display: none;"><button type="button" class="play">play</button></span>
				</div>
				<div class="sequence-pagination">
					<a href="#1"><img
						src="/rentacar/resources/images/main/visual_nav_on.png" alt="nav1" /></a>
					<a href="#1"><img
						src="/rentacar/resources/images/main/visual_nav_off.png"
						alt="nav2" /></a> <a href="#1"><img
						src="/rentacar/resources/images/main/visual_nav_off.png"
						alt="nav3" /></a> <a href="#1"><img
						src="/rentacar/resources/images/main/visual_nav_off.png"
						alt="nav4" /></a> <a href="#1"><img
						src="/rentacar/resources/images/main/visual_nav_off.png"
						alt="nav5" /></a> <a href="#1"><img
						src="/rentacar/resources/images/main/visual_nav_off.png"
						alt="nav6" /></a>
				</div>
			</div>
		</div>
		<script type="text/javascript"
			src="/rentacar/resources/js/main/jquery.easing.1.3.js"></script>
		<script type="text/javascript"
			src="/rentacar/resources/js/main/main_visual.js"></script>

		<!-- tab menu -->
		<div class="main_contents">
			<div class="user_reivew">
				* Reivew <a href="/rentacar/review/list.do">&nbsp;&nbsp;more</a> <br />
				<div id="list-article" class="content scaffold-list" role="main">

					<div class="panel panel-default">
						<ul class="list-group">
							<c:forEach var="list" items="${reviewList_new}">
								<c:url var="viewURL" value="/review/view.do">
									<c:param name="no" value="${list.no}" />
								</c:url>
								<li class="list-group-item  list-group-has-note clearfix">
									<div class="list-title-wrapper clearfix">
										<div class="list-tag clearfix">
											<span class="list-group-item-text article-id">${list.no}
											</span>
										</div>
										<h3 class="list-group-item-heading ">
											<c:if test="${list.imagefile_savname != 'NULL'}">
												<a href="${viewURL}"><img src="/rentacar/resources/reviewUpload/${list.imagefile_savname}" width="500px" height= "200px"/>
												</a>
												<a href="${viewURL}"> ${list.subject} [${list.car}]
												</a>
											</c:if>
											<c:if test="${list.imagefile_savname == 'NULL'}">
												<div>
													<a href="${viewURL}"><img
														src="/rentacar/resources/images/no_img.jpg"
														width="500px" height= "200px" /></a>
												</div>
												<div>
													<a href="${viewURL}"> ${list.subject}[${list.car}]</a>
												</div>
											</c:if>
										</h3>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>

				</div>

				<div class="admin_notice">
					* Notice <a href="/rentacar/notify/list.do">&nbsp;&nbsp;more</a> <br />
					<c:forEach var="list" items="${noticeList}">
						<c:url var="viewURL" value="/notify/detail.do">
							<c:param name="no" value="${list.no}" />
						</c:url>
						<li class="list-group-item  list-group-has-note clearfix">
							<div class="list-title-wrapper clearfix">
								<div class="list-tag clearfix">
									<span class="list-group-item-text article-id">${list.no}</span>
								</div>
								<h3 class="list-group-item-heading ">
									<a href="${viewURL}">${list.subject}</a>
								</h3>
							</div>
						</li>
					</c:forEach>
				</div>

			</div>

		</div>
</body>

</html>