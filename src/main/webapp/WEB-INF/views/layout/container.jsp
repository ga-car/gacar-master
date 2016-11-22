<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="Ko" lang="Ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />

<title>Insert title here</title>

<script type="text/javascript" src="/rentacar/resources/js/main/contextPath.jsp"></script>

<script type="text/javascript" src="/rentacar/resources/js/main/encypt.sha1.js"></script>
<script type="text/javascript" src="/rentacar/resources/js/main/jquery-1.9.1.js"></script>
<script type="text/javascript" src="/rentacar/resources/js/main/jquery-ui-1.9.1.custom.js"></script>
<script type="text/javascript" src="/rentacar/resources/js/main/com.js"></script>

<link type="text/css" rel="stylesheet" media="all" href="/rentacar/resources/css/use/use_common.css" />
<link type="text/css" rel="stylesheet" media="all" href="/rentacar/resources/css/main/master.css" />
<link type="text/css" rel="stylesheet" media="all" href="/rentacar/resources/css/use/use_layout.css" />
<link type="text/css" rel="stylesheet" media="all" href="/rentacar/resources/css/use/main.css" />

<script type="text/javascript">
//<![CDATA[
$(function(){
	moveBestPage(1);
	
	$("#chkGeo").bind("click", function(){
		if ($(this).is(":checked")) {
			goSearch3();
		}
	});
});    


function closeHotBanner() {
	$("#hotBanner").hide();
}

function prePage(pageNum) {
	moveBestPage(pageNum-1);
}

