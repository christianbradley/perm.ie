class Consumption
  
  attr_reader :consumer, :action, :resource

  def initialize consumer, action, resource
    @consumer = consumer
    @action = action
    @resource = resource
  end
  
end