<%@page import="java.util.Map"%>
<%@page import="kr.or.ddit.kream.vo.MyBuyingListVO"%>
<%@page import="java.util.List"%>
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
<script src="<%=request.getContextPath()%>/js/kakao.js"></script>
<link rel = "stylesheet" href = "/Kream/css/pagetopline.css">
<link rel = "stylesheet" href = "/Kream/css/prodSearchModal.css">
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<script type="text/javascript">
	
$(function(){
	$('#search_modal').on('click', function(){
		$('#searchmodal').modal('show');
	})
	sort = $('#asc').attr('id');
	$('#asc').on('click',function(){
		$(this).toggle();
		$('#desc').toggle();
		sort = $('#desc').attr('id');
	});
	
	$('#desc').on('click',function(){
		$(this).toggle();
		$('#asc').toggle();
		sort = $('#asc').attr('id');
	});
	
// 	$(":hidden").each(function(){
// 		name = $(this).attr('id');
// 		alert(name);
// 	})
	
	$('#lately2').on('click',function(){
		var sysdate = new Date();
		document.getElementById('date1').value = sysdate.toISOString().substring(0, 10);
		var temp = sysdate;
		
		temp.setMonth(temp.getMonth()+2);
		
		document.getElementById('date2').value = temp.toISOString().substring(0, 10);
	})
	
	$('#lately4').on('click',function(){
		var sysdate = new Date();
		document.getElementById('date1').value = sysdate.toISOString().substring(0, 10);
		var temp = sysdate;
		
		temp.setMonth(temp.getMonth()+4);
		
		document.getElementById('date2').value = temp.toISOString().substring(0, 10);
	})
	
	$('#lately6').on('click',function(){
		var sysdate = new Date();
		document.getElementById('date1').value = sysdate.toISOString().substring(0, 10);
				
		var temp = sysdate;
		
		temp.setMonth(temp.getMonth()+6);
		
		document.getElementById('date2').value = temp.toISOString().substring(0, 10);
	})
	
	$('#search').on('click',function(){
		start = $('#date1').val();
		end = $('#date2').val();
		console.log(start);
		
		$.ajax({
			url : '<%= request.getContextPath() %>/buyingListSearch.do',
			type : 'post',
			data : {
				"start" : start,
				"end" : end,
				"sort" : sort
			},
			success : function(res){
				code="";
				$.each(res,function(i,v){
					code += '<div">                                      '
					code += '<div class="buying-detail" style="display: flex; border: 1px solid black;">'
					code += '	<div class="member_thumb">                                              '
					code += '		<img alt="" src="' + v.photo_path + '"> '
					code += '	</div>                                                                  '
					code += '	<div class="prod_size" style="margin: auto 0px;">                       '
					code += '		<strong>' + v.prod_name + '</strong>                                               '
					code += '		<p>' + v.size_name + '</p>                                                         '
					code += '	</div>                                                                  '
					code += '	<div class="bid_state" style="margin: auto 0px; margin-left: auto;">    '
					code += '		<strong>' + v.bid_state + '</strong>                                               '
					code += '	</div>                                                                  '
					code += '	<div class="bid_date" style="margin: auto 20px;">                       '
					code += '		<strong>                                                            '
					code += '		' + v.bid_date + '                                                                '
					code += '		</strong>                                                           '
					code += '	</div>					                                                '
					code += '</div>                                                                     '
				})
				$('#result').html(code);
			},
			error : function(xhr){
				alert("?????? " + xhr.status);
			},
			dataType : 'json'
		});
	});
});

</script>
<style>
div{
	display: block;
	box-sizing: border-box;
}
a, a:hover{
	text-decoration: none;
	color: black;
}
.container.my{
	margin: 0 auto;
	padding: 40px 40px 0px;
	max-width: 1280px;
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
}
.displyNone{
	display: none;
}


