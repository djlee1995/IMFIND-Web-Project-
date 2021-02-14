$(function() {

			memberList();
			
			
			
		});
function memberList() {
	
    var form = '<tr><th>회원ID</th><th>이름</th><th>연락처</th><th>email</th><th>계좌번호</th><th>은행명</th><th>예금주</th><th>가입일</th></tr>';
	$('thead').html(form);
	$("#output").DataTable({
		destroy: true,
		paging : true,
		"pageLength": 10,
		pagingType : "simple_numbers",
		"search": {
		    "caseInsensitive": false
		  },
		"ajax" : {
			"url" : "/imfind/adminmember2",
			"type" : "POST",
			"dataSrc" : function(res) {
				var form = '<tr><th>회원ID</th><th>이름</th><th>연락처</th><th>email</th><th>계좌번호</th><th>은행명</th><th>예금주</th><th>가입일</th></tr>';
				$('thead').html(form);
				console.log(res)
				var data = res.data;
				return data;
			}
		},
		"columns" : [ {
			"data" : "id"
		}, {
			"data" : "name"
		}, {
			"data" : "contact"
		}, {
			"data" : "email"
		}, {
			"data" : "account_Num"
		}, {
			"data" : "bank"
		}, {
			"data" : "account_holder"
		}, {
			"data" : "join_date"
		}, ]

	});

};

function payList() {
	$("#output").DataTable().rows().clear().draw();
	$("#output").DataTable().destroy().draw();
	var form = '<tr><th>회원ID</th><th>주문번호</th><th>결제금액</th><th>결제상태</th><th>결제승인시각</th></tr>';
	$('thead').html(form);
	$("#output").DataTable({
		destroy: true,
		paging : true,
		"pageLength" : 10,
		pagingType : "simple_numbers",
		"search": {
		    "caseInsensitive": false
		  },
		"ajax" : {
			"url" : "/imfind/adminpay2",
			"type" : "POST",
			"dataSrc" : function(res) {
				$('#title1').text('결제관리');
				$('#title2').text('결제관리');
				var form = '<tr><th>회원ID</th><th>주문번호</th><th>결제금액</th><th>결제상태</th><th>결제승인시각</th></tr>';
				$('thead').html(form);
				console.log("결제리스트" + res)
				var data = res.data;
				return data;
			}
		},
		"columns" : [ {
			"data" : "id"
		}, {
			"data" : "payCode"
		}, {
			"data" : "pay_Amount"
		}, {
			"data" : "pay_State"
		}, {
			"data" : "pay_Date"
		},

		]

	});

};

function paidList() {
	$("#output").DataTable().rows().clear().draw();
	$("#output").DataTable().destroy().draw();
	var form = '<tr><th>회원ID</th><th>주문번호</th><th>결제금액</th><th>결제상태</th><th>결제승인시각</th></tr>';
	$('thead').html(form);
	$("#output").DataTable({
		
		"destroy": true,
		paging : true,
		"pageLength" : 10,
		pagingType : "simple_numbers",
		"search": {
		    "caseInsensitive": false
		  },

		"ajax" : {
			"url" : "/imfind/adminpaid2",
			"type" : "POST",
			"dataSrc" : function(res) {
				$('#title1').text('결제관리');
				$('#title2').text('결제관리');
				var form = '<tr><th>회원ID</th><th>주문번호</th><th>결제금액</th><th>결제상태</th><th>결제승인시각</th></tr>';
				$('thead').html(form);
				var data = res.data;
				return data;
			}
		},
		"columns" : [ {
			"data" : "id"
		}, {
			"data" : "payCode"
		}, {
			"data" : "pay_Amount"
		}, {
			"data" : "pay_State"
		}, {
			"data" : "pay_Date"
		},

		]

	});

};
function refundList() {
	$("#output").DataTable().rows().clear().draw();
	$("#output").DataTable().destroy().draw();
	var form = '<tr><th>회원ID</th><th>주문번호</th><th>결제금액</th><th>결제상태</th><th>결제승인시각</th><th>환불버튼</th></tr>';
	$('thead').html(form);
	$("#output").DataTable({
		"destroy": true,
		paging : true,
		"pageLength" : 10,
		pagingType : "simple_numbers",
		"search": {
		    "caseInsensitive": false
		  },
		"ajax" : {
			"url" : "/imfind/adminrefund2",
			"type" : "POST",
			"dataSrc" : function(res) {
				$('#title1').text('결제관리');
				$('#title2').text('결제관리');
				var form = '<tr><th>회원ID</th><th>주문번호</th><th>결제금액</th><th>결제상태</th><th>결제승인시각</th><th>환불버튼</th></tr>';
				$('thead').html(form);
				var data = res.data;
				
				$.each(data, function(index, item){
						console.log(item)
	                   if (item.pay_State == 'refund'){
	                	   item['button'] = '<button type="button" id="cancelBtn" class="btn btn-outline-primary" onclick="cancelPay(event)">환불승인</button>';
	                   }
	                   
	            }); //each 끝 
				return data;
			}
		},
		"columns" : [ {
			"data" : "id"
		}, {
			"data" : "payCode"
		}, {
			"data" : "pay_Amount"
		}, {
			"data" : "pay_State"
		}, {
			"data" : "pay_Date"
		}, {
			"data" :"button"
       		}
		]
	});
};
function cancelPay(event){
    if(event.target.id == "cancelBtn"){
	        var id = event.target.parentElement.parentElement.childNodes[0].firstChild.data;   
	        var paycode = event.target.parentElement.parentElement.childNodes[1].firstChild.textContent;
	        
	         
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
	            cancel(id, paycode);
	            refundList();
	         
	         }).fail(function(error){ // 환불 실패시 로직
	            alert("환불 실패 : " + error);
	         });
    }
 }
