// Wait until everything has loaded
$(function() {
  // When a user clicks to load comments
  $("a.load_comments").on("click", function(e){

    fetch(this.href)
      .then(function(response) {
        return response.json()
      })
      .then(function(json) {
        console.log(json)
      })

    // // Send AJAX get request and if successful:
    // $.get(this.href).success(function(json){
    //   var $ol = $("ol.comments")
    //   $ol.html("") // Clear the comments div first
    //
    //   // Add comments to DOM
    //   json.forEach(function(comment_attributes){
    //     var comment = new Comment(comment_attributes);
    //     var commentLi = comment.renderLI();
    //     $ol.append(commentLi);
    //   });
    // });

    // Stop from doing the normal redirect action
    e.preventDefault();
  });

  // When a user adds a comment and clicks to submit
  $("#new_comment").on("submit", function(e){
    $("input.add_comment").removeAttr('data-disable-with');


    var $inputs = $('#new_comment :input');

    // not sure if you wanted this, but I thought I'd add it.
    // get an associative array of just the values.
    var values = {};
    $inputs.each(function() {
        values[this.name] = $(this).val();
    });

    var req = {
      method: 'POST',
      credentials: 'include',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(values)
    }

    fetch(this.action, req)



    // $.ajax({
    //   method: "POST",
    //   url: this.action,
    //   data: $(this).serialize(),
    //   dataType: "json"
    // })
    // .success(successful)
    // .error(function(error) {
    //   console.log("Error:", error)
    // })

    e.preventDefault();
  });

});

function successful(json) {
  // Empty comment box
  $("#comment_body").val("");

  var comment = new Comment(json);
  var commentLi = comment.renderLI();
  $("ol.comments").append(commentLi);
}

function Comment(attributes) {
  this.body = attributes.body;
  this.id = attributes.id;
}

Comment.prototype.renderLI = function() {
  return "<li>" + this.body + "</li>"
}
