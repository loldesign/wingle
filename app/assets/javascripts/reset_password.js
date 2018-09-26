function disable(input_id) {
  $(input_id).prop('disabled', true);
  $(input_id).addClass( "disabled" );
}

function enable(input_id) {
  $(input_id).prop('disabled', false);
  $(input_id).removeClass( "disabled" );
}

$(document).on('turbolinks:load', function() {
  if (($("#reset_password #candidate_cpf").length > 0) && ($("#reset_password #candidate_email").length > 0)) {
    // if form returns error the page will have a cpf value so we disable email
    if ($("#candidate_cpf").val().length > 0) {
      disable("#candidate_email");
    } else if ($("#candidate_email").val().length > 0) {
      disable("#candidate_cpf");
    }

    $("#candidate_cpf").keyup(function(){
      if ($("#candidate_cpf").val().length > 0) {
        disable("#candidate_email");
      } else {
        enable("#candidate_email");
      }
    });

    $("#candidate_email").keyup(function(){
      if ($("#candidate_email").val().length > 0) {
        disable("#candidate_cpf");
      } else {
        enable("#candidate_cpf");
      }
    });
  }

  setTimeout(function() {
    $("#notice-wrapper").fadeOut(3000, function() {
      $(this).remove();
    })
  }, 4500);
});