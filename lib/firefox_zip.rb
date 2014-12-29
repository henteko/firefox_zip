require 'firefox_zip/parses/manifest'
require 'firefox_zip/files/project'

module FirefoxZip
  class << self
    attr_reader :name

    def analyze(file_path)
      @name = 'hello'
      
      self
    end
  end
end