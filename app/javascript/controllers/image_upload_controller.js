import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "input", "preview" ]

  upload(event) {
    const [file] = event.target.files

    if (file) {
      this.previewTarget.src = URL.createObjectURL(file)
    }
  }
}