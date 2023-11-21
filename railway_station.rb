class RailwayStation
#   include InstanceCounter

  attr_reader :trains, :name

    @@stations = []

  def initialize(name)
      self.name = name
      self.trains = []
      @@stations << self
  end

  def train_arrived(train)
      trains << train unless trains.include?(train)
  end

  def send_train(train)
      trains.delete(train)
  end

  def trains_by_category(category)
      trains.select { |train| train.category == category }
  end

  def self.all
    @@stations
  end

  private
  attr_writer :trains, :name
end
