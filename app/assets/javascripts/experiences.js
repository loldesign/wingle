var experiencesSecondStepManager = function(){
  this.$container  = $('#second_step.experience-step')
  this.$disclaimer = $('p.total-years-sum')

  this.startup = function(){
    if(!this.$container[0]){ return false; }

    var _this = this;

    this.$container.on('change', ['select.years', 'select.months'], function(event) {
      event.preventDefault();

      var yearsTotal  = _this.sumArray(_this.getTotalList($('select.years')))
      var monthsTotal = _this.sumArray(_this.getTotalList($('select.months')))

      if(monthsTotal >= 12){
        var monthsYear = Math.floor(monthsTotal/12)
        var restMonths = monthsTotal%12

        yearsTotal  = yearsTotal + monthsYear
        monthsTotal = restMonths
      }
      console.log(yearsTotal, monthsTotal)

      _this.setDisclaimer(yearsTotal, monthsTotal)
    });
  }

  this.getTotalList = function($Ellist){
    return $.map($Ellist ,function(option) {
      var value = $(option).val();
      if(value){
        return parseInt(value);
      }else{
        return 0
      }

    });
  }

  this.sumArray = function(array){
    return array.reduce(function(a, b) { return a + b; }, 0);
  }

  this.setDisclaimer = function(years, months){
    var yearWord  = years  > 1 ? ' anos'  : ' ano'
    var monthWord = months > 1 ? ' meses' : ' mês'
    var andWord   = years  > 0 ? ' e '    : ''

    var text = "Total de " + (years > 0 ? (years + yearWord) : '') + (months > 0 ? (andWord + months + monthWord) : '')

    this.$disclaimer.text(text)
  }

  this.startup()
}
