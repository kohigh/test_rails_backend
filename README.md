# Rails API with awesome features.

## 1. Demo microservice for SMS messaging([Article about it](https://www.google.com))
   ### Versions
        Ruby 2.5.1
        Rails 5.2.1.1 
        Redis 5.0.2

   ### Preconditions

        1.1 Before you start using this repo assure that you have Redis working locally 
        1.2 Installed all required gems for rails api and smservice(They both have own Gemfile)
        1.3 Have cofingured Twilio account
        1.4 Created all required configuration yml files(pubsub.yml, sms.yml, sms_messenger.yml)
            In pubsub.yml keep redis_url value blank if you run Redis locally
            In sms_messenger.yml url value specify your account_id and fill other twilio credentials.
    
   ### Usage    
   To start using it start rails application in api directory by calling `rails s`
   and in separate tab start microservice in smservice directory by calling `ruby server.rb`.
