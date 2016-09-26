
1. `rails new where-to-work`
2. `cd where-to-work/`
3. `git init`
4. `git add .`
5. `git commit -m "initial commit"`
6. `rails g model user username:string password_digest:string`
7. `rails g controller Users index new show edit`
8. `rails g model place name:string type:string neighborhood:string address:string comments:text wifi:boolean wifi_quality:string public_restroom:boolean restroom_cleanliness:string costs_money:boolean available_for_purchase:string`
9. `rails g controller Places index new show edit`
10. Forgot to add user_id:integer to places, add to migration
11. Add belongs_to :user to Place model
12. Add has_many :places to User model
13. Add pry gem
14. Add bcrypt gem
15. add has_secure_password to user model
16. fill out places controller
17. fill out users controller
18. `rails db:migrate`
19. create seed file
20. `rails db:seed`
21. `rails db:drop`
22. rename "type" to "place_type" in places migration
23. `rails db:migrate`
24. `rails db:seed`
25. `rails c`
26. build out table in places index
27. `rails g controller Sessions`
28. add:
  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
29. fill out sessions controller
30. revise root_path: create welcome/index.html.erb
31. `rails g controller Welcome`
32. fill out place views
33. add pundit gem
34. add `include Pundit` to application controller
35. `rails g pundit:install`
36. `rails g pundit:policy place`
37. `rails g migration AddRoleToUsers role:integer`
38. Maybe add some methods from flatiron-bnb-methods lab for friendships