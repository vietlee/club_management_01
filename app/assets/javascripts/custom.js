var CRUMINA = {};
(function ($) {
  "use strict";


  var $window = $(window),
    $document = $(document)

  CRUMINA.Materialize = function () {
    $.material.init();
    $('.checkbox > checkbox[type="checkbox"]').on('click', function () {
      $(this).closest('.checkbox').addClass('clicked');
    })
  };

  $document.ready(function () {
    CRUMINA.Materialize();

    // ------menu-----//
    $(".js-expanded-menu").on('click', function () {
      $('.profile-menu').toggleClass('expanded-menu');
      return false
    });
  });
})(jQuery);
