/**
 * 
 */
 
 var memberList = function(){
	$.ajax({
		url : '/Kream/AdminBoard.do',
	    type : 'post',
	    data :{
			'page'  :  currentPage,
			'stype' : typevalue, //관리자, 일반사용자
			'sword' : wordvalue
	    },
	    success : function(res){
			code = "<table class='table table-hover'>";
			code += "<tr><th>회원아이디</th>";
			code += "<th>비밀번호</th>";
			code += "<th>회원이름</th>";
			code += "<th>생년월일</th>";
			code += "<th>등급</th>";
			code += "<th>계좌번호</th>";
			code += "<th>은행명</th>";
			code += "<th>프로필명</th>";
			code += "<th>권한</th></tr>";
				
			$.each(res.datas,function(i,v){
				if(typeof v.mem_name =="undefined")
					v.mem_name = "";
				if(typeof v.mem_bir =="undefined")
					v.mem_bir = "";
				if(typeof v.mem_grade =="undefined")
					v.mem_grade = "";
				if(typeof v.mem_acc =="undefined")
					v.mem_acc = "";
				if(typeof v.mem_bank =="undefined")
					v.mem_bank = "";
				if(typeof v.mem_alias =="undefined")
					v.mem_alias = "";
				if(typeof v.authority =="undefined"){
					v.authority = "일반사용자";
				}else if(v.authority =="admin"){
					v.authority = "관리자";
				}
				
				code += "<tr><td>"+v.mem_email+"</td>";
				code += "<td>"+v.mem_pass+"</td>";
				code += "<td>"+v.mem_name+"</td>";
				code += "<td>"+v.mem_bir+"</td>";
				code += "<td>"+v.mem_grade+"</td>";
				code += "<td>"+v.mem_acc+"</td>";
				code += "<td>"+v.mem_bank+"</td>";
				code += "<td>"+v.mem_alias+"</td>";
				code += "<td>"+v.authority+"</td></tr>";
				
			})
			code+="</table>";
			
			$('.container').html(code);
			
			pcode = "";
		   
		   //이전버튼 출력
		   if(res.startp > 1) {
			pcode = '<ul class="pagination">';
			pcode +='<li class="page-item">';
			pcode +='<a class="page-link prev" href="#">Previous</a>';
			pcode += '</li>';
			pcode += '</ul>';
		  }
		   
		   
		   pcode += '<ul  class="pagination pager">'
		   //페이지 목록 출력 
		   for(i= res.startp ; i<= res.endp; i++){
			  if(currentPage == i){
				pcode +='<li class="page-item active">';
		     	pcode +='<a class="page-link pnum" href="#">' + i + '</a>'
		     	pcode += '</li>';
			  }else{
				pcode +='<li class="page-item">';
		     	pcode +='<a class="page-link pnum" href="#">' + i + '</a>'
		     	pcode += '</li>';
			  }
		   }
		   pcode += '</ul>'
		   
		   
		   //다음 버튼 출력 
		   if(res.endp < res.totalp){
			pcode += '<ul class="pagination">';
			pcode +='<li class="page-item">';
			pcode +='<a class="page-link next" href="#">Next</a>';
			pcode += '</li>';
			pcode += '</ul>';
		   }
		   
		   $('#pagelist').html(pcode);
		},
		error : function(xhr){
		   alert("상태 : " + xhr.status);
	    },
	    dataType : 'json'
	})
}