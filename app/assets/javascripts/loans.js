$(document).on('turbolinks:load', function() {
  $('#loan_type_id').on('change', function() {
    var loanDurations = $(this).data('loan-durations');
    var selectedLoanTypeId = $(this).val();
    var loanDuration = loanDurations[selectedLoanTypeId];

    $('#loan_duration').val(loanDuration || '');
  });
});
