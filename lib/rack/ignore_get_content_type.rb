require "ignore_get_content_type/version"

module Rack
  class IgnoreGetContentType
    def initialize(app)
      @app = app
    end

    def call(env)
      req = Rack::Request.new(env)
      env['CONTENT_TYPE'] = nil if req.content_type && req.request_method == 'GET'
      @app.call(env)
    end
  end
end
