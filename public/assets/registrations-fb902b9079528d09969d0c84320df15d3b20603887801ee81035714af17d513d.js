jQuery(function($) {

	setTimeout(function() {

		// These inner checks for a element "ready" are needed because
		// these elements are created by javascript in SimpleForm.  If
		// that javascript is not yet done, the elements won't be on the
		// page, so that we can attach the event handlers.

		$("#registration_registerable_type_group").ready(function() {
			$("#registerable_group").parent().hide();
			$("#registration_registerable_type_group").change(function() {
				$("#registerable_student").parent().hide();
				$("#registerable_group").parent().show();
			});
		});

		$("#registration_registerable_type_student").ready(function() {
			$("#registration_registerable_type_student").prop('checked', true);
			$("#registration_registerable_type_student").change(function() {
				$("#registerable_student").parent().show();
				$("#registerable_group").parent().hide();
			});
		});
	}, 1000);

});
