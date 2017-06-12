jQuery(document).on 'turbolinks:load', ->
  club_id = $("#chat-box-club-id").val()
  if (App.cable.subscriptions['subscriptions'].length > 1)
    App.cable.subscriptions.remove(App.cable.subscriptions['subscriptions'][1])
  App.club = App.cable.subscriptions.create {
    channel: "ClubChannel"
    club_id: club_id},
    connected: ->

    disconnected: ->

    received: (data) ->
      $("#list-messages").append data.message
      $('div').animate({scrollTop: $('#viewport-content ul').height()},'slow');

    speak: (message) ->
      @perform 'speak', message: message, club_id: club_id


  $(".row-chat").on "submit",(event) ->
    if $('.chat-input').val().length > 0
      App.club.speak($(".chat-input").val())
      $(".chat-input").val("")
      event.preventDefault()
