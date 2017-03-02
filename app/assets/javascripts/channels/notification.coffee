App.notification = App.cable.subscriptions.create 'NotificationChannel',
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('.notificationsBody').append data.notification
    $('.notification_count').text($('.notification-un_read').length)
    $('.notification_count').fadeIn('slow')
  push: ->
    @perform 'push'
