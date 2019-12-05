# Coinswitch

A simple wrapper round httparty requests for coinswitch. 
no errors that can be thrown are included yet.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'coinswitch'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install coinswitch

## Usage

explore the gem to an overview of the methods.


`
require 'coinswitch'
client = Coinswitch::Dynamic::DynamicClient.new
puts client.orderid('11111111-6c9e-4c53-9a6d-55e089aebd04')`

this will use ipify to fetch your external ip and use the development sandbox credentials to make queries.
the resultant requests are passed through JSON.parse to create a ruby dict. Currently their is no error handling or errors.
the queries themselves are just httparty requests. simple to modify.

the current initialize for the DynamicClient Class looks like this:
`def initialize(ip_address=Ipify.ip,api_key=Coinswitch::SANDBOX_API_KEY)`
so dead simple. the methods are named after the endpoints which are described here:
https://developer.coinswitch.co/reference#instant-exchange-api with the exception of
`puts client.coins_list` which is a convenience feature i added. it returns an array of coins that can be traded.

right now this simple library just does the job and pull requests are welcomed.

its just a wrapper round httparty requests.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/coinswitch. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Coinswitch project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/coinswitch/blob/master/CODE_OF_CONDUCT.md).
