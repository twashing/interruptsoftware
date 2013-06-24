
# $(".slider").serialScroll({ target: '.slider', items: '#wrapper-home, #wrapper-introduction, #wrapper-approach, #wrapper-services, #wrapper-approach', duration: 500, axis: 'x', force: true }) 
# $('.slider').scrollTo($('#wrapper-approach'), 500, { axis:'x' , easing: 'easeInOutQuad'}) 


/* JQuery document ready handler */
$(document).ready ->
  
  ###
    Hide nav label
  ###
  #$(".nav-item-label").css('visibility', 'hidden')
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
    Load the index content 
  ###
  $("#centre-content")
    .css('display', 'none')
    .load("/include/main.html")
    .fadeIn(500, "linear")
  
  ###
    Add handlers for 
      1. right menu items and 
      2. main ribbon 
  ###
  
  transitionPageHandler("#item-about", "/include/profile.html", "/profile")
  transitionPageHandler("#item-portfolio", "/include/portfolio.html", "/portfolio")
  transitionPageHandler("#item-main , #main-ribbon", "/include/main.html", "/")
  
  
