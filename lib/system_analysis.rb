class SystemAnalysis

  def initialize system
    @system = system
  end

  def deficiencies
    resources - products
  end

  def compatibilities
    @system.combinations.select do |combination|
      CombinationAnalysis.new(combination).compatible?
    end
  end

  def resources
    @system.resources
  end

  def products
    @system.products
  end

end