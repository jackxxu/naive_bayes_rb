module NaiveBayesRb
  class NaiveBayes

    attr_reader :model, :dimension

    def fit(data, target)
      @dimension = data[0].length
      @model = data.zip(target)
                   .group_by(&:last)
                   .each {|_, v| v.each_index {|i| v[i] = v[i][0]} }
    end

    def predict(data)
    end

  end
end
