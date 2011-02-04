
      var _gaq = _gaq || [];
      _gaq.push(['_setAccount', 'UA-21195819-2']);
      _gaq.push(['_trackPageview']);

      (function() {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
      })();


$(document).ready(function() {

  $('#ajaxBusy').hide();

  $(document).ajaxStart(function(){ 
    $('#ajaxBusy').show(); 
  }).ajaxStop(function(){ 
   $('#ajaxBusy').fadeOut("slow");
  });

});
