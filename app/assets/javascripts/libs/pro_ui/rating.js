(function($) {
  $.fn.rating = function() {
    var element;

    function _paintValue(ratingInput, value) {
      var selectedStar = $(ratingInput).find('[data-value=' + value + ']');
      selectedStar.removeClass('fa fa-star-o').addClass('fa fa-star');
      selectedStar.prevAll('[data-value]').removeClass('fa fa-star-o').addClass('fa fa-star');
      selectedStar.nextAll('[data-value]').removeClass('fa fa-star').addClass('fa fa-star-o');
    }

    function _clearValue(ratingInput) {
      var self = $(ratingInput);
      self.find('[data-value]').removeClass('fa fa-star').addClass('fa fa-star-o');
      self.find('.rating-clear').hide();
      self.find('input').val('').trigger('change');
    }
    for (element = this.length - 1; element >= 0; element--) {
      var el, i, ratingInputs,
        originalInput = $(this[element]),
        max = originalInput.data('max') || 5,
        min = originalInput.data('min') || 0,
        clearable = originalInput.data('clearable') || null,
        stars = '';
      for (i = min; i <= max; i++) {
        stars += ['<span class="fa fa-star-o" data-value="', i, '"></span>'].join('');
      }
      if (clearable) {
        stars += [
          ' <a class="rating-clear" style="display:none;" href="javascript:void">',
          '<span class="fa fa-star-remove"></span> ',
          clearable,
          '</a>'
        ].join('');
      }
      el = [
        '<div class="rating-input">',
        stars,
        '<input type="hidden" name="',
        originalInput.attr('name'),
        '" value="',
        originalInput.val(),
        '" id="',
        originalInput.attr('id'),
        '" />',
        '</div>'
      ].join('');
      originalInput.replaceWith(el);
    }
    $('.rating-input')
      .on('mouseenter', '[data-value]', function() {
        var self = $(this);
        _paintValue(self.closest('.rating-input'), self.data('value'));
      })
      .on('mouseleave', '[data-value]', function() {
        var self = $(this);
        var val = self.siblings('input').val();
        if (val) {
          _paintValue(self.closest('.rating-input'), val);
        } else {
          _clearValue(self.closest('.rating-input'));
        }
      })
      .on('click', '[data-value]', function(e) {
        var self = $(this);
        var val = self.data('value');
        self.siblings('input').val(val).trigger('change');
        self.siblings('.rating-clear').show();
        e.preventDefault();
        false
      })
      .on('click', '.rating-clear', function(e) {
        _clearValue($(this).closest('.rating-input'));
        e.preventDefault();
        false
      })
      .each(function() {
        var val = $(this).find('input').val();
        if (val) {
          _paintValue(this, val);
          $(this).find('.rating-clear').show();
        }
      });
  };
  $(function() {
    if ($('input.rating[type=number]').length > 0) {
      $('input.rating[type=number]').rating();
    }
  });
  $(document).on("click", ".rating-input span", function(event) {
    $.post(
      "/ratings", {
        rating: $(".rating-input input").val(),
        club_id: $("#club_id").val()
      },
      function(data) {}
    );
  });
}($));
