import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="star-review"
export default class extends Controller {
  static targets = [ ]

  static values = {
    rating: Number
  }

  changeValue(event) {
    this.ratingValue = event.target.value

    // loop through all the stars
    for (let i = 1; i <= 5; i++) {
      // if the current star is less than or equal to the rating value
      if (i <= this.ratingValue) {
        // add the 'checked' class
        this.element.querySelector(`#star-${i} svg`).classList.add('text-yellow-400')
      } else {
        // otherwise remove the 'checked' class
        this.element.querySelector(`#star-${i} svg`).classList.remove('text-yellow-400')
      }
    }
  }
}
