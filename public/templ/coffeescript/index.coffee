

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


