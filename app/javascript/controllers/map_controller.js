import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markersNear: Array,
    markersFar: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/clairedeville/clb3xcvb3000k14n124dvbzx8"
    })

    this.#addMarkersToMap()

    this.#fitMapToMarkers()

    this.map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl }))
  }

  #addMarkersToMap() {
    console.log(this.markersFarValue);

    this.markersNearValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_near)

      new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(this.map)
    });

    this.markersFarValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_far)

      // Create a HTML element for your custom marker
      // const customMarker = document.createElement("div")
      // customMarker.className = "marker"
      // customMarker.style.color = "#747b7d"

      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map)
    });
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersFarValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
}
