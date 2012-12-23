function checkFieldEmpty(field, s, s_i)
{
	var style = '1px solid #ccc';
  	var style_inc = '1px solid red';
	if(field.val() == '')
  	{
  		field.css('border', s_i);
  		return false;
  	}
  	else
  		field.css('border', s);
  	return true;
}
$(document).ready(function(){
  $('#user_reg_form').submit(function(e){
  	var style = '1px solid #ccc';
  	var style_inc = '1px solid red';

  	var fio =  $('input[name="user[fio]"]');
  	var email =  $(this).find('input[name="user[email]"]');
  	var pass = $(this).find('input[name="user[password]"]');
  	var conf_pass = $(this).find('input[name="user[confirm_password]"]');
  	
  	var valid = true;
  	if(!checkFieldEmpty(fio, style, style_inc))
  		valid = false;
  	if(!checkFieldEmpty(email, style, style_inc))
  		valid = false;
  	if(!checkFieldEmpty(pass, style, style_inc))
  		valid = false;
  	if(!checkFieldEmpty(conf_pass, style, style_inc))
  		valid = false;
  		
  		
  	if(conf_pass.val() != pass.val())
  	{
  		pass.css('border', style_inc);
  		conf_pass.css('border', style_inc);
  		valid = false;
  	}
  	if(!valid)
  		e.preventDefault();
  	
  });
});
