// Wait until everything has loaded
$(function() {
  // When a user clicks to load comments
  $("a.load_comments").on("click", function(e){
    
    // Send AJAX get request and if successful:
    $.get(this.href).success(function(json){
      var $div = $("div.comments")
      $div.html("")

      // Add comments to DOM
      json.forEach(function(comment){
        $div.append("<p>" + comment.body + "</p>");
      });
    });

    // Stop from doing the normal redirect action
    e.preventDefault();
  });
});