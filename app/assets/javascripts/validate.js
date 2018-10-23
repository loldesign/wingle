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

validateDate = function($div, errors) {
  var $startDateMonth = $($div).find(".start_date_month")
  var $startDateYear  = $($div).find(".start_date_year")
  var $endDateMonth   = $($div).find(".end_date_month")
  var $endDateYear    = $($div).find(".end_date_year")

  var startMonth = parseInt($startDateMonth.val());
  var endMonth = parseInt($endDateMonth.val());
  var startYear = parseInt($startDateYear.val());
  var endYear = parseInt($endDateYear.val());
  var currentYear = new Date().getFullYear();

  $div.find(".error-message").addClass("hide")

  // Check the ranges of month and year
  if(startYear < 1990 || startYear > currentYear || startMonth == 0 || startMonth > 12) {
    $startDateMonth.addClass('warning');
    $startDateYear.addClass('warning');
    $div.find(".start_date .error-message").removeClass("hide")
    $div.find(".start_date .error-message").html("Data inválida!")
    errors++;
    return errors
  } else {
    $startDateMonth.removeClass('warning');
    $startDateYear.removeClass('warning');
  }
  if (endYear < 1990 || endYear > currentYear || endMonth == 0 || endMonth > 12) {
    $endDateMonth.addClass('warning');
    $endDateYear.addClass('warning');
    $div.find(".end_date .error-message").removeClass("hide")
    $div.find(".end_date .error-message").html("Data inválida!")
    errors++;
    return errors
  } else {
    $endDateMonth.removeClass('warning');
    $endDateYear.removeClass('warning');
  }

  // Check if start date is greater than end date
  if (startYear > endYear || (startYear == endYear && startMonth > endMonth)) {
    $startDateMonth.addClass('warning');
    $startDateYear.addClass('warning');
    $div.find(".start_date .error-message").removeClass("hide")
    $div.find(".start_date .error-message").html("Data início maior que fim!")
    errors++;
    return errors
  }

  return errors
}

// Validate Form //
function validateForm($btn) {
  var errors = 0;
  
  var withRadius = $btn.data('with-radios') || undefined


  $(".validate").map(function(){
     if ($(this).hasClass("validate-date")) {
      errors = validateDate($(this), errors)

    } else if( !$(this).val()) {
          $(this).addClass('warning');
          $(this).parent().find(".error-message").removeClass("hide")
          $(this).parent().find(".error-message").html("Obrigatório")
          errors++;
    } else if (withRadius && !validateRadio()) {

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