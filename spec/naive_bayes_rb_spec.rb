require "spec_helper"

describe NaiveBayesRb::NaiveBayes do
  before do 
    @nb = NaiveBayesRb::NaiveBayes.new
  end

  describe "NaiveBayesRb::NaiveBayes.new" do 
    it 'is not nil' do
      expect(@nb).not_to be_nil
    end
  end

  describe "NaiveBayesRb::NaiveBayes#dimension" do 
    let(:data)   { [[1, 20], [2, 21], [3, 22]] }
    let(:target) { [1, 0, 1] }

    it 'is calculated correctly' do
      @nb.fit(data, target)
      expect(@nb.dimension).to eq(2)
    end
  end

  describe 'NaiveBayesRb::NaiveBayes#fit' do
    let(:data)   {[[1, 20], [2, 21], [3, 22]]}
    let(:target) {[1, 0, 1]}
    let(:output) {@nb.fit(data, target)}

    it 'calculate the model properly' do
      @nb.fit(data, target)
      expect(output).to eq({0 => [[2, 21]], 1 => [[1, 20], [3, 22]]})
    end


  end
end
