$(document).ready(function () {

  // send an HTTP DELETE request for the sign-out link
  $('a#sign-out').on("click", function (e) {
    e.preventDefault();
    $.ajax({ 
      url: $(this).attr('href'), 
      type: 'delete'
      }).done(function () { window.location = "/"; });
  });

});
