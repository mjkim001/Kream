<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="<%=request.getContextPath()%>/js/kakao.js"></script>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel = "stylesheet" href = "/Kream/css/pagetopline.css">
<link rel = "stylesheet" href = "/Kream/css/prodSearchModal.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
html{
	height: 100%;
}
.content{
	margin: 0 auto;
	padding: 0 40px;
	max-width: 1280px;
}
.login_area{
	margin: 0 auto;
    padding: 60px 0 160px;
    width: 400px;
}
.login_title{
	padding-bottom: 50px;
    text-align: center;
    font-size: 0;
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
$(function() {
	$('#search_modal').on('click', function(){
		$('#searchmodal').modal('show');
	})
	
	$('#find_name_btn').on('click',function(){
		mem_name = $('#find_name').val();
		
		$.ajax({
			url : '<%= request.getContextPath() %>/findEmail.do',
			data : {"mem_name" : mem_name},
			type : 'post',
			success : function(res){
				alert(res);
			},
			error : function(xhr){
				alert("?????? " + xhr.status);
			},
			dataType : 'json'
		});
	})
	
	$('#find_pass_btn').on('click',function(){
		mem_name = $('#find_pass_name').val();
		mem_email = $('#find_pass_email').val();
		
		$.ajax({
			url : '<%= request.getContextPath() %>/findPass.do',
			data : {"mem_name" : mem_name, "mem_email" : mem_email},
			type : 'post',
			success : function(res){
				alert(res);
			},
			error : function(xhr){
				alert("?????? " + xhr.status);
			},
			dataType : 'json'
		});
	})
	
	
})


Kakao.init('ba2c3583e3af2fefe8d5556275e63e32');
console.log(Kakao.isInitialized()); // ????????? ????????????

login = "";
function loginWithKakao() {
    Kakao.Auth.login({
        success: function (authObj) {
            console.log(authObj); // access?????? ???
            Kakao.Auth.setAccessToken(authObj.access_token); // access????????? ??????

            getInfo();
        },
        fail: function (err) {
            console.log(err);
        }
    });
}

// 4. ????????? ????????? ????????????, ?????? ????????? ??????????????? ????????? ????????? ?????????.
function getInfo() {
    Kakao.API.request({
        url: '/v2/user/me',
        success: function (res) {
            console.log(res);
            // ?????????, ??????, ?????????, ??????????????????
            var email = res.kakao_account.email;
            var gender = res.kakao_account.gender;
            var nickname = res.kakao_account.profile.nickname;
            var profile_image = res.kakao_account.profile.thumbnail_image_url;
            var birthday = res.kakao_account.birthday;
            var age_range = res.kakao_account.age_range;

            console.log(email, gender, nickname, profile_image, birthday, age_range);
            //location.href = "http://localhost/Kream/member/joinMain.jsp?email=" + email;
            
            
            //window.open("http://localhost/Kream/member/joinMain.jsp");
        	$.ajax({
        		url : '<%= request.getContextPath() %>/KakaoCheck.do',
        		data : {
        			"email" : email,
        			"nickname" : nickname
        		},
        		type : 'post',
        		success : function(result){
        			alert(result)
        			if(result == "0"){
        				location.href = "http://localhost/Kream/member/joinSns.jsp?email=" + email + "&nickname=" + nickname;
        			}else{
        				alert("?????????");
        				$.ajax({
        					url : '<%= request.getContextPath() %>/KakaoLogin.do',
        					data : {"sns" : email},
        					type : 'get',
        					success : function(res){
        						
        						location.href = "http://localhost/Kream/Login.do?mem_email=" + res.mem_email + "&mem_pass=" + res.mem_pass;
        					},
        					error : function(xhr){
        						alert("?????? " + xhr.status)
        					},
        					dataType : 'json'
        				});
        			}
        		},
        		error : function(xhr){
        			alert("?????? " + xhr.status)
        		},
        		dataType : 'json'
        	});
		    //location.href = "http://localhost/Kream/member/joinMain.jsp";
        	
        },
        fail: function (error) {
            alert('????????? ???????????? ??????????????????. ??????????????? ???????????????.' + JSON.stringify(error));
        }
    });
}

// 5. ???????????? ?????? - ????????? ????????? ???????????? ????????? ????????? ??????, ????????? ????????????????????? ??????????????? ?????? ??????.
function kakaoLogout() {
    if (!Kakao.Auth.getAccessToken()) {
        alert('Not logged in.');
        return;
    }
    Kakao.Auth.logout(function() {
        alert('logout ok\naccess token -> ' + Kakao.Auth.getAccessToken());
    });
};

// 6. ?????? ?????? ??????
function secession() {
	Kakao.API.request({
    	url: '/v1/user/unlink',
    	success: function(response) {
    		console.log(response);
    		//callback(); //????????????(??????)????????? ???????????? ????????? ??????
    		//window.location.href='/'
    	},
    	fail: function(error) {
    		console.log('?????? ?????????')
    		console.log(error);
    	},
	});
}; 
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
   </div>
</div>
<!-- ???????????? ????????? -->

<div class="content md">
	<div class="login_area">
		<form action="<%= request.getContextPath() %>/Login.do" method="post" class="was-validated">
			<h2 class="login_title">????????? ?????????</h2>
			<div class="input_box mb-4">
				<h3 class="input_title">????????? ??????</h3>
				<div class="input_item">
					<input type="text" class="form-control w-100" id="email" placeholder="???)shou123@ddit.or.kr" name="mem_email" required>
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
			
			<button type="submit" class="btn btn-outline-secondary w-100">?????????</button>
			<div class="d-flex mb-3">
			    <div class="p-2 flex-fill" style="text-align: center;">
			    <a href="<%= request.getContextPath() %>/member/joinMain.jsp" class="info">????????? ??????</a>
			    </div>
			    
			    <div class="p-2 flex-fill" style="text-align: center;">
			    <a data-toggle="modal" data-target="#findEmail" class="info">????????? ??????</a>
			    </div>
			    
			    <div class="p-2 flex-fill" style="text-align: center;">
			    <a data-toggle="modal" data-target="#findPass" class="info">???????????? ??????</a>
			    </div>
  			</div>
		</form>
		<div style="text-align: center;">
			<a id="custom-login-btn" href="javascript:loginWithKakao()">
				<img alt="" src="/Kream/img/icon/kakao_login_medium_wide.png">
	        
	    	</a>
		</div>
<!--     	<button class="api-btn" onclick="secession()">?????? ??????</button> -->
		
	</div>
</div>

<!-- ????????? ?????? -->
<div class = "modal" id = "findEmail" style="display: none;">
	<div class="modal-dialog">
    	<div class="modal-content">
      
	        <!-- Modal Header -->
	        <div class="modal-header">
	          <h4 class="modal-title">????????? ??????</h4>
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
        
        	<!-- Modal body -->
        	<div class="modal-body">
        		<div class = "modal_select_area" showlayer = "true">
        			<div class="modify name">
						<h5 class="title2" style="padding: 0; margin: 0; font-size: 15px; color: black;">?????? ??? ????????? ????????? ????????????</h5>
						<h5 class="title2" style="padding: 0; margin: 0; font-size: 15px; padding-bottom: 22px; color: black;">????????? ????????? ????????? ??????????????????.</h5>
						<div class="input_box">
							<input type="text" autocomplete="off" id="find_name" placeholder="?????? ??????" class="input_txt name">
							<button id="find_name_btn">????????? ??????</button>
						</div>
					</div>

					<div id="findEmailResult">
					
					</div>
				</div>
        	</div>
        	        <!-- Modal footer -->
	        <div class="modal-footer">
	        	
	        </div>
		</div>
	</div>
</div>

<!-- ?????? ?????? ?????? -->
<div class = "modal" id = "findPass" style="display: none;">
	<div class="modal-dialog">
    	<div class="modal-content">
      
	        <!-- Modal Header -->
	        <div class="modal-header">
	          <h4 class="modal-title">???????????? ??????</h4>
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
        
        	<!-- Modal body -->
        	<div class="modal-body">
        		<div class = "modal_select_area" showlayer = "true">
        			<div class="modify name">
						<h5 class="title2" style="padding: 0; margin: 0; font-size: 15px; color: black;">?????? ??? ????????? ????????? ???????????? ????????????</h5>
						<h5 class="title2" style="padding: 0; margin: 0; font-size: 15px; padding-bottom: 22px; color: black;">???????????? ????????? ??????????????????.</h5>
						<div class="input_box">
							
								<input type="text" autocomplete="off" id="find_pass_name" placeholder="?????? ??????" class="input_txt name">
								<input type="email" autocomplete="off" id="find_pass_email" placeholder="?????? ?????????" class="input_txt name">
							</div>
					</div>
						
					<div class="modify_btn_box" style="margin-top: 10px; margin-left: 0px;">
						<button id="find_pass_btn">???????????? ??????</button>
					</div>
					
					<div id="findPassResult">
					
					</div>
        		</div>
        	</div>
        	        <!-- Modal footer -->
	        <div class="modal-footer">
	          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
	        </div>
		</div>
	</div>
</div>

<div class="jumbotron jumbotron-fluid text-center" id="footerbody">
	
	<div class="info_list">
		<p>????????? : SHOEKREAM</p>
		<p>??????????????????: ??????????????? ?????? ????????? 846 3??? 304???</p>
		<p>????????? ????????? : ?????????????????????</p>
	
		
		
		<table>
			<tr>
				<td>PL</td>
				<td>:?????????&nbsp;</td>
				<td></td>
				<td></td>
			</tr>
			
			<tr>
				<td>TA</td>
				<td class="td_last">:?????????&nbsp;</td>
				<td>AA</td>
				<td>:?????????</td>
			</tr>
			
			<tr>
				<td>UA</td>
				<td class="td_last">:?????????&nbsp;</td>
				<td>DA</td>
				<td>:?????????</td>
			</tr>
		</table>
	</div>
	
	
	
	<div class="customer_service">
		<strong>
			????????????
			<a href="tel:042-939-5559">042-939-5559</a>
		</strong>
		<p>???????????? ?????? 09:00 - 17:30</p>
		<p>???????????? ?????? 12:50 - 13:40</p>
		<p>???????????? ?????? ?????? 5:30 - 22:00</p>
		<p>???????????? ?????? ?????? 9:00 - 18:00</p>
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

















