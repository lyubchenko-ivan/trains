class PassengerTrain < Train
  protected
  def can_add_van?(van)
    super && van.is_a?(PassengerVan)
  end
end
