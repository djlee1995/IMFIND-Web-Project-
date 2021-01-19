
$(document).ready(function() {
	$.ajax({
		url :'datainfo.do',
		//type : 'POST',
		data : {'lost_PostNum': lost_PostNum },
		contentType: 'application/x-www-form-urlencoded;charset=utf-8',
		//dataType:'json',
		success: function(data){
			$.each(data, function(index,item){
				console.log(data)
				var output = '';
				output +='<tr style="font-size: large;"><td>'+ item.lost_PostNum + '</td></tr>';
				output +='<tr style="font-size: large;"><td>'+ item.lost_Title + '</td></tr>';
				output +='<tr style="font-size: large;"><td>'+ item.lost_Content + '</td></tr>';
				output +='<tr style="font-size: large;"><td>'+ item.lost_Re_Date + '</td></tr>';
				output +='<tr style="font-size: large;"><td>'+ item.lost_Re_Count + '</td></tr>';
				output +='<tr style="font-size: large;"><td>'+ item.lost_Content + '</td></tr>';
				output +='<tr><td><img width="300px"; height="300px"; src="'+ item.lost_Up_File + '"></td></tr>';
				output +='<tr style="font-size: large;"><td>'+ item.lost_Pay + '</td></tr>';
				output +='<tr style="font-size: large;"><td>'+ item.lost_Item + '</td></tr>';
				output +='<tr style="font-size: large;"><td>'+ item.lost_Loc + '</td></tr>';
				output +='<tr style="font-size: large;"><td>'+ item.lost_Date + '</td></tr>';
				output +='<tr style="font-size: large;"><td>'+ item.id + '</td></tr>';
				output +='<tr style="font-size: large;"><td>'+ item.contact + '</td></tr>';
				$('#data_output').append(output);
	
			});
			},
			
		error : function() {

			alert("ajax통신 실패2")

		}
		


	});
});