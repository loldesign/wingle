$(document).ready(function() {
  // INTEREST LOCALES DROP LIST //
  $(".city-list-item").click(function(){
    $(this).parent().find(".list-city-locale").slideToggle('.hidden');
    $(this).find('.icon').toggleClass('rotated');
  });
});