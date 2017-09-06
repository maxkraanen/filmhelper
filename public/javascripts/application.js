$(document).ready(function(){
  $(".form-background").click(function()
  {
    $(this).toggleClass("form-background-expand");
    $('.all-search-results').toggleClass("hidden");
  });

});
