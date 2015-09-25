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
  def tours_dsts
    data = api_request 'tours', 'dsts'
    list = data['list']
    if list.is_a? Array
      list.map { |dst| Rosstour::TourDst.new dst }
    else
      raise Rosstour::MalformedResponse.new "Unsufficient data: #{list.inspect}"
    end
  end
  def tours_opers
    data = api_request 'tours', 'opers'
    list = data['list']
    if list.is_a? Array
      list.map { |oper| Rosstour::TourOper.new oper }
    else
      raise Rosstour::MalformedResponse.new "Unsufficient data: #{list.inspect}"
    end
  end
  def tours_zones
    data = api_request 'tours', 'zones'
    list = data['list']
    if list.is_a? Array
      list.map { |zone| Rosstour::TourZone.new zone }
    else
      raise Rosstour::MalformedResponse.new "Unsufficient data: #{list.inspect}"
    end
  end
  def tours_meals
    data = api_request 'tours', 'meals'
    list = data['list']
    if list.is_a? Array
      list.map { |meal| Rosstour::TourMeal.new meal }
    else
      raise Rosstour::MalformedResponse.new "Unsufficient data: #{list.inspect}"
    end
  end
  def tours_stars
    data = api_request 'tours', 'stars'
    list = data['list']
    if list.is_a? Array
      list.map { |star| Rosstour::TourStar.new star }
    else
      raise Rosstour::MalformedResponse.new "Unsufficient data: #{list.inspect}"
    end
  end
end

module Rosstour::Services
  include Rosstour::Services::Tours
end
