
$(document).on('turbolinks:load', function() {
    if ( ! $.fn.DataTable.isDataTable('#transactions-table') ) {

        $('#transactions-table').dataTable( {
            processing: true,
            serverSide: true,
            ajax: {
                url: '/transactions/datatables',
                processing: true,
                serverSide: true
            },
            columns: [
                {data: 'payment_transaction_id'},
                {data: 'registration_code'},
                {data: 'owner_name'},
                {data: 'registerable_name'},
                {data: 'payment_type'},
                {data: 'status'},
                {data: 'payer_name'},
                {data: 'amount'},
                {data: 'created_at'},
                {data: 'updated_at'},
                {data: 'refresh_button', orderable: false, searchable: false }
            ],

        });
    }
});
