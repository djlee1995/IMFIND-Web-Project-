(function($) {

	"use strict";

	var fullHeight = function() {

		$('.js-fullheight').css('height', $(window).height());
		$(window).resize(function(){
			$('.js-fullheight').css('height', $(window).height());
		});

	};
	fullHeight();

	$('#sidebarCollapse').on('click', function () {
      $('#sidebar').toggleClass('active');
      
  });

})(jQuery);


//(function(){
//	
//	window.addEventListener('resize', function(event){
//		console.log(window.innerWidth);
//		console.log(window.innerHeight);
//		
//		var widthSize = window.innerWidth;
//		if(widthSize)
//	});
//	
//})();