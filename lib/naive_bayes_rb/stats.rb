module NaiveBayesRb
  module Stats
    extend self

    def mean_stdev(data)
      dimension = data[0].length-1
      means = (0..dimension).map {|i| mean(data.map {|x| x[i]})}
      stdevs = (0..dimension).map {|i| stdev(data.map {|x| x[i]})}
      means.zip(stdevs)
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
