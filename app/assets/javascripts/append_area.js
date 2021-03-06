var appendCompany = function(){
  $('#btn-minus').click(function (event) {
    event.preventDefault();
    removeCompany();
  });

  $('#btn-plus').click(function (event) {
    event.preventDefault();
    addCompany($(this));
  });

  // Remove Company //
  removeCompany = function() {
    $('.candidate-company-item:last').remove();

    // Candidate Company Counter //
    var companyCounter = $('.collection.candidate-companies-form .candidate-company-item').length

    if (companyCounter < 2) {
      $('#btn-minus').addClass("hide");
    }

    $('#btn-plus').removeClass("hide");
  }

  // Add Company //
  addCompany = function($btn) {
    if(validateForm($btn)) {
      // Candidate Company Add Action//
      var companyCounter         = $btn.closest('ul').find('.candidate-company-item').length + 1
      var $companyContainer      = $btn.closest('ul').find('.candidate-company-item:first')
      var $companyContainerClone = $companyContainer.clone()

      $companyContainerClone.find(':input').val('')
      $companyContainerClone.find('select').val('')
      
      if (companyCounter <= 5) {
        $btn.closest('ul').find('.candidate-company-item:last').after($companyContainerClone)
      } 

      if (companyCounter === 5){
        $('#btn-plus').addClass("hide");
      }else{
        $('#btn-minus').removeClass("hide");
      }
    }
  } 
}

var appendLanguage = function(){
  $('#btn-minus-language').click(function (event) {
    event.preventDefault();
    removeLanguage();
  });

  $('#btn-plus-language').click(function (event) {
    event.preventDefault();
    addLanguage($(this));
  });

  // Remove Language //
  removeLanguage = function() {
    $('.language-item .collection-item:last').remove();

    // Candidate Language Counter //
    var languageCounter = $('.collection.language-form .language-item .collection-item').length

    if (languageCounter < 2) {
      $('#btn-minus-language').addClass("hide");
    }

    $('#btn-plus-language').removeClass("hide");
  }

  // Add Language //
  addLanguage = function($btn) {
    if(validateForm($btn)) {
      // Candidate Language Add Action //
      var languageCounter         = $btn.closest('ul').find('.language-item .collection-item').length + 1
      var $languageContainer      = $btn.closest('ul').find('.language-item .collection-item:first')
      var $languageContainerClone = $languageContainer.clone()

      $languageContainerClone.find(':radio').removeAttr('checked')
      $languageContainerClone.find(':radio').each((function(index){
        var $el       = $(this)
        var elName    = $el.attr('name')
        var newElName = elName.replace(/\[\d+\]/, '['+languageCounter+']')

        $el.attr('name', newElName)
      }))

      var $select       = $languageContainerClone.find('select')
      var selectName    =  $select.attr('name')
      var selectNewName =  selectName.replace(/\[\d+\]/, '['+languageCounter+']')

      $select.val('')
      $select.attr('name', selectNewName)
      
      if (languageCounter <= 4) {
        $btn.closest('ul').find('.language-item .collection-item:last').after($languageContainerClone)
      } 

      if (languageCounter === 4){
        $('#btn-plus-language').addClass("hide");
      }else{
        $('#btn-minus-language').removeClass("hide");
      }
    }
  }
}