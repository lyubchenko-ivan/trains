class Van
  include CompanyName
  include InstanceCounter

  attr_reader :type

  protected
  attr_reader :type
end
