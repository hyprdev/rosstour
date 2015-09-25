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

  class TourOper < TourSrc
    attr_accessor :abbr
  end

  class TourZone < TourSrc
  end

  class TourMeal < TourSrc
    attr_accessor :comment, :num
  end

  class TourStar < TourSrc
    attr_accessor :num
  end
end
