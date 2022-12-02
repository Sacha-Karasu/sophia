import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="scroll-custom"
export default class extends Controller {
  static targets = ["messages"]
  connect() {
    console.log("Connected to scroll custom")
    this.messagesTarget.scrollTo({
      top: this.messagesTarget.scrollHeight,
      left: 0,
      behavior: "auto"
    })
  }
}
