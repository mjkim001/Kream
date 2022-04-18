<%@page import="java.util.Map"%>
<%@page import="kr.or.ddit.kream.vo.MyBuyingListVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.kream.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	MemberVO memberVo = (MemberVO)session.getAttribute("memberVo");

	Map<String, Integer> countMap = (Map<String, Integer>)request.getAttribute("countMap");
	
	
	
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script>


</script>




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
.meun.item a{

	color: rgba(34,34,34,0.5);
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
p{
	margin-bottom: 0px;
}
.buying-content li{
	float: left;
	list-style: none;
	margin-left: 20px;

</style>
</head>
<body style="padding-top: 50px;">
<div class="top_line fixed-top border-bottom text-end" style="height: 50px; display: flex; line-height: 50px; padding-right: 20px; background: white;">
	<ul class = "text-end" style="margin-left: auto;">
		<li><a class="top_line" href="#">고객센터</a></li>
		<li><a class="top_line" href="<%= request.getContextPath() %>/MyPage.do">마이페이지</a></li>
<%
	if(memberVo == null){
%>
		<li id="login"><a href="<%= request.getContextPath() %>/member/loginForm.jsp">로그인</a></li>

		
<% }else{ %>
		<li id="logout"><a href="<%= request.getContextPath() %>/Logout.do">로그아웃</a></li>
<%
	}
%>
	</ul>
	
</div>


<div class="container my">
	<div class="left_meun">
	    <a class="mytitle" href="<%= request.getContextPath()%>/member/myPage.jsp">마이 페이지</a>
	    <ul class="meun" style="padding-left: 0px;">	
			<li class="meun title">쇼핑 정보</li>
			
			<li class="meun item"><a href="/Kream/member/my/shopinfo/buying.jsp">구매 내역</a></li>
			<li class="meun item"><a href="/Kream/member/my/shopinfo/selling.jsp">판매 내역</a></li>
			<li class="meun item"><a href="/Kream/member/my/shopinfo/wish.jsp">관심 상품</a></li>
			
			<li class="meun title">내 정보</li>
			
			<li class="meun item"><a href="/Kream/member/profile.jsp">프로필 정보</a></li>
			<li class="meun item"><a href="/Kream/member/address.jsp">주소록</a></li>
			<li class="meun item"><a href="/Kream/member/payment.jsp">결제 정보</a></li>
			<li class="meun item"><a href="/Kream/member/point.jsp">포인트</a></li> 	
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
								<strong><%= memberVo.getMem_email() %></strong>
							</div>
						</div>
					</div>
					
					<div class="d-inline-flex " style="position: relative;  display: flex; margin-left: auto; margin-right:50px; align-items: center; text-align: center;" >
	 					<div class="p-2 ">
	 						<strong><%= memberVo.getMem_grade() %></strong>
	 						<p>회원 등급</p>
	 					</div>
	 					<div class="p-2 ">
	 						<strong><%= memberVo.getMem_point() %></strong>
	 						<p>포인트</p>	 					
	 					</div>
					</div>
				</div>	
			</div>
			
			<div style="border: 1px solid blue; align-items: center;">
				<div class="buying-title" style="display: flex; margin-left: auto; margin-right:50px;">
					<h3>구매내역</h3>
				</div>
			</div>
			
			<div class="d-flex" style="text-align: center;">
				<div class="p-2 flex-fill border-end">
					<strong>전체</strong>
	 				<p><%= countMap.get("BUYERALL") %></p>	
				</div>
				
				<div class="p-2 flex-fill border-end">
					<strong>입찰중</strong>
	 				<p><%= countMap.get("BUYER0") %></p>
				</div>
				
				<div class="p-2 flex-fill">
					<strong>낙찰완료</strong>
	 				<p><%= countMap.get("BUYER1") %></p>
				</div>
			</div>
<%

	if((String)request.getAttribute("noList1") != null){
		
	}else {
		List<MyBuyingListVO> list = (List<MyBuyingListVO>)request.getAttribute("BuyingList");
		for(MyBuyingListVO vo : list){
%>			

			<div style="border: 1px solid blue;">
				<div class="buying-detail" style="display: flex; border: 1px solid black;">
					<div class="member_thumb">
						<img alt="" src="<%= vo.getPhoto_path() %>">
					</div>
					
					<div class="prod_size" style="margin: auto 0px;">
						<strong><%= memberVo.getMem_email() %></strong>
						<p><%= vo.getSize_name() %></p>
					</div>
					
					<div class="bid_state" style="margin: auto 0px; margin-left: auto;">
						<strong><%= vo.getBid_state() %></strong>
					</div>
					
					<div class="bid_date" style="margin: auto 20px;">
						<strong><%= vo.getBid_date() %>
						
						</strong>
					</div>					
				</div>				
			</div>	
			
<%			
		}
	}
%>
			
			<div style="border: 1px solid blue; align-items: center;">
				<div class="buying-title" style="display: flex; margin-left: auto; margin-right:50px;">
					<h3>판매 내역</h3>
				</div>
			</div>
			
			<div class="d-flex" style="text-align: center;">
				<div class="p-2 flex-fill border-end">
					<strong>전체</strong>
	 				<p><%= countMap.get("SELLERALL") %></p>	
				</div>
				
				<div class="p-2 flex-fill border-end">
					<strong>입찰중</strong>
	 				<p><%= countMap.get("SELLER0") %></p>
				</div>
				
				<div class="p-2 flex-fill">
					<strong>낙찰완료</strong>
	 				<p><%= countMap.get("SELLER1") %></p>
				</div>
			</div>
<%

	if((String)request.getAttribute("noList2") != null){
		
	}else {
		List<MyBuyingListVO> list = (List<MyBuyingListVO>)request.getAttribute("SellingList");
		for(MyBuyingListVO vo : list){
%>			

			<div style="border: 1px solid blue;">
				<div class="buying-detail" style="display: flex; border: 1px solid black;">
					<div class="member_thumb">
						<img alt="" src="<%= vo.getPhoto_path() %>">
					</div>
					
					<div class="prod_size" style="margin: auto 0px;">
						<strong><%= memberVo.getMem_email() %></strong>
						<p><%= vo.getSize_name() %></p>
					</div>
					
					<div class="bid_state" style="margin: auto 0px; margin-left: auto;">
						<strong><%= vo.getBid_state() %></strong>
					</div>
					
					<div class="bid_date" style="margin: auto 20px;">
						<strong><%= vo.getBid_date() %>
						
						</strong>
					</div>					
				</div>				
			</div>	
			
<%			
		}
	}
%>			
			
			
					
		</div>
	</div>	
</div>

</body>
</html>