# Adopt Don't Shop

This project was created as a project for the Turing School of Software & Design. The purpose is to build foundational knowledge of building a web application using ReST and MVC architecture principles. Adopt Don't Shop is a web app that allows a user to see a shelter, any pets in that shelter, and also apply for specific pets. At this time, the development doesn't include "users" and with each session a user can create, edit and delete shelters, pets, and reviews.

This project was completed by [Hash G](https://github.com/hashmaster3k) and [James B](https://github.com/JBelta)

## Summary

  - [Getting Started](#getting-started)
  - [Running Tests](#running-tests)
  - [Deployment](#deployment)
  - [Built With](#built-with)

## Getting Started

These instructions will get you a copy of the project up and running on
your local machine for development and testing purposes. See deployment
for notes on how to deploy the project on a live system.

This project was built using ruby version 2.5.3 and rails 5.2.4.3. Ensure that you either install these versions or change the versions in the Gemfile.

### Prerequisites

In addition to the standard rails gems, please copy and paste the following into your Gemfile.

```
gem 'rspec-rails'
gem 'capybara'
gem 'launchy'
gem 'simplecov'
gem 'pry'
gem 'shoulda-matchers', '~> 4.0'
```

Links to each gem:
- [RSpec](https://github.com/rspec/rspec-rails) - Test Suite
- [Capybara](https://github.com/teamcapybara/capybara) - Additional Testing Tools
- [Launchy](https://github.com/copiousfreetime/launchy) - Additional Testing Tools
- [SimpleCov](https://github.com/simplecov-ruby/simplecov) - Test Coverage
- [Pry](https://github.com/pry/pry) - Runtime Dev Console

This project uses postgresql for database management. Please download the [Postgres.app](https://postgresapp.com/downloads.html) and follow the documentation to also install the CLI tools.

### Installing

If you plan on making your own changes and intend to push it back up, fork this repository then clone it into your directory of choice. In the main project directory, delete the file Gemfile.lock. Then, in your terminal, from the project directory run ```bundle install``` to install all the needed gems.

To setup the database from your terminal, run the following commands:

```
rails db:create
```

```
rails db:migrate
```
```
rails db:seed
```

This will create your database, migrate the needed resources then seed the database with starting data.

## Running Tests

From the command line in terminal, type ```bundle exec rspec```. This will run all tests located in the /spec directory. If any errors or failures occur please create and issue.

To run specific test files, include the file path.
```
bundle exec rspec spec/features/shelters/index_spec.rb
```

## Deployment

Before full cloud based deployment, check that the web app is working locally by opening a new tab in terminal and run the command ```rails s```. This will run a local server which you can connect to. Type ```localhost:3000``` into your web browsers address bar and hit enter. You should see Sarah Mclachlan and her famous song, Angel.

Cloud deployment was done with [Heroku: Cloud Application platforms](https://heroku.com/). Visit [getting started with rails](https://devcenter.heroku.com/articles/getting-started-with-rails5) on how to deploy the web app to Heroku.

Too see a live version click here ->
https://boiling-lake-75121.herokuapp.com/

## Built With
  - Ruby on Rails
  - Postgresql
  - HTML
  - CSS
