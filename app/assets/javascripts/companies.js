var companiesFirstStepManager = function(){
  this.$container    = $('#first_step.company-step')
  this.$localeSelect = $('#candidate_current_company_neighborhood')

  this.startup = function(){
    if(!this.$container[0]){ return false; }

    var _this = this;

    this.$container.on('change', '#candidate_current_company_city_locale', function(event) {
      event.preventDefault();

      var $select = $(this)

      _this.process($select)
    });

    this.process($('#candidate_current_company_city_locale'), false)
  }

  this.process = function($select, clear=true){
    if(clear){
      this.$localeSelect.val('');
    }

    if($select.val() === ''){ return false; }

    this.hideAllLocaleSteps()
    this.showOnlyLocale($select.find('option:selected').val())
  }

  this.hideAllLocaleSteps = function(){
    this.$localeSelect.find('option').hide()
  }

  this.showOnlyLocale = function(id){
    this.$localeSelect.find('option').filter("[data-city-locale-id="+id+"]").show()
  }

  this.startup()
}
