module Rosstour::Services::Rates
  def rates_cbr
    data = api_request 'rates', 'cbrfRates'
    unless data.nil? || data['usd'].nil? || data['eur'].nil?
      Rosstour::RateCBR.new data
    else
      raise Rosstour::MalformedResponse.new "Unsufficient data: #{data.inspect}"
    end
  end
  def rates_oper
    data = api_request 'rates', 'operRates'
    if data.is_a? Array
      data.map { |rate| Rosstour::RateOper.new rate }
    else
      raise Rosstour::MalformedResponse.new "Unsufficient data: #{data.inspect}"
    end
  end
end

module Rosstour::Services
  include Rosstour::Services::Rates
end
