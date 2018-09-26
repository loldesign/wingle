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

  $("#claim_list").change(function (event) {
    event.preventDefault();
    calculatePretensionYearlyTotal();
  });

  // Calculate last salary total //
  calculateLastSalaryTotal = function() {
    var monthly_salary = $("#candidate_pretension_last_monthly_salary").val().replace(/^(R\$ )/, '').replace(/\./g, '').replace(',', '.')
    var nofsalaries    = $("#candidate_pretension_nofsalaries").val()
    var variable       = $("#candidate_pretension_variable").val().replace(/^(R\$ )/, '').replace(/\./g, '').replace(',', '.')

    var total = monthly_salary * nofsalaries + Number(variable)
    var formatted = "R$ " + total.toFixed(2).replace('.', ',')
    formatted = formatted.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.")
    $("#candidate_pretension_last_salary_total").val(formatted)
  }

  // Calculate pretension yearly total //
  calculatePretensionYearlyTotal = function() {
    var last_salary_total = $("#last_salary_total").val().replace(/^(R\$ )/, '').replace(/\./g, '').replace(',', '.')
    var percent           = $("#claim_list").val()

    var total = last_salary_total*(1+(percent/100))
    var formatted = "R$ " + total.toFixed(2).replace('.', ',')
    formatted = formatted.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.")
    $("#pretension_yearly_total").val(formatted)
  }
}