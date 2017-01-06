# Specifications for the Rails with jQuery Assessment

Specs:
- [x] Use jQuery for implementing new requirements
- [ ] Include a show resource rendered using jQuery and an Active Model Serialization JSON backend.
- [ ] Include an index resource rendered using jQuery and an Active Model Serialization JSON backend.
- [x] Include at least one has_many relationship in information rendered via JSON and appended to the DOM.
  A Place's comments can be viewed on the Place show page by clicking to "show comments", then the comments are loaded below the Place details without the page refreshing.
- [x] Include at least one link that loads or updates a resource without reloading the page.
  Writing a new comment on a Place's show page, then clicking to "add" the comment will update the comments resource and add the comment to the list of the Place's comments
- [x] Translate JSON responses into js model objects.
  Adding a comment will return a JSON response that's turned into a Comment js model object.
- [x] At least one of the js model objects must have at least one method added by your code to the prototype.
  The Comment js model object has a "renderLI" prototype method that is used to format the Comment into html to show on a page.

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
