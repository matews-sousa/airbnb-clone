import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "input", "line1", "line2", "city", "state", "postal_code", "country", "lat", "lng" ]

  connect() {
    if (typeof(google) != "undefined") {
      this.initMap()
    }
  }

  initMap() {
    this.autocomplete = new google.maps.places.Autocomplete(this.inputTarget, {
      fields: ["geometry", "address_components"],
      types: ["address"]
    })
    this.autocomplete.addListener("place_changed", this.placeSelected.bind(this))
  }

  placeSelected() {
    const place = this.autocomplete.getPlace()
    this.latTarget.value = place.geometry.location.lat()
    this.lngTarget.value = place.geometry.location.lng()

    for (const component of place.address_components) {
      const componentType = component.types[0]
      switch (componentType) {
        case "street_number":
          this.line1Target.value = `${component.long_name} ${this.cityTarget.value}`
          break
        case "route":
          this.line1Target.value += component.short_name
          break
        case "postal_code":
          this.postal_codeTarget.value = component.long_name
          break
        case "postal_code_suffix":
          this.postal_codeTarget.value = `${this.postalCodeTarget.value}-${component.long_name}`
          break
        case "locality":
          this.cityTarget.value = component.long_name
          break
        case "administrative_area_level_1":
          this.stateTarget.value = component.short_name
          break
        case "country":
          this.countryTarget.value = component.long_name
          break
      }
    }
  }

  keydown(event) {
    if (event.key === "Enter") {
      event.preventDefault()
    }
  }
}