$(document).ready(function() {

	$(".loadLocations").click(function(){
		$.get("location/list", function(data) {
			$("#locationList").html(data);
		});
	});
	
	$(".loadNews").click(function(){
		$.get("posts/list", function(data) {
			$("#newsList").html(data);
		});
	});

});