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

/* jQuery(function($) { */
$(document).on('turbolinks:load', function() {
    if ( ! $.fn.DataTable.isDataTable('#registrations-table') ) {
        $('#registrations-table').dataTable( {
            processing: true,
            serverSide: true,
            ajax: {
            	url: '/registrations/datatables'
            },
            columns: [
                {data: 'registration_code'},
                {data: 'course_name'},
                {data: 'training_code'},
                {data: 'owner_name'},
                {data: 'registrant'},
                {data: 'paid_for'},
                {data: 'updated_at'},
                {data: 'edit_button', orderable: false, searchable: false }
            ],
        });
    }
});
/* }); */
