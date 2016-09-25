
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
16. 