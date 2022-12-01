import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="room-subscription"
export default class extends Controller {

  static values = { roomId: Number, currentUserId: Number }
  static targets = ["messages"]

  connect() {

    this.channel = createConsumer().subscriptions.create(
      { channel: "RoomChannel", id: this.roomIdValue },
      { received: data => this.#insertMessageAndScrollDown(data) }
    )
    console.log(`Subscribe to the chatroom with the id ${this.chatroomIdValue}.`)
    }

  #insertMessageAndScrollDown(data) {
    const currentUserIsSender = this.currentUserIdValue === data.sender_id
    // Creating the whole message from the `data.message` String
    const messageElement = this.#buildMessageElement(currentUserIsSender, data.message)

    // Inserting the `message` in the DOM
    this.messagesTarget.insertAdjacentHTML("beforeend", messageElement)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)

    // this.messagesTarget.insertAdjacentHTML("beforeend", data)
    // console.log(this.messagesTarget)
    // this.messagesTarget.scrollTo(0, this.messagesTarget)
  }

  #buildMessageElement(currentUserIsSender, message) {
    return `
      <div class="message-row d-flex ${this.#justifyClass(currentUserIsSender)}">
        <div class="${this.#userStyleClass(currentUserIsSender)}">
          ${message}
        </div>
      </div>
    `
  }

  #justifyClass(currentUserIsSender) {
    return currentUserIsSender ? "justify-content-end" : "justify-content-start"
  }

  #userStyleClass(currentUserIsSender) {
    return currentUserIsSender ? "sender-style" : "receiver-style"
  }

  resetForm(event) {
    event.target.reset()
  }

  disconnect() {
    console.log("Unscribed from the room")
    this.channel.unsubscribe()
  }
}
