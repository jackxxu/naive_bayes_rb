require "spec_helper"

describe NaiveBayesRb::Stats do

  describe ".mean_stdev" do 
    let(:result) { NaiveBayesRb::Stats.mean_stdev(data)}

    describe 'two dimensions' do
      let(:data)   { [[1, 20], [3, 22]] }

      it 'caculates the mean_stdev for 2d array' do
        expect(result).to eq([[2, 1.4142135623730951], [21, 1.4142135623730951]])
      end        
    end

    describe 'one dimension' do
      let(:data)   { [[1], [2], [3], [4], [5]] }

      it 'caculates the mean_stdev for 2d array' do
        expect(result).to eq([[3, 1.5811388300841898]])
      end        
    end
    
  end

  describe '.probability' do
    let(:x) { 71.5 }
    let(:mean) { 73 }
    let(:stdev) { 6.2 } 
    let(:probability) { NaiveBayesRb::Stats.probability(x, mean, stdev) }

    it 'calculates correct probability' do
      expect(probability).to eq(0.06248965759370005)
    end

  end
end


