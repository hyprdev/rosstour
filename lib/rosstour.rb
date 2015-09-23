require "httparty"

require "rosstour/version"
require "rosstour/exceptions"
require "rosstour/documents"
require "rosstour/services"
require "rosstour/gate"

module Rosstour
  include Documents
  include Exceptions

  class << self
    def new(uri, *args)
      klass = Class.new(Gate)
      klass.base_uri(uri.to_s)
      klass.new(*args)
    end
  end
end
