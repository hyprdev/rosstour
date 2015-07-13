require "rosstour/version"
require "rosstour/exceptions"
require "rosstour/services"

module Rosstour
  class << self

    attr_reader :options

    def initialize(options={})
    end

    protected
    def api_url service, method
    end
  end
end
