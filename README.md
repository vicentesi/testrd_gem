[![Build Status](https://travis-ci.org/vicentesi/testrd_gem.svg?branch=master)](https://travis-ci.org/vicentesi/testrd_gem) [![Coverage Status](https://coveralls.io/repos/vicentesi/testrd_gem/badge.svg?branch=master&service=github)](https://coveralls.io/github/vicentesi/testrd_gem?branch=master)

# TestrdGem

This project is design as part of the Resultados Digitais Evaluation Project. It offers CRUD operations with Leads and integration with [Salesforce](http://www.salesforce.com/).

Written by [Vicente Silveira Inácio](https://br.linkedin.com/pub/vicente-silveira-inácio/25/734/588)


## Installation

Add this line to your application's Gemfile:

    gem 'testrd_gem'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install testrd_gem

## Usage

### Create
Create a new lead

    TestrdGem::new(name, last_name, email, company, job_title, phone, website)

### Retrieve
Retrieve a single lead, by id.

    TestrdGem::show(id)

Retrieve all leads

    TestrdGem::all()

### Delete
Delete a user, by id.

    TestrdGem::delete(id)

### Count
Return the number of registered leads.

    TestrdGem::count()

### Integration with Salesforce

TestrdGem uses a external gem for connecting to Salesforce: [salesforce-bulk](https://github.com/jorgevaldivia/salesforce_bulk)

Lead integration with Salesforce

    TestrdGem::integrate(username, password, token)

* Username: Salesforce identification
* Password: Salesforce password
* Token: Salesforce security token

## Example

    require 'testrd_gem'

    lead = TestrdGem::new('a','b','c@email.com','foozzb,'dev','5555555','http://website.foobar.com')

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/testrd_gem.
