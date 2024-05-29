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


  $(document).on('turbolinks:load', function() {
    var loanTypeSelect = $('#loan_type_id');
    var loanAmountInput = $('#loan_amount');
    var loanBalanceInput = $('#loan_balance');
    
    var loanDurations = loanTypeSelect.data('loan-durations');
    var loanInterests = loanTypeSelect.data('loan-interests');

    function updateLoanDetails() {
      var selectedLoanTypeId = loanTypeSelect.val();
      
      var loanDuration = loanDurations[selectedLoanTypeId];
      $('#loan_duration').val(loanDuration || '');

      var loanAmount = parseFloat(loanAmountInput.val());
      if (selectedLoanTypeId && !isNaN(loanAmount)) {
        var interestRate = loanInterests[selectedLoanTypeId] || 0;
        var loanBalance = loanAmount + (loanAmount * interestRate / 100);
        loanBalanceInput.val(loanBalance.toFixed(2));
      } else {
        loanBalanceInput.val('');
      }
    }

    loanTypeSelect.on('change', updateLoanDetails);
    loanAmountInput.on('input', updateLoanDetails);
  });
