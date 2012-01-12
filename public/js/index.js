(function() {
  /* JQuery document ready handler */;  $(document).ready(function() {
    /* 
      Load the index content 
    */    $("#centre-column").load("/include/main.html");
    /*
        Add handlers for 
          1. right menu items and 
          2. main ribbon 
      */
    $("#item-about").click(function() {
      return $("#centre-column").load("/include/profile.html");
    });
    $("item-portfolio").click(function() {
      return $("#centre-column").load("/include/portfolio.html");
    });
    return $("#main-ribbon").click(function() {
      return $("#centre-column").load("/include/main.html");
    });
  });
}).call(this);
