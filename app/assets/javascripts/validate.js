var validate = function(){
  $('#validate-form-button').click(function (event) {
    event.preventDefault();
    submitButton($(this));
  });

  $('#validate-only-date-button').click(function (event) {
    event.preventDefault();
    submitDateButton($(this));
  });

  submitButton = function($btn) {
    if(validateForm($btn)) {
      $btn.closest('form').submit()
    } else {
      validateForm()
    }
  }

  submitDateButton = function($btn) {
    if(validateOnlyDate($btn)) {
      $btn.closest('form').submit()
    } else {
      validateOnlyDate()
    }
  }
}

validateRadio = function() {
  var check
  $("input:radio").each(function(){
      var name = $(this).attr("name");
      if($('input:radio[name="'+name+'"]:checked').length == 0){
          check = false;
          $('input:radio[name="'+name+'"]').closest('.language-level-box').find('.radio-error-message').removeClass('hide')
      } else {
        check = true
        $('input:radio[name="'+name+'"]').closest('.language-level-box').find('.radio-error-message').addClass('hide')
      }
      
  });
  
  return check
}

validateDate = function($input, errors) {
  var date = $($input).val()
  if(date != "" && !/^\d{2}\/\d{4}$/.test(date)) {
    $input.addClass('warning');
    $input.parent().find(".error-message").removeClass("hide")
    $input.parent().find(".error-message").html("Data inválida!")
    errors++;
    return errors
  } else {
    $input.removeClass('warning');
    $input.parent().find(".error-message").addClass("hide")
  }

  // Parse the date parts to integers
  var parts = date.split("/");
  var month = parseInt(parts[0]);
  var year = parseInt(parts[1]);
  var currentYear = new Date().getFullYear();

  // Check the ranges of month and year
  if(year < 1900 || year > currentYear || month == 0 || month > 12) {
    $input.addClass('warning');
    $input.parent().find(".error-message").removeClass("hide")
    $input.parent().find(".error-message").html("Data inválida!")
    errors++;
    return errors
  }

  // Check if start date is greater than end date
  if ($input.hasClass("start-date")) {
    var input_end_date = $input.parent().parent().find(".end-date")
    var end_date = $(input_end_date).val()

    // Parse the end-date to integers
    var end_parts = end_date.split("/");
    var end_month = parseInt(end_parts[0]);
    var end_year = parseInt(end_parts[1]);

    if (year > end_year || (year == end_year && month > end_month)) {
      $input.addClass('warning');
      $input.parent().find(".error-message").removeClass("hide")
      $input.parent().find(".error-message").html("Data início maior que fim!")
      errors++;
      return errors
    }
  }

  return errors
}

// Validate Form //
function validateForm($btn) {
  var errors = 0;
  var withRadius = $btn.data('with-radios') || undefined

  $(".validate").map(function(){
     if( !$(this).val()) {
          $(this).addClass('warning');
          $(this).parent().find(".error-message").removeClass("hide")
          $(this).parent().find(".error-message").html("Obrigatório")
          errors++;
    } else if (withRadius && !validateRadio()) {

      errors++;

    } else if ($(this).hasClass("start-date") || $(this).hasClass("end-date")) {

      errors = validateDate($(this), errors)

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

function validateOnlyDate($btn) {
  var errors = 0;

  $(".start-date").map(function(){
    errors = validateDate($(this), errors)
  });

  $(".end-date").map(function(){
    errors = validateDate($(this), errors)
  });

  if(errors > 0){
    return false;
  } else {
    return true;
  }
}