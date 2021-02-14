<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta name="description" content="Fashi Template">
    <meta name="keywords" content="Fashi, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>회원탈퇴</title>
    
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
    
     <!-- DataTables -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css" />
     <!-- Css Styles -->
     <!-- Header Section Begin -->
      <jsp:include page="${request.contextPath}/NewHeader_CSS"></jsp:include>
     <!-- Header End -->
    
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/bootstrap.min.css" type="text/css"> 
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/YS_css/newstyle.css" type="text/css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/themify-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/slicknav.min.css" type="text/css">    
  
    <!-- Bootstrap cdn 설정  for 페이징  -->   
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">   
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">   
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">   
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>   
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>   

<style>

	#noticetext {
		resize: none;
		margin: auto 0;
		width: 800px;
		heigh: 500px;
	}
	
	.notice {
		border: 1px solid gray;
		width: 820px;
		heigh: 400px;
		margin-left: 370px;
	}
	
	#delcontent1 {
		padding-top: 40px;
	}
	
	#delcontent2 {
		padding-bottom: 20px;
	}
	
	#deltitle {
		margin: 200px 0 0 370px;
		display: flex;
		justify-content: row;
	}
	
	.deltitle1 {
		margin-top: 42px;
		margin-left: 10px;
	}
	
	.agree_check {
		/* align: center; */
		padding-left: 300px;
		margin-bottom: 10px;
	}
	
	.button_area {
		padding: 20px 0 0 680px;
		display: flex;
		justify-content: row;
	}
	
	.pass {
		width: 200px;
		height: 35px;
	}
	
	.pwchktitle{
	    margin-top: 20px;
	    margin-left: 663px;
	}
	
	.pwchk {
		margin-left: 661px;
		margin-top: 10px;
		display: flex;
		justify-content: row;
	}
	
	.pwbox {
		margin-right: 10px;
	}
	
	.btn.btn-block.bg-gradient-secondary {
	    display: block;
	    width: 60px;
	    color: #fff;
	    background-color: #dc3545;
	    border-color: #dc3545;
	    box-shadow: none;
	    display: block; 
	    font-family: 'Noto Sans KR', sans-serif;
}
	.btn.btn-block.bg-gradient-danger {
		color: #fff;
	    background-color: #6c757d;
	    border-color: #6c757d;
	    box-shadow: none;
	    font-family: 'Noto Sans KR', sans-serif;
	    width: 60px;
	    
	}
	.con{
		position : relative;
     	top: -114px;
	}
	
	
</style>
	
