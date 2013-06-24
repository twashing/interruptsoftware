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
      Load the index content 
    */
    $("#centre-content").css('display', 'none').load("/include/main.html").fadeIn(500, "linear");
    /*
        Add handlers for 
          1. right menu items and 
          2. main ribbon 
      */
    transitionPageHandler("#item-about", "/include/profile.html", "/profile");
    transitionPageHandler("#item-portfolio", "/include/portfolio.html", "/portfolio");
    return transitionPageHandler("#item-main , #main-ribbon", "/include/main.html", "/");
  });
}).call(this);
