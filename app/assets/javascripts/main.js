$(document).on('ready page:change', function() {
  // Conflict Solution between Materialize Waves Button Effect and Turbolinks //
  Waves.displayEffect();

  // Questions Options Counter //
  optionsCount();
});