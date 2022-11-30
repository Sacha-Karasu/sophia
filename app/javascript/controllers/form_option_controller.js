import { Controller } from "@hotwired/stimulus"
// import { end } from "@popperjs/core"

// Connects to data-controller="option-index"
export default class extends Controller {
  static targets = ["noend", "end", "liste", "carte", "nouveau"]

  connect() {
    console.log("couc")
  }

  revealContent(event) {


    // if (this.event.carteTarget) {

    //   console.log("if1")

    //   this.listeTarget.classList.add("d-none") && this.carteTarget.classList.remove("d-none") && this.nouveauTarget.classList.add("d-none")
    // }
    // else if (this.nouveauTarget) {
    //   console.log("if2")
    //   this.nouveauTarget.classList.remove("d-none") && this.carteTarget.classList.add("d-none") && this.listeTarget.classList.add("d-none")
    // }
    // else if (this.listeTarget) {
    //   console.log("if3")
    //   this.nouveauTarget.classList.add("d-none") && this.carteTarget.classList.add("d-none")
    // }
  }

  displayForm() {

    console.log("couc")
    this.noendTarget.classList.toggle("d-none")
    this.endTarget.classList.toggle("d-none")
  }
}
