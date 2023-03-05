import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="reservation"
export default class extends Controller {
  static targets = ["checkin", "checkout", "totalNights", "totalPerNight", "totalPrice"]

  static values = {
    price: Number,
    minNights: Number,
    cleaningFee: Number,
    firstDateAvailable: String,
  }

  connect() {
    // set minCheckout date to today + minNights
    const minCheckout = new Date()
    minCheckout.setDate(minCheckout.getDate() + this.minNightsValue)
    this.checkoutTarget.min = minCheckout.toISOString().substr(0, 10)

    this.checkinTarget.min = this.firstDateAvailableValue
    this.checkinTarget.value = this.firstDateAvailableValue
    this.checkinChanged()
  }

  checkinChanged() {
    if (this.checkinTarget.value < this.checkinTarget.min) {
      this.checkinTarget.value = this.checkinTarget.min
    }

    // set checkout date to checkin date + minNights and update checkout min date
    const checkin = new Date(this.checkinTarget.value)
    checkin.setDate(checkin.getDate() + this.minNightsValue)
    this.checkoutTarget.min = checkin.toISOString().substr(0, 10)
    this.checkoutTarget.value = checkin.toISOString().substr(0, 10)

    this.updateValues()
  }

  checkoutChanged() {
    // if total nights is less than minNights, dont allow
    if (this.nights() < this.minNightsValue) {
      this.checkinChanged()
    }

    this.updateValues()
  }

  updateValues() {
    const TOTAL_NIGHTS = this.nights()
    const TOTAL_PER_NIGHT = this.priceValue * TOTAL_NIGHTS
    const TOTAL_PRICE = TOTAL_PER_NIGHT + this.cleaningFeeValue

    this.totalNightsTarget.textContent = TOTAL_NIGHTS
    this.totalPerNightTarget.textContent = `$${TOTAL_PER_NIGHT}`
    this.totalPriceTarget.textContent = `$${TOTAL_PRICE}`
  }

  nights() {
    const checkin = new Date(this.checkinTarget.value)
    const checkout = new Date(this.checkoutTarget.value)
    return (checkout - checkin) / 1000 / 60 / 60 / 24
  }
}
