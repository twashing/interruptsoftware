
/* JQuery document ready handler */ 
$(document).ready -> 
  
  ### 
    Load the index content 
  ###
  $("#centre-content").load("/include/profile.html")
  
  
  ###
    Add handlers for 
      1. right menu items and 
      2. main ribbon 
  ###
  $("#item-about").click -> $("#centre-content").load("/include/profile.html")
  $("#item-portfolio").click -> $("#centre-content").load("/include/portfolio.html")
  
  $("#item-main , #main-ribbon").click -> $("#centre-content").load("/include/main.html")

