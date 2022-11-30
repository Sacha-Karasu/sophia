import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="room-subscription"
export default class extends Controller {

  static values = { roomId: Number }
  static targets = ["messages"]

  connect() {

    this.channel = createConsumer().subscriptions.create(
      { channel: "RoomChannel", id: this.roomIdValue },
      { received: data => this.#insertMessageAndScrollDown(data) }
    )
    console.log(`Subscribe to the chatroom with the id ${this.chatroomIdValue}.`)
    }

  #insertMessageAndScrollDown(data) {

    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    console.log(this.messagesTarget)
    this.messagesTarget.scrollTo(0, 0)
  }

  resetForm(event) {

    event.target.reset()
  }

  disconnect() {
    console.log("Unscribed from the room")
    this.channel.unsubscribe()
  }
}
