var calculatePercentage = function(){

  // calculate percentage on experience step 5
  if ($(".experience-percentage").length > 0) {

    calculateTotal = function() {
      var total = 0;
      $(".experience-percentage").each(function() {
        if ($(this).val()) {
          total = total + parseInt($(this).val())
        }
      });
      $("#candidate_experience_total_functions_percentage").val(total+"%")
    }

    // format numbers to percentage
    numbersToPercentage = function() {
      $(".experience-percentage").each(function() {
        if ($(this).val()) {
          var val = $(this).val()
          $(this).val(val+"%")
        }
      });
    }

    validatePercentage = function() {
      $(".experience-percentage").each(function() {
        if ($(this).val()) {
          var val = parseInt($(this).val())
          if (val > 100) {
            $(this).addClass('warning');
            $(this).parent().find(".error-message").removeClass("hide")
            $(this).parent().find(".error-message").html("Máximo 100%")
          } else {
            $(this).removeClass('warning');
            $(this).parent().find(".error-message").addClass("hide")
          }
        }
      });

      var input_total = $("#candidate_experience_total_functions_percentage")[0]
      var val = parseInt(input_total.value)
      console.log("input value: ", val)
      if ((val > 100) || val < 30) {
        $(input_total).addClass('warning');
        $(input_total).parent().find(".error-message").removeClass("hide")
      } else {
        $(input_total).removeClass('warning')
        $(input_total).parent().find(".error-message").addClass("hide")
      }
    }

    // set numbers to percentage
    numbersToPercentage();
    // calculate on load
    calculateTotal();

    $(".experience-percentage").blur(function (event) {
      event.preventDefault();
      calculateTotal();
      validatePercentage();
      var val = $(this).val().replace(/\D/g, '')
      $(this).val(val+"%")
    });

  }
}