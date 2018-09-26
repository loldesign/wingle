var makeRadiosDeselectable = function(){
  $("input[type='radio']").click(function() {
    var previousValue = $(this).prop('previousValue');
    var name = $(this).prop('name');

    if (previousValue == 'checked') {
      $(this).removeProp('checked');
      $(this).prop('previousValue', false);
    }
    else {
      $("input[name='"+name+"']:radio").prop('previousValue', false);
      $(this).prop('previousValue', 'checked');
    }
  });
}