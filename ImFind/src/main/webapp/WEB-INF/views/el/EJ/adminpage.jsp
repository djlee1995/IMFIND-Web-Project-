<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
    
    <!-- Css Styles -->
    <!-- Header Section Begin -->
      <jsp:include page="${request.contextPath}/NewHeader_CSS"></jsp:include>
    <!-- Header End -->

      <!-- DataTables -->
      <link rel="stylesheet" href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css" />
<%--   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/YH/adminlte/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/YH/adminlte/plugins/datatables-responsive/css/responsive.bootstrap4.min.css"> --%>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/bootstrap.min.css" type="text/css"> 
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/home/css/css_YH.css" type="text/css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/themify-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/slicknav.min.css" type="text/css">    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/YS_css/style2.css" type="text/css">

   <script type="text/javascript">
   
   function memberList(){
      
       $('#output').empty();
       var title ='<thead><h1 style="margin-top:0px; margin-left:200px; width:500px;">회원관리</h1></thead>'
       var form ='<tr><td width = "50px">회원ID</td><td width = "40px">이름</td><td width = "80px">연락처</td><td width = "80px">email</td><td width = "80px">계좌번호</td><td width = "80px">은행명</td><td width = "80px">예금주</td><td width = "180px">가입일</td></tr>';
       $('#output').append(title);
       $('#output').append(form);
       $.ajax({
          url : '/imfind/adminmember',
         contentType : 'application/x-www-form-urlencoded:charset=utf-8',
         success : function(data){
            $.each(data, function(index, item){
               var output='';
               output += '<tr margin-left:200px;>';
                   output += '<td width = "30px">' + item.id + '</td>';
                   output += '<td width = "40px">' + item.name + '</td>';
                   output += '<td width = "80px">' + item.contact + '</td>';
                   output += '<td width = "80px">' + item.email + '</td>';
                   output += '<td width = "80px">' + item.account_Num + '</td>';
                   output += '<td width = "80px">' + item.bank + '</td>';
                   output += '<td width = "80px">' + item.account_holder + '</td>';
                   output += '<td width = "80px">' + item.join_date + '</td>';
                   output += '</tr>'
                  // console.log("output:" + output); //F12 개발자도구에서 볼수 있음 (dom 구조로 확인가능) 동적인 내용은 소스보기에서 볼수 없음
                   $('#output').append(output); //추가

            }); //each 끝 
            }, //success 끝
            error:function(){
                 alert("ajax통신 실패!!!");
         }// error 끝.
       });// ajax 끝
   }
   
   function payList(){

       $('#output').empty();
      
       var title ='<h1 style="margin-top:0px; margin-left:200px; width:500px;>결제관리</h1>'
       var form ='<tr><td width = "80px">회원ID</td><td width = "80px">주문번호</td><td width = "80px">결제금액</td><td width = "80px">결제상태</td><td width = "120px">결제승인시각</td><td width = "120px">결제승</td></tr>';
       $('#output').append(title);
       $('#output').append(form);
      
       $.ajax({
          url : '/imfind/adminpay',
         contentType : 'application/x-www-form-urlencoded:charset=utf-8',
         success : function(data){
            $.each(data, function(index, item){
               //console.log(item)
               var output='';
               output += '<tr>'; 
                   output += '<td width = "80px">' + item.id + '</td>';
                   output += '<td width = "80px">' + item.payCode + '</td>';
                   //output += '<td width = "80px">' + item.pay_Way + '</td>';
                   output += '<td width = "80px">' + item.pay_Amount + '</td>';
                   if (item.pay_State == 'paid'){
                      output += '<td width = "80px">결제완료</td>';
                   } 
                   if (item.pay_State == 'refund'){
                      output += '<td width = "80px">환불요청</td>';
                   }
                   if (item.pay_State == 'cancel'){
                      output += '<td width = "80px">환불완료</td>';
                   }
                      output += '<td width = "120px">' + item.pay_Date + '</td>';
                      //output += '<td width = "120px">' + item.cancel_Date + '</td>';
                   output += '</tr>'
                   //console.log("output:" + output); //F12 개발자도구에서 볼수 있음 (dom 구조로 확인가능) 동적인 내용은 소스보기에서 볼수 없음
                   $('#output').append(output); //추가
            }); //each 끝 
            }, //success 끝
            error:function(){
                 alert("ajax통신 실패!!!");
         }// error 끝.
       });// ajax 끝
   }
   
   function paidList(){
       $('#output').empty();
       
       //var pay_State = $("input[name=paymenu]:checked").val();
       
       
       var title ='<h1 style="margin-top:0px; margin-left:200px; width:500px;>결제관리</h1>'
       var form ='<tr><td width = "80px">회원ID</td><td width = "80px">주문번호</td><td width = "80px">결제금액</td><td width = "80px">결제상태</td><td width = "120px">결제승인시각</td></tr>';
       $('#output').append(title);
       $('#output').append(form);
      
       $.ajax({
          url : '/imfind/adminpaid',
         contentType : 'application/x-www-form-urlencoded:charset=utf-8',
         success : function(data){
            $.each(data, function(index, item){
               //console.log(item)
               var output='';
               output += '<tr>';
                   output += '<td width = "80px">' + item.id + '</td>';
                   output += '<td width = "80px">' + item.payCode + '</td>';
                   //output += '<td width = "80px">' + item.pay_Way + '</td>';
                   output += '<td width = "80px">' + item.pay_Amount + '</td>';
                   output += '<td width = "80px">결제완료</td>';
                   output += '<td width = "120px">' + item.pay_Date + '</td>';
                   output += '</tr>'
                   console.log("output:" + output); //F12 개발자도구에서 볼수 있음 (dom 구조로 확인가능) 동적인 내용은 소스보기에서 볼수 없음
                   $('#output').append(output); //추가
            }); //each 끝 
            }, //success 끝
            error:function(){
                 alert("ajax통신 실패!!!");
         }// error 끝.
       });// ajax 끝
   }
   
   function refundList(){
       $('#output').empty();
      
       var title ='<h1 style="margin-top:0px; margin-left:200px; width:500px;>결제관리</h1>'
       var form ='<tr><td width = "80px">회원ID</td><td width = "80px">주문번호</td><td width = "80px">결제금액</td><td width = "80px">결제상태</td><td width = "120px">결제승인시각</td><td width = "120px"></td><td width = "120px">환불완료날짜</td></tr>';
       $('#output').append(title);
       $('#output').append(form);
      
       $.ajax({
          url : '/imfind/adminrefund',
         contentType : 'application/x-www-form-urlencoded:charset=utf-8',
         success : function(data){
            $.each(data, function(index, item){
               //console.log(item)
               var output='';
               output += '<tr>';
                   output += '<td width = "80px">' + item.id + '</td>';
                   output += '<td width = "80px">' + item.payCode + '</td>';
                  // output += '<td width = "80px">' + item.pay_Way + '</td>';
                   output += '<td width = "80px">' + item.pay_Amount + '</td>';
                   if (item.pay_State == 'refund'){
                      output += '<td width = "80px">환불요청</td>';
                      output += '<td width = "120px">' + item.pay_Date + '</td>';
                      output += '<td><button type="button" id="cancelBtn" class="btn btn-outline-primary onclick="cancelPay()">환불승인</button></td>';
                      output += '<td width = "120px">-</td>';
                   }
                   if (item.pay_State == 'cancel'){
                      output += '<td width = "80px">환불완료</td>';
                      output += '<td width = "120px">' + item.pay_Date + '</td>';
                     output += '<td><button type="button" id="cancelBtn_s" class="btn btn-outline-primary onclick="cancels()">환불완료</button></td>';
                     output += '<td width = "120px">' + item.cancel_Date + '</td>';
                   }
                   output += '</tr>'
                  // console.log("output:" + output); //F12 개발자도구에서 볼수 있음 (dom 구조로 확인가능) 동적인 내용은 소스보기에서 볼수 없음
                   $('#output').append(output); //추가
            }); //each 끝 
            }, //success 끝
            error:function(){
                 alert("ajax통신 실패!!!");
         }// error 끝.
       });// ajax 끝
   }
   
   function cancels(event){
      alert("이미 환불 되었습니다.");
   }
   
   function cancelPay(event){
      alert("click")
        var id = event.target.parentElement.parentElement.childNodes[0].firstChild.data;   
        var paycode = event.target.parentElement.parentElement.childNodes[1].firstChild.textContent;
         alert(id)
         alert(paycode)
         
         jQuery.ajax({
            url : "/imfind/adminpaycancel",
            type : "post",
            //datatype: "json",
            contentType : 'application/x-www-form-urlencoded; charset=utf-8',
            data : {
               "merchant_uid" : paycode // 주문번호
            }
         }).done(function(result){ // 환불 성공시 로직
            alert("환불 성공 : " + result);
         
            cancelList(id, paycode);
         
         }).fail(function(error){ // 환불 실패시 로직
            alert("환불 실패 : " + error);
         });
   }
   
   // 바디와, table의 태그들이 모두 로드되면 실행되는 함수
   document.addEventListener('DOMContentLoaded', function(){
      const tableElem = document.querySelector('#output');
      tableElem.addEventListener('click', function(){
         //console.log(event.target);
         cancelPay(event);
      })
   })
   var toady = new Date();
   
   function cancelPay(event){
        //alert("click")
        //$('[name=commentInsertBtn]')
        if (event.target.id == 'cancelBtn_s'){
            alert("이미 환불 되었습니다.");
            return true;
        }
        if (event.target.id == 'cancelBtn'){
          var id = event.target.parentElement.parentElement.childNodes[0].firstChild.data;
          var paycode = event.target.parentElement.parentElement.childNodes[1].firstChild.textContent;
            alert(id)
            alert(paycode)


            jQuery.ajax({
                url : "/imfind/adminpaycancel",
                type : "post",
                //datatype: "json",
                contentType : 'application/x-www-form-urlencoded; charset=utf-8',
                data : {
                    "merchant_uid" : paycode // 주문번호
                }
            }).done(function(result){ // 환불 성공시 로직
                alert("환불 성공 : " + result);

                cancelList(id, paycode);

            }).fail(function(error){ // 환불 실패시 로직
                alert("환불 실패 : " + error);
            });
        }
    }
   function cancelList(id, paycode){
      var params = {"Id" : id , "PayCode" : paycode};
      $('#output').empty();   
          var title ='<h1 style="margin-top:0px; margin-left:200px; width:500px;>결제관리</h1>'
          var form ='<tr><td width = "80px">회원ID</td><td width = "80px">주문번호</td><td width = "80px">결제금액</td><td width = "80px">결제상태</td><td width = "120px">결제승인시각</td><td width = "120px">환불날짜</td></tr>';
          $('#output').append(title);
          $('#output').append(form);
         
          $.ajax({
             url : '/imfind/admincancel', 
             data :JSON.stringify(params),
              type : "POST",
            contentType :'application/json',
            success : function(data){
               //$('#output').empty(); 
               $.each(data, function(index, item){
                  var output='';
   
                  output += '<tr>';
                      output += '<td width = "80px">' + item.id + '</td>';
                      output += '<td width = "80px">' + item.payCode + '</td>';
                     // output += '<td width = "80px">' + item.pay_Way + '</td>';
                      output += '<td width = "80px">' + item.pay_Amount + '</td>'; 
                      if (item.pay_State == 'refund'){
                         output += '<td width = "80px">환불요청</td>';
                         output += '<td width = "120px">' + item.pay_Date + '</td>';
                         output += '<td><button type="button" id="cancelBtn" class="btn btn-outline-primary onclick="cancelPay()">환불승인</button></td>';
                         output += '<td width = "120px">-</td>';
                      }
                      if (item.pay_State == 'cancel'){
                         output += '<td width = "80px">환불완료</td>';
                         output += '<td width = "120px">' + item.pay_Date + '</td>';
                        output += '<td><button type="button" id="cancelBtn_s" class="btn btn-outline-primary onclick="cancels()">환불완료</button></td>';
                        output += '<td width = "120px">' + item.cancel_Date + '</td>';
                      }
                     
                      output += '</tr>'
            
                      $('#output').append(output); //추가
               }); //each 끝 
               }, //success 끝
               error:function(){
                    alert("ajax통신 실패!!!");
            }// error 끝.
          });// ajax 끝
   }

   function adjustmentList(){
		
	   $('#output').empty();
	      
       var title ='<h1 style="margin-top:0px; margin-left:200px; width:500px;>정산관리</h1>'
       //var form ='<tr><td width = "80px">회원ID</td><td width = "80px">주문번호</td><td width = "80px">결제금액</td><td width = "80px">결제상태</td><td width = "120px">결제승인시각</td><td width = "120px">결제승</td></tr>';
       var form = '<tr>'
 			+'<td>글번호</td>'
 			+'<td>파인더</td>'
 			+'<td>거래상태</td>'
 			+'<td>거래완료일</td>'
 			+'<td>정산 금액</td>'
 			+'<td>정산 계좌</td>'
 			+'<td>은행</td>'
 			+'<td>계좌주</td>'
 			+'<td>정산 상태</td>'
 			+'<td>정산날짜</td>'
			+'</td>'
			
       $('#output').append(title);
       $('#output').append(form);
      
       $.ajax({
          url : '/imfind/getAdjustmentList',
          contentType : 'application/x-www-form-urlencoded:charset=utf-8',
          
          success : function(data){
            $.each(data, function(index, item){
               console.log(item)
               
     		  if(item.lost_PostNum == null){
    			  postnum = item.pat_PostNum
    			  href = './petinfo?Pet_PostNum='
    		  }
    		  else{
    			  postnum = item.lost_PostNum
    			  href = './iteminfo?lost_PostNum='
    		  }
    		  
    		  if(item.adjustment_state == null){
    			  adjustment_state = '미정산' + '<button type="button" value="승인" style="width:50px; height:30px;" onclick="giveMoeny()">정산</button></td>';
    			  adjustment_date = '-'
    		  }
    		  else{
    			  adjustment_state = '정산완료'
   				  adjustment_date = moment(item.adjustment_date).format('YYYY-MM-DD');
    		  }
    		  
    		  
               var output='';
               output += '<tr>'; 
               output += '<td width = "80px">' + postnum+ '</td>';
               output += '<td width = "80px">' + item.f_ID+ '</td>';
               output += '<td width = "80px">' + item.deal_State + '</td>';
               output += '<td width = "80px">' + item.Deal_Date + '</td>';
               output += '<td width = "80px">' + item.pay_Amount + '</td>';
               output += '<td width = "80px">' + item.account_Num + '</td>';
               output += '<td width = "80px">' + item.bank + '</td>';
               output += '<td width = "80px">' + item.account_holder + '</td>';
               output += '<td width = "80px">' + adjustment_state + '</td>';
               output += '<td width = "80px">' + adjustment_date + '</td>';
               
               output += '</tr>'
               //console.log("output:" + output); //F12 개발자도구에서 볼수 있음 (dom 구조로 확인가능) 동적인 내용은 소스보기에서 볼수 없음
               $('#output').append(output); //추가
            }); //each 끝 
            }, //success 끝
            error:function(){
                 alert("ajax통신 실패!!!");
         }// error 끝.
       });// ajax 끝
   }
   function giveMoeny(){
	   
	   document.querySelector('#output').addEventListener('click', function(e){
		  	console.log(e.target)
		  	var postNum = e.target.parentElement.parentElement.childNodes[0].innerText
		  	var finder = e.target.parentElement.parentElement.childNodes[1].innerText
		    alert('정산')
		   
		    $.ajax({
	          url : '/imfind/giveMoney',
	          contentType : 'application/x-www-form-urlencoded:charset=utf-8',
	          data : {"Lost_PostNum" : postNum, "F_ID" : finder},
	          success : function(data){
	        	  console.log(data)
	        	  window.location.href = './adminhome'
	          },
	          error : function(){
	        	 
	          } 
		   
		    });
	   });
   }

   </script>
   
   <style type="text/css">
   .admin {
      margin-top: 135px;
      margin-left: 200px;
   }
   
   body {
      font-size: 20px;
   }
   
   h1 {
      font-size: 22px;
   }
   div.table-container{
      width : 73vw;
      margin: 0 auto;
   }
   table#outout{
      width : 80% !important;
      font-size: 1.5rem !important;
   }
   </style>
