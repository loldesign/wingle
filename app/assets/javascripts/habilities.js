var habilitiesFirstStepManager = function(){
  this.$container = $('#first_step.habilities-container')
  this.maxOptions = this.$container.data("max")

  this.validateArea = function($checkbox){
    var $areaContainer = $checkbox.closest('.list-function-hability');
    var totalChecked   = $areaContainer.find('input:checkbox:checked').size();

    if(totalChecked >= this.maxOptions){
      this.toggleCheckboxes($areaContainer.find('input:checkbox:not(:checked)'), { disabled: true })
    }else{
      this.toggleCheckboxes($areaContainer.find('input:checkbox'), { disabled: false })
    }
  }

  this.validateAllAreas = function(){
    var _this = this;

    $.each(this.$container.find('.list-function-hability .collection-item'), function(index, val) {
       var $areaContainer = $(val).closest('.list-function-hability');
       var totalChecked   = $areaContainer.find('input:checkbox:checked').size()

       console.log('--->', totalChecked)
       if(totalChecked >= 5){
        _this.toggleNextButton(false)
       }else{
        _this.toggleNextButton(true)

        return false;
      }
    });
  }

  this.toggleCheckboxes = function($checkboxes, options){
    $checkboxes.prop(options);
  }

  this.toggleNextButton = function(disabled){
    var $button = $("a.next-step")

    if(disabled){
      $button.addClass("disabled")
    }else{
      $button.removeClass("disabled")
    }
  }

  this.startup = function(){
    if(!this.$container[0]){ return false; }
    
    var _this = this;

    this.toggleNextButton(true)

    this.$container.on('click', '.list-function-hability .collection-item', function(event) {
      _this.validateArea($(this))

      _this.validateAllAreas()
    });

    $.each(this.$container.find('.list-function-hability .collection-item'), function(index, val) {
       _this.validateArea($(val))
    });

    this.validateAllAreas()
  }

  this.startup()
}