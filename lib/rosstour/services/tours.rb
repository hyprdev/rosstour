module Rosstour::Services::Tours
  def tours_srcs
    data = api_request 'tours', 'srcs'
    prepare_response_collection Rosstour::TourSrc, data
  end
  def tours_dsts params
    check_params params, [:src]
    data = api_request 'tours', 'dsts', params
    prepare_response_collection Rosstour::TourDst, data
  end
  def tours_opers params
    check_params params, [:src, :dst]
    data = api_request 'tours', 'opers', params
    prepare_response_collection Rosstour::TourOper, data
  end
  def tours_zones params
    data = api_request 'tours', 'zones', params
    prepare_response_collection Rosstour::TourZone, data
  end
  def tours_meals params
    data = api_request 'tours', 'meals', params
    prepare_response_collection Rosstour::TourMeal, data
  end
  def tours_stars params
    data = api_request 'tours', 'stars', params
    prepare_response_collection Rosstour::TourStar, data
  end
  def tours_dates params
    data = api_request 'tours', 'dates', params
    prepare_response_collection Rosstour::TourDate, data
  end
  def tours_nights params
    data = api_request 'tours', 'nights', params
    prepare_response_collection Rosstour::TourNight, data
  end
  def tours_hotels params
    data = api_request 'tours', 'hotels', params
    prepare_response_collection Rosstour::TourHotel, data
  end
  def tours_tours params
    data = api_request 'tours', 'tours', params
    prepare_response_collection Rosstour::TourTour, data
  end

end

module Rosstour::Services
  include Rosstour::Services::Tours
end
