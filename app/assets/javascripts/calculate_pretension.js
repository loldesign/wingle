var calculatePretension = function(){
	$("#candidate_pretension_last_monthly_salary").blur(function (event) {
    event.preventDefault();
    calculateLastSalaryTotal();
  });

  $("#candidate_pretension_nofsalaries").change(function (event) {
    event.preventDefault();
    calculateLastSalaryTotal();
  });

  $("#candidate_pretension_variable").blur(function (event) {
    event.preventDefault();
    calculateLastSalaryTotal();
  });

  // Calculate last salary total //
  calculateLastSalaryTotal = function() {
    var monthly_salary = $("#candidate_pretension_last_monthly_salary").val()
    var nofsalaries    = $("#candidate_pretension_nofsalaries").val()
    var variable       = $("#candidate_pretension_variable").val()

    var total = monthly_salary * nofsalaries + Number(variable)
    console.log(total)
    $("#candidate_pretension_last_salary_total").val(total.toFixed(2))
  }
}