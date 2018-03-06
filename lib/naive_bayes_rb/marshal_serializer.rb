module NaiveBayesRb
  module MarshalSerializer 
    extend self
    def self.save(model, path)
      File.open(path, 'wb') {|f| f.write( Marshal.dump(model) ) }
    end

    def self.load(path)
      Marshal.load(File.binread(path))
    end
  end
end