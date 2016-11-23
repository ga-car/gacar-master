	
	var canvas = $(".sequence-canvas").children();
	var len =  $(".sequence-canvas").children().length;
	var cnt = 1;
	
	var timer = null;
	var auto = true;
	var timer = null;
	var speed = 5000;
	
	var first = $(canvas).first();
	var last = $(canvas).last();
	
	canvas.css({"display":"none"});
	first.css({"display":"block", "left":"0"}).addClass("current");
	
	setTimeout( function () {
		autoSlide();
		if(auto) timer = setInterval(autoSlide, speed);
	}, 2500);
		
	$(".sequence-pagination").children().click( function () {
		return false;
	});
	$(".sequence-pagination").children().bind({
		'click' : paging,
		'mouseenter': mouseOver,
		'mouseleave': mouseOut
	});

	function mouseOver() {
		if(!auto) return false;
		clearInterval(timer);
		auto = false;
	}
	function mouseOut() {
		timer = setInterval(autoSlide, speed);
		auto = true;

		if ($("#control_stop").hide()) {
			$("#control_stop").show();
			$("#control_play").hide();
		}
	}

	function paging() {

		
		$(".sequence-pagination").children().unbind("mouseleave", mouseOut);

		var idx = $(".sequence-pagination").children().index(this); 
		cnt = idx;
		
		var canvasindex = $(".sequence-canvas").children(".current").index();
		$(".sequence-canvas").children(".current").removeClass("current").animate({"left":"-1000"}, {
			duration:3300, 
			easing:"easeInOutQuart",
			start: function() {
				$(".sequence-pagination").children().unbind("click", paging);
			},
			complete: function() {
				$(this).css({"display":"none", "left":"800px"});
				$(this).children(".step").css({"display":"none", "left":"150%"});
				$(".sequence-pagination").children().bind("click", paging);
				$(".sequence-pagination").children().bind("mouseleave", mouseOut);

			}
		});
		$(canvas).eq(idx).css("display","block").animate({"left":"0"},{duration:3300, easing:"easeInOutQuart",
			complete: function() {
				$(this).addClass("current");
			}
		})

		if ($("#control_stop").css("display","none")) {
			visualPlay();
		}

		autoSlide();


		return false;
	}

	
	function autoSlide() {	
		if(cnt > len-1) {
			cnt = 0;
		}

		
		rotateWheel();

		$(".current").animate({"left":"-1000"},{
			duration:3300, 
			easing:"easeInOutQuart",
			start: function() {
				$(".sequence-pagination").children().unbind("click", paging);
			},
			complete: function() {
				$(this).removeClass("current").css({"display":"none", "left":"800px"});
				$(this).children('.step').css({"display":"none", "left":"150%"});
			}
		}).next().css({"display":"block"}).animate({"left":"0"},{
			duration:3300, 
			easing:"easeInOutQuart",
			start: function() {

			},
			complete: function() {
				$(this).addClass("current");
				$(".sequence-pagination").children().bind("click", paging);
			}
		})
		if (last.hasClass("current")) {
			first.css({"display":"block"}).animate({"left":"0"}, {
				duration:3300, 
				easing:"easeInOutQuart",
				start: function() {
					$(".sequence-pagination").children().unbind("click", paging);
				},
				complete: function() {
					$(".sequence-pagination").children().bind("click", paging);
				}
			}).addClass("current")
		}

		var source2 = $('.sequence-pagination').children().find('img').attr('src').replace('_on.png','_off.png');
		$('.sequence-pagination').children().find('img').attr('src',source2);
		var source = $('.sequence-pagination').children().find('img').attr('src').replace('_off.png','_on.png');
		$('.sequence-pagination').children().eq(cnt).find('img').attr('src',source);

		if (cnt == 0) {
			$(".frame1_txt").css("display","block").animate({"left":"50%"}, {duration:3800, easing:"easeInOutQuart"});
			$(".frame1_cloud").css("display","block").animate({"left":"0"}, {duration:3300, easing:"easeInOutQuart"});
			$(".frame1_hand").css("display","block").animate({"left":"68%"}, {duration:3500, easing:"easeInOutExpo"});	
		}
		else if (cnt == 1) {
			$(".frame2_txt").css("display","block").animate({"left":"50%"}, {duration:3800, easing:"easeInOutQuart"});
			$(".frame2_cloud").css("display","block").animate({"left":"0"}, {duration:3300, easing:"easeInOutQuart"});
		}
		else if (cnt == 2) {
			$(".frame3_txt").css("display","block").animate({"left":"50%"}, {duration:3800, easing:"easeInOutQuart"});
			$(".frame3_cloud").css("display","block").animate({"left":"0"}, {duration:3300, easing:"easeInOutQuart"});
		}
		else if (cnt == 3) {
			$(".frame4_txt").css("display","block").animate({"left":"50%"}, {duration:3800, easing:"easeInOutQuart"});
			$(".frame4_cloud").css("display","block").animate({"left":"0"}, {duration:3300, easing:"easeInOutQuart"});
		}
		else if (cnt == 4) {
			$(".frame5_txt").css("display","block").animate({"left":"50%"}, {duration:3800, easing:"easeInOutQuart"});
			$(".frame5_cloud").css("display","block").animate({"left":"0"}, {duration:3300, easing:"easeInOutQuart"});
		}
		else if (cnt == 5) {
			$(".frame6_txt").css("display","block").animate({"left":"50%"}, {duration:3800, easing:"easeInOutQuart"});
			$(".frame6_cloud").css("display","block").animate({"left":"0"}, {duration:3300, easing:"easeInOutQuart"});
		}

	
		cnt++;
	}

	

	

	// Layout Resize - CSS class change
    $(window).resize(function(){
        var width = parseInt($(this).width());
		$(".sequence-canvas li").css("width", width);
    }).resize(); // 로딩되면서 창크기에 맞추기 위해 한 번 부름

	$("#control_stop").click( function () {visualStop();});
	$("#control_play").click( function () {visualPlay();});
	
	function visualStop() {
		$("#control_stop").hide();
		$("#control_play").show();
		if(!auto) return false;
		clearInterval(timer);
		auto = false;
	}
	function visualPlay() {
		$("#control_play").hide();
		$("#control_stop").show();
		timer = setInterval(autoSlide, speed);
		auto = true;
	}



	/* Wheel Rotation  */
	var sms, tms, timer2, cms, val=0, angle=3700, time=3000;
	// animation frame
	window.requestAnimationFrame = (function() {
		return window.requestAnimationFrame || window.webkitRequestAnimationFrame || function(callback) { return setTimeout(callback, 16); };
	})();
	// cancel animation frame
	window.cancelRequestAnimationFrame = (function () {
		return window.cancelRequestAnimationFrame || window.webkitCancelRequestAnimationFrame || clearTimeout;
	})();
	// easing-easeInQuad
	function easeInQuad(t, b, c, d) {
		t /= d;
		return c*t*t + b;
	};
	// easing-easeInOutQuad
	function easeInOutQuad(t, b, c, d) {
		t /= d/2;
		if (t < 1) return c/2*t*t + b;
		t--;
		return -c/2 * (t*(t-2) - 1) + b;
	};
	// easing-easeInOutQuart
	function easeInOutQuart(t, b, c, d) {
		t /= d/2;
		if (t < 1) return c/2*t*t*t*t + b;
		t -= 2;
		return -c/2 * (t*t*t*t - 2) + b;
	};
	// rotate
	function rotateWheel(){
		sms = new Date*1
		timer2 = requestAnimationFrame( requestHandle );
	};
	function requestHandle(){
		tms = (new Date*1)-sms;
		val = easeInOutQuart( tms, 0, angle, time );
		if( val > angle ){
			val = angle;
		}
		//kcRotate( document.getElementById('wheel1'), val );
		//kcRotate( document.getElementById('wheel2'), val );
		//var tx = ($('#wheel1 img').data( 'left' ) + ( Math.round(val/-10)*69 )) % 2484;
		var tx = ($('#wheel1 img').data( 'left' ) + ( Math.round(val/-10)*57 )) % 1995;

		$('#wheel1 img').css( 'left', tx );
		$('#wheel2 img').css( 'left', tx );
		
		if( tms >= time ){
			$('#wheel1 img').data( 'left', tx );
			$('#wheel2 img').data( 'left', tx );
			cancelRequestAnimationFrame( timer2 );
		}else{
			timer2 = requestAnimationFrame( requestHandle );
		}
	};
	$(document).ready(function(){
		$('#wheel1 img').data( 'left', 0 );
		$('#wheel1 img').data( 'left', 0 );
	});