function cancel(id, paycode){
    var params = {"Id" : id , "PayCode" : paycode};
       
    $.ajax({
      url : '/imfind/admincancel', 
      data :JSON.stringify(params),
      type : "POST",
      contentType :'application/json',
      success : function(data){
    
      }, //success 끝
      error:function(){
          alert("ajax통신 실패!!!");
      }// error 끝.
   });// ajax 끝
}
function cancelList() {
	$("#output").DataTable().rows().clear().draw();
	$("#output").DataTable().destroy().draw();
	var form = '<tr><th>회원ID</th><th>주문번호</th><th>결제금액</th><th>결제상태</th><th>결제승인시각</th><th>환불완료날짜</th></tr>';
	$('thead').html(form);
	$("#output").DataTable({
		clear:true,
		"destroy": true,
		paging : true,
		"pageLength" : 10,
		pagingType : "simple_numbers",
		 "search": {
			    "caseInsensitive": false
			  },
		"ajax" : {
			"url" : "/imfind/admincancleList",
			"type" : "POST",
			"dataSrc" : function(res) {
				$('#title1').text('결제관리');
				$('#title2').text('결제관리');
				var form = '<tr><th>회원ID</th><th>주문번호</th><th>결제금액</th><th>결제상태</th><th>결제승인시각</th><th>환불완료날짜</th></tr>';
				$('thead').html(form);
				var data = res.data;
				console.log(data)
				return data;
			}
		},
		"columns" : [ {
			"data" : "id"
		}, {
			"data" : "payCode"
		}, {
			"data" : "pay_Amount"
		}, {
			"data" : "pay_State"
		}, {
			"data" : "pay_Date"
		},  {
			"data" : "cancel_Date"
		}

		]

	});

};

