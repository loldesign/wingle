// Conflict Solution between Materialize Waves Button Effect and Turbolinks
$(document).on('ready page:change', function() {
  Waves.displayEffect();
});