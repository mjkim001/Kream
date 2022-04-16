<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <script src="../js/adminBoard.js"></script>
<script type="text/javascript">
currentPage = 1;
$(function() {
	typevalue = "";
	wordvalue = "";
	
	memberList();
	
	//search검색  이벤트
	$('#search').on('click', function(){ //search 버튼을 눌렀을때
		typevalue= $('#stype option:selected').val().trim(); //체크한 옵션 가져오기
		wordvalue =$('#sword').val().trim();
		
		currentPage = 1;
		memberList();
	})
	
	//page번호 클릭하는 이벤트
	$('#pagelist').on('click','.pnum',  function(){
		//alert( $(this).text());
		
		currentPage = $(this).text();
		memberList();
	})
	
	//이전버튼 클릭하는 이벤트
	$('#pagelist').on('click', '.prev', function(){
		currentPage = 
			parseInt($('.pager a').first().text()) - 1;
		
		listServer();
	})
	//다음버튼 클릭하는 이벤트
	$('#pagelist').on('click', '.next', function(){
		currentPage =
			parseInt( $('.pager a').last().text()) + 1;
		
		listServer();
	})
	
	$('.container').on('click', '.action', function(){
		actionName =  $(this).attr('name');
		actionIdx  = $(this).attr('idx');
		
		if(actionName == "modify"){
			alert(actionIdx + "번 글을 수정합니다");
			
			//수정 창을 띄위기 - 수정할 (원래) 내용들을 출력
			bcard = $(this).parents('.card');
			subject = bcard.find('a').text();
			writer = bcard.find('.bwr').text();
			mail = bcard.find('.bma').text();
			cont = bcard.find('.p3').html();
			
			
			cont = cont.replace(/<br>/g, "\n");
			$('#modiModal #writer').val(writer);
			$('#modiModal #subject').val(subject);
			$('#modiModal #mail').val(mail);
			$('#modiModal #content').val(cont);
			$('#modiModal #num').val(actionIdx);
			
			$('#modiModal #add').prop('disabled', true)
			
		}
		
		
		
		
	}
	
})
</script>
<style type="text/css">
#head{
	border: 1px solid;
}
div{
	margin: 0px;
	display: inline-block;
}
/*검색창 (search, optionList)*/
.navbar{
	float: left;
	width: 100%;
}
#sword{
	width: 400px;
}
.form-inline{
	margin-left:5px;
}

#stype{
	width: 150px;
}
/* 관리자 계정 추가, 수정, 삭제*/
#btns{
	margin-left:210px;
	float: right;
	display: inline-block;
}
/*table ui*/
.container{
	width:100%;
	height:555px;
	margin: 0px;
	padding: 0px;
}
table{
	width: 100%;
	margin-left: 10px;
	margin-right: 5px;
}

/* page 리스트*/
#pagelist{
	margin-left:500px;
}

/*moadal*/
#modiModal{
	padding-left: 450px;
}
#lsize{
	/*글씨 맞춤 style*/
}

</style>
</head>
<body>
<h3>회원관리</h3><hr id="head">
  <nav class="navbar navbar-expand-sm  navbar-info">
  
	 <select class="form-control" id="stype">
	   <option value="">전체</option>
	   <option value="user">일반사용자</option>
	   <option value="admin">관리자</option>
	 </select>
	 
	  <form class="form-inline" >
	     <input id="sword" class="form-control mr-sm-2" type="text" placeholder="Search">
	     <button id="search" class="btn btn-primary" type="button">Search</button>
	  </form>
	  
	  <form id="btns">
	  	<button id="add" type="button" data-toggle="modal" data-target="#modiModal" class="btn btn-outline-light text-dark">계정추가</button>
	  	<button id="modify" type="button" data-toggle="modal" data-target="#modiModal" class="btn btn-outline-light text-dark">계정수정</button>
	  	<button id="delete" type="button" data-toggle="modal" data-target="#modiModal" class="btn btn-outline-light text-dark">계정삭제</button>
	  </form>
  </nav>
  <br><br>
  <!--list출력   -->
 <div class="container">
 
 </div>
 
 <br><br>
 <!--page출력   -->
 <div id="pagelist">
 
 </div>
 
 
 <!-- The Modal -->
<div class="modal" id="modiModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">관리자 계정 추가</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <form id="modiForm">
        <!-- vo와 name이 동일해야한다. -->
        	<label class="lsize">아이디</label>
        	<input type="text" id="mem_mail" name="mem_mail"><br>
        	
        	<label class="lsize">비밀번호</label>
        	<input type="text" id="mem_pass" name="mem_pass"><br>
        	
        	<label class="lsize">이름</label>
        	<input type="text" id="mem_name" name="mem_name"><br>
        	
        	<input type="button"  id="modisend"value="전송"> <!-- class="action" name="modisend" idx="" -->
        </form>
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