[![Build Status](https://api.travis-ci.org/megatux/quinigem.svg)](https://travis-ci.org/megatux/quinigem)

# Quinigem

Gem to scrap the Quiniela results from http://www.loteria-nacional.gov.ar

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'quinigem'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install quinigem

## Usage

```ruby
q = Quinigem::Scrapper.new "pri", "07112014"
q.winners
```

## Contributing

1. Fork it ( https://github.com/megatux/quinigem/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
