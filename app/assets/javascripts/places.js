// Wait until everything has loaded
$(function() {
  // When a user clicks to load comments
  $("a.load_comments").on("click", function(e){

    // Send AJAX get request and if successful:
    $.get(this.href).success(function(json){
      var $ol = $("ol.comments")
      $ol.html("") // Clear the comments div first

      // Add comments to DOM
      json.forEach(function(comment){
        $ol.append("<li>" + comment.body + "</li>");
      });
    });

    // Stop from doing the normal redirect action
    e.preventDefault();
  });

  // When a user adds a comment and clicks to submit
  $("#new_comment").on("submit", function(e){

    $.ajax({
      type: "POST",
      url: this.action,
      data: $(this).serialize(),
      success: function(response){
        // Empty comment box
        $("#comment_body").val("");
        var $ol = $("ol.comments")
        $ol.append(response);
        $("input.add_comment").prop('disabled', false)
      }
    });

    e.preventDefault();
  });

});
