$(document).ready(function(){
  $('.admin_product_properties_page').click(function(){
  	$('.admin_product_properties_page').css('color', 'black');
  	$(this).css('color', 'red');
  	var number = $(this).data('number');
  	$('.product_properties_tab').css('display', 'none');
  	$('.product_properties_tab[data-number='+number+']').css('display', 'block');
  });
});
