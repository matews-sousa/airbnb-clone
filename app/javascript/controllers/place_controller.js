import { Controller } from "@hotwired/stimulus"
import { getDistance } from "geolib"

export default class extends Controller {
  static targets = ["distance"]

  static values = {
    latitude: Number,
    longitude: Number
  }

  connect() {
    navigator.geolocation.getCurrentPosition((position) => {
      if (!this.latitudeValue || !this.longitudeValue) {
        this.distanceTarget.textContent = "No location data available"
        return;
      }

      const { latitude, longitude } = position.coords
      const distance = getDistance(
        { latitude, longitude },
        { latitude: this.latitudeValue, longitude: this.longitudeValue }
      )
      const distanceInKm = Math.floor(distance / 1000)
      this.distanceTarget.textContent = `${distanceInKm} kilometers away`
    })
  }
}