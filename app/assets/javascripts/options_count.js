var optionsCount = function(){
  this.container = $('.question-container')
  this.minOptions = container.data("min")
  this.maxOptions = container.data("max")

  $(".collection-item p label input").click(function(){
     var currentOptions = $(this).parents().find("input[type=checkbox]:checked").length
     checkCountOptions(currentOptions);
  });

  checkCountOptions = function(currentOptions) {
    if (currentOptions >= minOptions) {
      $(".action-buttons-duo a.next-step").removeClass("disabled")
      $(".max-option-notice").addClass("visible")
    } else {
      $(".action-buttons-duo a.next-step").addClass("disabled")
    }

    if (currentOptions >= this.maxOptions) {
      $("input:checkbox:not(:checked)").prop({
        disabled: true
      });

      $(".action-buttons-duo a.next-step").removeClass("disabled")

    } else if (currentOptions < this.maxOptions) {
      $("input:checkbox:not(:checked)").prop({
        disabled: false
      });

      $(".max-option-notice").removeClass("visible")
    }
  }
}
