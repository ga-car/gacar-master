


// JavaScript Document

$(document).ready(function() {

    //Default Action
    $(".tab_cate .tab_content").hide(); //Hide all content
    $(".tab_cate ul.tabs li:first").addClass("act").show(); //Activate first tab
    $(".tab_cate .tab_content:first").show(); //Show first tab content
    
    //On Click Event
    $(".tab_cate ul.tabs li").click(function() {
        $(".tab_cate ul.tabs li").removeClass("act"); //Remove any "act" class
        $(this).addClass("act"); //Add "act" class to selected tab
        $(".tab_cate .tab_content").hide(); //Hide all tab content
        var activeTab = $(this).find("a").attr("href"); //Find the rel attribute value to identify the active tab + content
        $(activeTab).show(); //Fade in the active content
        return false;
    });

});               


$(document).ready(function() {
	var b_path_loc1 = $(".post2").text();
    var path_loc6 = $(".post1").text();
    
     // 쇼핑몰 탭부분     아이콘모양변경
    $(".postion > ul > li > a").each(function() {
		var b_postion_loc1 = $(this).text();
		
		if(b_postion_loc1 == b_path_loc1) {
			$(this).addClass('active');
			$(this).parent('li').addClass('active');
			
		}
	});

     // 커뮤니티  카테고리      아이콘모양변경
	$(".board_postion > ul > li > a").each(function() {
		var b_postion_loc2 = $(this).text();
		if(b_postion_loc2 == b_path_loc1) {
			$(this).addClass('active');
			$(this).parent('li').addClass('active');
			
		}
	});
    
	// 메인 카테고리  탭부분 회색부분
	$(".tabs > li > a").each(function() {
		var postion_loc4 = $(this).text();
		if(postion_loc4 == path_loc6) {
		$(".tab_cate ul.tabs li").removeClass("act");
		$(this).addClass('act');
		$(this).parent('li').addClass('act');
		$(".tab_cate .tab_content").hide(); //Hide all tab content
		$("#tab2").show();
		}
	});
	
	// 통합 카테고리 맨위 탭 tab2 활성화
	$(".tab_content > div > ul > a").each(function() {
	var postion_loc7 = $(this).text();
	if(postion_loc7 == path_loc6) {
	$(this).addClass('active');
	$(this).parent('ul').addClass('active');

	}
	}); 
    
});