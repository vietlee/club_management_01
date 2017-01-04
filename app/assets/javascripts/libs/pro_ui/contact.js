var Contact = function() {
  return {
    init: function() {
      new GMaps({
        div: '#gmap',
        lat: -33.8703,
        lng: 151.2254,
        zoom: 15,
        disableDefaultUI: true,
        scrollwheel: false
      }).addMarkers([{
        lat: -33.8703,
        lng: 151.2254,
        title: I18n.t('find_us'),
        infoWindow: {
          content: '<strong>I18n.t("company_add") &amp; I18n.t("info")</strong>'
        },
        animation: google.maps.Animation.DROP
      }]);
      $('#form-contact').validate({
        errorClass: 'help-block animation-slideDown',
        errorElement: 'div',
        errorPlacement: function(error, e) {
          e.parents('.form-group').append(error);
        },
        highlight: function(e) {
          $(e).closest('.form-group').removeClass('has-success has-error').addClass('has-error');
          $(e).closest('.help-block').remove();
        },
        success: function(e) {
          e.closest('.form-group').removeClass('has-success has-error');
          e.closest('.help-block').remove();
        },
        rules: {
          'contact-name': {
            required: true,
            minlength: 3
          },
          'contact-email': {
            required: true,
            email: true
          },
          'contact-message': {
            required: true,
            minlength: 5
          }
        },
        messages: {
          'contact-name': {
            required: I18n.t('let_us_know_name'),
            minlength: I18n.t('let_us_know_name')
          },
          'contact-email': I18n.t('let_us_know_email'),
          'contact-message': {
            required: I18n.t('let_us_know_assist'),
            minlength: I18n.t('let_us_know_assist')
          }
        }
      });
    }
  };
}();
