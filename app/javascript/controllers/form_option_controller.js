import { Controller } from "@hotwired/stimulus"
// import { end } from "@popperjs/core"

// Connects to data-controller="option-index"
export default class extends Controller {
  static targets = ["noend", "end", "list", "map", "new", "listToggle", "mapToggle", "newToggle", "address", "address2"]

  connect() {
    console.log("Connected to form-option controller")
    console.group(this.listTarget)
  }

  revealList() {

    this.listTarget.classList.remove("d-none")
    this.mapTarget.classList.add("d-none")
    this.newTarget.classList.add("d-none")
    this.listToggleTarget.classList.add("selected")
    this.mapToggleTarget.classList.remove("selected")
    this.newToggleTarget.classList.remove("selected")

  }

  revealMap() {

    this.mapTarget.classList.remove("d-none")
    this.listTarget.classList.add("d-none")
    this.newTarget.classList.add("d-none")
    this.listToggleTarget.classList.remove("selected")
    this.mapToggleTarget.classList.add("selected")
    this.newToggleTarget.classList.remove("selected")

  }

  revealNew() {

    this.newTarget.classList.remove("d-none")
    this.mapTarget.classList.add("d-none")
    this.listTarget.classList.add("d-none")
    this.listToggleTarget.classList.remove("selected")
    this.mapToggleTarget.classList.remove("selected")
    this.newToggleTarget.classList.add("selected")

  }

  displayForm() {

    this.noendTarget.classList.toggle("d-none")
    this.endTarget.classList.toggle("d-none")
  }

  displayAddress() {
    this.addressTarget.classList.toggle("d-none")
  }

  displayAddress2() {
    this.address2Target.classList.toggle("d-none")
  }

}
