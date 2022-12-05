import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="location-nomade"
export default class extends Controller {

  static targets = [ "icon" ]

  static values = {
    room: Number,
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue;

  }

  actualiseLocation() {

    const icon = this.roomValue;
    console.log(icon);

    const success = (position) => {

      fetch(`${window.location.protocol}://${window.location.host}/nomade`, {
        method: "POST",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify({"latitude": position.coords.latitude, "longitude": position.coords.longitude, "room": icon })
      })
      location.reload();
    };

    const error = (error) => {
      console.log(error);
    };

    navigator.geolocation.getCurrentPosition(success, error);


  }
}
