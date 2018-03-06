require "spec_helper"

describe NaiveBayesRb::NaiveBayes do
  before(:all) do 
    @nb = NaiveBayesRb::NaiveBayes.new
  end

  describe "NaiveBayesRb::NaiveBayes.new" do 
    it 'is not nil' do
      expect(@nb).not_to be_nil
    end

    it 'has zero dimension' do
      expect(@nb.dimension).to eq(0)      
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

  describe 'NaiveBayesRb::NaiveBayes#save' do
    let(:train)  { [[1, 20], [2, 21], [3, 22], [4, 23]] }
    let(:target) { [1, 0, 1, 0] }
    let(:test)   { [[0, 0], [4, 24]] } 
    let(:model_file_name) { 'test.pb' }
    let(:loaded_model) { NaiveBayesRb::NaiveBayes.load(model_file_name)  }
    
    before do 
      NaiveBayesRb::NaiveBayes.serializer = NaiveBayesRb::MarshalSerializer
      @nb.fit(train, target).save(model_file_name)   
    end

    it 'saves to a model file' do
      expect(loaded_model.model).to eq(@nb.model)
    end
    
  end

end
