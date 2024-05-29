$(document).on('turbolinks:load', function() {
    $('a[data-remote=true]').on('ajax:success', function(event) {
      var detail = event.detail;
      var data = detail[0], status = detail[1], xhr = detail[2];
      $('#paymentModalBody').html(data);
      var editLink = $(data).find('#editPaymentLink').attr('href');
      $('#editPaymentLink').attr("href", editLink);
      $('#paymentModal').modal('show');
    });
  });


  document.addEventListener("turbolinks:load", function() {
    document.getElementById('member_select').addEventListener('change', function() {
      var memberId = this.value;
      var url = this.dataset.url;
      var loanSelect = document.getElementById('loan_select');
  
      if (memberId) {
        fetch(`${url}?member_id=${memberId}`)
          .then(response => response.json())
          .then(loans => {
            loanSelect.innerHTML = '<option value="">Select a loan</option>';
            loans.forEach(loan => {
              var option = document.createElement('option');
              option.value = loan.id;
              option.textContent = loan.control_number;
              loanSelect.appendChild(option);
            });
          })
          .catch(() => {
            loanSelect.innerHTML = '<option value="">Select a loan</option>';
          });
      } else {
        loanSelect.innerHTML = '<option value="">Select a loan</option>';
      }
    });
  });
  