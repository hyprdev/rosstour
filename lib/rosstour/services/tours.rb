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
  def tours_dsts params
    data = api_request 'tours', 'dsts', params

    list = data['list']
    if list.is_a? Array
      list.map { |dst| Rosstour::TourDst.new dst }
    else
      raise Rosstour::MalformedResponse.new "Unsufficient data: #{list.inspect}"
    end
  end
  def tours_opers params
    data = api_request 'tours', 'opers', params
    list = data['list']
    if list.is_a? Array
      list.map { |oper| Rosstour::TourOper.new oper }
    else
      raise Rosstour::MalformedResponse.new "Unsufficient data: #{list.inspect}"
    end
  end
  def tours_zones params
    data = api_request 'tours', 'zones', params
    list = data['list']
    if list.is_a? Array
      list.map { |zone| Rosstour::TourZone.new zone }
    else
      raise Rosstour::MalformedResponse.new "Unsufficient data: #{list.inspect}"
    end
  end
  def tours_meals params
    data = api_request 'tours', 'meals', params
    list = data['list']
    if list.is_a? Array
      list.map { |meal| Rosstour::TourMeal.new meal }
    else
      raise Rosstour::MalformedResponse.new "Unsufficient data: #{list.inspect}"
    end
  end
  def tours_stars params
    data = api_request 'tours', 'stars', params
    list = data['list']
    if list.is_a? Array
      list.map { |star| Rosstour::TourStar.new star }
    else
      raise Rosstour::MalformedResponse.new "Unsufficient data: #{list.inspect}"
    end
  end
  def tours_dates params
    data = api_request 'tours', 'dates', params
    list = data['list']
    if list.is_a? Array
      list.map { |date| Rosstour::TourDate.new date }
    else
      raise Rosstour::MalformedResponse.new "Unsufficient data: #{list.inspect}"
    end
  end
  def tours_nights params
    data = api_request 'tours', 'nights', params
    list = data['list']
    if list.is_a? Array
      list.map { |night| Rosstour::TourNight.new night }
    else
      raise Rosstour::MalformedResponse.new "Unsufficient data: #{list.inspect}"
    end
  end
  def tours_hotels params
    data = api_request 'tours', 'hotels', params
    list = data['list']
    if list.is_a? Array
      list.map { |hotel| Rosstour::TourHotel.new hotel }
    else
      raise Rosstour::MalformedResponse.new "Unsufficient data: #{list.inspect}"
    end
  end
end

module Rosstour::Services
  include Rosstour::Services::Tours
end
