import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="location-nomade"
export default class extends Controller {

  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue;
  }

  actualiseLocation() {

    const options = {
      enableHighAccuracy: true,
      timeout: 5000,
      maximumAge: 0
    };

    function success(pos) {
      console.log("coucu")
      const crd = pos.coords;

      console.log('Your current position is:');
      console.log(`Latitude : ${crd.latitude}`);
      console.log(`Longitude: ${crd.longitude}`);
      console.log(`More or less ${crd.accuracy} meters.`);
    }

    function error(err) {
      console.warn(`ERROR(${err.code}): ${err.message}`);
    }

    navigator.geolocation.getCurrentPosition(success, error, options);

    fetch(`https://${window.location.host}/nomade`, {
      method: "POST",
      headers: {"Content-Type": "application/json"},
      body: JSON.stringify({"latitude": crd.latitude, "longitude": crd.longitude})
    })
    .then(response => response.json())
    .then((data) => {

    })
  }
}
