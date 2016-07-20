jQuery(function($) {

	$(document).on('turbolinks:load', function() {

		$("#registration_registrant_email").parent().hide();
		$("#registration_group_handle").parent().hide();

		$("#registration-type").on("click", function() {

			var val = $("#registration-type input:checked").attr('value');

			if (val === 'single-self') {
				$("#registration_registrant_email").parent().hide();
				$("#registration_group_handle").parent().hide();
			} else if (val === 'single-other') {
				$("#registration_registrant_email").parent().show();
				$("#registration_group_handle").parent().hide();
			} else {
				$("#registration_registrant_email").parent().hide();
				$("#registration_group_handle").parent().show();
			}
		});
	});
	
});
