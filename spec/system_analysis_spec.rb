require 'system_analysis'
require 'combination_analysis'

describe SystemAnalysis do

  let(:system) { double :system, :combinations => [] }
  let(:analysis) { SystemAnalysis.new system }

  describe "deficiencies" do

    subject { analysis.deficiencies }

    context "all resources are produced" do

      before do 
        system.stub(:products) { [:eggs, :water] }
        system.stub(:resources) { [:eggs, :water] }
      end

      it "is not deficient" do
        should be_empty 
      end

    end

    context "resources are not being produced" do

      before do 
        system.stub(:products) { [:eggs, :water] }
        system.stub(:resources) { [:eggs, :scraps] }
      end

      it "is deficient" do
        should include :scraps
      end
      
    end
    
  end
  
  describe "compatibilities" do
    
    let(:combination) { double :combination }
    let(:combination_analysis) { double :combination_analysis, :compatible? => true }

    before do 
      system.stub(:combinations) { [combination] } 
    end    
    
    it "determines compatibility of each combination" do
      CombinationAnalysis.should_receive(:new).with(combination) { combination_analysis }
      analysis.compatibilities.should include combination
    end
    
  end

end