$(document).on('turbolinks:load', function() {
  $('.form-search-other-clubs').on('keyup',function(e) {
    SearchOtherClub();
  });

  $('.stype-other-clubs').on('change',function(e) {
    SearchOtherClub();
  });

  $('.stype-organizations-other-clubs').on('change',function(e) {
    SearchOtherClub();
  });
});

function SearchOtherClub() {
  var search = $('.form-search-other-clubs').val()
  var stype_clubs = $('.stype-other-clubs').val();
  var stype_organizations = $('.stype-organizations-other-clubs').val();
  var data = {q: {name_or_content_cont: search,
    club_type_eq: stype_clubs,organization_id_eq: stype_organizations}}
  $.get('/clubs', data , null, 'script');
  return false;
}