</style>
</head>
<body>
<div class="top_line fixed-top border-bottom text-end" id="topline1">
	<ul class = "text-end" style="margin-left: auto;">
		<li><a class="top_line" href="#">????????????</a></li>
		<li><a class="top_line" href="<%= request.getContextPath() %>/MyPage.do">???????????????</a></li>
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

<div class="top_line fixed-top border-bottom text-end" id="topline2">
    <a href = "/Kream/prodview/prodList.jsp">
   		<h3 style=" margin:0px 0px; align-content: center; font-style: oblique; font-weight: 900;">
   		SHOEKREAM
   		</h3>
   </a>
   <div class="gnb_area">
      <nav class="gnb">
         <ul class="gnb_list">
            <li class="gnb_item">
               <a  class="gnb_link" href="http://localhost/Kream/prodview/prodReviewPage.jsp">STYLE</a>
            </li>
            <li class="gnb_item" style="margin-left: 30px;">
               <a class="gnb_link" href="http://localhost/Kream/prodview/prodList.jsp">SHOP</a>
            </li>
            <li class="gnb_item search" style="margin-left: 30px;">
               <a href = "#" class="gnb_link" id = "search_modal">SEARCH</a>
            </li>
         </ul>
      </nav>
      <div></div>
   </div>
</div>


<div class="container my">
	<div class="left_meun">
	    <a class="mytitle" href="<%= request.getContextPath() %>/MyPage.do">?????? ?????????</a>
	    <ul class="meun" style="padding-left: 0px;">	
			<li class="meun title">?????? ??????</li>
			
			<li class="meun item"><a href="<%= request.getContextPath() %>/buyingList.do" style="color: black; font-weight: 700;">?????? ??????</a></li>
			<li class="meun item"><a href="<%= request.getContextPath() %>/member/my/shopinfo/selling.jsp">?????? ??????</a></li>
			<li class="meun item"><a href="<%= request.getContextPath() %>/member/my/shopinfo/wish.jsp">?????? ??????</a></li>
			
			<li class="meun title">??? ??????</li>
			
			<li class="meun item"><a href="/Kream/member/my/myinfo/profile.jsp">????????? ??????</a></li>
			<li class="meun item"><a href="/Kream/member/my/myinfo/payment.jsp">?????? ??????</a></li>
			<li class="meun item"><a href="/Kream/member/my/myinfo/point.jsp">?????????</a></li> 	
	    </ul>
	</div>
	
	<div class="my-home-area" style="overflow: hidden;">
		<div class="my-home">
			
			<div style="align-items: center; border-bottom : 3px solid; margin-bottom: 20px;">
				<div class="buying-title" style="display: flex; margin-left: auto; margin-right:50px;">
					<h3>????????????</h3>
				</div>
			</div>
			
			<button type="button" id="lately2">?????? 2??????</button>
			<button type="button" id="lately4">4??????</button>
			<button type="button" id="lately6">6??????</button>
			<input type="date" id="date1" name="date1">
			<span>~</span>
			<input type="date" id="date2" name="date2">
			<button type="button" id="search">??????</button>
			<i class='fas fa-sort-numeric-down' id="asc" style='font-size:24px;'></i>
			<i class='fas fa-sort-numeric-up' id="desc" style='font-size:24px; display: none;'></i>
			
			<div id="result">
			</div>
		</div>	
	</div>
</div>

<div class = "modal" id = "searchmodal" >
	<div class="modal-dialog">
    	<div class="modal-content search_modal_content">
      
	        <!-- Modal Header -->
	        <div class="modal-header">
	          <h4 class="modal-title">?????? ??????</h4>
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
        
        	<!-- Modal body -->
        	<div class="modal-body">
        		<div class = "modal_select_area_search" showlayer = "true">
        			<input type = "text" id = "search_prod" name = "search_prod">
        			<input type = "button" id = "search_btn" name = "search_btn" value = "??????">
        		</div>
        		<div id = "prod_search_list">
        		</div>
        	</div>
        	        <!-- Modal footer -->
	        <div class="modal-footer">
	          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
	        </div>
		</div>
	</div>
</div>
</body>
</html>