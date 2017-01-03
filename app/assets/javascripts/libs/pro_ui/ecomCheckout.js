var EcomCheckout = function() {
  return {
    init: function() {
      var checkoutWizard = $('#checkout-wizard');
      checkoutWizard
        .formwizard({
          disableUIStyles: true,
          inDuration: 0,
          outDuration: 0,
          textBack: I18n.t('previous_step'),
          textNext: I18n.t('next_step'),
          textSubmit: I18n.t('confirm_order')
        });
      $('.checkout-steps a').on('click', function() {
        var gotostep = $(this).data('gotostep');

        checkoutWizard
          .formwizard('show', gotostep);
      });
    }
  };
}();
