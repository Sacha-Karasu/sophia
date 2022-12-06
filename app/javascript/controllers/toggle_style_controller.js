import { Controller } from "@hotwired/stimulus"


// Connects to data-controller="toggle-style"
export default class extends Controller {
  connect() {
    console.log("Connected to toggle style controller")
  }

  styleToggle() {
    this.listToggleTarget.classList.toggle("selected")
    this.mapToggleTarget.classList.toggle("selected")
    this.newToggleTarget.classList.toggle("selected")
  }
}
