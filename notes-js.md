Do not use remote: true in this application

Specs:
- [x] Use jQuery for implementing new requirements
- [ ] Include a show resource rendered using jQuery and an Active Model Serialization JSON backend.
- [ ] Include an index resource rendered using jQuery and an Active Model Serialization JSON backend.
- [ ] Include at least one has_many relationship in information rendered via JSON and appended to the DOM.
- [ ] Include at least one link that loads or updates a resource without reloading the page.
- [ ] Translate JSON responses into js model objects.
- [ ] At least one of the js model objects must have at least one method added by your code to the prototype.



Must render at least one index page (index resource - 'list of things') via jQuery and an Active Model Serialization JSON Backend. For example, in a blog domain with users and posts, you might display the index of the users posts on the users show page, fetching the posts via an AJAX GET request, with the backend rendering the posts in JSON format, and then appending the posts to the page.

  * User's places index - on user show page, add div to display user's places index

Must render at least one show page (show resource - 'one specific thing') via jQuery and an Active Model Serialization JSON Backend. For example, in the blog domain, you might allow a user to sift through the posts by clicking a 'Next' button on the posts show page, with the next post being fetched and rendered via JQuery/AJAX.

  * Neighborhood show page - allow clicking 'next' to show the next neighborhood on the same page

The rails API must reveal at least one has-many relationship in the JSON that is then rendered to the page. For example if each of those posts has many comments, you could render those comments as well on that show page.

  * User has-many places, which are displayed through JSON on the page

Must use your Rails API and a form to create a resource and render the response without a page refresh. For example, a user might be able to add a comment to a post, and the comment would be serialized, and submitted via an AJAX POST request, with the response being the new object in JSON and then appending that new comment to the DOM.

  * Change how places comments work- have a form to create a comment, then serialize the comment, submit via AJAX POST, then append comment to the dom

Must translate the JSON responses into Javascript Model Objects. The Model Objects must have at least one method on the prototype. Formatters work really well for this.
Borrowing from the previous example, instead of plainly taking the JSON response of the newly created comment and appending it to the DOM, you would create a Comment prototype object and add a function to that prototype to perhaps concatenate (format) the comments authors first and last name. You would then use the object to append the comment information to the DOM.

  * Similar to what was done in the handlebars video- create a comment object and use that to format the comment before appending to the dom