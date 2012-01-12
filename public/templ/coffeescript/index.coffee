
/* JQuery document ready handler */ 
$(document).ready -> 
  
  ### 
    Load the index content 
  ###
  $("#centre-column").load("/include/main.html")
  
  
  ###
    Add handlers for 
      1. right menu items and 
      2. main ribbon 
  ###
  $("#item-about").click -> $("#centre-column").load("/include/profile.html")
  $("item-portfolio").click -> $("#centre-column").load("/include/portfolio.html")
  
  $("#main-ribbon").click -> $("#centre-column").load("/include/main.html")

