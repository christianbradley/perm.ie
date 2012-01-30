class CombinationAnalysis

  attr_reader :combination
  
  def initialize combination
    @combination = combination
  end

  def compatible?
    product == resource
  end

  def consumption
    combination.consumption
  end

  def resource
    consumption.resource
  end

  def production
    combination.production
  end

  def product
    production.product
  end
  
end