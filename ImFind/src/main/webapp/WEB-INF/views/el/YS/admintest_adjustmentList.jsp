<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
 <style type="text/css">
 
 .layout-boxed .wrapper, .layout-boxed .wrapper::before {
  margin: 0 auto;
  max-width:1850px !important; /*1250px*/
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
    
   //  var title ='<h1 style="margin-top:0px; margin-left:200px; width:500px;>결제관리</h1>'
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
    
    // $('#output').append(title);
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
              //console.log("output:" + output); //F12 개발자도구에서 볼수 있음 (dom 구조로 확인가능) 동적인 내용은 소스보기에서 볼수 없음
              $('#output').append(output); //추가
           }); //each 끝 
           }, //success 끝
           error:function(){
                alert("ajax통신 실패!!!");
       },// error 끝.
          complete : function(){ //등록글이 없으면, 페이지네이션이 계산할 tr카운팅수가 없으므로 무조건 수행 해도 상관 없다.
				// myfunction();  //위에 each가 반복문으로 계속 돌아 가니까 한번 돌때 마다. 카운팅하기때문이 주의!!!  그래서 밖으로 나옴. 페이지네이셔 호출! 
			     $('.dataTables_empty').remove()	
        	  var tfoot ='</tbody><tfoot><tr>'
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
        	  +'</tr></tfoot>';
        	  $('#output').append( tfoot );
			},
          
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
<%-- 
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
   %> --%>
   
<body class="hold-transition sidebar-mini layout-boxed">
<!-- Site wrapper -->
<div class="wrapper">
  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="../../index3.html" class="nav-link">Home</a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="#" class="nav-link">Contact</a>
      </li>
    </ul>

    <!-- SEARCH FORM -->
    <form class="form-inline ml-3">
      <div class="input-group input-group-sm">
        <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
        <div class="input-group-append">
          <button class="btn btn-navbar" type="submit">
            <i class="fas fa-search"></i>
          </button>
        </div>
      </div>
    </form>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <!-- Messages Dropdown Menu -->
      <li class="nav-item dropdown">
        <a class="nav-link" data-toggle="dropdown" href="#">
          <i class="far fa-comments"></i>
          <span class="badge badge-danger navbar-badge">3</span>
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
          <a href="#" class="dropdown-item">
            <!-- Message Start -->
            <div class="media">
              <img src="${pageContext.request.contextPath}/resources/el/Admin_dist/img/user1-128x128.jpg" alt="User Avatar" class="img-size-50 mr-3 img-circle">
              <div class="media-body">
                <h3 class="dropdown-item-title">
                  Brad Diesel
                  <span class="float-right text-sm text-danger"><i class="fas fa-star"></i></span>
                </h3>
                <p class="text-sm">Call me whenever you can...</p>
                <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
              </div>
            </div>
            <!-- Message End -->
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <!-- Message Start -->
            <div class="media">
              <img src="${pageContext.request.contextPath}/resources/el/Admin_dist/img/user8-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
              <div class="media-body">
                <h3 class="dropdown-item-title">
                  John Pierce
                  <span class="float-right text-sm text-muted"><i class="fas fa-star"></i></span>
                </h3>
                <p class="text-sm">I got your message bro</p>
                <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
              </div>
            </div>
            <!-- Message End -->
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <!-- Message Start -->
            <div class="media">
              <img src="${pageContext.request.contextPath}/resources/el/Admin_dist/img/user3-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
              <div class="media-body">
                <h3 class="dropdown-item-title">
                  Nora Silvester
                  <span class="float-right text-sm text-warning"><i class="fas fa-star"></i></span>
                </h3>
                <p class="text-sm">The subject goes here</p>
                <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
              </div>
            </div>
            <!-- Message End -->
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item dropdown-footer">See All Messages</a>
        </div>
      </li>
      <!-- Notifications Dropdown Menu -->
      <li class="nav-item dropdown">
        <a class="nav-link" data-toggle="dropdown" href="#">
          <i class="far fa-bell"></i>
          <span class="badge badge-warning navbar-badge">15</span>
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
          <span class="dropdown-item dropdown-header">15 Notifications</span>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <i class="fas fa-envelope mr-2"></i> 4 new messages
            <span class="float-right text-muted text-sm">3 mins</span>
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <i class="fas fa-users mr-2"></i> 8 friend requests
            <span class="float-right text-muted text-sm">12 hours</span>
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <i class="fas fa-file mr-2"></i> 3 new reports
            <span class="float-right text-muted text-sm">2 days</span>
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item dropdown-footer">See All Notifications</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">
          <i class="fas fa-th-large"></i>
        </a>
      </li>
    </ul>
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="../../index3.html" class="brand-link">
      <img src="${pageContext.request.contextPath}/resources/el/Admin_dist/img/AdminLTELogo.png"
           alt="AdminLTE Logo"
           class="brand-image img-circle elevation-3"
           style="opacity: .8">
      <span class="brand-text font-weight-light">AdminLTE 3</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="${pageContext.request.contextPath}/resources/el/Admin_dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block">Admin</a>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
        <li class="nav-header">관리자 메뉴</li>
       
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-chart-pie"></i>
              <p>
                Charts
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="../charts/chartjs.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>ChartJS</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../charts/flot.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Flot</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../charts/inline.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Inline</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item has-treeview">
            <a href="./admintest" class="nav-link">
              <i class="nav-icon fas fa-tree"></i>
              <p>
                	회원관리
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="./admintest" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>회원조회</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>회원2</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>회원3</p>
                </a>
              </li>
     
      
            </ul>
          </li> 
          <li class="nav-item has-treeview">
            <a href="./admintest_payList" class="nav-link">
              <i class="nav-icon fas fa-table"></i>
              <p>
               	결제관리
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="./admintest_payList" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>결제상태 리스트</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="./admintest_paidList" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>결제완료 리스트</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="./admintest_refundList" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>환불거래 리스트</p>
                </a>
              </li>
            </ul>
          </li>
          <!-- 정산 사이드 메뉴 추가  -->
            <li class="nav-item has-treeview">
            <a href="./admintest_adjustmentList" class="nav-link">
              <i class="nav-icon fas fa-table"></i>
              <p>
               	정산
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="./admintest_adjustmentList" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>정산관리</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>(예비 메뉴 1)</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>(예비 메뉴2)</p>
                </a>
              </li>
            </ul>
          </li>
          <!-- 정산 사이트 메뉴 마암 -->
          
    
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
            <h1>Boxed Layout</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">관리자페이지</a></li>
              <li class="breadcrumb-item"><a href="#">결제관리</a></li>
              <li class="breadcrumb-item active">정산  리스트  수정중</li>
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
                	<h3 class="card-title">Title: 정산관리</h3>
				</div>
                <div class="card-tools">
                
              <!-- /.card-header -->
              <div class="card-body">
                <table id="output" class="table table-bordered table-hover">
                  <!-- <table id="output" class="table table-bordered table-hover"> -->
             	<!--   <thead>
                  <tr>
                    <th>id</th>
                    <th>payCode</th>
                    <th>pay_Amount</th>
                    <th>pay_State</th>
                    <th>pay_Date</th>                    
                  </tr>
                  </thead>
                  <tbody></tbody>-->
                  <!-- <tbody></tbody>                  
                  <tbody id="output"> 
                  </tbody>
                  <tfoot>
                  <tr>
                    <th>id</th>
                    <th>name</th>
                    <th>contact</th>
                    <th>email</th>
                    <th>account_Num</th>
                    <th>bank</th>
                    <th>account_holder</th>
                    <th>join_date</th>
                  </tr>
                  </tfoot> -->
                </table>
           
                
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
<!-- </div> -->





