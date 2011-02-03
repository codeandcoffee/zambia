$(document).ready(function() {

	$(".loadLocations").click(function(){
		$.get("location/list", function(data) {
			$("#locationList").html(data);
		});
	});

});