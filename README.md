# README

Share Place Application

* Ruby version '2.4.6'

* Rails version '5.2.3'

* Database creation

    create .env file and add  DATABASE_PASSWORD=admin

    psql >
    create role share_place SUPERUSER;
    
    alter role share_place with LOGIN;
    
    alter role share_place with encrypted password "admin";

    rake db:create
    
    rake db:migrate

* Database initialization

  rake db:seed

* Login with 

  username: ramyani77@gmail.com, password: TestApp123
