(function() {
  var __indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

  $(document).ready(function() {
    if ((__indexOf.call(window, 'ontouchstart') >= 0) || window.DocumentTouch && document instanceof DocumentTouch) {
      $('body').addClass('touch');
    } else {
      $('body').addClass('no-touch');
    }
    $('#right-nav-button').on('click', function() {
      return $('body').toggleClass('show-nav');
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
      if ($(this).attr("id") === "blog") {
        $("body").animate({
          backgroundColor: "#FF8A31"
        }, 500);
        $("#wrapper-blog").css("height", "80%");
      } else {
        $("body").animate({
          backgroundColor: $(this).css("background-color")
        }, 500);
      }
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
      return window.open("mailto:twashing@interruptsoftware.com");
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
    return $("#cloudeditor-entry").unbind("click").click(function() {
      return window.open("http://storydesk.com/cloudeditor", '_blank');
    });
  });

}).call(this);
