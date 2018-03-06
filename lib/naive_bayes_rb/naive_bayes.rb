module NaiveBayesRb
  class NaiveBayes
    include SavedModel
    
    attr_accessor :model

    def initialize
      @model = {}
    end

    def fit(data, target)
      @model = data.zip(target)
                   .group_by(&:last)
                   .inject({}) { |h, (k, v)| h[k] = Stats.mean_stdev(v.map(&:first)); h}
      self
    end

    def predict(data)
      data.map {|v| Stats.prediction(v, @model) }
    end

    def dimension
      (@model.values || []).length
    end
    
  end
end

