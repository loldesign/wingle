var experiencesSecondStepManager = function(){
  this.$container  = $('#second_step.experience-step')
  this.$disclaimer = $('span.total-years-sum')

  this.startup = function(){
    if(!this.$container[0]){ return false; }

    var _this = this;

    this.$container.on('change', ['select.years'], function(event) {
      event.preventDefault();

      _this.calculateTime();
    });

    this.calculateTime();
  }

  this.calculateTime = function(){
    var yearsTotal  = this.sumArray(this.getTotalList($('select.years')))

    this.enableNextButton()

    this.setDisclaimer(yearsTotal)
  }

  this.getTotalList = function($Ellist){
    return $.map($Ellist ,function(option) {
      var value = $(option).val();
      if(value){
        return parseFloat(value);
      }else{
        return 0
      }
    });
  }

  this.sumArray = function(array){
    return array.reduce(function(a, b) { return a + b; }, 0);
  }

  this.enableNextButton = function(){
    $(".action-buttons-duo a.next-step").removeClass("disabled")
  }

  this.disableNextButton = function(){
    $(".action-buttons-duo a.next-step").addClass("disabled")
  }

  this.setDisclaimer = function(years){
    var yearWord  = years  > 1 ? ' anos'  : ' ano'

    var text = "Total de " + (years > 0 ? (years + yearWord) : '0')

    this.$disclaimer.text(text)
  }

  this.startup()
}
