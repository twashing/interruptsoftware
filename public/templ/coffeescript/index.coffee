
/* Common handler for page transitions */
transitionPageHandler = (ctxt, purl) -> 
  
  centreC = $("#centre-content")
  ctxtObj = $(ctxt)
  
  ctxtObj.click ->
    centreC.fadeOut(200, "linear", () ->
        centreC.load(purl, () -> 
          centreC.fadeIn(500, "linear")
        )
      )

/* JQuery document ready handler */ 
$(document).ready -> 
  
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
  
  transitionPageHandler("#item-about", "/include/profile.html")
  transitionPageHandler("#item-portfolio", "/include/portfolio.html")
  transitionPageHandler("#item-main , #main-ribbon", "/include/main.html")
  
