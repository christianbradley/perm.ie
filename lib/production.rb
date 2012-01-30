class Production 

  attr_reader :producer
  attr_reader :action
  attr_reader :product

  def initialize producer, action, product
    @producer = producer
    @action = action
    @product = product
  end
  
end