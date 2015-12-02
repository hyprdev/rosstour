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
        raise Rosstour::MalformedResponse.new "Service respond with code #{result.code}: #{result.inspect}"
      end

      begin
        responce = result.parsed_response
      rescue JSON::ParserError
        raise Rosstour::MalformedResponse.new "The responce is not a valid json: \n#{result.body}"
      end

      unless responce["success"]
        raise Rosstour::Error.new "Unsuccessful request, server returned an error: #{responce.inspect}"
      end

      responce["data"]
    end

    def check_params(required, params)
      required.each do |param|
        Rosstour::MissingParam.new "required parameter #{param}"
      end
    end

    ##
    # Prepares an array populated with <tt>Rosstour::Document</tt>
    #
    # @param document_class [Class]
    #   Class of document that will be instantiated and populated for
    #   each element of the result set
    # @param data [Hash]
    #   Api response hash, returned by <tt>api_request</tt>
    #   It is expected that the has has a <tt>'data'</tt> key,
    #   or <tt>'find'</tt> when the responce is from tours#tours method
    # @return [Array<Rosstour::Document>]
    def prepare_response_collection(document_class, data)
      list = data['list'] || data['find']
      if list.is_a? Array
        list.map { |hotel| document_class.new hotel }
      else
        raise Rosstour::MalformedResponse.new "Unsufficient data: #{list.inspect}"
      end
    end


  end
end
