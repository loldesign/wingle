$(document).on('turbolinks:load', function() {
  // Conflict Solution between Materialize Waves Button Effect and Turbolinks //
  Waves.displayEffect();

  // Questions Options Counter //
  optionsCount();

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
  // END jQuery Mask //

  // Candidate Companies Append or Remove //
  appendCompany();  

  // Candidate Language Append or Remove //
  appendLanguage();

  // Candidate Pretension //
  calculatePretension();

  makeRadiosDeselectable();
});