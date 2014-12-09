
# JQuery document ready handler
$(document).ready ->

  if (('ontouchstart' in window) || window.DocumentTouch && document instanceof DocumentTouch )
    $('body').addClass('touch')
  else
    $('body').addClass('no-touch')


  $('#right-nav-button').on( 'click', ->
    $('body').toggleClass('show-nav')
  );














  # ###
  #   Initialize and instrument horizontal sliding
  # ###
  # $(".slider").serialScroll({ target: '.slider', items: '#wrapper-home, #wrapper-introduction, #wrapper-approach, #wrapper-services, #wrapper-approach', duration: 500, axis: 'x', force: true })

  # $(".nav-item").click(->


  #   # slide to the relevant section
  #   $('.slider').scrollTo($("#wrapper-#{$(this).attr("id")}"), 500, { axis:'x' , easing: 'easeInOutQuad'})


  #   # change background color accordingly
  #   if $(this).attr("id") is "blog"
  #     $("body").animate({ backgroundColor: "#FF8A31" }, 500)
  #     $("#wrapper-blog").css("height", "80%")
  #   else
  #     $("body").animate({ backgroundColor: $(this).css("background-color") }, 500)
    
  #   $(".slide-container-content").animate({
  #                                           color: "black"
  #                                         }, 500)
  # )

  ###
    Clink redirects for twitter link et al
  ###
  $("#cv").unbind("click").click(-> window.open("/include/TimothyWashington-Contract.pdf", '_blank'))
  $("#email").unbind("click").click(-> window.open("mailto:twashing@interruptsoftware.com" ))
  $("#twitter").unbind("click").click(-> window.open("https://twitter.com/nutritioustim", '_blank'))
  $("#linkedin").unbind("click").click(-> window.open("http://linkedin.com/pub/0/9b2/506", '_blank'))
  $("#github").unbind("click").click(-> window.open("https://github.com/twashing", '_blank'))

  $("#bkeeping-entry").unbind("click").click(-> window.open("http://bkeeping.com", '_blank'))
  $("#cloudeditor-entry").unbind("click").click(-> window.open("http://storydesk.com/cloudeditor", '_blank'))
