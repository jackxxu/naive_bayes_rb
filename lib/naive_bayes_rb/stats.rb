module NaiveBayesRb
  module Stats
    extend self

    def mean_stdev(data)
      dimension = data[0].length-1
      means = (0..dimension).map {|i| mean(data.map {|x| x[i]})}
      stdevs = (0..dimension).map {|i| stdev(data.map {|x| x[i]})}
      means.zip(stdevs)
    end

    def probability(value, mean, stdev)
      exponent = Math.exp(-((value-mean)**2)/( 2 * stdev**2 ))
      (1 / (Math.sqrt(2*Math::PI) * stdev) ) * exponent
    end

    def class_probability(value, summaries)
      summaries.inject({}) { |h, (k, v)| 
        h[k] = v.inject(1) { |p, ms| 
          p * probability(value, ms[0], ms[1])}; h}
    end

    def getPrediction(value, summaries)
      class_probability(value, summaries).sort_by {|_, v| -v}.first.first
    end

    def getPredictions(values, summaries)
      values.map {|value| getPrediction(value, summaries)}
    end

    private

      def mean(list)
        list.inject(:+).to_f.div(list.length)
      end

      def stdev(list)
        m = mean(list)
        sum = list.inject(0){|accum, i| accum +(i-m)**2 }
        Math.sqrt(sum/(list.length - 1).to_f)
      end

  end
end
