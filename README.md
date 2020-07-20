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




Simple lunch app project. Built using Ruby 2.6.5 and Rails 6.0.3.2.

Demo app can be found here: 

To run locally, first create the database:

rails db:create

Then run the migrations:

rails db:migrate

And bundle install:

bundle install



Details on the lunch project app:

There are set of courses that can be included to the daily menu. The course has 2 pricing models:

- based on the weight/volume/etc, this means the final course price is calculated proportionally to the ordered weight/volume. The price is set up for the pre-defined weight/volume/another measurement system, for instance, 100g of spaghetti = $2, but the customer can order 140g of spaghetti for $2.8

- based on the portion, this means the portion is always pre-defined, the weight/volume is still listed for the customer but only 1,2,3,... portions can be ordered, for instance, the customer may buy 3 tiramisu cakes 100g each.

Each course is included in a single category. Example of the category: “Main Courses”, “Desserts”.

A daily menu is a set of courses chosen by a chef for the specific day and setup price. Daily menu categories are unique categories fully “inherited” from courses included to the day.



Admin panel for the management of domain model entities listed above has the following features:

- Category can not be deleted if it contains at least one course

- The course can not be deleted if it was included to at least single daily menu

- Daily menu can be deleted

- Only single menu per day can be created

- Adding the course to the daily menu the system should propose the course pricing that was setup for its inclusion to the most recent (chronogicaly) daily menu composed in the system.

