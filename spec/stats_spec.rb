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

  describe '.class_probability' do
    let(:summaries) { { 0 => [[1, 0.5]], 1 => [[20, 5.0]] } }
    let(:value) { 1.1 }
    let(:class_probability) { NaiveBayesRb::Stats.class_probability(value, summaries) }

    it 'calculates correct probability' do
      expect(class_probability).to eq( { 0 => 0.7820853879509118, 1 => 6.298736258150442e-05 } )
    end
  end

  describe '.prediction' do
    let(:summaries) { {'A' => [[1, 0.5]], 'B' => [[20, 5.0]] } }
    let(:value) { 1.1 }
    let(:prediction) { NaiveBayesRb::Stats.prediction(value, summaries) }

    it 'calculates correct probability' do
      expect(prediction).to eq( 'A' )
    end

  end

  describe '.predictions' do
    let(:summaries) { {'A' => [[1, 0.5]], 'B' => [[20, 5.0]] } }
    let(:values) { [ 1.1, 19.1] }
    let(:prediction) { NaiveBayesRb::Stats.predictions(values, summaries) }

    it 'calculates correct probability' do
      expect(prediction).to eq( ['A', 'B'] )
    end
  end

  describe '.getAccurancy' do
    let(:target) { ['a', 'a', 'b'] }
    let(:predictions) { [ 'a', 'a', 'a'] }
    let(:accuracy) { NaiveBayesRb::Stats.accuracy(predictions, target) }

    it 'calculates correct probability' do
      expect(accuracy).to eq( 66.66666666666667 )
    end
  end
end





