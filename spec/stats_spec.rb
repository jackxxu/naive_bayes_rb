require "spec_helper"

describe NaiveBayesRb::Stats do

  describe ".means" do 
    let(:data)   { [[1, 20], [3, 22]] }
    let(:result) { NaiveBayesRb::Stats.mean(data)}
    it 'caculates the mean' do
      expect(result).to eq([2, 21])
    end
  end

  describe ".stdev" do 
    let(:data)   { [[1, 20], [3, 22]] }
    let(:result) { NaiveBayesRb::Stats.stdev(data)}
    it 'caculates the mean' do
      expect(result).to eq([1.4142135623730951, 1.4142135623730951])
    end
  end
end

