require 'system'
require 'combination'

describe System do

  let(:productions) { double :productions }
  let(:consumptions) { double :consumptions }
  let(:system) { System.new productions, consumptions } 
  
  subject { system }

  it "aggregates productions and consumptions" do
    subject.productions.should == productions
    subject.consumptions.should == consumptions
  end

  describe "pairs" do
    
    before do
      system.stub(:productions) { [:foo, :bar] }
      system.stub(:consumptions) { [:baz, :qux] }
    end
    
    subject { system.pairs }
    
    it "combines productions and consumptions" do
      should include [:foo, :baz]
      should include [:foo, :qux]
      should include [:bar, :baz]
      should include [:bar, :qux]
    end
    
  end
  
  describe "combinations" do
    
    before do 
      system.stub(:pairs) { [[:foo, :bar], [:foo, :baz]] }
    end
    
    it "creates a combination from each pair" do
      Combination.should_receive(:new).with(:foo, :bar).and_return { :foo_bar }
      Combination.should_receive(:new).with(:foo, :baz).and_return { :foo_baz }
      
      system.combinations.should == [:foo_bar, :foo_baz]
    end
    
  end
  
end