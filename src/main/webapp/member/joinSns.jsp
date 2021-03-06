<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	String email = request.getParameter("email");
	String nickname = request.getParameter("nickname");
%>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel = "stylesheet" href = "/Kream/css/pagetopline.css">
<link rel = "stylesheet" href = "/Kream/css/prodSearchModal.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="../js/jquery.serializejson.min.js"></script>

<style>
.content{
	margin: 0 auto;
	padding: 0 40px;
	max-width: 1280px;
}
.login_area{
	margin: 0 auto;
    padding: 118px 0 160px;
    width: 400px;
}
.login_title{
	padding-bottom: 50px;
    text-align: center;
    font-size: 32px;
}
.intput_box{
	position: relative;
    padding: 10px 0 14px;
}
.input_title{
	font-size: 13px;
    letter-spacing: -.07px;
    line-height: 18px;
}
.input_item{
	position: relative;
}
.intput_txt{
	padding-right: 30px;
    height: 38px;
}
a, a:hover{
	text-decoration: none;
	color: black;
	font-size: 12px;
}
li{
	float: left;
	list-style: none;
	margin-left: 20px;
}
</style>
<script type="text/javascript">
$(function(){
	$('#search_modal').on('click', function(){
		$('#searchmodal').modal('show');
	})
	
	$('form').on('submit',function(){
		
		event.preventDefault();
		fdata3 = $('form').serializeJSON();
		
		console.log(fdata3);
		
		$.ajax({
			url : '<%= request.getContextPath() %>/insertSnsMember.do?email=<%= email %>',
			data : fdata3,
			type : 'get',
			success : function(res){
				if(res == 1){
					alert("????????????");
				}else{
					alert("?????? ????????? ????????? ?????????. ?????? ???????????? ????????? ?????????.");
				}
				location.href = "http://localhost/Kream/member/loginForm.jsp";
			},
			error : function(xhr){
				alert("?????? " + xhr.status);
			},
			dataType : 'json'
		});
	});
})

</script>
</head>
<body>
<div class="top_line fixed-top border-bottom text-end" style="height: 50px; display: flex; line-height: 50px; padding-right: 20px; background: white;">
<ul class = "text-end" style="margin-left: auto;">
	<li><a href="#">????????????</a></li>
	<li><a href="<%= request.getContextPath() %>/MyPage.do">???????????????</a></li>
	<li><a href="<%= request.getContextPath() %>/member/loginForm.jsp">?????????</a></li>
</ul>
</div>

<div class="top_line fixed-top border-bottom text-end" style="height: 68px; align-items: center; display: flex; padding:0px 40px; background: white; margin-top: 50px;">
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


<div class="content md">
	<div class="login_area">
		<form class="was-validated">
			<h2 class="login_title">?????? ?????? ??????</h2>
			<div class="input_box mb-4">
				<h3 class="input_title">????????? ??????</h3>
				<div class="input_item input-group">
					<input type="email" value="<%= email %>" class="form-control" id="email" placeholder="???)shou123@ddit.or.kr" name="mem_email" required>
					<div class="valid-feedback"></div>
					<div class="invalid-feedback">????????? ????????? ????????? ????????? ?????????</div>
				</div>
			</div>
			
			<div class="input_box mb-4">
				<h3 class="input_title">????????????</h3>
				<div class="input_item">
					<input type="password" class="form-control w-100" id="pass" placeholder="Enter passward" autocomplete="off" name="mem_pass" required
					pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$">
					<div class="valid-feedback"></div>
					<div class="invalid-feedback">??????, ??????, ??????????????? ???????????? ??????????????????. (8??? ??????)</div>
				</div>
			</div>
			
			<div class="input_box mb-4">
				<h3 class="input_title">??????</h3>
				<div class="input_item">
					<input type="text" value="<%= nickname %>" class="form-control w-100" id="name" placeholder="?????????" name="mem_name" required
					pattern="^[???-???]{2,4}$">
					<div class="valid-feedback"></div>
					<div class="invalid-feedback">????????? ????????? ????????? ?????????</div>
				</div>
			</div>
			<button type="submit" id="join" class="btn btn-outline-secondary w-100">?????? ??????</button>
			
		</form>
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