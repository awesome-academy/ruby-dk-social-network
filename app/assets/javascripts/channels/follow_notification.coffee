App.follow_notification = App.cable.subscriptions.create "FollowNotificationChannel",
  connected: ->
    console.log("connected")
  disconnected: ->

  received: (data) ->
    console.log(data["event"])
    alert(data["event"])
    $('#open_notification').prepend "#{data["notification"].count}"
