// 시군구동 검색 
jQuery(document).ready(function(){
   listdata();

      var pet_Loc;
      var si;
      var gu;
      var dong;
  //sido option 추가
  jQuery.each(hangjungdong.sido, function(idx, code){
    //append를 이용하여 option 하위에 붙여넣음
    jQuery('#petsido').append(fn_option(code.sido, code.codeNm));
  });
  //sido 변경시 시군구 option 추가
  jQuery('#petsido').change(function(){
    jQuery('#petsigugun').show();
    jQuery('#petsigugun').empty();
    jQuery('#petsigugun').append(fn_option('','시/군/구 선택하세요'));
    jQuery('#petdong').empty();
    jQuery('#petdong').append(fn_option('','읍/면/동 선택하세요'));//
    jQuery.each(hangjungdong.sigugun, function(idx, code){
      if(jQuery('#petsido > option:selected').val() == code.sido)
        jQuery('#petsigugun').append(fn_option(code.sigugun, code.codeNm));
    });
    //세종특별자치시 예외처리
    //옵션값을 읽어 비교
    if(jQuery('#petsido option:selected').val() == '36'){
      jQuery('#petsigugun').hide();
      //index를 이용해서 selected 속성(attr)추가
      //기본 선택 옵션이 최상위로 index 0을 가짐
      jQuery('#petsigugun option:eq(1)').attr('selected', 'selected');
      //trigger를 이용해 change 실행
      jQuery('#petsigugun').trigger('change');
    }
    si = $('#petsido :selected').text();
    if(si=='시/도 선택하세요'){
       si = "";
    }
    Pet_Loc=si
    console.log(Pet_Loc)
  });
  //시군구 변경시 행정동 옵션추가
  jQuery('#petsigugun').change(function(){
    //option 제거
    jQuery('#petdong').empty();
    jQuery.each(hangjungdong.dong, function(idx, code){
      if(jQuery('#petsido > option:selected').val() == code.sido && jQuery('#petsigugun > option:selected').val() == code.sigugun)
        jQuery('#petdong').append(fn_option(code.dong, code.codeNm));
    });
    //option의 맨앞에 추가
    jQuery('#petdong').prepend(fn_option('','읍/면/동 선택하세요'));
    //option중 선택을 기본으로 선택
    jQuery('#petdong option:eq("")').attr('selected', 'selected');
    gu = $('#petsigugun :selected').text();
    if(gu=='시/군/구 선택하세요'){
       gu = "";
    }
    pet_Loc=si+gu
    console.log(pet_Loc)
  });
  jQuery('#petdong').change(function(){
    var sido = jQuery('#petsido option:selected').val();
    var sigugun = jQuery('#petsigugun option:selected').val();
    var dong = jQuery('#petdong option:selected').val();
    var dongCode = sido + sigugun + dong + '00';
    dong = $('#petdong :selected').text();
    if(dong=='읍/면/동 선택하세요'){
       dong = "";
    }
    pet_Loc=si+gu+dong
    console.log(pet_Loc)
  });
  $('.petselect').change(function(){
     if(pet_Loc==''){
        listdata();
      }
     $.ajax({
         url :'petsido.do',
         //type : 'POST',
         data : {'Pet_Loc': Pet_Loc },
         async:false,
         contentType: 'application/x-www-form-urlencoded;charset=utf-8',
         //dataType:'json',
         success: function(data){
            $('#petoutput').empty();
          
            $.each(data,function(index,item) {  
            	
                if(item.pet_Up_File == '0'){
                	pet_Up_File = '<img src="./resources/el/images/no_img.png"/>';
                }
                else{
                	pet_Up_File = item.pet_Up_File;
                }
                
               var output = '';
               output +='<tr><td><a href = "./petinfo?Pet_PostNum='+item.pet_PostNum+'">'+pet_Up_File+'</td>';
               output +='<td>'+(moment(item.pet_Date).format('YYYY-MM-DD'))+'</td>';
               output +='<td>'+item.pet_Title+'</td>';
               output +='<td>'+item.pet_Pay+'</td></tr>';
               $('#petoutput').append(output);
            });
            },
         error : function() {
            alert("ajax통신 실패2")
         }
   })
});
});
  function fn_option(code, name){
     return '<option value="' + code +'">' + name +'</option>';
   }
  function listdata() {
     $.ajax({
         url : '/imfind/petlist.do',
         contentType : 'application/x-www-form-urlencoded;charset=utf-8',
         success : function(data) {
            $('#petoutput').empty();
  
            $.each(data,function(index,item) {  
            	

                if(item.pet_Up_File == '0'){
                	pet_Up_File = '<img src="./resources/el/images/no_img.png"/>';
                }
                else{
                	pet_Up_File = item.pet_Up_File;
                }
                
               var output = '';
               output +='<tr><td><a href = "./petinfo?Pet_PostNum='+item.pet_PostNum+'">'+pet_Up_File+'</td>';
               output +='<td>'+(moment(item.pet_Date).format('YYYY-MM-DD'))+'</td>';
               output +='<td>'+item.pet_Title+'</td>';
               output +='<td>'+item.pet_Pay+'</td></tr>';
               $('#petoutput').append(output);
            });
         },
         error : function() {
            alert("ajax 통신 실패!!!");
         }
   });// ajax 끝.
}
       <!-- 민정 검색버튼 -->
      document.querySelector('.btn').addEventListener('click', function click() {
         var lost_Title = $("input[name=input-search]").val();
         if (lost_Title ==""){
            alert('검색어를 입력해주세요')
            return false;
         }//if 
         $.ajax({
              url : "/imfind/petsearch.do",
              contentType : 'application/x-www-form-urlencoded;charset=utf-8',
              data : { "Pet_Title" : Pet_Title },
              //type : 'POST',
              success : function(data) {
            $('#petoutput').empty();
            $.each(data,function(index,item) {   

                if(item.pet_Up_File == '0'){
                	pet_Up_File = '<img src="./resources/el/images/no_img.png"/>';
                }
                else{
                	pet_Up_File = item.pet_Up_File;
                }
               var output = '';
               output +='<tr><td><a href = "./petinfo?Pet_PostNum='+item.pet_PostNum+'">'+item.pet_Up_File+'</td>';
               output +='<td>'+(moment(pet.lost_Date).format('YYYY-MM-DD'))+'</td>';
               output +='<td>'+item.pet_Title+'</td>';
               output +='<td>'+item.pet_Pay+'</td></tr>';
               $('#petoutput').append(output);
            });
         },
         error : function() {
            alert("ajax 통신 실패!!!");
         },
         })
      })
      //엔터
