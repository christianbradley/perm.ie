require 'combination'

class System

  attr_reader :productions
  attr_reader :consumptions

  def initialize productions, consumptions
    @productions = productions
    @consumptions = consumptions
  end

  def pairs
    productions.product(consumptions)
  end

  def combinations
    pairs.map do |(production, consumption)|
      Combination.new production, consumption
    end
  end

  def products
    productions.map &:product
  end

  def resources
    consumptions.map &:resource
  end

end