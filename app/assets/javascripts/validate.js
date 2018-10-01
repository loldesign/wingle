var validate = function(){
  $('#validate-form-button').click(function (event) {
    event.preventDefault();
    submitButton($(this));
  });

  submitButton = function($btn) {
    if(validateForm()) {
      $btn.closest('form').submit()
    } else {
      validateForm()
    }
  }
}

// Validate Form //
function validateForm($btn) {
  var errors = 0;
  $(".validate").map(function(){
     if( !$(this).val()) {
          $(this).addClass('warning');
          $(this).parent().find(".error-message").removeClass("hide")
          errors++;
    } else if ($(this).val()) {
          $(this).removeClass('warning');
          $(this).parent().find(".error-message").addClass("hide")
    }   
  });

  if(errors > 0){
    return false;
  } else {
    return true;
  }
}