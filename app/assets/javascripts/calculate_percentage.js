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


    calculateTotal();

    $(".experience-percentage").blur(function (event) {
      event.preventDefault();
      //remove
      console.log("id: ", $(this).prop("id"))
      calculateTotal();
      var val = $(this).val()
      $(this).val(val+"%")
    });

  }
}