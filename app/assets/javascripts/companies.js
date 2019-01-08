var companiesFirstStepManager = function(){
  this.$container    = $('#first_step.company-step')
  this.$localeSelect = $('#candidate_current_company_neighborhood')
  this.$endDate      = $('#current_end_date')

  this.startup = function(){
    if(!this.$container[0]){ return false; }

    var _this = this;

    this.$container.on('change', '#candidate_current_company_city_locale', function(event) {
      event.preventDefault();

      var $select = $(this)

      _this.process($select, true)
    });

    this.$container.on('change', '#candidate_current_company_neighborhood_group', function(event) {
      event.preventDefault();

      _this.populateNeighborhood($(this))
    });

    this.process($('#candidate_current_company_city_locale'), false)

    this.$container.on('change', '#candidate_current_company_currently_work_here', function(event) {
      event.preventDefault();

      var $checkbox = $(this)

      _this.processEndDate($checkbox[0])
    });

    this.processEndDate($("input[type='checkbox']#candidate_current_company_currently_work_here")[0])
  }

  this.process = function($select, clear){
    if(clear){
      this.$localeSelect.val('');
    }

    if($select.val() === ''){ return false; }

    this.hideAllLocaleSteps()
    this.showOnlyLocale($select.find('option:selected').val())
  }

  this.processEndDate = function($checkbox){
    if($checkbox.checked) {
      this.hideEndDates()
      this.clearEndDates()
    } else {
      this.showEndDates()
    }
  }

  this.hideAllLocaleSteps = function(){
    this.$localeSelect.find('option').hide()
  }

  this.showOnlyLocale = function(id){
    this.$localeSelect.find('option').filter("[data-city-locale-id="+id+"]").show()
  }

  this.populateSubsectors = function($select) {
    var $subsectors = $('#candidate_current_company_neighborhood')

    if ($select.val() != "") {
      $subsectors.parent().removeClass('hidden');
      
      $.ajax({
        url: '/candidato/empresa/passo-1/subsectors?sector_id='+$select.val(),
        type: 'get',
        dataType: 'json',
      })
      .success(function(data) {
        $subsectors.children('option:not(:first)').remove();
        $subsectors.append('<option value>Bairro</option>');

        $.each(data, function(i, obj) {
          $subsectors.append($("<option />").val(obj.id).text(obj.name));
        });
      })
      .done(function() {
        console.log("success");
      })
      .fail(function() {
        console.log("error");
      });
    } else {
      $('#candidate_current_company_neighborhood').parent().addClass('hidden');
    }
  }

  this.populateNeighborhood = function($select) {
    var $neighborhood = $('#candidate_current_company_neighborhood')

    if ($select.val() != "") {
      $neighborhood.parent().removeClass('hidden');
      
      $.ajax({
        url: '/candidato/empresa/passo-1/bairros?neighborhood_group_id='+$select.val(),
        type: 'get',
        dataType: 'json',
      })
      .success(function(data) {
        $neighborhood.children('option:not(:first)').remove();
        $neighborhood.append('<option value>Bairro</option>');

        $.each(data, function(i, obj) {
          $neighborhood.append($("<option />").val(obj.id).text(obj.name));
        });
      })
      .done(function() {
        console.log("success");
      })
      .fail(function() {
        console.log("error");
      });
    } else {
      $('#candidate_current_company_neighborhood').parent().addClass('hidden');
    }
  }

  this.hideEndDates = function(){
    this.$endDate.hide()
  }

  this.showEndDates = function(){
    this.$endDate.show()
  }

  this.clearEndDates = function(){
    $("#candidate_current_company_end_date_month").val("")
    $("#candidate_current_company_end_date_year").val("")
  }

  this.startup()
}
