class Route
  attr_reader :stations, :from, :to

  def initialize
    self.stations = []
    self.from = ''
    self.to = ''
  end

  def add_station(station)
      stations << station unless stations.include?(station)
  end

  def remove_station(station)
      stations.delete(station)
  end

  def stations_list
      [from] + stations + [to]
  end

  private
  attr_writer :stations, :from, :to
end
