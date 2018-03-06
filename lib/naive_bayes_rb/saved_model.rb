module NaiveBayesRb
  module SavedModel
    def self.included(base)
      base.extend(ClassMethods)
    end
    
    module ClassMethods
      def load(path)
        # stuff
      end
    end

    def save(model, path)

    end
  end
end