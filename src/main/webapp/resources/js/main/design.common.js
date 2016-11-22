$(document).ready(function () {
	// top_banner
	$(".top_banner").parent().addClass("reserv_layout_popup");
	if (getCookie( "TOP_BANNER") == "HIDE") {	// 닫은상태
		$(".top_banner").hide();
		$(".top_banner").parent().removeClass("reserv_layout_popup");
	} else {
		$(".top_banner").show();
		$(".top_banner .cont .close > a").click(function(){
			setCookie( "TOP_BANNER" , "HIDE", 0);
			$(".top_banner").hide(500);
			$(".top_banner").parent().removeClass("reserv_layout_popup");
			return false;
		});
	}
	
	// 상단 바로가기
	$(".scrollTop").click(function () {
		$('body, html').animate({
			scrollTop: 0
		}, 100);
		return false;
	});

	$(".navigation a").hover(
		function () {
			$(this).addClass('on');
		},
		function () {$(this).removeClass('on');}
	);
	$(".navi-sublist").hover(
		function () {$(this).prev().addClass('on');},
		function () {$(this).prev().removeClass('on');}
	);
	$(".navigation a").mouseover(function () {
		$(".nav-sub-wrap, .navi-sublist").css('display','block');
	});
	$("#header").mouseleave(function () {
		 setTimeout(function(){
			$(".nav-sub-wrap, .navi-sublist").css('display','none');
		  }, 400);
	});
	$(".navi-sublist li a").hover(function () {$(this).removeClass('on');});

	$('body').on('focus', '.navigation a', function(e) {
		$(".nav-sub-wrap, .navi-sublist").css('display','block');	
	});
	$('body').on('blur', '.sns-facebook a', function(e) {
		$(".nav-sub-wrap, .navi-sublist").css('display','none');
		$(".leftMenu li a:first").focus();
		$(".q01").focus();
	});


	// 메인 특가상품
	$(".tab_special_product:eq(1)").hide();

	$(".tabview .btn_tab_next").find("a").click(function(){
		$(".tab_special_product:eq(0)").hide();
		$(".tab_special_product:eq(1)").show();
		$(".tab_special_product:first").insertAfter(".tab_special_product:last");

		return false;					
	});

	$(".tabview .btn_tab_prev").find("a").click(function(){
		$(".tab_special_product:eq(0)").hide();
		$(".tab_special_product:eq(1)").show();
		$(".tab_special_product:last").insertBefore(".tab_special_product:first");

		return false;					
	});



	// 메인 자동롤링  배너
	function playAndStop( stat ){
		var $play = $('#controllBtn').find( '#playBtn' );
		var $stop = $('#controllBtn').find( '#stopBtn' );
		clearTimeout($bannerSet);
		if( stat ){
			$play.css('display', 'none');
			$stop.css('display', '');
			bannerStart();
		}else{
			$play.css('display', '');
			$stop.css('display', 'none');
		}
	}
	$(".main-banner ul").show().filter(".img_list").find("li:gt(0)").hide();
	$(".main-banner .cut_list a").click(function(){
		clearTimeout($bannerSet);
		$clickNum = $(this).text()-1;
		$rolling_ea = $clickNum;
		banner_view($clickNum);
		playAndStop( false );
		return false;
	});

	$rolling_ea = 0;
	bannerStart();

	$('#controllBtn').click( function(){
		if( $(this).find('#playBtn').css('display') == 'none' ){
			playAndStop(false);
		}else{
			playAndStop(true);
		}
	});



	// for main
	$(".mainview-box").parents().find("#container").addClass("main-content-box");
	$(".mainview-box").parents().find(".hgroup").css('border','none');
	$(".searchbar-01 .box input").focus( function () {
		 defaultText = $(this).val();
		 $(this).val('');
		 $(".word-list-wrap").css('display','none');
	});
	$(".searchbar-01 .box input").blur( function () {
		if ($(this).val() == '') {
			$(this).val(defaultText);
		}
		$(".word-list-wrap").css('display','none');
	});
	
	//링크도움말
	$(".link_layer_pos .btnstyle-01").click(function(){
		$(".layerbox").toggle();
		return false;
	});
	
});

// 메인 자동롤링 배너
function banner_view(num){
	$(".main-banner .img_list li").eq(num).show().siblings().hide();
	$(".main-banner .cut_list li").eq(num).addClass("ing").siblings().removeClass("ing");
}

function bannerStart(){
	//박진수, 2014.09.25, 배너수
	var banner_cnt = $(".main-banner .img_list li").length;
	$bannerSet = setInterval(function(){
		banner_view(++$rolling_ea%banner_cnt); 
	},2000);
}


//예약 차종선택 NEW (2015-04-09)
function carChoice(num){
	$carList = 	$(".popup_carchoice .btnstyle-wrap li");
	for(i=0;i<$carList.length;i++){
		if(i == num){
			$carList.eq(i).find("a").addClass("active");
			$(".popup_carchoice .tabCont"+i).show();
		}else{
			$carList.eq(i).find("a").removeClass("active");
			$(".popup_carchoice .tabCont"+i).hide();
		}
	}
}