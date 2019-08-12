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


create .env file and add  DATABASE_PASSWORD=admin

psql >
create role share_place SUPERUSER;
alter role share_place with LOGIN;
alter role share_place with encrypted password "admin";

rake db:create
