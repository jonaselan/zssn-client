$('home.index').ready(function(){

  $(".link-to-survivor").click(function() {
    window.location = $(this).data("href");
  });

});
