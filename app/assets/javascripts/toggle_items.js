$(document).on('turbolinks:load', function() {
  // HEADER PROFILE OPTIONS //
  $(".profile-container .profile-box").click(function(){
    $(this).parent().find(".profile-options").slideToggle('.hidden');
  });

  // INTEREST NEIGHBORHOODS DROP LIST //
  $(".city-locale-item").click(function(){
    $(this).parent().find(".list-neighborhood-group").slideToggle('.hidden');
    $(this).find('.icon').toggleClass('rotated');
  });

  $(".neighborhood-group-item").click(function(){
    $(this).parent().find(".list-neighborhood").slideToggle('.hidden');
    $(this).find('.icon').toggleClass('rotated');
  });

  // HABILITY DROP LIST //
  $(".function-list-item").click(function(){
    $(this).parent().find(".list-function-hability").slideToggle('.hidden');
    $(this).find('.icon').toggleClass('rotated');
  });

  // ##### COMPANY ONBOARDING ##### //
  // SIDE MENU //
  $(function () {
    $(".header-top .left-box i").click(function(e){
      $(this).closest('.full-header').find('#menu').toggleClass('open');
      $(this).closest('.full-header').find('#menu .close-menu-area').toggleClass('hidden');

      e.stopPropagation();
      return false;
    });
    
    $('.close-menu-area, .close-responsive-side-menu').click(function() {
      $(this).parents().find('#menu').removeClass('open');
      $(this).addClass('hidden');
    });
  });
    
  // CANDIDATE CONTACT ACTIONS //
  $(".candidate-contact-actions-container .action-button").click(function(){
    $(this).parents().find('.contact-actions').toggle("slide", { direction: "down" }, 400);
  });
});