</head>
<body>
	<script type="text/javascript">
		var user = '${loginUser}';
	</script>
	
 	 <jsp:include page="${request.contextPath}/el/afterLoginHeader"></jsp:include> 
 	 <div class="con">
	 	 <div id="deltitle"> 
	 	 	<div class="deltitle1">
	 	 		<h1>회원탈퇴</h1>
	 	 	</div>
	 	 	<div class="deltitle1">
	 	 		<h5 style="margin-top: 41px;">회원탈퇴를 하기전 아래 유의사항을 꼭 확인해 주시기 바랍니다.</h5>
	 	 	</div>
	 	 </div>     
		
		 <div class="notice">
			<ol>
				<li id="delcontent1">
					<p>탈퇴 시 사용하고 계시는 [ ${loginUser} ] 아이디는 재사용 및 복구가 불가능합니다.</p>
					<p>탈퇴 시 해당 아이디는 즉시 탈퇴 처리 되며, 탈퇴한 아이디는 본인과 타인 모두 <span class="color_point">재사용 및 복구가 불가</span> 하오니 신중하게 선택하시기 바랍니다.</p>
				</li>
				<li>
					<p>탈퇴 시 회원정보는 <span class="color_point">모두 삭제되며,</span> 삭제된 데이터는 복구되지 않습니다.</p>
				</li>
				<li id="delcontent2">
					<p>탈퇴 후에도 게시판에 등록한 게시물은 그대로 남아 있습니다.</p>
					<p>imfind 홈페이지에 올린 게시글 및 댓글은 탈퇴 시 자동 삭제되지 않고 그대로 남아 있으므로, 삭제를 원하는 게시글이 있다면 반드시 탈퇴 전</p>
					<p>삭제하시기 바랍니다.</p>
				</li>
			</ol>
			<div class="agree_check" >
			   <input type="radio" id="radio_y" name="radio" value="Y">
			   <label for="radio_y" class="marginr10">동의합니다.</label>
			   <input type="radio" id="radio_n" name="radio" value="N" checked="">
			   <label for="radio_n">동의하지 않습니다.</label>
			</div>
		 </div>
		
		<div class="pwchktitle" >
			<h5>회원탈퇴를 위해 비밀번호를 입력해주세요.</h5>
		</div>
		<div class="pwchk">
			<div class="pwbox"> 
				<input type="password" id="pass" placeholder="비밀번호를 입력해주세요" name="pw" autocomplete="false" required style="width: 200px; height: 35px;">
			</div>
			<div class="pwok">
			<button type="button" class="btn btn-block btn-secondary" onclick="return chkEqualpw()" style="width: 50px; height: 35px; font-family: 'Noto Sans KR', sans-serif;">확인</button>
			</div>
		</div>
		
		<div class="button_area">
			<div class="del_suc">
				<button class="btn btn-block btn-secondary" title="탈퇴하기" onclick="return deleteMember()" style="width: 86px;  font-family: 'Noto Sans KR', sans-serif;">
					<span>탈퇴하기</span>
				</button>
			</div>
			<div class="del_cancel">	
				<button class="btn btn-block bg-gradient-secondary" title="취소" onclick="javascript:location.href='/home.do'" style="width: 86px;">
					<span>취소</span>
				</button>
			</div>									
		</div>
	</div>
	<script>
	
	 
	function chkEqualpw(){
		
		 var pwd = $("#pass").val();
	     alert(pwd)
		 
		 $.ajax({
				
			    url: "/imfind/loginCheck", 
			    data: { "id": user,
			    		"pw": pwd},  
			    type: "POST",     
				success : function(data){
					alert(data)
					if(data == 'unpass'){
						pw.setAttribute("style", " border: 1px solid red;");
						
						if(document.getElementsByClassName('warn').length == 0){
							const warn_id = document.createElement('div');
							
							warn_id.className = 'warn';
							warn_id.innerHTML = 
								'아이디와 패스워드를 확인해 주세요';
							warn_id.style.color = 'red';
							warn_id.style.marginTop = '10px';
							
							inputElem.appendChild(warn_id);
						}
					}
					else {
						alert("탈퇴하기 버튼을 눌러주세요!")
					}
		
				},
				error : function(){
					console.log("통신 실패");
				}
			});
	}
	//회원탈퇴
	function deleteMember(){
		
		var chk_box = $('input[name=radio]:checked').val();
		var pwd = $('input[name=pw]').val();
			if(pwd == "") {
				alert("비밀번호를 입력해주세요.")
				
				 return true;
			}
			if(chk_box == "N"){
				alert("동의여부를 확인해주세요.")
							
			}else{
				alert("탈퇴하시겠습니까?")
					
				$.ajax({
					url : '/imfind/deleteMember',
					//type : 'post',
					data : { "id": user,
			    		 	 "pw": pwd},  
					dataType : 'json',
					/* contentType : 'application/x-www-form-urlencoded;charset=utf-8', */
					success : function(data){
						console.log(data.res)
						if(data.res == "success") {
							alert("정상적으로 탈퇴되었습니다.")
							window.location.href = "./logout"; //댓글 삭제후 목록 출력
						}					
					},
					error:function(error){
						alert("ajax통신 실패(delete)");
					}
				});
			} 
				
		
	}
	</script>
	
	 <!-- Js Plugins -->
    <script src="${pageContext.request.contextPath}/resources/el/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/el/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/el/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/el/js/jquery.countdown.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/el/js/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/el/js/jquery.zoom.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/el/js/jquery.dd.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/el/js/jquery.slicknav.js"></script>
    <script src="${pageContext.request.contextPath}/resources/el/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/el/js/main.js"></script>
 
        <jsp:include page="${request.contextPath}/NewFooter_JS"></jsp:include>
  
    <script src="${pageContext.request.contextPath}/resources/el/YH/adminlte/dist/js/adminlte.min.js"></script>
   <script src="${pageContext.request.contextPath}/resources/el/YH/adminlte/dist/js/demo.js"></script>
</body>
</html>