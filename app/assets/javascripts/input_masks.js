var inputMasks = function(){
  // jQuery Mask //
  $('.cpf').mask('000.000.000-00');

  var PhoneMaskBehavior = function (val) {
    return val.replace(/\D/g, '').length === 11 ? '(00) 00000-0000' : '(00) 0000-00009';
  },
  phoneOptions = {
    onKeyPress: function(val, e, field, options) {
        field.mask(PhoneMaskBehavior.apply({}, arguments), options);
      }
  };

  $('.cellphone').mask(PhoneMaskBehavior, phoneOptions);
  $('.money').mask('#.##0', {reverse: true});

  $('.month_year').mask('00/0000');
  // END jQuery Mask //
}