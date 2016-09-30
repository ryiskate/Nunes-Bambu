$(".add-item-form").submit(function(e){
    $('.add-item-confirmation').show();
});

$(function() {
  $("a#close").click(function(e){
    $('.minicart').hide();
  });
});