var current_page = 1;
var placesJson = [];

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
        placesJson.push(place)
        changePage(1);
        // var placeDisplay = place.renderDisplay(place);
        // $("ol.places").append(placeDisplay);
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

Place.prototype.renderDisplay = function(place) {
  var source   = $("#place-template").html();
  var template = Handlebars.compile(source);
  return template(place)
}

function prevPage() {
  if (current_page > 1) {
    current_page--;
    changePage(current_page);
  }
}

function nextPage() {
  if (current_page < numPages()) {
    current_page++;
    changePage(current_page);
  }
}

function changePage(page) {
  // Validate page
  if (page < 1) page = 1;
  if (page > numPages()) page = numPages();

  $("ol.places").html("")

  for (var i = (page-1); i < (page) && i < placesJson.length; i++) {
    var placeDisplay = placesJson[i].renderDisplay(placesJson[i]);
    $("ol.places").append(placeDisplay);
  }

  $("#page").html(page + "/" + numPages());

  if (page == 1) {
    $("#btn_prev").hide();
  } else {
    $("#btn_prev").show();
  }

  if (page == numPages()) {
    $("#btn_next").hide();
  } else {
    $("#btn_next").show();
  }
}

function numPages() {
  return Math.ceil(placesJson.length);
}
