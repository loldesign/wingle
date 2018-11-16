var processSelectionCandidateManager = function(){
  this.$container   = $('#company_candidate_profile')

  this.startup = function(){
    if(!this.$container[0]){ return false; }

    var _this = this;

    this.$container.on('change', '#candidate_profile_status', function(event) {
      var value       = $(this).find('option:selected').val()
      var candidateId = _this.$container.data('candidate-id')

      _this.updateState(candidateId, value)
    });
  }

  this.updateState = function(candidateId, state){
    var _this = this;

    $.ajax({
      url: '/empresa/candidato/perfil/'+candidateId+'/update-state',
      type: 'PUT',
      dataType: 'json',
      data: {state: state},
    })
    .done(function() {
      console.log("success");

      _this.getInfo()
    })
    .fail(function() {
      console.log("error");
    })
    .always(function() {
      console.log("complete");
    });
  }

  this.getInfo = function(){
    var _this = this;

    $.ajax({
      url: '/empresa/processo-seletivo/info',
      type: 'GET',
      dataType: 'json',
    })
    .done(function(json) {
      _this.updateMenuTotals(json)
    })
    .fail(function() {
      console.log("error");
    })
    .always(function() {
      console.log("complete");
    });
  }

  this.updateMenuTotals = function(json){
    var $menuContainer = $('.process-selsection-info')

    this.updateTotalLabel($menuContainer, json, "first_level")
    this.updateTotalLabel($menuContainer, json, "second_level")
    this.updateTotalLabel($menuContainer, json, "third_level")
    this.updateTotalLabel($menuContainer, json, "fourth_level")
    this.updateTotalLabel($menuContainer, json, "received_proposal")
    this.updateTotalLabel($menuContainer, json, "accepted_proposal")
    this.updateTotalLabel($menuContainer, json, "ignored")
  }

  this.updateTotalLabel = function($container, json, name){
    var $link = $container.find('a[data-level="'+name+'"]')
    var label = $link.text().replace(/\d./, json[name])

    $link.text(label)
  }

  this.startup()
}
