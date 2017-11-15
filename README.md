# Drawing Board

Build a simple server & frontend presenting a user with a 20x20 grid of squares the user can "draw" on to create a simple design. 

  * [**Twitter Bootstrap for responsive design**](#gotta-patch-em-all)
  * [**Html5 input elements**](#gotta-patch-em-all)
  * [**CSS3 Flex Box**](#other-good-fonts-to-patch)
  * [**Coffeescript - for client side scripts**](#contributing)
  * [**TDD and BDD basic coverage using Rspec, Capybara**](#contributing) 
  * [**FactoryBot for Automated Test Data, Database Cleaner for testing**](#contributing)

## Getting Started

These instructions will help you set up of the project up and running on your local machine for development and testing purposes.  

### Prerequisites

This application currently works with:

* Rails 5.1.x
* Ruby 2.4.1
* PostgreSQL
* Rspec,Capybara,Database Cleaner

## Installation
A step by step series of examples that tell you have to get a development env running

* `git clone <repository-url>` this repository
* `cd drawing_board`
* `bundle install`
* `rails db:create & rails db:migrate`
* `rails s`

User will be generated randomly and assigned based on your ip address. it will consider as a same user if you are tring to access/refreshes pages every time

If you want to test this(LAN), Run rails server as like as
* `rails s -b 0.0.0.0 -p 3000`

Access this page with your sytemip:3000(http:192.162.*.*:3000)

## Running the tests

I have covered the basic test coverage for these sections, i will be updating the channeles, services covering up with more scenarios 

* `rspec spec ` Runs all models, features,routing,job specs will run 
* `rspec spc/models` - Runs model specs
* `rspec spc/features`- Runs features specs for integration testing instead of controller testing
* `rspec spc/routing`- Runs routing specs
* `rspec spc/jobs` - Runs Jobs specs 

### Run Rails best practices 

Run Rails Best practices from the application root in Terminal
```
rails_best_practices -f html .
```
