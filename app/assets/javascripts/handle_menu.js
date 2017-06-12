var App_handle = function() {
  var uiInit_handle = function() {
    handleHeader();
    handleMenu();
  };
  var handleHeader = function() {
    var header = $('header');
    $(window).scroll(function() {
      if ($(this).scrollTop() > header.outerHeight()) {
        header.addClass('header-scroll');
      } else {
        header.removeClass('header-scroll');
      }
    });
  };
  var handleMenu = function() {
    var sideNav = $('.site-nav');
    $('.site-menu-toggle').on('click', function() {
      sideNav.toggleClass('site-nav-visible');
    });

    sideNav.on('mouseleave', function() {
      $(this).removeClass('site-nav-visible');
    });
  };
  return {
    init: function() {
      uiInit_handle();
    }
  };
}();
$(function() {
  App_handle.init();
});
