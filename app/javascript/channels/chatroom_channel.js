import consumer from "channels/consumer"

consumer.subscriptions.create("ChatroomChannel", {
  connected() {
    console.log("Connected")
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {

    $("#message-box").append(data)
    $( '#chatroom-form' ).each(function(){
      this.reset();
    });
    $(document).ready(function(){$("#exampleFormControlInput1").focus();})
    // $("#exampleFormControlInput1").autofocus(true)
    // Called when there's incoming data on the websocket for this channel
  }
});


