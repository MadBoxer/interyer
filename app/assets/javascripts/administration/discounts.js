$(document).ready(function(){
    $('select#parent_category').change(function(){
        $.get('/administration/discounts/get_category_children', {id : $(this).val()}, function(a){
            $('.children_cats').html(a);
        });
    });
    $('button#get_cat_products').click(function(){
        src = $('select#children_category')[0];
        if(src == undefined)
        {
            src = $('select#parent_category');
        }
        else
            src = $(src);
        $.get('/administration/discounts/get_category_products', {id : src.val(), discount : $('input[name="discount[id]"]').val()}, function(a){
            $('#product_list').html(a);
        });
    });
});