<!-- 붙일 테이블 가져옴 끝. -->

<!-- Site wrapper -->
            <!--   </div> -->
              <!-- /.card-body -->
              <div class="card-footer">
                Footer
              </div>
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

  <footer class="main-footer">
    <div class="float-right d-none d-sm-block">
      <b>Version</b> 3.0.5
    </div>
    <strong>Copyright &copy; 2014-2019 <a href="http://adminlte.io">AdminLTE.io</a>.</strong> All rights
    reserved.
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
 <!--  </div> -->
<!-- ./wrapper -->


  
  
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
 </body>
<!-- 원글에 있던 (아래) -->
    <!-- Js Plugins -->
   <%--  <script src="${pageContext.request.contextPath}/resources/el/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/el/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/el/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/el/js/jquery.countdown.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/el/js/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/el/js/jquery.zoom.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/el/js/jquery.dd.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/el/js/jquery.slicknav.js"></script>
    <script src="${pageContext.request.contextPath}/resources/el/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/el/js/main.js"></script>
     --%>
    <!-- jQuery -->
  <!--   <script src="https://code.jquery.com/jquery-3.5.1.js"></script> -->
    <!-- DataTables -->
   <!--  <script src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.js"></script> -->
    
<%--    <script src="${pageContext.request.contextPath}/resources/el/YH/adminlte/plugins/datatables/jquery.dataTables.min.js"></script>
   <script src="${pageContext.request.contextPath}/resources/el/YH/adminlte/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
   <script src="${pageContext.request.contextPath}/resources/el/YH/adminlte/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
   <script src="${pageContext.request.contextPath}/resources/el/YH/adminlte/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script> --%>
   
    
     <!-- Header Section Begin -->
     <%--  <jsp:include page="${request.contextPath}/NewFooter_JS"></jsp:include> --%>
    <!-- Header End -->
   


<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script>
  $(function () {
  /*   $("#example1").DataTable({
      "responsive": true,
      "autoWidth": false,
    }); */
    $('#output').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false,
      "responsive": true,
    });
  });
</script>


</html>

