
$(document).ready(function() {
	$.ajax({
		url :'imfind/datainfo',
		//type : 'POST',
		data : {'lost_PostNum': lost_PostNum },
		contentType: 'application/x-www-form-urlencoded;charset=utf-8',
		//dataType:'json',
		success: function(data){
			
			},
			
		error : function() {

			alert("ajax통신 실패2")

		}
	

});
});