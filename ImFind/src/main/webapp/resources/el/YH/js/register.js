	function chkPW(e){

		 var pw = $("#pass").val();
		 var num = pw.search(/[0-9]/g);
		 var eng = pw.search(/[a-z]/ig);
		 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	
		 if(pw.length < 10 || pw.length > 20){
		  alert("10자리 ~ 20자리 이내로 입력해주세요.");
		  return false;
		 }else if(pw.search(/\s/) != -1){
		  alert("비밀번호는 공백 없이 입력해주세요.");
		  return false;
		 }else if( (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0) ){
		  alert("영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
		  return false;
		 }else {
			console.log("통과");	 
			
		 }
	}
	function getTime(){
		
		var time = new Date();
		y = time.getFullYear();
		m = time.getMonth() + 1;
		d = time.getDay();
		
		if(m < 10){
			m = "0" + String(m);
		}
		if(d < 10){
			d = "0" + String(d);
		}
		
		h = time.getHours();
		min = time.getMinutes(); 
		s = time.getSeconds();
		var date = String(y)+String(m) + String(d) + String(h) + String(min) + String(s);
		return date;
	}

	function getBankToken(){
		
		$.ajax({
			url : './getAuthorize',
			type : 'GET',
			success : function(data){
				window.open(data)
			}, 
			error : function(){
				alert('통신dd 실패')
			}
		})   
	}
	function bankList(){
		
		// 은행 조회 코드
		const defaultOption = document.querySelector('#inputGroupSelect01');
		
		for(key in bank) {
			var option = document.createElement('option');
			option.value = key;
			option.setAttribute('name', 'bank');
			option.innerText = bank[key];
			defaultOption.appendChild(option);
		}
	}
	function getBank(){
		const options = document.querySelector('.custom-select');
		var index = options.selectedIndex;
		var bankName = options[index].text;
		
		const inputElem = document.querySelector('input[name="bank"]');
		inputElem.value = bankName;
		inputElem.innerText = bankName;
	}
	function optionStyle(e){
		
		var index = e.target.options.selectedIndex;
		var options =  e.target.options
		var bankCode = options[index].value;
		var bankName = options[index].text;
		
/* 		var inputElem = document.createElement('input');
		inputElem.setAttribute('type','hidden');
		inputElem.setAttribute('name', bank)
		inputElem.value = bankCode; */
		
		//const parentNode = document.querySelector('.box.account');
		//e.target.options[index].append(inputElem);
	}
	
	// input type = number 자릿수 제한.
  	function maxLengthCheck(object){
	    if (object.value.length > object.maxLength){
	      object.value = object.value.slice(0, object.maxLength);
	    }    
	}
	function getName(e){
		console.log(e.target.value)
		const account_holder = document.querySelector('input[name="account_holder"]');
		account_holder.innerText = e.target.value;
		account_holder.value = e.target.value;
	}
	function chkEqualpw(){
		
		 var pwd1 = $("#pass").val();
	     var pwd2 = $("#pass2").val();
	     
	     if ( pwd1 != '' && pwd2 == '' ) {
	            null;
         } else if (pwd1 != "" || pwd2 != "") {
            if (pwd1 == pwd2) {
                alert("비밀번호가 일치합니다.");
            } else {
                alert("비밀번호가 일치하지 않습니다. 비밀번호를 재확인해주세요.");
            }
        }
	}
	function chkID(e){
		var id = e.target.value;
		console.log(e.target)
		
		$.ajax({
			url : './chkID',
			data : {'id' : id},
			beforeSend : function(xhr){
				if(e.target.value == ""){
					e.target.style = "border: 1px solid #ebebeb";
					e.target.nextElementSibling.innerText = '';
					 xhr.abort();
				}
			},
			success : function(data){
				if(data == 'ok'){
					e.target.style = "border: 1px solid #A5FA52;";
					e.target.nextElementSibling.innerText = '사용가능한 아이디 입니다.'
				}
				else{
					e.target.style = "border: 1px solid #F59991;";
					e.target.nextElementSibling.innerText = '중복된 아이디 입니다.';
					e.target.value = '';
					e.target.setAttribute('placeholder', '새로운 아이디를 입력해 주세요.');
				}
			}, 
			error : function(){
				alert('id 중복검사 통신 실패')
			}
		})
	}
	
/*	function getPhone(e){
		var phone = e.target.value;
		const phoneElem = document.querySelector('input[name="contact"]');
		phoneElem.value = phone.replaceAll('-', '');
		console.log(e.target.value)
	}
	*/

	
/* 	// 계좌인증
	const accountElem = document.querySelector('.certification-api.account');
	accountElem.addEventListener('click', getBankToken()); */

	/*      
	var $authorizeFrm = $('#authorizeFrm');
	window.open('', '_authForm');
	$authorizeFrm.submit();  
	 */
	
	
	var bank = {
				  "001": "한국은행",
				  "002": "산업은행",
				  "003": "기업은행",
				  "004": "국민은행",
				  "005": "외환은행",
				  "006": "국민은행",
				  "007": "수협중앙회",
				  "008": "수출입은행",
				  "009": "수협중앙회",
				  "010": "농협은행",
				  "011": "농협중앙회",
				  "020": "우리은행",
				  "023": "제일은행",
				  "027": "씨티은행",
				  "031": "대구은행",
				  "032": "부산은행",
				  "034": "광주은행",
				  "035": "제주은행",
				  "037": "전북은행",
				  "039": "경남은행",
				  "045": "새마을금고중앙회",
				  "048": "신협중앙회",
				  "050": "상호저축은행",
				  "052": "모간스탠리은행",
				  "054": "HSBC은행",
				  "055": "도이치은행",
				  "056": "알비에스피엘씨은행",
				  "057": "제이피모간체이스은행",
				  "058": "미즈호은행",
				  "059": "미쓰비시도쿄UFJ은행",
				  "060": "BOA은행",
				  "061": "비엔피파리은행",
				  "062": "중국공상은행",
				  "063": "중국은행",
				  "064": "산림조합중앙회",
				  "065": "대화은행",
				  "071": "우체국",
				  "076": "신용보증기금",
				  "077": "기술보증기금",
				  "081": "하나은행",
				  "088": "신한은행",
				  "092": "한국정책금융공사",
				  "093": "한국주택금융공사",
				  "094": "서울보증보험",
				  "095": "경찰청",
				  "096": "한국전자금융(주)",
				  "099": "금융결제원"
		}

	// MJ Email chk
	   function chkEmail(e){
	      var email = e.target.value;
	      
	      
	      $.ajax({
	         url : './chkEmail',
	         data : {'email' : email},
	         beforeSend : function(xhr){
	            if(e.target.value == ""){
	               e.target.style = "border: 1px solid #ebebeb";
	               e.target.innerText = '';
	                xhr.abort();
	            }
	         },
	         success : function(data){
	            if(data == 'ok'){
	               e.target.style = "border: 1px solid #A5FA52;";
	               console.log(e.target)
	               e.target.nextElementSibling.innerHTML = '사용가능한 이메일 입니다.'   
	               
	            }
	            else{
	            
	               e.target.style = "border: 1px solid #F59991;";
	               e.target.nextElementSibling.innerHTML = '중복된 이메일입니다.'
	               e.target.value = ''; 
	               e.target.setAttribute('placeholder', '새로운 이메일을 입력해 주세요.');
	            }
	         }, 
	         error : function(){
	            alert('email 중복검사 통신 실패')
	         }
	      })
	   }
