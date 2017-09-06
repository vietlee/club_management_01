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
  $('ul.first').bsPhotoGallery({
    "classes" : "col-md-6 col-sm-3 col-xs-4 col-xxs-12",
    "hasModal" : true
  });
  $('.image-club-show').bsPhotoGallery({
    "classes" : "col-md-3 image-club-show col-sm-3 col-xs-3",
    "hasModal" : true
  });
});
$(document).ready(function () {
  baguetteBox.run(".tz-gallery");
});
