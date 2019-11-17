# Trumail

[![Gem Version](https://badge.fury.io/rb/trumail.svg)](http://badge.fury.io/rb/trumail)
[![Build Status](https://travis-ci.org/drexed/trumail.svg?branch=master)](https://travis-ci.org/drexed/trumail)

API wrapper for the free and open source [Trumail](https://trumail.io) email validation/verification system.
You can also self-host the system on your own server. Find out more here: [https://github.com/sdwolfe32/trumail](https://github.com/sdwolfe32/trumail)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'trumail'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install trumail

## Usage

### Lookup
```ruby
# Basic Lookup
lookup = Trumail::Lookup.new('test@email.com').verify
lookup = Trumail::Lookup.verify('test@email.com')

# Custom Host
lookup = Trumail::Lookup.verify(
  'test@email.com',
  host: 'https://verifier.com',
  format: :xml
)
```

### Response

```ruby
lookup.url            => 'https://api.trumail.io/v2/lookup/json?email=test@email.com'
lookup.hash           => { 'address' => 'test@email.com', 'catchAll' => true, ... }
lookup.success?       => true
lookup.error?         => false

# Data Methods
lookup.address        => 'test@email.com'
lookup.username       => 'test'
lookup.domain         => 'email.com'
lookup.md5_hash       => '0065537cb732045561c0d23e859710f4'
lookup.suggestion     => nil
lookup.catch_all?     => true
lookup.deliverable?   => false
lookup.disposable?    => true
lookup.free?          => true
lookup.full_inbox?    => false
lookup.gravatar?      => true
lookup.host_exists?   => false
lookup.role?          => false
lookup.valid_format?  => true
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/trumail. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Trumail project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/trumail/blob/master/CODE_OF_CONDUCT.md).
