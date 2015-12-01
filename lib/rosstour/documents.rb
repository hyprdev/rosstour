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

  class TourDate < Document
    attr_accessor :date
  end

  class TourNight < TourSrc
  end

  class TourHotel < TourSrc
    attr_accessor :star, :zone
  end

  class TourTour < TourSrc
    attr_accessor(
      :dayBegin, :nights, :hotels, :men, :acc, :fromArea, :toArea,
      :price, :prices, :tourLink, :tourClaim, :operId, :visaLink,
      :fuelLink, :flightStops, :dayBeg, :dayEnd, :priceInRUR, :creditPrice, :ID
    )
  end

end
