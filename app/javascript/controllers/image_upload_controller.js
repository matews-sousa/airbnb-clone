import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "input", "preview" ]

  upload(event) {
    const [file] = event.target.files

    if (file) {
      this.previewTarget.src = URL.createObjectURL(file)
    }
  }

  uploadMultiple() {
    const files = this.inputTarget.files

    if (files) {
      Array.from(files).forEach((file) => {
        const img = document.createElement("img")
        img.classList.add("w-44", "h-44", "object-cover", "cursor-pointer", "hover:outline", "hover:outline-2", "hover:outline-red-500")
        img.src = URL.createObjectURL(file)
        img.dataset.id = file.name
        img.addEventListener("click", (event) => {
          this.remove(event)
        })
        this.previewTarget.appendChild(img)
      })
    }
  }

  remove(event) {
    const image = event.target
    image.remove()
    const files = Array.from(this.inputTarget.files)

    const filteredFiles = files.filter((file) => {
      return file.name !== image.dataset.id
    })

    // for each file in filteredFiles, create a new File object
    // and add it to the newFiles array
    const newFiles = []
    filteredFiles.forEach((file) => {
      const newFile = new File([file], file.name, { type: file.type })
      newFiles.push(newFile)
    })

    // set the inputTarget.files to the newFiles array
    const dataTransfer = new DataTransfer()
    
    newFiles.forEach((file) => {
      dataTransfer.items.add(file)
    })

    this.inputTarget.files = dataTransfer.files
  }
}