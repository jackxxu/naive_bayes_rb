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
    let(:data)   {[[1, 20], [2, 21], [3, 22], [4, 23]]}
    let(:target) {[1, 0, 1, 0]}

    it 'calculate the model properly' do
      @nb.fit(data, target)
      expect(@nb.model).to eq({
        1=>[[2, 1.4142135623730951], [21, 1.4142135623730951]], 
        0=>[[3, 1.4142135623730951], [22, 1.4142135623730951]]})
    end
  end


  describe 'NaiveBayesRb::NaiveBayes#predict' do
    let(:train)  { [[1, 20], [2, 21], [3, 22], [4, 23]] }
    let(:target) { [1, 0, 1, 0] }
    let(:test)   { [[0, 0], [4, 24]] } 

    let(:predictions) {@nb.fit(train, target).predict(test)}

    it 'calculate the model properly' do
      expect(predictions).to eq([1, 0])
    end
  end

end

