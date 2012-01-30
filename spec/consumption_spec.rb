require 'consumption'

describe Consumption do

  subject { Consumption.new :consumer, :action, :resource }

  it "models the consumer, action, and resource" do
    subject.consumer.should == :consumer 
    subject.action.should == :action 
    subject.resource.should == :resource 
  end

end