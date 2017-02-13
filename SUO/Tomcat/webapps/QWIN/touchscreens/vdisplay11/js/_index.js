  $(function() {
   lalafunc(768);
    App.run(6);
    (function getstart() {
	
      var data = {};
      $.ajax( "/touchscreens/vdisplay/includes/get.qsp2", {
        cache: false,
        data: data,
        dataType: "json",
        error: errorHandler,
        success: success
      });
    })();
 
    function success( data ) {
      $("#inside_strok").text(data.strok);
      //$("#strok").text(data.strok);
    };
	 function errorHandler() {
      
    }
    var glob_time = 10;
    function lalafunc(a)
    {
    el=document.getElementById('strok');
    el.style.left=a+"px";
    a=a-1;
    if(a==-(el.offsetWidth*1))  
    {
      a=768;
      glob_time--;
      if(glob_time<=0)
        {
          glob_time = 10;
          getstart();
          function getstart() {
            var data = {};
            $.ajax( "/touchscreens/vdisplay/includes/get.qsp2", {
            cache: false,
            data: data,
            dataType: "json",
            success: function(data){
              $("#inside_strok").text(data.strok);
            }
            });
          };
        }
      }
      setTimeout(function(){
        lalafunc(a);
      },10);
    }
    
  });