$(function(){
  $(".rate-form").submit(function(e){
    e.preventDefault();
    var data = $(this).serializeArray();
    $.post("/rates.json", data)
      .done(function(data){
        paintStars(data);
        $(`.rate-form`).find('input[type="submit"]').prop('disabled', false);
      })
      .fail(function(){
        console.log("erro");
      });
  });
  
  function paintStars(value){
    var stars = $(".star-conteiner i");
    stars.removeClass("fa-star fa-3 fa-star-half-o fa-star-o");
    $.each(stars, function(i, star){
      if (value >= i+1-0.2){
        $(star).addClass("fa-star fa-3");
      } else if(value > i+1-0.7){
        $(star).addClass("fa-star-half-o");
      } else {
        $(star).addClass("fa-star-o");
      }
    });
  }
})