function enterkey() {
    if (window.event.keyCode == 13) {
       var pet_Title = $("input[name=input-search]").val();
      if (pet_Title ==""){
         alert('검색어를 입력해주세요')
         return false;
      }//if 
      $.ajax({
           url : "/imfind/petsearch.do",
           contentType : 'application/x-www-form-urlencoded;charset=utf-8',
           data : { "Pet_Title" : Pet_Title },
           //type : 'POST',
          success : function(data) {
            $('#petoutput').empty();
            $.each(data,function(index,item) {   

                if(item.pet_Up_File == '0'){
                	pet_Up_File = '<img src="./resources/el/images/no_img.png"/>';
                }
                else{
                	pet_Up_File = item.pet_Up_File;
                }
               var output = '';
               output +='<tr><td><a href = "./petinfo?Pet_PostNum='+item.pet_PostNum+'">'+item.pet_Up_File+'</td>';
               output +='<td>'+(moment(item.pet_Date).format('YYYY-MM-DD'))+'</td>';
               output +='<td>'+item.pet_Title+'</td>';
               output +='<td>'+item.pet_Pay+'</td></tr>';
               $('#petoutput').append(output);
            });
         },
         error : function() {
            alert("ajax 통신 실패!!!");
         },
      });
    }
}
    //유희 추가함
      function getChangeDateString(originalDate){

    	var fromNow = moment(originalDate).startOf('day').fromNow();
    	console.log(fromNow)
    	var fromNowTrim = fromNow.substr(0, 2).trim();
    	console.log(fromNowTrim)
    	
    	if(fromNow.includes('days')){
    		if(fromNowTrim == '2' || fromNowTrim == '3' || fromNowTrim == '4' || fromNowTrim == '5' || fromNowTrim == '6'  ){
    			return fromNowTrim + '일전';
    			//$('#lost_Re_Date').text(fromNow +'일전');			
    		}
    		else{
    			return moment(originalDate).format('YYYY-MM-DD');
    			//$('#lost_Re_Date').text(moment(originalDate).format('YYYY-MM-DD'));			
    		}
    	}
    	else if(fromNow == 'a day ago'){
    		return '어제';
    		//$('#lost_Re_Date').text('어제');	
    	}
    	else if(fromNow.includes('hours')){
    		return fromNowTrim + '시간 전';
    		//$('#lost_Re_Date').text(fromNowTrim + ' 시간 전')
    		}
    }
