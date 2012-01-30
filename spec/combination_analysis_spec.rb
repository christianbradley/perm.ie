require 'combination_analysis'

describe CombinationAnalysis do

  let(:production) { double :production }
  let(:consumption) { double :consumption }
  let(:combination) { double :combination, :consumption => consumption, :production => production }
  let(:analysis) { CombinationAnalysis.new combination }

  subject { analysis }

  context "resource and product are different" do

    before do 
      production.stub(:product) { :eggs }
      consumption.stub(:resource) { :dirt }
    end

    it "is incompatible" do
      analysis.should_not be_compatible
    end

  end

  context "resource and product are the same" do

    before do 
      production.stub(:product) { :eggs }
      consumption.stub(:resource) { :eggs }
    end

    it "is compatible" do
      analysis.should be_compatible
    end

  end

end
