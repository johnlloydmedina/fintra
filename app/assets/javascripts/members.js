// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// app/assets/javascripts/members.js
$(document).on('turbolinks:load', function() {
    $('a[data-remote=true]').on('ajax:success', function(event) {
      var detail = event.detail;
      var data = detail[0], status = detail[1], xhr = detail[2];
      $('#memberModalBody').html(data);
      var editLink = $(data).find('#editMemberLink').attr('href');
      $('#editMemberLink').attr("href", editLink);
      $('#memberModal').modal('show');
    });
  });

  document.addEventListener("turbolinks:load", function() {
    $('.datepicker').datepicker({
      format: 'yyyy-mm-dd',
      startView: 2,
      startDate: '1900-01-01'
    });
  });
  