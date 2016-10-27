<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<style type="text/css">
 .orderInfo{
	margin: 10px 0 0;
    padding: 90px 0;
    border: 1px solid #f0f0f0;
    background: #f6f6f6;
    color: #202020; 	
 }
 .orderInfo .complete{
 	width: 443px;
    height: 151px;
    margin: 0 auto;
    padding: 30px 0 0 74px;

 }
 .orderInfo img{
 float:left;
 margin-right: 21px;
 }
 .orderInfo p{
	    line-height: normal;
    font-weight: bold;
    font-size: 30px;
    color: #464c4e;
    height: 70px;
 }
 .orderInfo li{
 	margin: 5px 0 0;
 	    margin-top: 32px;
    text-align: center;	
 }
</style>

<div class="basket_list" style="margin-top:35px;margin-bottom:35px;">
	<div class="basket_main">
		<div class="orderInfo">
	        <div class="complete">
	        <img src="http://img.echosting.cafe24.com/design/skin/default/order/ico_complete.gif">
	        
	        <p>${member.name}고객님의<br/>가입이 완료 되었습니다.</p>
			<ul>
				<li class="number">
				<span>로그인 후 이용해 주세요</span>
				</li>
				
			</ul>
			</div>
	    </div>
	    
	    <div style="margin-top:15px; text-align:center;">
			<span class="btn btnC_04 btnP_04"><a href="/pet/main.dog"><input type="button" value="메인화면으로"></a></span>
			
		</div>
	</div>
</div>