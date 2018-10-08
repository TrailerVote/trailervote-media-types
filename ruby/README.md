# TrailerVote::MediaTypes
[![Build Status](https://travis-ci.com/TrailerVote/trailervote-media-types.svg?branch=master)](https://travis-ci.com/TrailerVote/trailervote-media-types)
[![Gem Version](https://badge.fury.io/rb/trailer_vote-media_types.svg)](https://badge.fury.io/rb/trailer_vote-media_types)
[![Maintainability](https://api.codeclimate.com/v1/badges/f5ea339bc868a4e3c362/maintainability)](https://codeclimate.com/github/TrailerVote/trailervote-media-types/maintainability)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'trailer_vote-media_types'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install trailer_vote-media_types
    
## Notes

### `updated_at` vs `Last-Modified` headers

When this is used in conjunction with a TrailerVote service, the `updated_at` attributes inside the body of a response will take precedence over any `Last-Modified` header. The `updated_at` value **SHOULD** reflect the last time the resource was updated, whereas the `Last-Modified` value may change when the representation is updated.

### Are ids missing?

No, the `id` or `uuid` attributes are not missing. As per the [TrailerVote API considerations](https://docs.trailervote.com/reference) clients **SHOULD** not need to construct URLs. Both internally and externally, where possible, we refer to resources by their fully qualified URL which _is_ their identifier, instead of something like a UUID.

## Usage

This gem is based on [`media_types`](https://github.com/SleeplessByte/media-types-ruby), and inherits all the functionality from that gem. In general, you can use `trailer_vote-media_types` in the following ways:

### `Accept` and `Content-Type` construction

All the media types can be turned into a header value, both acceptable for the `Accept` and `Content-Type` headers:

```ruby
TrailerVote::MediaTypes::Configuration.to_constructable.version(2).to_s
# => "application/vnd.trailervote.configuration.v2+json"
```

The [`Constructable`](https://www.rubydoc.info/gems/media_types/MediaTypes/Constructable) result of `#to_constructable` allows for chaining the various options in our media types, namely `view` (e.g. `index`, `create`) and `version`. The default `suffix` is none for binary types and `json` for text type, as we don't support XML at the moment.

It is **recommended** to always include `.version(n)`, otherwise you will get the newest version, which might not be what you support in the code.

### `Accept` with quality parameter

If you want to have multiple `Accept` values, but with different priorities, `Constructable#to_s` accepts an additional parameter to set this. For example, if you want to make a fully qualified `Accept` header and you prefer product version 2, but accept version 1 as well:

```ruby
[
    TrailerVote::MediaTypes::Product.to_constructable.version(2).to_s,
    TrailerVote::MediaTypes::Product.to_constructable.version(1).to_s(0.9),
    TrailerVote::MediaTypes::Errors.to_constructable.version(1).to_s(0.1)
].join(', ')
# => "application/vnd.trailervote.configuration.product.v2+json,
#       application/vnd.trailervote.configuration.product.v1+json; q=0.9,
#       application/vnd.trailervote.errors.v1+json; q=0.1"
```

### Data validation

All the media types come equipped with validations, for most known / expected permutations of views and versions. Validations are based on [`Scheme`](https://www.rubydoc.info/gems/media_types/MediaTypes/Scheme) from the [`media_types`](https://github.com/SleeplessByte/media-types-ruby) gem.

```ruby
media_type = TrailerVote::MediaTypes::ClientConfiguration.to_constructable.version(1)
# => application/vnd.trailervote.client_configuration.v1+json

media_type.valid?(
    configuration: {
        place: "https://fake.trailervote.com/api/places/435ec0b8-100d-4e92-8a17-04bc77e90880",
        persona: "https://fake.trailervote.com/api/persona/e03a1c72-8bce-408c-a6e4-de215e73dd92"
    }
)
# => true

media_type.validate!(
    configuration: {
        place: "https://fake.trailervote.com/api/places/435ec0b8-100d-4e92-8a17-04bc77e90880",
    }
)
# => raises MediaTypes::Scheme::ExhaustedOutputError: Missing keys in output: [:persona] at [.->configuration]
```

### `Mime::Type` registration

In case you use `action_dispatch/http/mime_type`, you may register the TrailerVote Media Types into the `Mime::Type` registry like so:
```ruby
TrailerVote::MediaTypes::Persona.register
# => [...] # Array of registered types, each version, each suffix permutation, all aliases
```

You can now look them up in the registry:

```ruby
media_type = TrailerVote::MediaTypes::Persona.to_constructable.version(1).to_s
# => "application/vnd.trailervote.persona.v1+json"

Mime::Type.lookup(media_type)
# => Mime::Type entry
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can
also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the
version number in `version.rb`, and then run `bundle update trailer_vote-media_types` in any repository that depends on
this gem. If you have permissions, you may call `bundle exec rake release` to create a new git tag, push
git commits and tags, and push the `.gem` file to the rubygems gem server.

## Contributing

Bug reports and pull requests are welcome on GitHub at [TrailerVote/trailervote-media-types](https://github.com/TrailerVote/trailervote-media-types)
