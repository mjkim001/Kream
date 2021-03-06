<%@page import="kr.or.ddit.kream.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	MemberVO memberVo = (MemberVO)session.getAttribute("memberVo");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
div{
	display: block;
	box-sizing: border-box;
}
nav{
	border : 1px solid black;
	box-sizing: border-box;
	display: block;
}
a, a:hover{
	text-decoration: none;
	color: black;
}
.top_line a{

	font-size: 12px;
}
.container.my{
	margin: 0 auto;
	padding: 40px 40px 0px;
	max-width: 1280px;
}
.text-end li{
	float: left;
	list-style: none;
	margin-left: 20px;
}
.meun{
	list-style: none;
}
.left_meun{
	width: 180px;
	margin-left: 50px;
	float: left;
}
.mytitle{
	font-size: 24px;
}
.meun.title{
	font-size: 18px;
	padding-top: 30px;
}
.meun.item{
	font-size: 15px;
	padding-top: 12px;
}
.title{
	font-weight: 700;
}
img {
	width: 100px;
	height: 100px;
}
.member_thumb{
	position: relative;
    margin-right: 12px;
    width: 100px;
    height: 100px;
    border-radius: 100%;
}
</style>
</head>
<body style="padding-top: 50px;">
<div class="top_line fixed-top border-bottom text-end" style="height: 50px; display: flex; line-height: 50px; padding-right: 20px; background: white;">
	<ul class = "text-end" style="margin-left: auto;">
		<li><a class="top_line" href="#">????????????</a></li>
		<li><a class="top_line" href="#">???????????????</a></li>
<%
	if(memberVo == null){
%>
		<li id="login"><a href="<%= request.getContextPath() %>/member/loginForm.jsp">?????????</a></li>

		
<% }else{ %>
		<li id="logout"><a href="<%= request.getContextPath() %>/Logout.do">????????????</a></li>
<%
	}
%>
	</ul>
	
</div>


<div class="container my">
	<div class="left_meun">
	    <a class="mytitle" href="<%= request.getContextPath()%>/member/myPage.jsp">?????? ?????????</a>
	    <ul class="meun" style="padding-left: 0px;">	
			<li class="meun title">?????? ??????</li>
			
			<li class="meun item"><a href="/Kream/member/buying.jsp">?????? ??????</a></li>
			<li class="meun item"><a href="/Kream/member/selling.jsp">?????? ??????</a></li>
			<li class="meun item"><a href="/Kream/member/wish.jsp">?????? ??????</a></li>
			
			<li class="meun title">??? ??????</li>
			
			<li class="meun item"><a href="/Kream/member/profile.jsp">????????? ??????</a>   </li>
			<li class="meun item"><a href="/Kream/member/address.jsp">?????????</a>        </li>
			<li class="meun item"><a href="/Kream/member/payment.jsp">?????? ??????</a>     </li>
			<li class="meun item"><a href="/Kream/member/point.jsp">?????????</a>        </li> 	
	    </ul>
	</div>
	
	<div class="my-home-area" style="overflow: hidden;">
		<div class="my-home">
			<div style="border: 1px solid blue; padding: 23px 0 23px 23px;">
				<div class="member_membership" style="display: flex; ">
					<div class="member_detail" style="position: relative; display: flex;">
						<div class="member_thumb">
							<img alt="" src="../img/Adidas/Adidas Yeezy 500 Blush 2022.jpg">
						</div>
						<div class="member_info">
							<div class="info_detail">
								<strong>????????? ?????????</strong>
							</div>
						</div>
					</div>
					
					<div class="d-inline-flex " style="position: relative;  display: flex; margin-left: auto; margin-right:50px; align-items: center; text-align: center;" >
	 					<div class="p-2 ">
	 						<strong>?????? ??????</strong>
	 						<p>?????? ??????</p>
	 					</div>
	 					<div class="p-2 ">
	 						<strong>0P</strong>
	 						<p>?????????</p>
	 					
	 					</div>
					</div>
				</div>	
			</div>
			
			<div style="border: 1px solid blue; align-items: center;">
				<div class="buying-title" style="display: flex; margin-left: auto; margin-right:50px;">
					<h3>????????????</h3>
				</div>
				
				<div class="buying-content">
					<ul>
						<li>??????</li>
						<li>??????</li>
						<li>??????</li>
					
					</ul>
				</div>
			</div>
		</div>
	</div>
	
	
</div>

</body>
</html>