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
			//console.log(data);
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
			else{
				window.location.href = "index";
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
	console.log(flag);
	
	if(flag){
		loginValidate(loginBoxElem);
	}
}	
		
function kakaoLogin(){
	
	$.ajax({
		url : "./el/getKakaoAuthUrl",
		type : "GET",
		success : function(data){
			console.log(data);
			location.href = data;
		}
	});
}

function openModal(){
	const modal = document.querySelector('.modal_overlay');
	modal.classList.remove("hidden");
}
function closeModal(){
	const modal = document.querySelector('.modal_overlay');
	modal.classList.add("hidden");	
}


function find_id(){
	
	const IDbtn = document.querySelector('.find-btn.id');
	
	IDbtn.addEventListener('click', function(e){
		
		e.preventDefault();
		const formElem = document.querySelector('#getID');
		
		console.log(formElem);
		// 아이디, 비번 찾기 ajax
	});
}
function sendEmailForID (e){
	e.preventDefault();

	var inputs = e.target.parentElement.querySelectorAll('input');
	var name = inputs[0].value;
	var email = inputs[1].value;
	
	const parentNode = document.querySelector('.group-input.input');
	var data = {"name" : name, "email" : email};
	
	$.ajax({
		url : "./findIDAuth",
		type : "POST",
		data : JSON.stringify(data),
		contentType : 'application/json',
		beforeSend : function (){
			alert('before');
			var elems = document.querySelectorAll('.input-code');
			for(let i = 0; i < elems.length; i++){
				elems[i].classList.remove('hidden');
			}
		},
		success : function(res){
			
		}, 
		error : function(){
			console.log("아이디 찾기 통신 실패");
		}
	});
}
function sendEmailForPW (e){
	
}
	
function clickHandler(e){
	
	const modal = document.querySelector('.modal_overlay');
	
	let elem = e.target;
	
	// 모달창
	if(elem.className == "forget-pass"){
		openModal();
	}
	if(elem.className == "close"){
		closeModal();
	}
	if(elem.className == "find-btn id"){
		sendEmailForID(e);
	}
	if(elem.className == "find-btn pw"){
		sendEmailForPW(e);
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