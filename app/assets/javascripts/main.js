$(function(){
  $('.dropdown').on('click', function(){
    if($('.dropdown-menu').hasClass('display-none')){
      $('.dropdown-menu').removeClass('display-none');
    } else {
      $('.dropdown-menu').addClass('display-none');
    }
  });

  $('#invitationNow').on('click', function(){
    if($('#invitationNowDisplay').hasClass('display-none')){
      $('#invitationNowDisplay').removeClass('display-none');
    } else {
      $('#invitationNowDisplay').addClass('display-none');
    }
  });
  $('#invitationMember').on('click', function(){
    if($('#invitationMemberDisplay').hasClass('display-none')){
      $('#invitationMemberDisplay').removeClass('display-none');
    } else {
      $('#invitationMemberDisplay').addClass('display-none');
    }
  })
})
