module Rosstour::Services::Tours
  def tours_srcs
    data = api_request 'tours', 'srcs'
    list = data['list']
    if list.is_a? Array
      list.map { |src| Rosstour::TourSrc.new src }
    else
      raise Rosstour::MalformedResponse.new "Unsufficient data: #{list.inspect}"
    end
  end
end

module Rosstour::Services
  include Rosstour::Services::Tours
end
