$(document).on('turbolinks:load', function() {
  // Conflict Solution between Materialize Waves Button Effect and Turbolinks //
  Waves.displayEffect();

  // Questions Options Counter //
  optionsCount();

  // jQuery Mask //
  inputMasks();

  // Candidate Companies Append or Remove //
  appendCompany();  

  // Candidate Language Append or Remove //
  appendLanguage();

  // Candidate Pretension //
  calculatePretension();

  makeRadiosDeselectable();

  validate();

  // Candidate Experience Functions //
  calculatePercentage();
});