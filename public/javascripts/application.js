$(document).ready(function() {

  $('#ajaxBusy').hide();

  $(document).ajaxStart(function(){ 
    $('#ajaxBusy').show(); 
  }).ajaxStop(function(){ 
   $('#ajaxBusy').fadeOut("slow");
  });

});
