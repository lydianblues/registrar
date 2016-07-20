jQuery(function($) {

	$("#registration-type").on("click", function() {
		
		var val = $("#registration-type input:checked", "#registration-type").val();
		alert(val);
	});

});
