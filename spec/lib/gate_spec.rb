require 'spec_helper'
require 'rosstour'
require 'cgi'

describe Rosstour::Gate do
  before do
    stub_request(:any, /api.echo/).to_return do |request|
      {
        body: {
          success: true,
          data: CGI::parse(request.uri.query)
        }.to_json,
        headers: {
          'Content-Type' => 'application/json; charset=utf-8'
        }
      }
    end
  end

  describe '#api_request' do
    let(:api){ Rosstour.new 'http://api.echo/' }

    it "should pass service and method to query string" do
      result = api.send(:api_request,'service','method')
      expect(result['service']).to include("service")
      expect(result['method']).to include("method")
    end

    it "should pass params and method to query string" do
      result = api.send(:api_request,'service','method', {foo: 'bar', baz: 'bud'})
      expect(result['foo']).to include("bar")
      expect(result['baz']).to include("bud")
    end

  end
end
