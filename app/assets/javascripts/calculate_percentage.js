var calculatePercentage = function(){
  this.total = 0;
  // calculate percentage on experience step 5
  if ($(".experience-percentage").length > 0) {

    calculateTotal = function() {
      var total = 0;
      var _this = this;

      $(".experience-percentage").each(function() {
        if ($(this).val()) {
          total       = total + parseInt($(this).val())
          _this.total = total
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
      var errors = 0;
      $(".experience-percentage").each(function() {
        if ($(this).val()) {
          var val = parseInt($(this).val())
          if (val > 100) {
            $(this).addClass('warning');
            $(this).parent().find(".error-message").removeClass("hide")
            $(this).parent().find(".error-message").html("Máximo 100%")
            errors++;
          } else {
            $(this).removeClass('warning');
            $(this).parent().find(".error-message").addClass("hide")
          }
        }
      });

      var input_total = $("#candidate_experience_total_functions_percentage")[0]
      var val = parseInt(input_total.value)
      if ((val > 100) || val < 100) {
        $(input_total).addClass('warning');
        $(input_total).parent().find(".error-message").removeClass("hide")
        errors++;
      } else {
        $(input_total).removeClass('warning')
        $(input_total).parent().find(".error-message").addClass("hide")
      }

      if(errors > 0){
        $("#form-button").attr("disabled","disabled");
      } else {
        $("#form-button").removeAttr("disabled");
      }
    }

    displayDisclaimer = function(){
      var $label       = $('.percentage-sum-text')
      var maximumValue = 100
      var difference   = maximumValue - this.total

      if(difference === 0){
        $label.html('&nbsp;')
      }else if(difference < 0){
        $label.text('Você ultrapassou em ' +Math.abs(difference)+ '%')
      }else if(difference < maximumValue){
        $label.text('Ainda faltam ' +difference+ '%')
      }else{
        $label.text('A soma deve ser 100%')
      }
    }

    // set numbers to percentage
    // numbersToPercentage();
    // calculate on load
    calculateTotal();
    validatePercentage();

    var _this = this;

    $(".experience-percentage").change(function (event) {
      event.preventDefault();
      
      calculateTotal();
      validatePercentage();
      
      _this.displayDisclaimer()
      // var val = $(this).val().replace(/\D/g, '')
      // val = (val == "") ? 0 : val
      // $(this).val(val+"%")
    });

  }
}
