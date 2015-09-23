module Rosstour::Documents
  class Document; end

  class RateCBR < Document
    attr_accessor :usd, :eur
  end

  extend Rosstour
end
