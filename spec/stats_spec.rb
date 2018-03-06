require "spec_helper"

describe NaiveBayesRb::Stats do

  describe ".mean_stdev" do 
    let(:result) { NaiveBayesRb::Stats.mean_stdev(data)}

    context 'two dimensions' do
      let(:data)   { [[1, 20], [3, 22]] }
      it 'caculates the mean_stdev for 2d array' do
        expect(result).to eq([[2, 1.4142135623730951], [21, 1.4142135623730951]])
      end        
    end

    context 'one dimension' do
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
    context 'one dimension' do
      let(:summaries) { { 0 => [[1, 0.5]], 1 => [[20, 5.0]] } }
      let(:value) { 1.1 }
      let(:class_probability) { NaiveBayesRb::Stats.class_probability(value, summaries) }
  
      it 'calculates correct probability' do
        expect(class_probability).to eq( { 0 => 0.7820853879509118, 1 => 6.298736258150442e-05 } )
      end        
    end
    
    context 'two dimensions' do
      let(:summaries) { {1 => [[1, 0.5], [2, 0.5]], 2 => [[20, 5.0], [19, 5]] } }
      let(:value) { [1.1, 2.2] }
      let(:class_probability) { NaiveBayesRb::Stats.class_probability(value, summaries) }
      it 'calculates correct probability for 2d' do
        expect(class_probability).to eq( { 1 => 0.5760373910997226, 2 => 1.7770023163251082e-08 } )
      end
    end
  end
  
  describe '.prediction' do
    context 'one dimension' do
      let(:summaries) { {'A' => [[1, 0.5]], 'B' => [[20, 5.0]] } }
      let(:value) { 1.1 }
      let(:prediction) { NaiveBayesRb::Stats.prediction(value, summaries) }
  
      it 'calculates correct probability' do
        expect(prediction).to eq( 'A' )
      end        
    end

    context 'two dimensions' do
      let(:summaries) { {'A' => [[1, 0.5], [2, 0.5]], 'B' => [[20, 5.0], [19, 5]] } }
      let(:value) { [1.1, 2.2] }
      let(:prediction) { NaiveBayesRb::Stats.prediction(value, summaries) }
  
      it 'calculates correct probability' do
        expect(prediction).to eq( 'A' )
      end      
    end
  end

  describe '.accurancy' do
    let(:target) { ['a', 'a', 'b'] }
    let(:predictions) { [ 'a', 'a', 'a'] }
    let(:accuracy) { NaiveBayesRb::Stats.accuracy(predictions, target) }

    it 'calculates correct probability' do
      expect(accuracy).to eq( 66.66666666666667 )
    end
  end
end





