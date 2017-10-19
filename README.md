# Trumail

[![Gem Version](https://badge.fury.io/rb/trumail.svg)](http://badge.fury.io/rb/trumail)
[![Build Status](https://travis-ci.org/drexed/trumail.svg?branch=master)](https://travis-ci.org/drexed/trumail)

API wrapper for the free and open source Trumail email validation/verification system.

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
```ruby
# Basic Usage
lookup = Trumail::Lookup.new('test@email.com').verify
lookup = Trumail::Lookup.verify('test@email.com')

lookup.url          => 'https://trumail.io/json/test@email.com'
lookup.to_h         => { 'address' => 'test@email.com', 'catchAll' => true, ... }
lookup.address      => 'test@email.com'
lookup.catch_all?   => true
lookup.deliverable? => false
lookup.disposable?  => true
lookup.domain       => 'email.com'
lookup.full_inbox?  => false
lookup.gravatar?    => true
lookup.host_exists? => false
lookup.username     => 'test'

# Host
lookup = Trumail::Lookup.new('test@email.com', host: 'https://verifier.com').verify
lookup = Trumail::Lookup.verify('test@email.com', host: 'https://verifier.com')

# Format
lookup = Trumail::Lookup.new('test@email.com', format: :xml).verify
lookup = Trumail::Lookup.verify('test@email.com', format: :xml)
```

## Contributing

Your contribution is welcome.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
