import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="room-subscription"
export default class extends Controller {

  static values = { roomId: Number, currentUserId: Number }
  static targets = ["messages"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
            { channel: "RoomChannel", id: this.roomIdValue },
            { received: data => this.#insertMessageAndScrollDown(data)}
      )
    }

    disconnect() {
      console.log("Unscribed from the room")
      this.channel.unsubscribe()
    }

  #insertMessageAndScrollDown(data) {
    const currentUserIsSender = this.currentUserIdValue === data.sender_id
    // Creating the whole message from the `data.message` String
    const messageElement = this.#buildMessageElement(currentUserIsSender, data.message)
    // Inserting the `message` in the DOM
    this.messagesTarget.insertAdjacentHTML("beforeend", messageElement)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)

    // ACTION CABLE - VERSION SIMPLE
    // this.messagesTarget.insertAdjacentHTML("beforeend", data)

    // TESTS FOR SCROLL DOWN
    // console.log(this.messagesTarget)
    // this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }

  #buildMessageElement(currentUserIsSender, message) {
    return `
      <div class="message-row d-flex ${this.#justifyClass(currentUserIsSender)}">
      ${message}
      </div>
      </div>
      `
  }
      // <div class="${this.#userStyleClass(currentUserIsSender)}">

  #justifyClass(currentUserIsSender) {
    return currentUserIsSender ? "justify-content-end" : "justify-content-start"
  }

  // #userStyleClass(currentUserIsSender) {
  //   return currentUserIsSender ? "sender-style" : "receiver-style"
  // }

  resetForm(event) {
    event.target.reset()
  }

}
