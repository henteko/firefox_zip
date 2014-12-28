module FirefoxZip
  class << self
    attr_reader :name

    def analyze(file_path)
      @name = 'hello'
      
      self
    end
  end
end