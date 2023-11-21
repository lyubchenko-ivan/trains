module InstanceCounter
  @@instances = 0

  def self.instances
    @@instances
  end

  protected
  def self.register_instance
    @@instances += 1
  end
end
