/**
 * 
 */
 
 var noticeList=function(){
	$.ajax({
		url : '/Kream/AdminNotice.do',
	    type : 'post',
	    data :{
			'page'  :  currentPage,
			'stype' : typevalue, //관리자, 일반사용자
			'sword' : wordvalue
	    },
	    success : function(res){
//			NOTICE 글번호
//			MEM_EMAIL 작성자아이디
//			NOTICE_TITLE 글 제목
//			NOTICE_CONTENT 글 내용
//			NOTICE_DATE 작성일
//			NOTICE_CAT 공지사항 카테고리
			
			code = "<table class='table table-hover'>";
			code += "<tr><th>번호</th>";
			code += "<th>작성자</th>";
			code += "<th>제목</th>";
			code += "<th>작성일</th>";
			code += "<th>카테고리</th></tr>";
			
			$.each(res.datas,function(i,v){
				NOTICE
				MEM_EMAIL
				NOTICE_TITLE
				NOTICE_CONTENT
				NOTICE_DATE
				NOTICE_CAT
			})
			
		},
		error : function(xhr){
		   alert("상태 : " + xhr.status);
	    },
	    dataType : 'json'
	})
}