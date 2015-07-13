module Rosstour
  SERVICES = {
    avia:   [ :init, :search, :reservation ],
    geo:    [ :IpInfo, :listCityFranOffice, :listFranOfficeInCity ],
    rates:  [ :cbrfRates, :operRates ],
    tours:  [ :Src, :Dsts, :Opers, :Zones, :Meals, :Stars, :Dates, :Night, :Hotel, :Tours ],
    hotels: [ :Countries, :Cities, :Visainfo, :HotelInfo, :CancellationInfo,
              :VisaTextInfo, :search],
  }
end
