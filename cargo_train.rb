class CargoTrain < Train
  protected
  def can_add_van?(van)
    super && van.is_a?(CargoVan)
  end
end
