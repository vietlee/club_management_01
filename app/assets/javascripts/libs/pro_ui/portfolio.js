var Portfolio = function() {
  return {
    init: function() {
      var portfolioFilter = $('.portfolio-filter');
      var portfolio = $('.portfolio');
      var showCategory;
      portfolioFilter.find('a').on('click', function() {
        showCategory = $(this).data('category');
        if (!$(this).hasClass('active')) {
          portfolioFilter.find('a').removeClass('active');
          $(this).addClass('active');
          if (showCategory === 'all') {
            portfolio
              .find('.portfolio-item')
              .hide(0, function() {
                $(this).show(0);
              });
          } else {
            portfolio
              .find('.portfolio-item')
              .hide(0, function() {
                portfolio
                  .find('.portfolio-item[data-category="' + showCategory + '"]')
                  .show(0);
              });
          }
        }
      });
    }
  };
}();
