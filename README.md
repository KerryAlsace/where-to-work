# README

* Configuration

`git clone git@github.com:KerryAlsace/where-to-work.git`
`cd where-to-work`
`bundle install`

* Database creation

`rails db:setup`
`rails db:migrate`
`rails db:seed` for seed data for development and testing

* Enable Oauth2

add this to config/application.yml file:
```
GOOGLE_CLIENT_ID: <ID>
GOOGLE_CLIENT_SECRET: <SECRET>
```
replace <ID> and <SECRET> with info from your Google API Console: https://developers.google.com/identity/protocols/OAuth2?csw=1

* Deployment instructions

`rails c` to drop into rails console
`rails s` to start server
localhost:3000