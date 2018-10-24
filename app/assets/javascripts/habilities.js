var habilitiesFirstStepManager = function(){
  this.$container   = $('#first_step.habilities-container')
  this.maxOptions   = this.$container.data("max")

  this.validateArea = function($checkbox){
    var $areaContainer = $checkbox.closest('.list-function-hability');
    var totalChecked   = $areaContainer.find('input:checkbox:checked').size();

    if(totalChecked >= 5){
      this.toggleCheckboxes($areaContainer.find('input:checkbox:not(:checked)'), { disabled: true })
    }else{
      this.toggleCheckboxes($areaContainer.find('input:checkbox'), { disabled: false })
    }

    if(totalChecked >= 1){
      this.enableAreaNextItem($areaContainer)
    }else{
      this.disableAreaNextItem($areaContainer)
    }
  }

  this.enableAreaNextItem = function($areaContainer){
    $areaContainer.find('.next-area').removeClass('disabled')
  }

  this.disableAreaNextItem = function($areaContainer){
    $areaContainer.find('.next-area').addClass('disabled')
  }

  this.validateAllAreas = function(){
    var _this = this;

    $.each(this.$container.find('.list-function-hability .collection-item'), function(index, val) {
       var $areaContainer = $(val).closest('.list-function-hability');
       var totalChecked   = $areaContainer.find('input:checkbox:checked').size()

       if(totalChecked >= _this.maxOptions){
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

  this.hideSlideArea = function($area){
    $area.closest('.list-function-hability').slideToggle('.hidden')
    $area.closest('.list-function-hability').prev().find('.icon').toggleClass('rotated')
  }

  this.showSlideArea = function($area){
    $area.closest('.hability-function-item-block').next().find('.list-function-hability').slideToggle('.hidden')
    $area.closest('.hability-function-item-block').next().find('.list-function-hability').prev().find('.icon').toggleClass('rotated')
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

    this.$container.on('click', '.action-item a.next-area', function(event) {
      event.preventDefault();
      /* Act on the event */

      _this.hideSlideArea($(this))
      _this.showSlideArea($(this))
    });

    this.validateAllAreas()
  }

  this.startup()
}
