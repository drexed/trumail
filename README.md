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

### Lookup Verification
```ruby
# Basic Lookup
lookup = Trumail::Lookup.new('test@email.com').verify
lookup = Trumail::Lookup.verify('test@email.com')

# Custom Host
lookup = Trumail::Lookup.verify('test@email.com', host: 'https://verifier.com', format: :xml)
```

### Lookup Methods

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

## Contributing

Your contribution is welcome.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
