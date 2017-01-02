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
    $("input.add_comment").removeAttr('data-disable-with');

    $.ajax({
      method: "POST",
      url: this.action,
      data: $(this).serialize(),
      dataType: "json"
    })
    .success(function(json){
      // Empty comment box
      $("#comment_body").val("");

      var comment = new Comment(json);
      var commentLi = comment.renderLI();
      $("ol.comments").append(commentLi);
    })
    .error(function(error) {
      console.log("Error:", error)
    })

    e.preventDefault();
  });

});

function Comment(attributes) {
  this.body = attributes.body;
  this.id = attributes.id;
}

Comment.prototype.renderLI = function() {
  return "<li>" + this.body + "</li>"
}
