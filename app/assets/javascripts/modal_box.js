$(document).on('turbolinks:load', function() {
  var $modal = $(".fancybox");

  if($modal[0]){
    $modal.fancybox({
      openEffect  : 'easyIn',
      closeEffect : 'none',
    });
  }
}); 
