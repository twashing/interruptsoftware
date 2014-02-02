(function() {
  $(document).ready(function() {
    /*
      Hide nav label
    */

    $(".nav-item-label").animate({
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
    return $("body").hover(function(elem) {
      return $(".header").animate({
        opacity: 1
      }, 250);
    }, function(elem) {
      return $(".header").animate({
        opacity: 0
      }, 250);
    });
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

  $(".nav-item").click(function() {
    $('.slider').scrollTo($("#wrapper-" + ($(this).attr("id"))), 500, {
      axis: 'x',
      easing: 'easeInOutQuad'
    });
    $("body").animate({
      backgroundColor: $(this).css("background-color")
    }, 500);
    return $(".slide-container-content").animate({
      color: "black"
    }, 500);
  });

  /*
    Clink redirects for twitter link et al
  */


  $("#cv").unbind("click").click(function() {
    return window.open("/include/TimothyWashington-Contract.pdf", '_blank');
  });

  $("#email").unbind("click").click(function() {
    return window.open("mailto:twashing@gmail.com", '_blank');
  });

  $("#twitter").unbind("click").click(function() {
    return window.open("https://twitter.com/nutritioustim", '_blank');
  });

  $("#linkedin").unbind("click").click(function() {
    return window.open("http://linkedin.com/pub/0/9b2/506", '_blank');
  });

  $("#github").unbind("click").click(function() {
    return window.open("https://github.com/twashing", '_blank');
  });

  $("#bkeeping-entry").unbind("click").click(function() {
    return window.open("http://bkeeping.com", '_blank');
  });

  $("#cloudeditor-entry").unbind("click").click(function() {
    return window.open("http://storydesk.com/cloudeditor", '_blank');
  });

}).call(this);
