module NaiveBayesRb
  class NaiveBayes

    attr_reader :model, :dimension

    def fit(data, target)
      @dimension = data[0].length
      @model = data.zip(target)
                   .group_by(&:last)
                   .inject({}) { |h, (k, v)| h[k] = Stats.mean_stdev(v.map(&:first)); h}
      self
    end

    def predict(data)
      data.map {|v| Stats.prediction(v, @model) }
    end

  end
end
