require "spec_helper"

describe NaiveBayesRb::Stats do


  describe ".mean_stdev" do 
    let(:data)   { [[1, 20], [3, 22]] }
    let(:result) { NaiveBayesRb::Stats.mean_stdev(data)}
    it 'caculates the mean' do
      expect(result).to eq([[2, 1.4142135623730951], [21, 1.4142135623730951]])
    end
  end
end

