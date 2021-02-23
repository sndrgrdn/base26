# Base26

Ruby gem for encoding/decoding integers to/from Base26.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'base26'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install base26

## Usage

Converting an integer into a Base26 string:

```ruby
Base26.to_alpha(12345) # => "rfu"
```

Converting a Base26 string to the represented integer:

```ruby
Base26.to_int('rfu') # => 12345
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sndrgrdn/base26.
