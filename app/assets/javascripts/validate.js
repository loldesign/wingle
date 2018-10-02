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

validateRadio = function() {
  var check = true;
  $("input:radio").each(function(){
      var name = $(this).attr("name");
      if($('input:radio[name="'+name+'"]:checked').length == 0){
          check = false;
          $('input:radio[name="'+name+'"]').closest('.language-level-box').find('.radio-error-message').removeClass('hide')
      }
  });
  
  if(check){
      return true
      // alert('One radio in each group is checked.');
  }else{
      return false
      // alert('Please select one option in each question.');
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
    } else if (!validateRadio()) {

      errors++;

    } else if ($(this).val()) {
          $(this).removeClass('warning');
          $(this).parent().find(".error-message").addClass("hide")
          $(this).parent().find(".radio-error-message").addClass("hide")
    }   
  });

  if(errors > 0){
    return false;
  } else {
    return true;
  }
}