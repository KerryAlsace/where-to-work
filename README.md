# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

`git clone git@github.com:KerryAlsace/where-to-work.git`
`cd where-to-work`
`bundle install`
`rails db:setup`
`rails db:migrate`
`rails db:seed` for seed data for development and testing
	(you might have to change to `validates_presence_of :username #, :password` in app/models/user.rb)
`rails c` to drop into rails console
`rails s` to start server
localhost:3000
add this to config/application.yml file:
```
GOOGLE_CLIENT_ID: <ID>
GOOGLE_CLIENT_SECRET: <SECRET>
```
replace <ID> and <SECRET> with info from your Google API Console: https://developers.google.com/identity/protocols/OAuth2?csw=1