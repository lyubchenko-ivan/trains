class RailwayStation

  attr_reader :trains, :name

  def initialize(name)
      self.name = name
      self.trains = []
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

  private
  attr_writer :trains, :name
end
