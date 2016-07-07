require 'date'

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
    check_params params, [:src, :dst]
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

  ##
  # Takes single argument conaining +Hash+ of params and
  # returns a list of tours.
  #
  # @param options [Hash] a hash of options. Provided options are
  #   preprocessed to follow backend requirements
  # @return [Array<Rosstour::TourTour>]
  # @option options [Integer] :src Departure city id
  # @option options [Integer] :dst Destination country id
  # @option options [Integer] :oper Tour operator id
  # @option options [Integer, Range] :night
  #   Specifies tour duration if +Integer+ given, duration range if +Range+ given
  # @option options [Date,Array<Date>] :day
  #   Departure date or an array of two
  #   dates for range e.g. <tt>[Date.now, Date.now]</tt>
  # @option options [Array<Integer>] :price
  #   Takes an +Array+ of two +Integer+s. Specifies price range for searched
  #   tours. If either of two is +nil+, the result wil be an opend-ended range
  #   defaults to <tt>[nil, nil]</tt>
  # @option options [String] :currency
  #   Specifies currency for +:price+ option, defaults to <tt>"RUR"</tt>
  # @option options [Integer] :adults
  #   Number of adults, participating in a trip
  # @option options [Integer] :children
  #   Number of children, participating in a trip, defaults to <tt>0</tt>
  # @option options [Array<Integer>] :child_ages
  #   An array of children ages, the size of an array should be equal to
  #   value of <tt>:children</tt> option.
  #   Defaults to <tt>[]</tt>
  # @option options [Array<Integer>] :town
  #   Specifies a list of city IDs, aka zones.
  #   Use <tt>nil</tt> if you don't wat to narrow down the search.
  #   Defaults to nil
  # @option options [Array<Integer>] :stars
  #   Specifies a list of hotel star-rating IDs e.g. <em>5*</em>.
  #   Use <tt>nil</tt> if you don't want to narrow down the search.
  #   Defaults to nil
  # @option options [Array<Integer>] :meal
  #   Specifies a list of service-level IDs e.g. <em>All Inclusive</em>.
  #   Use <tt>nil</tt> if you don't want to narrow down the search.
  #   Defaults to nil
  # @option options [Array<Integer>] :hotel
  #   Specifies a list of hotes IDs.
  #   Use <tt>nil</tt> if you don't wat to narrow down the search.
  #   Defaults to nil
  # @option options [Boolean] :hotel_availible
  #   A flag for specifing in we interested in to tours with avalible hotels.
  #   Defaults to false
  # @option options [Boolean] :tickets_availible
  #   A flag for specifing in we interested in to tours with avalible tickets.
  #   Defaults to false
  # @option options [Integer] :page
  #   Specifies page number. Defaults to 0
  #
  # Mandatory backend params:
  # * <tt>:src</tt> -- Departure city id
  # * <tt>:dst</tt> -- Destination country id
  # * <tt>:oper</tt> -- Tour operator id
  # * <tt>:day</tt> -- Departure date range in format <tt>"from,to"</tt>,
  #   two dates delimited by comma, e.g. <tt>"01.12.2015,08.12.2015"</tt>
  # * <tt>:night</tt> -- Tour duration range in number of nights "min,max"
  #   two integers delimited by comma, e.g. <tt>"6,10"</tt>
  # * <tt>:price</tt> -- Price range "min,max,currency"
  #   two integers and a currency code
  #   e.g. <tt>"1,1000,RUR"</tt>, you can use <tt>",,RUR"</tt> for open range
  # * <tt>:adults</tt> -- Number of places for adults
  # * <tt>:child</tt> -- Number of places for children
  #   and their ages <tt>"number,age,age,..."</tt>
  # * <tt>:town</tt> -- Comma-separated lists of destination cities,
  #   first element is a boolean flag, <tt>"any,id,id,..."</tt>,
  #   e.g. <tt>"false,1,2,3"</tt> for specific list, or, <tt>"true"</tt> for
  #   all availible
  # * <tt>:stars[]</tt> -- Array of of hotel star-ratings,
  # * <tt>:meal</tt> -- Comma-separated lists of service levels,
  #   first element is a boolean flag, <tt>"any,id,id,..."</tt>,
  #   e.g. <tt>"false,1,2,3"</tt> for specific list, or, <tt>"true"</tt> for
  #   all availible
  # * <tt>:hotel</tt> -- Comma-separated lists of hotel ids,
  #   first element is a boolean flag, <tt>"any,id,id,..."</tt>,
  #   e.g. <tt>"false,1,2,3"</tt> for specific list, or, <tt>"true"</tt> for
  #   all availible
  # * <tt>:peace</tt> -- Require tickets and hotel avalibility, comma-separated
  #   list of booleans <tt>"hotel,tickets"</tt>, e.g. <tt>"true,false"</tt>
  # * <tt>:a</tt> -- We don't know what it means, but it
  #   should be <tt>"find"</tt>, or we will get a silent fail
  # * <tt>:page</tt> -- Page number, integer value
  def tours_tours options
    defaults = {
      price: [nil, nil],
      currency: "RUR",
      children: 0,
      child_ages: [],
      hotel_availible: false,
      tickets_availible: false,
      page: 0
    }

    settings = defaults.merge(options)

    child = ([settings[:children]]+settings[:child_ages]).join(',')

    day = settings[:day]
    day = [day, day] if(settings[:day].is_a? Date)
    day = day.map{|d| d.strftime "%d.%m.%Y" }.join(',') if day.is_a? Array

    night = settings[:night]
    night = (night..night) if night.is_a? Integer
    night = [night.min, night.max].join(',') if night.is_a? Range

    price = (settings[:price] + [settings[:currency]]).join(',')

    peace = [settings[:hotel_availible], settings[:tickets_availible]]
    peace = peace.map{|val| val ? 'true' : 'false' }.join(',')

    town = settings[:town] || 'true'
    town = (['false'] + town).join(',') if town.is_a? Array

    meal = settings[:meal] || 'true'
    meal = (['false'] + meal).join(',') if meal.is_a? Array

    hotel = settings[:hotel] || 'true'
    hotel = (['false'] + hotel).join(',') if hotel.is_a? Array

    star = settings[:stars] || 'true'
    star = (['false'] + star).join(',') if star.is_a? Array

    stars = settings[:stars]

    params = {
      src: settings[:src],
      dst: settings[:dst],
      oper: settings[:oper],
      adult: settings[:adult],
      child: child,
      day: day,
      night: night,
      price: price,
      town: town,
      star: star,
      stars: stars,
      meal: meal,
      hotel: hotel,
      peace: peace,
      page: settings[:page],
      a: "find"
    }

    check_params params, [:src, :dst, :oper, :adult]
    data = api_request 'tours', 'tours', params
    prepare_response_collection Rosstour::TourTour, data
  end

end

module Rosstour::Services
  include Rosstour::Services::Tours
end
