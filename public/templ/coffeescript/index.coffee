
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
  $("#item-about").click -> $("#centre-content").load("/include/profile.html")
  $("#item-portfolio").click -> $("#centre-content").load("/include/portfolio.html")
  $("#item-main , #main-ribbon").click -> $("#centre-content").load("/include/main.html")
  ###
  
  transitionPageHandler("#item-about", "/include/profile.html")
  transitionPageHandler("#item-portfolio", "/include/portfolio.html")
  transitionPageHandler("#item-main , #main-ribbon", "/include/main.html")
  
