(function() {
  /* JQuery document ready handler */;  $(document).ready(function() {
    /* 
      Load the index content 
    */    $("#centre-content").load("/include/portfolio.html");
    /*
        Add handlers for 
          1. right menu items and 
          2. main ribbon 
      */
    $("#item-about").click(function() {
      return $("#centre-content").load("/include/profile.html");
    });
    $("#item-portfolio").click(function() {
      return $("#centre-content").load("/include/portfolio.html");
    });
    return $("#item-main , #main-ribbon").click(function() {
      return $("#centre-content").load("/include/main.html");
    });
  });
}).call(this);
