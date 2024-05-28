// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
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