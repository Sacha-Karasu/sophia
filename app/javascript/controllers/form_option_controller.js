import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form-option"
export default class extends Controller {
  connect() {

  }

  displayForm() {
    this.noendTarget.classList.add("d-none")
    this.noendTarget.classList.add("d-none")
  }


}
