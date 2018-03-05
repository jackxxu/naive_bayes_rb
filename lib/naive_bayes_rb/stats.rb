module NaiveBayesRb
  module Stats
    extend self

    def mean(data)
      (0..data[0].length-1).map do |i|
        mean_calc(data.map {|x| x[i]})
      end
    end

    def stdev(data)
      (0..data[0].length-1).map do |i|
        stdev_calc(data.map {|x| x[i]})
      end
    end

    private

      def mean_calc(list)
        list.inject(:+).to_f.div(list.length)
      end

      def stdev_calc(list)
        m = mean_calc(list)
        sum = list.inject(0){|accum, i| accum +(i-m)**2 }
        Math.sqrt(sum/(list.length - 1).to_f)
      end

  end
end
