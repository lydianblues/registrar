jQuery(function($) {
	$(document).on('turbolinks:load', function() {
		if ($("#training_online").is(":checked")) {
			$(".in-person-only").hide();
		}
		$("#training_online").click(function() {
			if (this.checked) {
				$(".in-person-only").hide();
			} else {
				$(".in-person-only").show();
			}
		});

	});
});