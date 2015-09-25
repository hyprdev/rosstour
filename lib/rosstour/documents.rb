module Rosstour::Documents
  class Document
    def initialize attrs
      attrs.each do |key, value|
        setter = "#{key}=".to_sym
        self.send setter, value if self.respond_to? setter
      end
    end
  end

  class RateCBR < Document
    attr_accessor :usd, :eur
  end

  class RateOper < RateCBR
    attr_accessor :name, :abbr, :types, :url
  end

  class TourSrc < Document
    attr_accessor :id, :name
  end

  class TourDst < TourSrc
  end
end
