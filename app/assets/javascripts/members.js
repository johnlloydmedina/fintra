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

  // document.addEventListener("turbolinks:load", function() {
  //   $('.datepicker').datepicker({
  //     format: 'yyyy-mm-dd',
  //     startView: 2,
  //     startDate: '1900-01-01'
  //   });
  // });
  
  document.addEventListener("turbolinks:load", function() {
    $('.datepicker').datepicker({
      format: 'yyyy-mm-dd',
      startView: 1,
      startDate: '1900-01-01',
      todayBtn: "linked",
      todayHighlight : true,
      autoclose: true
    }).on('changeDate', function(e) {
      var birthdate = e.format();
      if (birthdate) {
        var birthDateObj = new Date(birthdate);
        var age = calculateAge(birthDateObj);
        $('#age-field').val(age);
      }
    });
  
    function calculateAge(birthDate) {
      var today = new Date();
      var age = today.getFullYear() - birthDate.getFullYear();
      var monthDifference = today.getMonth() - birthDate.getMonth();
      if (monthDifference < 0 || (monthDifference === 0 && today.getDate() < birthDate.getDate())) {
        age--;
      }
      return age;
    }
  });
  