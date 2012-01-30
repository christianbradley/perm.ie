require 'production'

describe Production do

  subject { Production.new :producer, :action, :product }

  it "models the producer, action, and product" do
     subject.producer.should == :producer 
     subject.action.should == :action 
     subject.product.should == :product 
  end

end