$(function(){ Portfolio.init(); });
$(document).ready(function() {
$('.thumb').click(function(){
      $('.modal-body').empty();
    var title = $(this).parent('a').attr("title");
    $('.modal-title').html(title);
    $($(this).parents('div').html()).appendTo('.modal-body');
    $(".modal-body").find('span').remove();
    $('#myModal').modal({show:true});
});
});
