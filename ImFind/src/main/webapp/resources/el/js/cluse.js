
$("#nextBtn").click(function() {
	if ($("#check_1").is(":checked") == false) {
		alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다.");
		return;
	} else if ($("#check_2").is(":checked") == false) {
		alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다..");
		return;

	} else {
		$("#terms_form").submit();
	}
});
