 function loadinner(el,data) //Загрузка данных в элемент
		{
				 document.getElementById(el).innerHTML=data;
		 }
		
  
  
  $( function() {
    getstart();
    function getstart() {
	
      var data = {};
      $.ajax( "/touchscreens/vdisplay/includes/get.qsp2", {
        cache: false,
        data: data,
        dataType: "json",
        error: errorHandler,
        success: success
      } );
	  
    };
 
    function success( data ) {
		loadinner("inside_strok",data.strok);
	
    }
	function errorHandler() {
      
    }
 
  } );