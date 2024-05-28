$(document).on('turbolinks:load', function() {
  $('#loan_type_id').on('change', function() {
    var loanDurations = $(this).data('loan-durations');
    var selectedLoanTypeId = $(this).val();
    var loanDuration = loanDurations[selectedLoanTypeId];

    $('#loan_duration').val(loanDuration || '');
  });
});

$(document).on('turbolinks:load', function() {
  $('a[data-remote=true]').on('ajax:success', function(event) {
    var detail = event.detail;
    var data = detail[0], status = detail[1], xhr = detail[2];
    $('#loanModalBody').html(data);
    var editLink = $(data).find('#editLoanLink').attr('href');
    $('#editLoanLink').attr("href", editLink);
    $('#loanModal').modal('show');
  });
});