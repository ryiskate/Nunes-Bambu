$(function() {
  $(".show-cart").on('mouseover', function(e) {
    e.preventDefault();
    $('.cart-container').load('/orders/minicart');
  }); 
});
