// Wait until everything has loaded
$(function() {
  // When a user clicks to load comments
  $("a.load_comments").on("click", function(e){

    // Send AJAX get request and if successful:
    $.get(this.href).success(function(json){
      var $div = $("div.comments")
      $div.html("") // Clear the comments div first

      // Add comments to DOM
      json.forEach(function(comment){
        $div.append("<p>" + comment.body + "</p>");
      });
    });

    // Stop from doing the normal redirect action
    e.preventDefault();
  });

  // When a user adds a comment and clicks to submit
  $("#new_comment").on("submit", function(e){
    e.preventDefault();

    $.ajax({
      type: ($("input[name='_method']").val() || this.method),
      url: this.action,
      data: $(this).serialize(),
      success: function(response){
        debugger
      }
    });


  });

});
