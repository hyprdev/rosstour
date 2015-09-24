module Rosstour::Services::Tours
  def tours_srcs
    data = api_request 'tours', 'srcs'
    list = data['list']
    unless list.nil?
      Rosstour::TourSrc.new list
    else
      raise Rosstour::MalformedResponse.new "Unsufficient list: #{list.inspect}"
    end
  end
end

module Rosstour::Services
  include Rosstour::Services::Tours
end
