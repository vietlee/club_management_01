$(function(){ Portfolio.init(); });
$(document).ready(function() {
$('.thumb').click(function(){
      $('.modal-body-image').empty();
    var title = $(this).parent('a').attr("title");
    $('.modal-title').html(title);
    $($(this).parents('div').html()).appendTo('.modal-body-image');
    $(".modal-body-image").find('span').remove();
    $('#myModalImage').modal({show:true});
});
});
