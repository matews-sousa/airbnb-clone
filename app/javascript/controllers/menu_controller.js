import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu", "button"]

  toggle() {    
    this.menuTarget.classList.toggle("hidden")
  }

  close(event) { 
    const buttonClicked = this.buttonTarget.contains(event.target)

    if (!buttonClicked || event.key === "Escape") {
      this.menuTarget.classList.add("hidden")
    } 
  }
}