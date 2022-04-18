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
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript">
currentPage = 1;
admin={};
$(function() {
	typevalue = "";
	wordvalue = "";
	
	noticeList();
}
</script>
<style type="text/css">
#btns{
	margin-left: 700px;
}
</style>
</head>
<body>
<h3>공지사항</h3><hr>
<nav class="navbar navbar-expand-sm  navbar-info">
	  
	  <form id="btns">
	  	<button id="insert" name="insert" type="button" data-toggle="modal" data-target="#insertModal" class="action btn btn-outline-dark">등록</button>
	  	<button id="update" name="update" type="button" data-toggle="modal" data-target="#updateModal" class="action btn btn-outline-dark">수정</button>
	  	<button id="delete" name="delete" type="button" class="btn btn-outline-dark">삭제</button>
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
</body>
</html>