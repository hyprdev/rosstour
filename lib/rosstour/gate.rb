module Rosstour
  class Gate
    include HTTParty
    include Services

    attr_reader :options

    def initialize(options={})
      @options = options
    end

    protected

    def api_request(service, method, params = {})
      query = {service: service, method: method, format: :json}
      query = query.merge(params) if params.is_a? Hash

      options = @options.merge({query: query})

      result = self.class.get '/gate/index.php', options

      unless result.code == 200
        raise Rosstour::Error.new "Service respond with #{result.code}: #{responce.inspect}"
      end

      responce = result.parsed_response

      unless responce["success"]
        raise Rosstour::Error.new "Unsuccessful request, server returned an error: #{responce.inspect}"
      end

      responce["data"]
    end
  end
end
