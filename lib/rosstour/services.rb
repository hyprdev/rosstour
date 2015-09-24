module Rosstour::Services
  # SERVICES = {
  #   avia:   [ :init, :search, :reservation ],
  #   geo:    [ :IpInfo, :listCityFranOffice, :listFranOfficeInCity ],
  #   rates:  [ :cbrfRates, :operRates ],
  #   tours:  [ :Srcs, :Dsts, :Opers, :Zones, :Meals, :Stars, :Dates, :Night, :Hotel, :Tours ],
  #   hotels: [ :Countries, :Cities, :Visainfo, :HotelInfo, :CancellationInfo,
  #             :VisaTextInfo, :search],
  # }
end


require 'rosstour/services/avia'
require 'rosstour/services/rates'
require 'rosstour/services/tours'
