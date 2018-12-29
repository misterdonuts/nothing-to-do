$(function(){
  $('.dropdown').on('click', function(){
      if($('.dropdown-menu').hasClass('display-none')){
        $('.dropdown-menu').removeClass('display-none');
      } else {
        $('.dropdown-menu').addClass('display-none');
      }
  });
})
