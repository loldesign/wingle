$(document).ready(function() {
  if (($("#candidate_cpf").length > 0) && ($("#candidate_email").length > 0)) {
    $("#candidate_cpf").keyup(function(){
      if ($("#candidate_cpf").val().length > 0) {
        $("#candidate_email").prop('disabled', true);
        $("#candidate_email").addClass( "disabled" );
      } else {
        $("#candidate_email").prop('disabled', false);
        $("#candidate_email").removeClass( "disabled" );
      }
    });

    $("#candidate_email").keyup(function(){
      if ($("#candidate_email").val().length > 0) {
        $("#candidate_cpf").prop('disabled', true);
        $("#candidate_cpf").addClass( "disabled" );
      } else {
        $("#candidate_cpf").prop('disabled', false);
        $("#candidate_cpf").removeClass( "disabled" );
      }
    });
  }
});