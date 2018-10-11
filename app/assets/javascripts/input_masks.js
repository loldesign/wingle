var inputMasks = function(){
  // jQuery Mask //
  var cpfcnpjMaskBehavior = function (val) {
    return val.replace(/\D/g, '').length <= 11 ? '000.000.000-009' : '00.000.000/0000-00';
  },
  cpfcnpjOptions = {
    onKeyPress: function(val, e, field, options) {
        field.mask(cpfcnpjMaskBehavior.apply({}, arguments), options);
      }
  };

  var PhoneMaskBehavior = function (val) {
    return val.replace(/\D/g, '').length === 11 ? '(00) 00000-0000' : '(00) 0000-00009';
  },
  phoneOptions = {
    onKeyPress: function(val, e, field, options) {
        field.mask(PhoneMaskBehavior.apply({}, arguments), options);
      }
  };

  var PretensionMoneyMaskBehavior = function (val) {
    var amount = val.replace(/\D/g, '')
    if (amount <= 999) {
      return '9999'
    } else if (amount > 999 && amount <= 9999) {
      return '0.0009'
    } else if (amount > 9999 && amount <= 99999) {
      return '00.0009'
    } else if (amount > 99999) {
      return '000.000'
    } else {
      return '100.000'
    }
  },
  moneyOptions = {
    onKeyPress: function(val, e, field, options) {
        field.mask(PretensionMoneyMaskBehavior.apply({}, arguments), options);
      }
  };

  $('.cpf').mask('000.000.000-00');
  $('.cpf_cnpj').mask(cpfcnpjMaskBehavior, cpfcnpjOptions);
  $('.cellphone').mask(PhoneMaskBehavior, phoneOptions);
  $('.money').mask(PretensionMoneyMaskBehavior, moneyOptions, {reverse: true});

  $('.month_year').mask('00/0000');

  $('.percentage').mask('099');
  // END jQuery Mask //
}