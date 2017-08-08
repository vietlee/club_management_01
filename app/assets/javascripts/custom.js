var CRUMINA = {};
(function ($) {
  "use strict";

  var $window = $(window),
      $document = $(document);

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

    // Toggle aside panels Left menu
    $(".js-sidebar-open").on('click', function () {
      $(this).toggleClass('active');
      $(this).closest('.fixed-sidebar').toggleClass('open');
      return false;
    });
  });
})(jQuery);
