import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form-option"
export default class extends Controller {
  static targets = ["noend", "end"]

  connect() {

  }

  displayForm() {
    this.noendTarget.classList.toggle("d-none")
    this.endTarget.classList.toggle("d-none")
  }


}
