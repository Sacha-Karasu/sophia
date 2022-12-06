import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="user-position"
export default class extends Controller {
  // static targets = [ "btnloc" ]

  static values = {
    user: Number,
    apiKey: String,
    markers: Array
  }

  connect() {
    console.log("Connected to user-position controller")
    // mapboxgl.accessToken = this.apiKeyValue

    let id;
    // let target;
    let options;

    options = {
      enableHighAccuracy: true,
      timeout: 5000,
      maximumAge: 0
    };

    const success = (position) => {

      const crd = position.coords;

      console.log(crd)
      fetch(`${window.location.protocol}//${window.location.host}/location`, {
        method: "POST",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify({"latitude": crd.latitude, "longitude": crd.longitude })
      })
      // location.reload();
    };

    const error = (error) => {
      console.log(error);
    };

    id = navigator.geolocation.watchPosition(success, error, options);
  }
}
