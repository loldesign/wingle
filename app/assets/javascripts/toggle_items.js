$(document).on('turbolinks:load', function() {
  // HEADER PROFILE OPTIONS //
  $(".dashboard-header .profile-container .profile-box").click(function(){
    $(this).parent().find(".profile-options").slideToggle('.hidden');
  });

  // INTEREST LOCALES DROP LIST //
  // $(".city-list-item").click(function(){
  //   $(this).parent().find(".list-city-locale").slideToggle('.hidden');
  //   $(this).find('.icon').toggleClass('rotated');
  // });

  // INTEREST NEIGHBORHOODS DROP LIST //
  $(".city-locale-item").click(function(){
    $(this).parent().find(".list-neighborhood").slideToggle('.hidden');
    $(this).find('.icon').toggleClass('rotated');
  });

  // HABILITY DROP LIST //
  $(".function-list-item").click(function(){
    $(this).parent().find(".list-function-hability").slideToggle('.hidden');
    $(this).find('.icon').toggleClass('rotated');
  });
});