</head>
<body>
     <script>
      var user = '${loginUser}';
   </script>
   <!-- Page Preloder -->
   <div id="preloder">
      <div class="loader"></div>
   </div>


   <%
      if (session.getAttribute("loginUser") == null && session.getAttribute("kakaoLoginUser") == null) {
   %>
   <jsp:include page="${request.contextPath}/el/header"></jsp:include>
   <%
      } else {
   %>
   <jsp:include page="${request.contextPath}/el/afterLoginHeader"></jsp:include>
   <%
      }
   %>
   <!-- Header End -->
   
    <div class="admin">
      <a href="javascript:memberList()">회원관리</a>
      <a href="javascript:payList()">결제관리</a>

      <a href="javascript:adjustmentList()">정산관리</a>

   <div>전체<input type="radio" name="paymenu" value="total" onclick="payList()"checked>
   결제건<input type="radio" id="paid" name="paymenu" value="paid" onclick="paidList()">
   환불건<input type="radio" id="refund" value="refund" name="paymenu" value="refund" onclick="refundList()"></div>
   </div>
   
   <div class="table-container">
      <table id="output" class="table table-bordered table-hover display" style="font-size:1.5rem;"></table>
   </div>
   


</body>

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
    
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <!-- DataTables -->
    <script src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.js"></script>
    
<%--    <script src="${pageContext.request.contextPath}/resources/el/YH/adminlte/plugins/datatables/jquery.dataTables.min.js"></script>
   <script src="${pageContext.request.contextPath}/resources/el/YH/adminlte/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
   <script src="${pageContext.request.contextPath}/resources/el/YH/adminlte/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
   <script src="${pageContext.request.contextPath}/resources/el/YH/adminlte/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script> --%>
   
    
     <!-- Header Section Begin -->
      <jsp:include page="${request.contextPath}/NewFooter_JS"></jsp:include>
    <!-- Header End -->
    
<script>
/* $("#example1").DataTable({
    "responsive": true, "lengthChange": false, "autoWidth": false,
    "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
  }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)'); */
  
  $(document).ready(function() {
     $.noConflict();
       $("#output").DataTable({
             "paging": true,
         "lengthChange": true,
         "searching": true,
         "ordering": true,
         "info": true,
         "autoWidth": false,
         "responsive": true,
           "columnDefs": [
              { "width": "30%", "targets": 0 },
            ],
         "autoWidth": true,
         "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
       }).buttons().container().appendTo('#output_wrapper .col-md-6:eq(0)');
   });
</script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

</html>