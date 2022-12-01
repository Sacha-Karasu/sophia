// import { Controller } from "@hotwired/stimulus"

// // Connects to data-controller="scroll-custom"
// export default class extends Controller {
//   connect() {
//     console.log("Connected to scroll custom")
//     const messages = document.getElementById("messages")
//     messages.addEventListener("DOMNodeInserted", this.resetScroll)
//     this.resetScroll(messages);
//   }

//   disconnect() {

//   }

//   resetScroll() {
//     console.log("t'es dans reset scroll custom")
//     messages.scrollTo(0, "#messages")
//     // messages.scrollTop = messages.scrollHeight - messages.clientHeight;
//   }
// }
