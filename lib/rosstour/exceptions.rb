module Rosstour::Exceptions

  class Error < StandardError; end
  class ServiceNotFound < Error; end
  class MethodNotFound < Error; end
  class Unauthorized < Error; end
  class MalformedRequest < Error; end
  class MalformedResponse < Error; end
  class MissingParam < MalformedRequest; end
end
