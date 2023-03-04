// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "@hotwired/stimulus"
import "./controllers"

window.initMap = function(...args) {
  const event = new Event("MapLoaded")
  event.initEvent("map-loaded", true, true);
  window.dispatchEvent(event)
}