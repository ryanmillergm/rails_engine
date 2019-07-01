# README

# Rales Engine

## Project Description
Rails Engine is a project where APIs are created using single responsiblity controllers. CSV files are imported to create data that will be used. Statistics are created using business logic. Relationships and endpoints are tested with spec harness.

* Ruby version

Ruby version 2.6.0.

* Database

Postgresql version 11.1.

* Set up

Clone this repository to your computer.  Once it has been cloned, run `bundle`.

  https://github.com/ryanmillergm/rails_engine.git
  
  `cd rails_engine`
  
  `bundle install`

  `rails db:{drop,create,migrate}`.

* Database initialization

Initializing the database requires running a rake task to import the CSV data into the database.  The raw CSV files are located in the /lib/data folder.

  Run `rake import:data`.

* Database schema

The database consists of 6 tables.  

* Testing

  `rspec` was used to test this project. Run `rspec` + `\filename`.

