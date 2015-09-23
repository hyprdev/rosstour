module Rosstour::Services::Rates
  def rates_cbr
    data = api_request 'rates', 'cbrfRates'
    Rosstour::RateCBR.new data
  end
  def rates_oper
    api_request 'rates', 'operRates'
  end
end

module Rosstour::Services
  include Rosstour::Services::Rates
end
