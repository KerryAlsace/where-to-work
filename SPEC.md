# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- App was built with Ruby on Rails
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes) 
- User has many places
- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
- Place belongs to User
- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
- Place has_many :friends, through: :shared_places, class_name: 'User'
- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
- Place has many friends through shared_places, and friends can submit a comment attribute to a place
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
- User, Place, Neighborhood
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
- User.most_places URL: /users/most_places (can only be viewed by admins)
- [ ] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item)
- [x] Include signup (how e.g. Devise)
- Users can sign up
- [x] Include login (how e.g. Devise)
- Registered users can log in
- [x] Include logout (how e.g. Devise)
- Users can log in
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
- Used omniauth and omniauth-google-oauth2 gems for oauth signup/login
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
- users/:user_id/places/:id
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
- users/:user_id/places/new
- [ ] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate