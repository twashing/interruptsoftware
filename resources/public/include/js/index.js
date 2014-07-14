(function() {
  var __indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

  var bgColours = {
    '#introduction': 'red',
    '#approach':     'orange',
    '#services':     'yellow',
    '#blog':         'green',
    '#about':        'blue',
  }

  var $main = $('#main')
  ,   $body = $('body')

  $(document).ready(function() {

    if ((__indexOf.call(window, 'ontouchstart') >= 0) || window.DocumentTouch && document instanceof DocumentTouch) {
      $('body').addClass('touch');
    } else {
      $('body').addClass('no-touch');
    }


    // Simplest router of all time
    // ********************************************************

    var activeView = false,
        transitioning = false

    var goToAnchor = function(newView, index){

      if( transitioning ) return
      if( ! newView ) return
      if( activeView === newView ) return
      if( ! $(newView) ) return

      console.log('go to anchor ' + newView)

      transitioning = true

      var bgcol = bgColours[ newView ]
      if( ! bgcol ) bgcol = 'white'

      if( activeView ){

        var $activeView = $(activeView),
            $newView = $(newView)

        var direction = ( index > $activeView.index() ) ? 'right' : 'left'

        $main.addClass(direction)
        $newView.addClass('in')

        setTimeout(function(){
          $main.addClass('transition')
          $activeView.removeClass('active').addClass('out')
          $newView.removeClass('in').addClass('active')
          $body.removeClass('red orange yellow green blue').addClass( bgcol )
        }, 50)

        setTimeout(function() { 
          $activeView.removeClass('out')
          $newView.removeClass('in').addClass('active')
          $main.removeClass('transition left right')

          activeView = newView
          transitioning = false
        }, 550);

      } else {

        $(newView).addClass('active')
          $body.removeClass('red orange yellow green blue').addClass( bgcol )
        activeView = newView
        transitioning = false

      }
      
    }

    // Catch anchor links
    $(document).delegate('a[href^="#"]', "click", function(e) {
      e.preventDefault();
      window.location.hash = this.hash
      goToAnchor( this.hash, $(this).index() );
    });

    goToAnchor( window.location.hash || '#introduction' );


    // Global jQuery UI

    $('#mobile-nav-header').on('click', function() {
      return $('body').toggleClass('show-nav');
    });

    $('#nav .local a').on('click', function(){
      $('body').removeClass('show-nav');
    })

    // /*
    //   Clink redirects for twitter link et al
    //  */
    // $("#cv").unbind("click").click(function() {
    //   return window.open("/include/TimothyWashington-Contract.pdf", '_blank');
    // });
    // $("#email").unbind("click").click(function() {
    //   return window.open("mailto:twashing@interruptsoftware.com");
    // });
    // $("#twitter").unbind("click").click(function() {
    //   return window.open("https://twitter.com/nutritioustim", '_blank');
    // });
    // $("#linkedin").unbind("click").click(function() {
    //   return window.open("http://linkedin.com/pub/0/9b2/506", '_blank');
    // });
    // $("#github").unbind("click").click(function() {
    //   return window.open("https://github.com/twashing", '_blank');
    // });
    // $("#bkeeping-entry").unbind("click").click(function() {
    //   return window.open("http://bkeeping.com", '_blank');
    // });
    // return $("#cloudeditor-entry").unbind("click").click(function() {
    //   return window.open("http://storydesk.com/cloudeditor", '_blank');
    // });
  });

}).call(this);
