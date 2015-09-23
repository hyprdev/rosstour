module Rosstour
  class Gate
    include HTTParty
    include Services

    attr_reader :options

    def initialize(options={})
      @options = options
    end

    protected

    def api_request(service, method, options = {})
      query = {"service": service, "method": method ,"format": :json}
      options = @options.merge(options).merge({query: query})
      result = self.class.get '/gate/index.php', options

      if result.code == 200
        result.parsed_response
      end
    end
  end
end
