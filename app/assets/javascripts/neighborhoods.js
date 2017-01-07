// Wait until everything has loaded
$(function() {
  if (this.URL.includes("neighborhoods")) {
    var id = this.URL.replace(/(http:\/\/localhost:3000\/neighborhoods\/)+/g, '')
    var url = `/neighborhoods/${id}/places`

    // Send AJAX get request and if successful:
    $.ajax({
      method: "GET",
      url: url,
      dataType: "json"
    })
    .success(function(json) {
      var $ol = $("ol.places")
      $ol.html("") // Clear the places div first

      json.forEach(function(place_attributes) {
        var place = new Place(place_attributes);
        var placeDisplay = place.renderDisplay();
        $("ol.places").append(placeDisplay);
      })
    })
    .error(function(error) {
      console.log("Error:", error)
    })
  }
});

function Place(attributes) {
  this.id = attributes.id;
  this.name = attributes.name;
  this.wifi = attributes.wifi;
  this.wifi_quality = attributes.wifi_quality;
  this.public_restroom = attributes.public_restroom;
  this.restroom_cleanliness = attributes.restroom_cleanliness;
  this.costs_money = attributes.costs_money;
  this.creator_id = attributes.creator_id;
}

Place.prototype.renderDisplay = function() {
  return "<li>" + this.name + "</li>"
}
