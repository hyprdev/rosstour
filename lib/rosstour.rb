require "httparty"

require "rosstour/version"
require "rosstour/exceptions"
require "rosstour/services"

module Rosstour
  class << self
    def new(uri, *args)
      klass = Class.new(Gate)
      klass.base_uri(uri.to_s)
      klass.new(*args)
    end
  end
  class Gate
    include HTTParty
    include Services

    attr_reader :options

    def initialize(options={})
      @options = options
    end

    protected

    def api_request(service, method, options = {})
      options = @options.merge(options).merge({format: :json})
      self.class.get '/gate/index.php', options
    end
  end
end
