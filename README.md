# IgnoreGetContentType


IgnoreGetContentType is a small piece of middleware that enables the consuming application
to ignore the content-type set on GET requests. 
Since GET requests are not expected to have a body, content-type isn't relevant.

It helps with overcoming a limitation with ParamsWrapper wrap_parameter config that unexpectedly adds an empty 
resource key for GETs if content-type is set in the request which otherwise accepts query parameters.
Please see: http://grokbase.com/t/gg/rubyonrails-talk/134jyh7x92/rails-request-with-content-type-application-json-add-extra-parameter
for reference.


## Installation

Add this line to your application's Gemfile:

    gem 'ignore_get_content_type'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ignore_get_content_type

## Usage

Example:

```
require 'rack/ignore_get_content_type'
config.middleware.use Rack::IgnoreGetContentType
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/ignore_get_content_type/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