function adjustmentList() {
	$("#output").DataTable().rows().clear().draw();
	$("#output").DataTable().destroy().draw();
	 var form ='<tr>'
			+'<th>글번호</th>'
			+'<th>파인더</th>'
			+'<th>거래상태</th>'
			+'<th>거래완료일</th>'
			+'<th>정산 금액</th>'
			+'<th>정산 계좌</th>'
			+'<th>은행</th>'
			+'<th>계좌주</th>'
			+'<th>정산 상태</th>'
			+'</tr>';
			$('thead').html(form);
	$("#output").DataTable({
		clear:true,
		"destroy": true,
		paging : true,
		"pageLength" : 10,
		pagingType : "simple_numbers",
		"search": {
		    "caseInsensitive": false
		  },
		"ajax" : {
			"url" : "/imfind/getAdjustmentList2",
			"type" : "POST",
			"dataSrc" : function(res) {
				$('#title1').text('정산관리');
				$('#title2').text('정산관리');
				var form ='<tr>'
   				+'<th>글번호</th>'
   				+'<th>파인더</th>'
   				+'<th>거래상태</th>'
   				+'<th>거래완료일</th>'
   				+'<th>정산 금액</th>'
   				+'<th>정산 계좌</th>'
   				+'<th>은행</th>'
   				+'<th>계좌주</th>'
   				+'<th>정산 상태</th>'
   				+'</tr>';
				$('thead').html(form);
				var data = res.data;
				console.log("미정산리스트" + res)
				$.each(data, function(index, item){
						console.log(item)
	                 if(item.lost_PostNum == null || item.lost_PostNum ==0){
	       item['postnum'] = item.pet_PostNum;
           item['button'] = '미정산' + '<button type="button" class="btn btn-outline-primary" value="승인"  onclick="giveMoenyPet()">정산</button></td>';

         }
         else{
        	 item['postnum'] = item.lost_PostNum;
            item['button'] = '미정산' + '<button type="button" class="btn btn-outline-primary" value="승인"  onclick="giveMoeny()">정산</button></td>';
         }
	                   
	            }); //each 끝 
				return data;
			}
		},
		"columns" : [ {
			"data" : "postnum"
		}, {
			"data" : "f_ID"
		}, {
			"data" : "deal_State"
		}, {
			"data" : "Deal_Date"
		}, {
			"data" : "pay_Amount"
		}, {
			"data" :"account_Num"
      		}
		, {
			"data" :"bank"
      		}
		, {
			"data" :"account_holder"
      		}
		, {
			"data" :"button"
      		}
		]
	});
};
function adjustmentList2() {
	$("#output").DataTable().rows().clear().draw();
	$("#output").DataTable().destroy().draw();
	 var form ='<tr>'
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
			+'</tr>';
			$('thead').html(form);
	$("#output").DataTable({
		clear:true,
		"destroy": true,
		paging : true,
		"pageLength" : 10,
		pagingType : "simple_numbers",
		"search": {
		    "caseInsensitive": false
		  },
		"ajax" : {
			"url" : "/imfind/getAdjustmentList",
			"type" : "POST",
			"dataSrc" : function(res) {
				$('#title1').text('정산관리');
				$('#title2').text('정산관리');
				var form ='<tr>'
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
		     		+'</tr>';
				$('thead').html(form);
				var data = res.data;
				console.log("미정산리스트" + res)
				$.each(data, function(index, item){
						console.log(item)
					    if(item.lost_PostNum == null || item.lost_PostNum ==0){
						       item['postnum'] = item.pet_PostNum;

					         }
					         else{
					        	 item['postnum'] = item.lost_PostNum;
					         }
						 if(item.adjustment_state == null){
				              adjustment_state = '미정산' + '<button type="button" value="승인" style="width:50px; height:30px;" onclick="giveMoeny()">정산</button></td>';
				              adjustment_date = '-'
				           }
				           else{
				              adjustment_state = '정산완료'
				                adjustment_date = moment(item.adjustment_date).format('YYYY-MM-DD');
				           }
	                   
	            }); //each 끝 
				return data;
			}
		},
		"columns" : [ {
			"data" : "postnum"
		}, {
			"data" : "f_ID"
		}, {
			"data" : "deal_State"
		}, {
			"data" : "Deal_Date"
		}, {
			"data" : "pay_Amount"
		}, {
			"data" :"account_Num"
      		}
		, {
			"data" :"bank"
      		}
		, {
			"data" :"account_holder"
      		}
		, {
			"data" :"adjustment_state"
      		}
		, {
			"data" :"adjustment_date"
      		}
		]
	});
};

function giveMoeny(){
    
    document.querySelector('#output').addEventListener('click', function(e){
         console.log(e.target)
         var postNum = e.target.parentElement.parentElement.childNodes[0].innerText
         var finder = e.target.parentElement.parentElement.childNodes[1].innerText
       
       
        $.ajax({
           url : '/imfind/giveMoney',
           contentType : 'application/x-www-form-urlencoded:charset=utf-8',
           data : {"Lost_PostNum" : postNum, "F_ID" : finder},
           success : function(data){
              console.log(data)
              adjustmentList();
           },
           error : function(){
             
           } 
       
        });
    });
 };
 
 function giveMoenyPet(){
	     
	     document.querySelector('#output').addEventListener('click', function(e){
	          console.log(e.target)
	          var postNum = e.target.parentElement.parentElement.childNodes[0].innerText
	          var finder = e.target.parentElement.parentElement.childNodes[1].innerText
	         
	        
	         $.ajax({
	            url : '/imfind/giveMoneyPet',
	            contentType : 'application/x-www-form-urlencoded:charset=utf-8',
	            data : {"pet_PostNum" : postNum, "F_ID" : finder},
	            success : function(data){
	               console.log(data)
	               adjustmentList();
	            },
	            error : function(){
	              
	            } 
	        
	         });
	     });
	  };