var appendCompany = function(){
  let formList = $(".collection.with-input")
  let formActions = $(".collection.with-input .list-item-options")
  let listItem = $('.collection.with-input .collection-item')

  $('#btn-minus').click(function (event) {
    event.preventDefault();
    let listItemQuantity = $('.collection.with-input .collection-item').length
    removeItem(listItemQuantity);
  });

  $('#btn-plus').click(function (event) {
    event.preventDefault();
    let listItemQuantity = $('.collection.with-input .collection-item').length
    addItem(listItemQuantity);
  });

  // Remove Company //
  removeItem = function(listItemQuantity) {
    $('.collection-item:last').remove();

    let currentItem = $('.collection.with-input .collection-item').length

    if (currentItem < 2) {
      $('#btn-minus').addClass("hide");
    }

    $('#btn-plus').removeClass("hide");
  }

  // Add Company //
  addItem = function(listItemQuantity) {
    formList.append("<li class='collection-item'> <input type='text' placeholder='Nome:'> <select name=' id=' class='custom'> <option value='one_year'>6 MESES - 1 ANO DE EXPERIÊNCIA</option> <option value='two_years'>1 ANO - 2 ANOS DE EXPERIÊNCIA</option> <option value='three_years'>2 ANOS - 3 ANOS DE EXPERIÊNCIA</option> <option value='four_years'>3 ANOS - 4 ANOS DE EXPERIÊNCIA</option> <option value='five_years'>4 ANOS - 5 ANOS DE EXPERIÊNCIA</option> <option value='six_years'>5 ANOS - 6 ANOS DE EXPERIÊNCIA</option> </select> </li>")

    let currentItem = $('.collection.with-input .collection-item').length

    if (currentItem > 4) {
      $('#btn-plus').addClass("hide");
    } else {
      $('#btn-minus').removeClass("hide");
    }

    $('#btn-minus').appendTo(formActions);
    $('#btn-plus').appendTo(formActions);
    $(formActions).appendTo(formList);
  } 
}