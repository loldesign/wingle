$(document).on('turbolinks:load', function() {
  // HEADER PROFILE OPTIONS //
  $(".dashboard-header .profile-container .profile-box").click(function(){
    $(this).parent().find(".profile-options").slideToggle('.hidden');
  });

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

  // ##### COMPANY ONBOARDING ##### //
  // CANDIDATE CONTACT ACTIONS //
  $(".candidate-contact-actions-container .action-button").click(function(){
    $(this).parents().find('.contact-actions').toggle("slide", { direction: "down" }, 400);
  });
});