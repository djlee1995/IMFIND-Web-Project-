<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="kr">
  <style type="text/css">
        *{
            font-family:'malgun gothic';
}
        #content.cols-d { width: 583px; min-width: 583px; }
        .f { position: relative; margin: 0 Auto; padding: 0 Auto; color: #666; }      /*  margin: 0;  */ 
        .f p { width: 100%; margin: 0 0 13px; font-size: 1.3em; text-align:center;margin-top:20px;}
        .f p:after { content: ""; display: block; overflow: hidden; clear: both; height: 0; }    
        .f textarea {
             position: relative; 
             width: 570px; height: 118px; min-height: 118px; 
             padding: 3px 3px 3px 6px; 
             border: 1px solid #ececec; 
             border-top-color: #e1e1e1; 
             border-left-color: #e1e1e1; 
             background: #ececec; 
             border-radius: 3px; 
            -moz-border-radius: 3px; 
            -webkit-border-radius: 3px;
}        
        .scheme-g { 
            margin: 26px 0 8px; 
            padding: 0px; 
            font-size: 1.2em; 
            font-weight: 100;
}        
        .button_big { 
            float:right;
            border: 0; border-radius: 3px; 
            cursor: pointer; display: inline-block; 
            font-size: 12px; font-weight: bold; 
            line-height: 24px; 
            margin-left: 5px; 
            padding: 8px 16px; 
            text-decoration: none; color:#fff; 
            background:#0080ff; 
            text-shadow: 1px 1px 1px #0066cc; 
            -webkit-transition: all 0.2s ease-out; }
            
           #eljoin_content_Wrap{position:relative;min-height:100%;min-width:1024px;background-color:#fff}
           
           .Aligner {
           display: flex !important;
           align-items: center !important;
           justify-content: center !important;
         }
         
         .Aligner-item {
           max-width: 50% !important;
         }
      	
      	/*은지 추가*/
      	.chk1 {
      		display: flex;
      		justify-content: center;
      	} 
   		.chk2 {
	   		display: flex;
	   		justify-content: center;
      	} 
      	.nextBtn-1 {
      		padding:3px 14px 14px 14px;
      		height: 20px;
      		width: 75px;
      		display: flex;
      		justify-content: center;
      		align-items: center;
      		margin-top: 17px;
  			margin-left: 247px;
      		/* margin-left: 0px; */
      		/* margin-right: 247px; */
      	}
    </style>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Fashi Template">
    <meta name="keywords" content="Fashi, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>I'm Find</title>
    
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
    
     <!-- DataTables -->
      <link rel="stylesheet" href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css" />
     <!-- Css Styles -->
     <!-- Header Section Begin -->
      <jsp:include page="${request.contextPath}/NewHeader_CSS"></jsp:include>
     <!-- Header End -->
    
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/bootstrap.min.css" type="text/css"> 
    
    
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
     
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/YS_css/newstyle.css" type="text/css">
</head>

<body>
    
     <jsp:include page="${request.contextPath}/el/afterLoginHeader"></jsp:include>      
    
<div class="col-lg-6 offset-lg-3" style=" padding-top: 8%;margin-left: 30%; position: relative; ">
<article id="content" class="cols-d">
    <div>
        <h1>IMFIND 이용약관</h1>
        <form id="terms_form" class="f" action="http://localhost:8080/imfind/login">
            <h4 class="scheme-g" style="font-weight: 400; margin-left: 5px;">이용약관</h4>
            <textarea style="font-size:.9em; height: 330px; resize: none;">
제 1 조 (목적)
				
 이 약관은 '아임파인드'(이하 '회사'라 표기합니다)가 제공하는 홈페이지 서비스의 이용조건 및 절차, 기타 필요한 사항을 규정함을 목적으로 합니다.
		
				
제 2 조 (약관의 효력과 변경)

1. 이 약관은 이용자에게 공지함으로써 효력을 발생합니다.
2. 이 약관의 내용은 서비스 화면 내에 게시하며 약관의 변경 사항이 있을 경우 회사의 온라인 공지사항을 통해 공지합니다.
3. 회사는 필요하다고 인정되는 경우 이 약관을 개정할 수 있으며 변경된 약관은 제 1 항과 같은 방법으로 효력을 발생합니다.


제 3 조 (약관적용외 준칙)

1. 이 약관은 당사가 제공하는 서비스에 관한 이용규정 및 별도 약관과 함께 적용됩니다.
2. 이 약관에 명시되지 않은 사항이 관계법령에 규정되어 있을 경우에는 그 규정에 따릅니다.


제 4 조 (정의)

 이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
1. "이용자"란 "홈페이지"에 접속하여 이 약관에 따라 "홈페이지" 가 제공하는 서비스를 받는 개인회원 및 법인회원을 말합니다.
2. "가입"이란 당사가 제공하는 신청서 양식에 해당 정보를 가입하고,본 약관에 동의하여 서비스 이용계약을 완료시키는 행위를 말합니다.
3. "회원"이란 "홈페이지"에 개인 및 법인정보를 제공하여 회원등록을 한 이용자로서 "홈페이지 "의 정보를 지속적으로 제공받으며 해당 서비스를 계속적으로 이용할 수 있는 자를 말합니다.
4. "ID"란 회원식별과 회원의 서비스 이용을 위하여 회원이 신청하고 당사가 승인하는 문자 및 숫자의 조합을 말합니다.
5. "비밀번호"란 이용자가 회원ID와 일치하는지를 확인하고 통신상의 자신의 비밀보호를 위하여 이용자 자신이 선정한 문자와 숫자의 조합을 말합니다.
6. "탈퇴"란 회원이 이용계약을 종료 시키는 행위를 말합니다.
7. 본 약관에서 정의하지 않은 용어는 개별서비스에 대한 별도 약관 및 이용규정에서 정의합니다.


제 5 조 (회원자격 및 이용신청)

1. 회원가입은 이용자가 본 약관에 동의하고, 회사에서 요구하는 소정의 가입절차에 응한 후 이루어집니다.
2. 회사는 새로운 회원이 가입시 회원 ID를 무료로 제공하며 서비스 이용신청자는 반드시 실명으로 이용신청을 하여야 합니다.
3. 회원가입은 이용자의 이용신청에 대한 회사의 이용 승낙과 이용자의 약관내용에 대한 동의로 성립됩니다.
4. 이용자의 회원등록 후 해당하는 조건이 갖추어진 신청자에게는 신청 즉시 온라인상으로 등록사실을 알리는 화면을 보여줍 니다.


제 6 조 (회원자격 탈퇴 및 자격상실)

1. 다음 각호의 사유에 해당하는 경우 회원자격을 제한 및 정지시킬 수 있습니다.
	가. 타인의 명의를 도용하여 신청하였을 때
	나. 이용 계약 신청서의 내용을 허위로 기재하거나 허위서류를 첨부하여 신청하였을 때
	다. 사회의 안녕이나 혹은 미풍양속을 저해할 목적으로 신청하였을 때
	라. 다른 사람의 당사서비스 이용을 방해하거나 그 정보를 도용하는 등의 행위를 하였을때
	마. 당사 사이트를 이용하여 법령과 본 약관이 금지하는 행위를 하는 경우
	바. 기타 당사가 정한 이용신청요건이 미비 되었을 때


제 7 조 (서비스의 제공 및 이용)

1. 서비스의 이용은 회사의 업무상 또는 기술상 특별한 지장이 없는 한 연중무휴 1일 24시간을 원칙으로 합니다.
2. 회사는 다음 각 호에 해당하는 경우 서비스 제공을 중지할 수 있습니다.
	가. 시스템 정비를 위하여 부득이한 경우
	나. 전기통신사업법에 규정된 기간통신사업자가 전기통신 서비스를 중지하는 경우
	다. 기타 회사가 서비스를 제공할 수 없는 사유가 발생할 경우
3. 당사가 제공하는 서비스는 아래와 같으며,그 변경될 서비스의 내용을 이용자에게 공지하고 아래에서 정한 서비스를 변경하 여 제공 할 수 있습니다.	
	가. 홈페이지(회원약관)
	나. 기타 회사가 자체 개발하거나 다른 회사와의 협력 계약 등을 통해 제공하는 일체의 서비스


제 8 조 (회원정보 사용에 대한 동의)

1. 회원의 개인정보에 대해서는 당사의 개인정보 보호정책이 적용됩니다.
2. 당사의 회원 정보는 다음과 같이 수집, 사용, 관리, 보호됩니다.
	가. 개인정보의 수집 : 당사는 귀하의 당사 서비스 가입 시 귀하가 제공하는 정보, 커뮤니티 활동을 위하여 귀하가 제공하는 정보, 각종 이벤트 참가를 위하여 귀하가 제공하는 정보, 광고나 경품의 취득을 위하여 귀하가 제공하는 정보 등을 통하여 귀하에 관한 정보를 수집합니다.
	나. 개인정보의 사용 : 당사는 당사 서비스 제공과 관련해서 수집된 회원의 신상정보를 본인의 승낙 없이 제3자에게 누설, 배포하지 않습니다. 단, 전기통신기본법 등 법률의 규정에 의해 국가기관의 요구가 있는 경우, 범죄에 대한 수사상의 목적이 있거나 정보통신윤리 위원회의 요청이 있는 경우 또는 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우, 귀하가 당사에 제공한 개인정보를 스스로 공개한 경우에는 그러하지 않습니다
	다. 개인정보의 관리 : 귀하는 개인정보의 보호 및 관리를 위하여 홈페이지 회원정보에서 수시로 귀하의 개인정보를 수정/삭제할 수 있습니다.
	라. 개인정보의 보호 : 귀하의 개인정보는 오직 귀하만이 열람/수정/삭제 할 수 있으며, 이는 전적으로 귀하의ID와 비밀번호에 의해 관리되고 있습니다. 따라서 타인에게 본인의 ID와 비밀번호를 알려주어서는 아니 되며, 작업 종료 시에는 반드시 로그아웃 해 주시고, 웹 브라우저의 창을 닫아 주시기 바랍니다(이는 타인과 컴퓨터를 공유하는 인터넷 카페나 도서관 같은 공공장소에서 컴퓨터를 사용하는 경우에 귀하의 정보의 보호를 위하여 필요한 사항입니다).
	마. 기타 : 게시판이나, E-mail,등 온라인상에서 귀하가 자발적으로 제공하는 개인정보는 다른 사람들이 수집하여 사용할 수 있음을 인지하시기 바랍니다. 공개적인 공간에 게재되는 개인정보로 인해 원하지 않는 상황이 발행할 수도 있습니다. 개인정보에 대한 비밀을 유지할 책임은 귀하에게 있으며, 당사는 개인정보 유출로 인해 발생한 결과에 대하여 어떤 책임도 부담하지 아니합니다.
3. 회원이 당사에 본 약관에 따라 이용신청을 하는 것은 당사가 본 약관에 따라 신청서에 기재된 회원정보를 수집, 이용 및 제공하는 것에 동의하는 것으로 간주됩니다.


제 9 조 (사용자의 정보 보안)

1. 가입 신청자가 당사 서비스 가입 절차를 완료하는 순간부터 귀하는 입력한 정보의 비밀을 유지할 책임이 있으며, 회원의 ID와 비밀번호를 사용하여 발생하는 모든 결과에 대한 책임은 회원본인에게 있습니다.
2. ID 와 비밀번호에 관한 모든 관리의 책임은 회원에게 있으며, 회원의 ID나 비밀번호가 부정하게 사용되었다는 사실을 발견한 경우에는 즉시 당사에 신고하여야 합니다. 신고를 하지 않음으로 인한 모든 책임은 회원 본인에게 있습니다.
3. 이용자는 당사 서비스의 사용 종료 시 마다 정확히 접속을 종료하도록 해야 하며, 정확히 종료하지 아니함으로써 제3자가 귀하에 관한 정보를 이용하게 되는 등의 결과로 인해 발생하는 손해 및 손실에 대하여 당사는 책임을 부담하지 아니합니다.


제 10 조 (정보의 제공 및 광고의 게재)

1. 회사는 서비스를 운용함에 있어 각종 정보를 웹사이트에 게재하는 방법 등으로 회원에게 제공할 수 있습니다.
2. 회사는 서비스의 운영과 관련하여 웹사이트, 전자우편 등에 광고 등을 게재할 수 있습니다.


제 11 조 (당사에 제출된 게시물의 저작권)

1. 귀하가 게시한 게시물의 내용에 대한 권리는 귀하에게 있습니다.
2. 당사는 게시된 내용을 사전 통지 없이 편집, 이동 할 수 있는 권리를 보유하며, 다음의 경우 사전 통지 없이 삭제 할 수 있습니다.
	가. 본 서비스 약관에 위배되거나 상용 또는 불법, 음란, 저속하다고 판단되는 게시물을 게시한 경우
	나. 다른 회원 또는 제 3자를 비방하거나 중상 모략으로 명예를 손상시키는 내용인 경우
	다. 공공질서 및 미풍양속에 위반되는 내용인 경우
	라. 범죄적 행위에 결부된다고 인정되는 내용일 경우
	마. 제3자의 저작권 등 기타 권리를 침해하는 내용인 경우
	바. 탈퇴자가 게시한 게시물
	사. 기타 관계 법령에 위배되는 경우
3. 귀하의 게시물이 타인의 저작권을 침해함으로써 발생하는 민, 형사상의 책임은 전적으로 귀하가 부담하여야 합니다.


제 12 조 (회사의 의무와 책임)

1. 서비스의 소유 및 운영은 회사에 있습니다.
2. 회사는 서비스와 관련하여 득한 회원의 개인정보를 본인의 사전 동의없이 타인에게 누설, 공개 또는 배포할 수 없으며, 서비 스관련이외의 상업적인 목적으로 사용할 수 없습니다. 다만 관계법령에 의한 경우 및 수사상의 목적등의 경우는 예외로 합니다.


제 13 조 (회원의 의무)

1. 회원은 관계법령, 이 약관의 규정, 이용안내 및 주의사항 등 회사가 통지하는 사항을 준수하여야 하며, 기타 회사의 업무에 방해되는 행위를 하여서는 안됩니다.
2. 회원은 회사의 사전 동의없이 서비스를 이용하여 어떠한 영리행위도 할 수 없습니다.
3. 회원은 서비스를 이용하여 얻은 정보를 회사의 사전 동의없이 복사,복제,변경, 번역,출판,방송 기타의 방법으로 사용하거나 이를 타인에게 제공할 수 없습니다.
4. 회원은 서비스 이용과 관련하여 다음 각 호의 행위를 하여서는 안됩니다.
	가. 다른 회원의 ID를 부정사용하는 경우
	나. 범죄행위를 목적으로 하거나 기타 범죄행위와 관련된 행위
	다. 선량한 풍속, 기타 사회질서를 해하는 경우
	라. 타인의 명예를 훼손하거나 모욕하는 행위
	마. 타인의 지적재산권 등의 권리를 침해하는 행위
	바. 해킹행위 또는 컴퓨터바이러스의 유포행위
	사. 타인의 의사에 반하여 광고성 정보등 일정한 내용을 전송하는 행위
	아. 당사 사이트에 게시된 정보의 변경
	자. 서비스의 안정적인 운영에 지장을 주거나 줄 우려가 있는 일체의 행위
	차. 기타 관계법령에 위배되는 행위


제 14 조 (회원 정보의 변경)

1. 회원은 회원정보의 변경(주소, E-mail Address등)이 있을 경우 즉시 회사가 운영하는 웹상에 통보 및 수정을 하여야 합니다.
2. 회원의 변경사항에 대한 미통보 및 미수정으로 인한 책임은 전적으로 회원에게 있으며 이는 서비스의 정지 및 해지의 사유가 될 수 있습니다.


제 15 조 (게시물 또는 내용물의 삭제)

회사는 서비스의 게시물 또는 내용물이 규정에 위반되거나 회사의 소정 게시기간을 초과하는 경우 사전 통지나 동의 없이 이를 삭제할 수 있습니다.


제 16 조 (계약해지 및 이용제한)

1. 회원이 이용계약을 해지하고자 하는 때에는 본인이 서비스 또는 전자우편을 통하여 해지하고자 하는 날의 1일전까지 (단, 해지일이 법정공휴일인 경우 공휴일 개시 2일전 까지) 이를 회사에 신청하여야 합니다.
2. 회사는 회원이 이 약관의 내용을 위반하고, 회사 소정의 기간 이내에 이를 해지하지 아니하는 경우 서비스 이용계약을 해지 할 수 있습니다.
3. 회사는 계약내용을 위반하는 회원에 대하여는 사전 동의 없이 이용의 제한 및 정지를 할 수 있습니다.
4. 회사는 회원의 계약내용과 일치하지 않는 사용 및 법령에 위배되는 행위에 관하여 서비스 정지 및 해지에 관한 권리를 갖습니다.


제 17 조 (손해배상)

회사는 무료로 제공되는 서비스와 관련하여 회원에게 어떠한 손해가 발생하더라도 동 손해가 회사의 중대한 과실에 의한 경우를 제외하고 이에 대하여 책임을 부담하지 아니합니다.


제 18 조 (면책 조항)

1. 회사는 천재지변 기타 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없을 경우에는 서비스 제공 중지에 관한 책임을 면합니다.
2. 회사는 이용자들의 귀책사유로 인한 서비스 이용의 장애에 대하여 책임을 면합니다.
3. 회사는 이용자가 서비스를 이용하여 얻은 정보 등으로 인해 입은 손해등에 대하여는 책임을 면합니다.
4. 회사는 회사가 제공하는 서비스망을 통해 제공하는 정보의 신뢰도나 정확성에 대하여는 책임을 면합니다.
5. 회사는 이용자가 게시 또는 전송한 자료의 내용에 관하여는 책임을 면합니다.

부칙 1.
(시행일) 이 약관은 2021년 2월 15일부터 시행된다.
            </textarea>
            
           
            <div class="chk1">
	            <div class="checkbox-1" style="width: 20px; margin-top: 7px;">
	                <input type="checkbox" id="check_1"  name="" /> 
	            </div>
	            <div class="checktext-1">
	            	<h5>이용 약관에 동의합니다.</h5>
	            </div>
            </div>
              
            <h4 class="scheme-g" style="font-weight: 400; margin-left: 5px;">개인정보 수집 및 이용 동의</h4>
            <textarea style="font-size:.9em; height: 208px; resize: none;">
'아임파인드'는 (이하 '회사'는) 고객님의 개인정보를 중요시하며, "정보통신망 이용촉진 및 정보보호"에 관한 법률을 준수 하고 있습니다. 
회사는 개인정보취급방침을 통하여 고객님께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.

회사는 개인정보취급방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.

- 본 방침은 : 2021 년 02 월 07 일 부터 시행됩니다.


[수집하는 개인정보 항목]

회사는 회원가입, 상담, 서비스 신청 등등을 위해 아래와 같은 개인정보를 수집하고 있습니다.

• 수집항목 : 이름 , 로그인ID , 비밀번호, 휴대전화번호, 이메일 , 생년월일 , 서비스 이용기록 , 접속 로그 , 
                  접속 IP 정보 등
• 개인정보 수집방법 : 홈페이지(회원가입)


[개인정보의 수집 및 이용목적]

회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.

• 회원 관리
  회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 불량회원의 부정 이용 방지와 비인가 사용 방지 , 가입 의사 확인 , 불만처리 등 민원처리 , 고지사항 전달


[개인정보의 보유 및 이용기간]

회사는 개인정보 수집 및 이용목적이 달성된 후에는 예외 없이 해당 정보를 지체 없이 파기합니다.


[개인정보의 파기절차 및 방법]

회사는 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체없이 파기합니다. 파기절차 및 방법은 다음과 같습니다.

• 파기절차
  회원님이 회원가입 등을 위해 입력하신 정보는 목적이 달성된 후 별도의 DB로 옮겨져(종이의 경우 별도의 서류함) 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라(보유 및 이용기간 참조) 일정 기간 저장된 후 파기되어집니다. 별도 DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 보유되어지는 이외의 다른 목적으로 이용되지 않습니다.
• 파기방법
  전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.


[개인정보 제공]

회사는 이용자의 개인정보를 원칙적으로 외부에 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.
• 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우


[수집한 개인정보의 위탁]

회사는 고객님의 동의없이 고객님의 정보를 외부 업체에 위탁하지 않습니다. 
향후 그러한 필요가 생길 경우, 위탁 대상자와 위탁 업무 내용에 대해 고객님에게 통지하고 필요한 경우 사전 동의를 받도록 하겠습니다.
   			</textarea>
   			 <div class="chk2">
	            <div class="checkbox-2" style="width: 20px; margin-top: 7px;">
	                <input type="checkbox" id="check_2"  name="" /> 
	            </div>
	            <div class="checktext-2">
	            	<h5>개인정보 수집 및 이용 동의 약관에 동의합니다.</h5>
	            </div>
            </div>
               
              <div class="nextBtn-1"> 
               <input type="button" id="nextBtn"  class="button_big" value="다음단계로" onclick="registerPage();"/>
       		  </div>	 
        </form>
    	</div>    
	</article>
	</div><!-- end:eljoin_content -->


<!-- ======================================================================================================================================== -->
	<script>
	function registerPage(){
		var chk1 = $('#check_1').is(":checked");
		var chk2 = $('#check_2').is(":checked");
		
		if(!chk1) {
			alert("이용약관에 동의해주세요.")
			return false;
		}
		if(!chk2) {
			alert("개인정보수집 약관에 동의해주세요.")
			return false;
		}
		
		$(location).attr('href','./register');
	}
	</script>
    <!-- Mypage Form Section End -->
     
    <!--마이페이지 js 시작-연수 -->
    <!--마이페이지 js 끝-연수 -->
   <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <!-- DataTables -->
    <script src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.js"></script>
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
    <!-- Header Section Begin -->
        <jsp:include page="${request.contextPath}/NewFooter_JS"></jsp:include>
    <!-- Header End -->
    <script src="${pageContext.request.contextPath}/resources/el/YH/adminlte/dist/js/adminlte.min.js"></script>
   <script src="${pageContext.request.contextPath}/resources/el/YH/adminlte/dist/js/demo.js"></script>

</body>

</html>