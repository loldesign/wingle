var calculatePretension = function(){
	$("#candidate_pretension_last_monthly_salary").blur(function (event) {
    event.preventDefault();
    var val = $("#candidate_pretension_last_monthly_salary").val().replace(/^(R\$ )/, '').replace(/\./g, '')
    if (val > 99999) {
      val = "100.000"
    } else if (val < 1000) {
      val = "1.000"
    }
    $("#candidate_pretension_last_monthly_salary").val("R$ " + val)
    calculateLastSalaryTotal();
  });

  $("#candidate_pretension_nofsalaries").change(function (event) {
    event.preventDefault();
    calculateLastSalaryTotal();
  });

  $("#candidate_pretension_variable").blur(function (event) {
    event.preventDefault();
    var val = $("#candidate_pretension_variable").val().replace(/\D/g, '')
    if (val > 99999) {
      val = "100.000"
    } else if (val < 1000) {
      val = "1.000"
    }
    $("#candidate_pretension_variable").val("R$ " + val)
    calculateLastSalaryTotal();
  });

  $("#claim_list").change(function (event) {
    event.preventDefault();
    calculatePretensionYearlyTotal();
  });

  $("#minimum_claim").blur(function (event) {
    event.preventDefault();
    var val = $("#minimum_claim").val().replace(/\D/g, '')
    if (val > 99999) {
      val = "100.000"
    } else if (val <= 999) {
      val = "1.000"
    } else {
      // Round up
      val = Math.ceil(val/100)*100
      // format again
      val = val.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.")
    }
    $("#minimum_claim").val("R$ " + val)
  });

  if (($("#candidate_pretension_last_monthly_salary").length > 0) && ($("#candidate_pretension_last_monthly_salary").val().length > 0)) {
      var val = $("#candidate_pretension_last_monthly_salary").val().replace(/^(R\$ )/, '')
      $("#candidate_pretension_last_monthly_salary").val("R$ " + val)
  }

  if (($("#candidate_pretension_variable").length > 0) && ($("#candidate_pretension_variable").val().length > 0)) {
    var val = $("#candidate_pretension_variable").val().replace(/^(R\$ )/, '')
    $("#candidate_pretension_variable").val("R$ " + val)
  }

  if (($("#minimum_claim").length > 0) && ($("#minimum_claim").val().length > 0)) {
    var val = $("#minimum_claim").val().replace(/^(R\$ )/, '')
    $("#minimum_claim").val("R$ " + val)
  }

  // Calculate last salary total //
  calculateLastSalaryTotal = function() {
    var monthly_salary = $("#candidate_pretension_last_monthly_salary").val().replace(/^(R\$ )/, '').replace(/\./g, '')
    var nofsalaries    = $("#candidate_pretension_nofsalaries").val()
    var variable       = $("#candidate_pretension_variable").val().replace(/^(R\$ )/, '').replace(/\./g, '')

    var total = monthly_salary * nofsalaries + Number(variable)
    var formatted = "R$ " + total.toFixed(0)
    formatted = formatted.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.")
    $("#candidate_pretension_last_salary_total").val(formatted)
  }

  // Calculate pretension yearly total (step 3) //
  calculatePretensionYearlyTotal = function() {
    var last_salary_total = $("#last_salary_total").val().replace(/^(R\$ )/, '').replace(/\./g, '')
    var percent           = $("#claim_list").val()

    var total = last_salary_total*(1+(percent/100))
    total = Math.ceil(total/1000)*1000
    var formatted = "R$ " + total.toFixed(0)
    formatted = formatted.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.")
    $("#pretension_yearly_total").val(formatted)
  }

  if ($("#pretension_yearly_total").length > 0) {
    calculatePretensionYearlyTotal();
  }
}