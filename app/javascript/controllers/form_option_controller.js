import { Controller } from "@hotwired/stimulus"
// import { end } from "@popperjs/core"

// Connects to data-controller="option-index"
export default class extends Controller {
  static targets = ["noend", "end", "list", "map", "new"]

  connect() {
    console.log("couc")
  }

  revealList() {

    this.listTarget.classList.remove("d-none")
    this.mapTarget.classList.add("d-none")
    this.newTarget.classList.add("d-none")

  }

  revealMap() {

    this.mapTarget.classList.remove("d-none")
    this.listTarget.classList.add("d-none")
    this.newTarget.classList.add("d-none")

  }

  revealNew() {

    this.newTarget.classList.remove("d-none")
    this.mapTarget.classList.add("d-none")
    this.listTarget.classList.add("d-none")

  }

  displayForm() {

    console.log("couc")
    this.noendTarget.classList.toggle("d-none")
    this.endTarget.classList.toggle("d-none")
  }
}
