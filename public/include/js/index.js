(function() {
  /* JQuery document ready handler */;  $(document).ready(function() {
    /*
        Hide nav label
      */    $(".nav-item-label").animate({
      opacity: 0
    }, 500);
    $("#home span:first").animate({
      opacity: 0
    }, 500);
    /*
        Show label on hover
      */
    $(".nav-item").hover(function(elem) {
      $(this).next().animate({
        opacity: 1
      }, 100);
      return $(this).find("span:first").animate({
        opacity: 1
      }, 100);
    }, function(elem) {
      $(this).next().animate({
        opacity: 0
      }, 100);
      return $(this).find("span:first").animate({
        opacity: 0
      }, 100);
    });
    /*
        Initialize and instrument horizontal sliding
      */
    $(".slider").serialScroll({
      target: '.slider',
      items: '#wrapper-home, #wrapper-introduction, #wrapper-approach, #wrapper-services, #wrapper-approach',
      duration: 500,
      axis: 'x',
      force: true
    });
    return $(".nav-item").click(function() {
      return $('.slider').scrollTo($("#wrapper-" + ($(this).attr("id"))), 500, {
        axis: 'x',
        easing: 'easeInOutQuad'
      });
    });
  });
}).call(this);
