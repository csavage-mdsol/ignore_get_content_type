require 'spec_helper'

describe Rack::IgnoreGetContentType do
  include Rack::Test::Methods

  def app
    rack_app = lambda { |env| [200, {}, "app"] }
    Rack::IgnoreGetContentType.new(rack_app)
  end

  describe 'GET request' do
    context 'no Content-Type header is set' do
      it 'retains the absence of content type' do
        get '/'
        expect(last_response).to be_ok
        expect(last_request.env['CONTENT_TYPE']).to be_nil
      end
    end

    context 'a Content-Type header is set' do
      it 'ignores the Content Type' do
        get '/', {}, { 'CONTENT_TYPE' => 'application/x-www-form-urlencoded' }
        expect(last_response).to be_ok
        expect(last_request.env['CONTENT_TYPE']).to be_nil
      end
    end
  end

  describe 'POST request' do
    it 'retains the Content-Type' do
      post '/'
      expect(last_response).to be_ok
      expect(last_request.env['CONTENT_TYPE']).to eq('application/x-www-form-urlencoded')
    end
  end
end
