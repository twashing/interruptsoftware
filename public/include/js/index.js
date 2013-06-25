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
      $('.slider').scrollTo($("#wrapper-" + ($(this).attr("id"))), 500, {
        axis: 'x',
        easing: 'easeInOutQuad'
      });
      $("body").animate({
        backgroundColor: $(this).css("background-color")
      }, 500);
      return $(".slide-container-content").animate({
        color: $(this).attr("id") === "services" ? "white" : "black"
      }, 500);
    });
  });
}).call(this);
