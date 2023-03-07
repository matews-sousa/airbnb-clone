import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
  static targets = [ "map" ]

  static values = {
    latitude: Number,
    longitude: Number,
  }

  connect() {
    if (window.google) {
      this.initMap()
    }
  }

  initMap() {
    const coordinates = { lat: this.latitudeValue, lng: this.longitudeValue}
    this._map = new google.maps.Map(this.mapTarget, {
      center: coordinates,
      zoom: 15,
    })

    new google.maps.Marker({
      position: coordinates,
      map: this._map,
      title: "You will stay here!"
    })
  }
}
