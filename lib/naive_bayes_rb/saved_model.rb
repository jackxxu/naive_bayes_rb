module NaiveBayesRb
  module SavedModel
    def self.included(base)
      base.extend(ClassMethods)
    end
    
    module ClassMethods
      def serializer=(serializer)
        @serializer = serializer
      end
  
      def serializer
        @serializer
      end
  
      def load(path)
        self.new.tap do |nb|
          nb.model = @serializer.load(path)
        end
      end
    end
  
    def save(path)
      self.class.serializer.save(self.model, path)
    end
  end
end