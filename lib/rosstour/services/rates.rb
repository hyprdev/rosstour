module Rosstour::Services::Rates
  def rates_cbr
    api_request 'rates', 'cbrfRates'
  end
  def rates_oper
    api_request 'rates', 'operRates'
  end
end

module Rosstour::Services
  include Rosstour::Services::Rates
end
