function countdown(remTime, str){
	
	console.log(str);
	
	var s = Math.floor(remTime/1000); 
	var m = Math.floor(s/60);

	m %= 60;
	s %= 60;

    m = (m < 10) ? "0" + m : m;
    s = (s < 10) ? "0" + s : s;
    
    document.querySelector(str).innerHTML = m + ':' + s;

    if(remTime == 0){
    	
    	sessionStorage.removeItem("code");
    	sessionStorage.removeItem("findID");
    	
    	const inputField = document.querySelector('#code-id');
    	
    	inputField.innerText = '';
    	inputField.setAttribute('placeholder','인증코드 입력시간이 만료되었습니다.' );

    	return;
    }
    
    remTime = remTime - 1000;
    setTimeout(countdown, 1000, remTime, str);
};

function createCodeInputBox(remTime, str){
	
	const elem =  document.querySelector(str);
	
	countdown(remTime, str); 
};

function loginValidate(loginBoxElem){

	var id = loginBoxElem.elements[0];
	var pw = loginBoxElem.elements[1];
	
	const labelForID = loginBoxElem.querySelector('#username');
	const labelForPW = loginBoxElem.querySelector('#pass');
	const inputElem = document.querySelector('.group-input.pass');
	
	$.ajax({
		
	    url: "/imfind/loginCheck", 
	    data: { "id": id.value,
	    		"pw": pw.value},  
	    type: "POST",     
		success : function(data){
			if(data == 'unpass'){

				id.setAttribute("style", " border: 1px solid red;");
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
			else if('pass'){
				window.location.href = "./";
			}
			else{
				window.location.href = data;
			}
		},
		error : function(){
			console.log("통신 실패");
		}
	});
}
		
function loginBoxNotNullCheck(id, pw){
	
	if(id.value == ""){
		id.setAttribute("style", " border: 1px solid red;");
	}
	else{
		id.setAttribute("style", " border: 1px solid #ebebe;");
	}
	if(pw.value == ""){
		pw.setAttribute("style", " border: 1px solid red;");
	}
	else{
		pw.setAttribute("style", " border: 1px solid #ebebe;");
	}
	if(id.value != "" && pw.value != ""){
		
		id.setAttribute("style", " border: 1px solid #ebebe;");
		pw.setAttribute("style", " border: 1px solid #ebebe;");
		
		return true;			
	}		
	return false;
}
		
function loginSubmit(e){
	
	e.preventDefault();
	
	var loginBoxElem = document.querySelector('#loginForm');
	var id = loginBoxElem.elements[0];
	var pw = loginBoxElem.elements[1];		
	
	var flag = loginBoxNotNullCheck(id, pw);
	
	if(flag){
		loginValidate(loginBoxElem);
	}
}	
		
function kakaoLogin(){
	
	$.ajax({
		url : "./el/getKakaoAuthUrl",
		type : "POST",
		success : function(data){
			location.href = data;
		}
	});
}


/* 이메일 인증 코드 input 박스 border color 변경*/
function resetBorderColor (e, color){
	
	var inputNodes = e.target.parentElement.previousElementSibling.getElementsByTagName('input');
	//console.log(inputNodes)
	inputNodes[0].style.border = '1px solid ' + color;
	inputNodes[1].style.border = '1px solid ' + color;
}

/* 존재하지 않는 이름, 이메일 입력시 */
function createCodeFail (e){
	resetBorderColor(e, 'red');
} 

/* 인증번호 발송 클릭 -> 존재하는 이름, 이메일 입력시  */
function createCodeSuccess(e, input, show_tag){
	
	var inputField = document.querySelector(input);
	// 인증코드 입력창 초기화
	resetBorderColor(e, "#ebebeb")
	inputField.setAttribute('placeholder', '이메일로 발송된 인증코드를 입력해주세요.')
	inputField.value = '';
	
	var elems = document.querySelectorAll('.' + show_tag);
	for(let i = 0; i < elems.length; i++){
		elems[i].classList.remove(show_tag);
	}
}
function resetInputCodeBox(){
	var inputs = document.querySelector('.find-id').getElementsByTagName('input')
	var inputsPW = document.querySelector('.find-id.pw').getElementsByTagName('input')
	
	for(let i = 0; i < inputs.length; i++){
		inputs[i].value = "";
		inputsPW[i].value = "";
	}
	var timer = document.querySelector('#code-id-inputfield');
	timer.innerText = "00:00"
	var timerPW = document.querySelector('#code-pw-inputfield');
	timerPW.innerText = "00:00"
}


function openModal(classname){
	const modal = document.querySelector(classname);
	modal.classList.remove("hidden");
}
function closeModal(classname){
	const modal = document.querySelector(classname);
	modal.classList.add("hidden");	
	resetInputCodeBox();
}

function sendEmailForID (e){

	console.log(e.target);
	var inputs = e.target.parentElement.previousElementSibling.querySelectorAll('input');
	var name = inputs[0].value;
	var email = inputs[1].value;
	
	const parentNode = document.querySelector('.group-input.input');
	var data = {"name" : name, "email" : email};
	
	$.ajax({
		url : "./findIDAuth",
		type : "POST",
		data : JSON.stringify(data),
		contentType : 'application/json',
		
		success : function(data){

			if(data.res == "ok"){
				
				//db 정보와 일치하면 세션에 인증코드, 아이디 저장
				sessionStorage.setItem("code", data.code)
				sessionStorage.setItem("findID", data.findID)
				sessionStorage.setItem("email", data.email)
				// border 색상 초기화
				resetBorderColor(e, "#ebebeb") 
				
				// 인증번호 입력창 생성
				createCodeSuccess(e, '#code-id', "input-code-id");
				
			    //인증 코드 입력 유효시간 타이머
				createCodeInputBox(180000, '#code-id-inputfield');
			}
			else{
				createCodeFail(e);
			}
		}, 
		error : function(){
			console.log("아이디 찾기 통신 실패");
		}
	});
}
function sendEmailForPW(e){
	console.log(e.target);
	var inputs = e.target.parentElement.previousElementSibling.querySelectorAll('input');
	var id = inputs[0].value;
	var email = inputs[1].value;
	
	const parentNode = document.querySelector('.group-input.input');
	var data = {"id" : id, "email" : email};
	
	$.ajax({
		url : "./findPWAuth",
		type : "POST",
		data : JSON.stringify(data),
		contentType : 'application/json',
		
		success : function(data){
			//alert(data.code);
			if(data.res == "ok"){
				//db 정보와 일치하면 세션에 인증코드, 아이디 저장
				sessionStorage.setItem("code", data.code)
				sessionStorage.setItem("findID", data.id)
				sessionStorage.setItem("email", data.email)
				// border 색상 초기화
				resetBorderColor(e, "#ebebeb") 
				
				// 인증번호 입력창 생성
				createCodeSuccess(e, '#code-pw', 'input-code-pw');
				
			    //인증 코드 입력 유효시간 타이머
				createCodeInputBox(180000, '#code-pw-inputfield');
			}
			else{
				createCodeFail(e);
			}
		}, 
		error : function(){
			console.log("아이디 찾기 통신 실패");
		}
	});
}

function clickHandler(e){
	//console.log(e.target);
	
	let elem = e.target;
	
	// 모달창 열고, 닫기
	if(elem.className == "fas fa-times close"){
		closeModal('.modal_overlay-1');
		closeModal('.modal_overlay-2');
		closeModal('.modal_overlay-3');

	}
	if(elem.className == "forget-pass"){
		openModal('.modal_overlay-1');
	}
	
	if(elem.className == "give-me id"){ // 아이디 찾기
		closeModal('.modal_overlay-1');
		openModal('.modal_overlay-2');
	}
	if(elem.className == "give-me pw"){ // 비번 찾기
		closeModal('.modal_overlay-1');
		openModal('.modal_overlay-3');
	}
	
	if(elem.className =="fas fa-chevron-left"){ // 뒤로가기
		closeModal('.modal_overlay-2');
		openModal('.modal_overlay-1');
	}
	if(elem.className =="fas fa-chevron-left 2"){ // 뒤로가기
		closeModal('.modal_overlay-3');
		openModal('.modal_overlay-1');
	}
	if(elem.className == "link-tag find-pw"){ // 비밀번호 찾기 링크
		closeModal('.modal_overlay-2');
		openModal('.modal_overlay-3');
	}
	if(elem.className == "link-tag find-id"){ // 아이디 찾기 링크
		closeModal('.modal_overlay-3');
		openModal('.modal_overlay-2');
	}
	
	// 이메일 인증 코드 발송
	if(elem.className == "find-btn id"){
		sendEmailForID(e);
	}
	if(elem.className == "find-btn pw"){
		sendEmailForPW(e);
	}
	// 아이디 찾기 코드 입력
	if(elem.id == 'submit-btn-1'){
		var userInputCode = document.querySelector('#code-id');
		
		// 코드 일치 
		if(userInputCode.value == sessionStorage.getItem('code')){ 
			
			$.ajax({
				url : "./sendUserID",
				type : "POST",
				data : {"email" : sessionStorage.getItem("email"),
						"id" : sessionStorage.getItem("findID")},
				success : function(){
					//alert('ok');
					alert('회원님의 이메일로 아이디가 전송되었습니다.');
				},
				error : function(){
					alert('시스템 오류 입니다. ');
				},
				complete : function(){
					sessionStorage.clear();
					closeModal('.modal_overlay-2');
				}
			});
		}
	}
	if(elem.id == 'submit-btn-2'){
	var userInputCode = document.querySelector('#code-pw');
		// 코드 일치 
		if(userInputCode.value == sessionStorage.getItem('code')){ 
			//alert('일치');
			$.ajax({
				url : "./sendUserPW",
				type : "POST",
				data : {"email" : sessionStorage.getItem("email"),
						"id" : sessionStorage.getItem("findID")},
				success : function(data){
					//alert('쿼리 결과 ' + data);
					if(data == 'ok'){
						alert('회원님의 이메일로 임시 비밀번호가 전송되었습니다.');
					}
					else{
						//alert('db 오류요')
					}
				},
				error : function(){
					alert('시스템 오류 입니다. ');
				},
				complete : function(){
					sessionStorage.clear();
					closeModal('.modal_overlay-3');
				}
			});
		}
	}
	
	// 로그인 
	if(elem.className == "site-btn login-btn"){
		loginSubmit(e);
	}
	if(elem.id == "kakao-login-btn"){
		kakaoLogin();
	}
}


document.addEventListener("DOMContentLoaded", function() {
	// click 이벤트
	const body = document.querySelector('body');
	body.addEventListener('click', clickHandler);
	 
});