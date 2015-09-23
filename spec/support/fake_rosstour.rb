require 'sinatra/base'

class FakeRosstour < Sinatra::Base
  set(:query) do |*args|
    condition do
      query = Rack::Utils.parse_nested_query(request.query_string)
      args.all? { |(key, value)| query[key.to_s] == value }
    end
  end

  get '/gate/index.php', query: {service: 'rates', some: 'cbr'} do
    json_response 200, 'stub.json'
  end

  private

  def json_response(response_code, file_name)
    content_type :json
    status response_code
    File.open(File.dirname(__FILE__) + '/../fixtures/' + file_name, 'rb').read
  end
end