function nextPage(pageNum) 	{
	moveBestPage(pageNum+1);
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
		success : function(data){
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
					<div id="wheel1" class="wheel"><img src="/rentacar/resources/images/main/wheels_1.png" alt="" /></div>
				</div>
				<div class="wheel_b">
					<div id="wheel2" class="wheel"><img src="/rentacar/resources/images/main/wheels_1.png" alt="" /></div>
				</div>
			</div>
			<ul class="sequence-canvas">
				<li><img src="/rentacar/resources/images/main/visual_01_02.png" alt="" />
					<div class="frame1_txt step">
						<img src="/rentacar/resources/images/main/visual_01_txt_20160802.png" alt="" />
					</div>
					<div class="frame1_cloud step"><img src="/rentacar/resources/images/main/visual_01_cloud.png" alt="" /></div>
					<div class="frame1_hand step"><img src="/rentacar/resources/images/main/visual_01_03.png" alt="" /></div>
				</li>
				<li><img src="/rentacar/resources/images/main/visual_02_01.png" alt="" />
					<div class="frame2_txt step">
						<img src="/rentacar/resources/images/main/visual_02_txt.png" alt="" />
					</div>
					<div class="frame2_cloud step"><img src="/rentacar/resources/images/main/visual_02_cloud.png" alt="" /></div>
				</li>
				<li><img src="/rentacar/resources/images/main/visual_03_01.png" alt="" />
					<div class="frame3_txt step">
						<img src="/rentacar/resources/images/main/visual_03_txt.png" alt="" />
					</div>
					<div class="frame3_cloud step"><img src="/rentacar/resources/images/main/visual_03_cloud.png" alt="" /></div>
				</li>
				<li><img src="/rentacar/resources/images/main/visual_04_01.png" alt="" />
					<div class="frame4_txt step">
						<img src="/rentacar/resources/images/main/visual_04_txt.png" alt="" />
					</div>
					<div class="frame4_cloud step"><img src="/rentacar/resources/images/main/visual_04_cloud.png" alt="" /></div>
				</li>
				<li><img src="/rentacar/resources/images/main/visual_05_01.png" alt="" />
					<div class="frame5_txt step">
						<img src="/rentacar/resources/images/main/visual_05_txt.png" alt="" />
					</div>
					<div class="frame5_cloud step"><img src="/rentacar/resources/images/main/visual_04_cloud.png" alt="" /></div>
				</li>
				<li><img src="/rentacar/resources/images/main/visual_06_01.png" alt="" />
					<div class="frame6_txt step">
						<img src="/rentacar/resources/images/main/visual_06_txt.png" alt="" />
					</div>
					<div class="frame6_cloud step"><img src="/rentacar/resources/images/main/visual_04_cloud.png" alt="" /></div>
				</li>
			</ul>
			<div class="control">
				<span class="button" id="control_stop"><button type="button" class="stop">stop</button></span>
				<span class="button" id="control_play" style="display:none;"><button type="button" class="play">play</button></span>
			</div>
			<div class="sequence-pagination">
				<a href="#1"><img src="/rentacar/resources/images/main/visual_nav_on.png" alt="nav1" /></a>
				<a href="#1"><img src="/rentacar/resources/images/main/visual_nav_off.png" alt="nav2" /></a>
				<a href="#1"><img src="/rentacar/resources/images/main/visual_nav_off.png" alt="nav3" /></a>
				<a href="#1"><img src="/rentacar/resources/images/main/visual_nav_off.png" alt="nav4" /></a>
				<a href="#1"><img src="/rentacar/resources/images/main/visual_nav_off.png" alt="nav5" /></a>
				<a href="#1"><img src="/rentacar/resources/images/main/visual_nav_off.png" alt="nav6" /></a>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="/rentacar/resources/js/main/jquery.easing.1.3.js"></script>
	<script type="text/javascript" src="/rentacar/resources/js/main/main_visual.js"></script>
	
	<!-- tab menu -->
	<div class="main-tab-container">
		<div class="main-content-wrap">
			<div class="main-cont-box1">
				<ul class="main-tablist">
					<li id="afterUse"></li>
					<li><a href="#1" class="tab menu2 lst" onclick="goSpecialGoods();"><span>SpecialGoods</span></a>
			
						<div class="tabview" style="display:none;">
							<div class="btn_tab_prev">
								<a href="#1"><img src="/rentacar/resources/images/main/btn_tab_prev.gif" alt="preList" /></a>
							</div>
							<ul class="tab_special_product">
								<li>
									<a href="/charge/special.do">
										<img src="/rentacar/resources/images/main/tab_special_img01.jpg" alt="" />
									</a>
								</li>
								<li class="last">
									<a href="/charge/special.do">
										<img src="/rentacar/resources/images/main/tab_special_img02.jpg" alt="" />
									</a>
								</li>
							</ul>
							<ul class="tab_special_product">
								<li>
									<a href="/charge/special.do">
										<img src="/rentacar/resources/images/main/tab_special_img03.jpg" alt="" />
									</a>
								</li>
								<li class="last">
									<a href="http://www.greencar.co.kr/customer/notice/view.do?h-bbsId=vdLQcGs7Op+LQlmQj2we1Q==">
										<img src="/rentacar/resources/images/main/tab_special_img04.jpg" alt="" />
									</a>
								</li>
							</ul>
							<div class="btn_tab_next">
								<a href="#1"><img src="/rentacar/resources/images/main/btn_tab_next.gif" alt="nextList" /></a>
							</div>
							<div class="more menu2">
								<a href="/charge/special.do"><span>more</span></a>
							</div>
						</div>
					</li>
				</ul>
			</div>			
					
			<div class="main-cont-box2">
				<div class="main-banner">
					<ul class="img_list">
							<li>
								<a href="http://blog.naver.com/greencar_co/220858397573" target="_blank"><img src="/banner/imgView.do?h-bannerIdx=y8y3PjRQlrDk4SX3bJyPYw==" alt=" 990" width="318" height="118"/></a>
							</li>		
							
							<li>
								<a href="http://www.greencar.co.kr/event/view.do?h-bbsId=Dc1oV62nLaITtu2k2dPt3Q==&bbsCateId=1&bbsNoticeYn=&searchItem=&searchWord=&gotoPage=1" ><img src="/banner/imgView.do?h-bannerIdx=oUwoNn/QffuncabzeCwUsA==" alt="friend" width="318" height="118"/></a>
							</li>
					</ul>
					<ul class="cut_list">		
									<li class="ing"><a href="#bannerZone" title="1event">1</a></li>
									<li ><a href="#bannerZone" title="2event">2</a></li>
					</ul>
					<p id="controllBtn" class="btnbox">
						<a id="stopBtn" href="#bannerZone" >stop</a>
						<a id="playBtn" class="play" style="display:none;" href="#bannerZone">play</a>
					</p>						
				</div>
				<div class="main-notice">
					<div class="inbox">
						<strong class="main-notice-tit">notice</strong>
						<ul>
							<li><a href="/customer/notice/view.do?h-bbsId=6Smeox0zNhMUW5r7MQUuoA=="><span class="new">new</span></a></li>						
							<li><a href="/customer/notice/view.do?h-bbsId=u70IOR5uOPWjeLkgJwI19w=="></a></li>
							<li><a href="/customer/notice/view.do?h-bbsId=h/XO1QEO2gqLw/rbWngIlw=="></a></li>
							<li><a href="/customer/notice/view.do?h-bbsId=ShHKlCZyy7v68X5OFKaJ2g=="></a></li>
						</ul>
						<span class="more"><a href="/customer/notice/list.do">more</a></span>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>			
</body>

</html>