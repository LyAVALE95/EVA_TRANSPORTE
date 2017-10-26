$(document).ready(function () {
$("#sidebar-wrapper").animate({left: '0px'});
$(".mainblock").css("margin-left", "70px")
    $("#sidebar-wrapper").hover(function(){
       // $(this).css("background-color", "yellow");
       $("#sidebar-wrapper").animate({left: '70px'});
        $(".mainblock").animate({left: '80px'});
    },
    function(){
       // $(this).css("background-color", "yellow");
       $(this).animate({left: '0px'});
            $(".mainblock").animate({left: '0px'});
    });
  var trigger = $('.hamburger'),
      overlay = $('.overlay'),
     isClosed = false;

    trigger.click(function () {
      hamburger_cross();      
    });

    function hamburger_cross() {

      if (isClosed == true) {          
        overlay.hide();
        trigger.removeClass('is-open');
        trigger.addClass('is-closed');
        isClosed = false;
      } else {   
        overlay.show();
        trigger.removeClass('is-closed');
        trigger.addClass('is-open');
        isClosed = true;
      }
  }
  
  $('[data-toggle="offcanvas"]').click(function () {
        $('#wrapper').toggleClass('toggled');
  });  
});