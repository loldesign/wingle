var processSelectionManager = function(){
  this.$container   = $('.process-selection-options')

  this.startup = function(){
    if(!this.$container[0]){ return false; }

    this.$hiddenField = $("input:hidden[name^='process_selection']")
    this.$form        = this.$container.find('form:first')

    var _this = this;

    this.$container.on('click', 'li.collection-item a.option', function(event) {
      _this.$hiddenField.val($(this).data('id'))

      _this.$form.submit()
    });
  }

  this.startup()
}
