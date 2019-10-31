# Kitten API
### About

Project from [The Odin Proiject](https://www.theodinproject.com/courses/ruby-on-rails/lessons/apis).

This is mean to be a fast and straightforward project where Rails is set up to be a data-producing API.

With kittens.


### Getting started

#### Requirements:
* Ruby 2.6.3
* Rails 6.0.0
* [Yarn](https://yarnpkg.com/en/docs/install) 1.19.1
* [REST Client](https://github.com/rest-client/rest-client)

#### Installation:
* Clone repo
* Run ```$ bundle install --without production``` to install dependencies
* Run ```$ rspec``` to ensure tests pass

#### How to use Rest Client
Only #index and #show will respond to JSON requests.
To test the #index's response, start IRB and use:

```$ response = RestClient.get("http://localhost:3000", accept: :json)```

And for #show, use:

```$ response = RestClient.get("http://localhost:3000/kittens/:id", accept: :json```

Replace ```:id``` with the kitten ID you wish to view.

Use ```$ response.body``` to view the results. You can omit
```accept: :json``` to view the html response.