jQuery(document).on 'turbolinks:load', ->
  club_id = $("#chat-box-club-id").val()

  App.club = App.cable.subscriptions.create {
    channel: "ClubChannel"
    club_id: club_id},
    connected: ->

    disconnected: ->

    received: (data) ->
      $("#list-messages").append data.message
      $('.pad-all').animate({scrollTop: $('.pad-all ul').height()},'slow')

    speak: (message) ->
      @perform 'speak', message: message, club_id: club_id

  $(document).on "keypress", "[data-behavior~=club_speaker]", (event) ->
    if event.keyCode is 13
      App.club.speak(event.target.value)
      event.target.value = ""
      event.preventDefault()

  $(".chat-box-submit").on "click",(event) ->
      App.club.speak($(".chat-input").val())
      $(".chat-input").val("")
      event.preventDefault()
