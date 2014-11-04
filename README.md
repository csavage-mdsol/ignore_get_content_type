# IgnoreGetContentType


IgnoreGetContentType is a small piece of middleware that enables the consuming application
to ignore Content-Type header on GET requests. 

The Content-Type header field is used to specify the nature of the data in the body of a request. 
According to the HTTP spec it is perfectly valid for a GET request to have a body. However, 
server semantics require that if there is a body in a GET request, it must have no semantic 
meaning to the request.

In other words, a requester may send a body with a GET request, but the server is forbidden 
to do anything with it. Therefore the Content-Type header in a GET request may be safely 
ignored, as it specifies the language of a book you are never going to read!

Additional benefit of ignoring Content-Type header on GETs is that it helps with overcoming 
a peculiar limitation of ParamsWrapper's wrap_parameter configuration that unexpectedly adds 
an empty resource key in presence of Content-Type for GETs that accept query parameters.
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
require 'ignore_get_content_type'
config.middleware.use Rack::IgnoreGetContentType
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/ignore_get_content_type/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
