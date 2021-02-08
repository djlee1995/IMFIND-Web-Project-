<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
 <style type="text/css">
 
 .layout-boxed .wrapper, .layout-boxed .wrapper::before {
  margin: 0 auto;
  max-width:1850px !important; /*1250px*/
}
 #fh5co-logo {
    font-size: 31px;
    margin-left: 20px;
    margin-top: 10px;
    padding: 0;
    text-transform: uppercase;
    font-weight: 700;
    font-family: 'Noto Sans KR', sans-serif;
    display: block;
}
 
 
 </style>
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 3 | Boxed Layout</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
 <!-- 참고
 --> 	<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/bootstrap.min.css" type="text/css"> 
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/css/YS_css/newstyle.css" type="text/css"> --%>
 <!--    참고 -->
  <!-- Font Awesome :필요-->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/Admin_plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
   <!-- DataTables -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/Admin_plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/Admin_plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
  
  <!-- Theme style :중요-->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/el/Admin_dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> 
 <script type="text/javascript">
	$(document).ready(function(){
	 $('#output').empty();
	 adjustmentList();
	 
	 
 });
 
	
 function adjustmentList(){
	 
     $('#output').empty();
    
     var form ='<thead><tr>'
     		+'<th>글번호</th>'
     		+'<th>파인더</th>'
     		+'<th>거래상태</th>'
     		+'<th>거래완료일</th>'
     		+'<th>정산 금액</th>'
     		+'<th>정산 계좌</th>'
     		+'<th>은행</th>'
     		+'<th>계좌주</th>'
     		+'<th>정산 상태</th>'
     		+'<th>정산날짜</th>'
     		+'</tr></thead><tbody>';
    
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
              output += '<td>' + postnum+ '</td>';
              output += '<td>' + item.f_ID+ '</td>';
              output += '<td>' + item.deal_State + '</td>';
              output += '<td>' + item.Deal_Date + '</td>';
              output += '<td>' + item.pay_Amount + '</td>';
              output += '<td>' + item.account_Num + '</td>';
              output += '<td>' + item.bank + '</td>';
              output += '<td>' + item.account_holder + '</td>';
              output += '<td>' + adjustment_state + '</td>';
              output += '<td>' + adjustment_date + '</td>';
              
              output += '</tr>'
              $('#output').append(output); //추가
           }); //each 끝 
           }, //success 끝
           error:function(){
                alert("ajax통신 실패!!!");
       },// error 끝.
         
          
     });// ajax 끝
 };
 
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
  };
 </script>
</head>

<body class="hold-transition sidebar-mini layout-boxed">
<!-- Site wrapper -->
<div class="wrapper">
		<!-- Navbar -->
		<nav
			class="main-header navbar navbar-expand navbar-white navbar-light">
			<!-- Left navbar links -->
			
		</nav>
		<!-- /.navbar -->

		<!-- Main Sidebar Container -->
		<aside class="main-sidebar sidebar-dark-primary elevation-4">
			<!-- Brand Logo -->
			<div id="fh5co-logo"><a href="./home.do">ImFind<span>.</span></a></div>

			<!-- Sidebar -->
			<div class="sidebar">
				<!-- Sidebar user (optional) -->
				<div class="user-panel mt-3 pb-3 mb-3 d-flex">
					<div class="image">
						<img
							src="${pageContext.request.contextPath}/resources/el/Admin_dist/img/user1.png"
							class="img-circle elevation-2" alt="User Image">
					</div>
					<div class="info">
						<a href="#" class="d-block">Admin</a>
					</div>
				</div>

				<!-- Sidebar Menu -->
				<nav class="mt-2">
					<ul class="nav nav-pills nav-sidebar flex-column"
						data-widget="treeview" role="menu" data-accordion="false">
						<li class="nav-header">관리자 메뉴</li>

						<li class="nav-item has-treeview"><a href="./admintest"
							class="nav-link"> <i class="nav-icon fas fa-tree"></i>
								<p>회원관리</p>
						</a></li>
						<li class="nav-item has-treeview"><a
							href="./admintest_payList" class="nav-link"> <i
								class="nav-icon fas fa-table"></i>
								<p>
									결제관리 <i class="fas fa-angle-left right"></i>
								</p>
						</a>
						
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="./admintest_payList"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>결제상태 리스트</p>
								</a></li>
								<li class="nav-item"><a href="./admintest_paidList"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>결제완료 리스트</p>
								</a></li>
								<li class="nav-item"><a href="./admintest_refundList"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>환불거래 리스트</p>
								</a></li>
								<li class="nav-item"><a href="./admintest_cancelList"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>환불완료 리스트</p>
								</a></li>
							</ul></li>
						<!-- 정산 사이드 메뉴 추가  -->
						<li class="nav-item has-treeview"><a
							href="./admintest_payList" class="nav-link"> <i
								class="nav-icon fas fa-table"></i>
								<p>
									정산관리 <i class="fas fa-angle-left right"></i>
								</p>
						</a>
						<ul class="nav nav-treeview">
								<li class="nav-item"><a href="./admintest_adjustmentList2"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>미정산 리스트</p>
								</a></li>
								<li class="nav-item"><a href="./admintest_adjustmentList"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>정산완료 리스트</p>
								</a></li>
							</ul></li>
						
					
					</ul>	<!-- 정산 사이트 메뉴 마암 -->
				</nav>
				<!-- /.sidebar-menu -->
			</div>
    <!-- /.sidebar -->
  </aside>
 
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>관리자페이지</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">관리자페이지</a></li>
              <li class="breadcrumb-item"><a href="#">결제관리</a></li>
              <li class="breadcrumb-item active">정산완료 리스트</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <!-- Default box -->
            <div class="card">
              <div class="card-header">
                	<h3 class="card-title">정산관리</h3>
				</div>
                <div class="card-tools">
                
              <!-- /.card-header -->
              <div class="card-body">
                <table id="output" class="table table-bordered table-hover">
                  <!-- <table id="output" class="table table-bordered table-hover"> -->
             	
                </table>
           
                
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->


<!-- 붙일 테이블 가져옴 끝. -->

<!-- Site wrapper -->
            <!--   </div> -->
              <!-- /.card-body -->
              
              <!-- /.card-footer-->
            </div>
            <!-- /.card -->
           </div>
        </div>
      </div>
    </section> 
    <!-- /.content -->
    </div>
  <!-- /.content-wrapper -->
</div>

  

  
  
<!-- jQuery -->
<script src="${pageContext.request.contextPath}/resources/el/Admin_plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${pageContext.request.contextPath}/resources/el/Admin_plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- DataTables -->
<script src="${pageContext.request.contextPath}/resources/el/Admin_plugins/datatables/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/el/Admin_plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/el/Admin_plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/el/Admin_plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath}/resources/el/Admin_dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="${pageContext.request.contextPath}/resources/el/Admin_dist/js/demo.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

 </body>






</html>

