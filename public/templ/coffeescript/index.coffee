

/* JQuery document ready handler */
$(document).ready ->



  ###
    Hide nav label
  ###
  $(".nav-item-label").animate({opacity:0}, 500)
  $("#home span:first").animate({opacity:0}, 500)


  ###
    Show label on hover
  ###
  $(".nav-item").hover(
                        (elem) ->
                          $(@).next().animate({opacity:1}, 100)
                          $(@).find("span:first").animate({opacity:1}, 100)
                        ,
                        (elem) ->
                          $(@).next().animate({opacity:0}, 100)
                          $(@).find("span:first").animate({opacity:0}, 100)
                      )

  $("body").hover(
                   (elem) ->
                     $(".header").animate({opacity:1}, 250)
                   ,
                   (elem) ->
                     $(".header").animate({opacity:0}, 250)
                 )


  ###
    Initialize and instrument horizontal sliding
  ###
  $(".slider").serialScroll({ target: '.slider', items: '#wrapper-home, #wrapper-introduction, #wrapper-approach, #wrapper-services, #wrapper-approach', duration: 500, axis: 'x', force: true })

  $(".nav-item").click(->

    # slide to the relevant section
    $('.slider').scrollTo($("#wrapper-#{$(this).attr("id")}"), 500, { axis:'x' , easing: 'easeInOutQuad'})

    # change background color accordingly
    $("body").animate({ backgroundColor: $(this).css("background-color") }, 500)
    $(".slide-container-content").animate({
                                            color: if $(this).attr("id") is "services" then "white" else "black"
                                          }, 500)
  )

  ###
    Clink redirects for twitter link et al
  ###
  $("#cv").unbind("click").click(-> window.open("/include/TimothyWashington-contract.pdf", '_blank'))
  $("#email").unbind("click").click(-> window.open("mailto:twashing@gmail.com", '_blank'))
  $("#twitter").unbind("click").click(-> window.open("https://twitter.com/nutritioustim", '_blank'))
  $("#linkedin").unbind("click").click(-> window.open("http://linkedin.com/pub/0/9b2/506", '_blank'))

  $("#bkeeping-entry").unbind("click").click(-> window.open("http://bkeeping.com", '_blank'))
  $("#cloudeditor-entry").unbind("click").click(-> window.open("http://storydesk.com/cloudeditor", '_blank'))
