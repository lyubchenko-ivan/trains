class Train
  # include CompanyName
  # include InstanceCounter

  attr_reader :vans_count, :speed, :route, :type

  @@trains = []

  def initialize(vans_count)
      self.vans_count = vans_count
      self.current_station_id = 0
      self.direction = :+
      self.speed = 0
      @@trains << self
  end

  def self.find(id)
    @@trains[id - 1]
  end

  def accelerate
      self.speed += 1
  end

  def slow_down
     self.speed -= 1
  end

  def add_van(van)
    self.vans_count += 1 if can_add_van?
  end

  def remove_van
      self.vans_count -= 1 if can_remove_van?
  end

  def route=(route)
      return unless route.is_a?(Route)
      self.route = route
  end

  def move_to_next_station
      self.current_station_id = current_station_id.send(direction, 1)
      change_direction! if end_station?
  end

  def previous_station
    route[current_station_id.send(opposite_direction, 1)]
  end

  def current_station
      route[current_station_id]
  end

  def next_station
    route.stations_list[current_station_id.send(direction, 1)]
  end

  protected
  attr_writer :vans_count, :speed, :route, :type
  attr_accessor :direction, :current_station_id

  def end_station?
    last_station? || first_station?
  end

  def change_direction!
    self.direction = if current_station_id == route.stations_list.size - 1
        :-
     elsif current_station == 0
        :+
     end
  end

  def last_station?
    current_station == route.stations_list.size - 1
  end

  def first_station?
    current_station == 0
  end

  def opposite_direction
    self.direction == :- ? :+ : :-
  end

  def can_remove_van?
    speed == 0 && vans_count > 0
  end

  def can_add_van?
    speed == 0
  end
end
