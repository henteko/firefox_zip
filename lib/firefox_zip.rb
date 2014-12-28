require 'zip'
require 'firefox_zip/parses/manifest'

module FirefoxZip
  class << self
    attr_reader :name

    def analyze(file_path)
      Zip::File.open(file_path) do |zip_file|
        zip_file.each do |entry|
          puts "Extracting #{entry.name}"
        end
      end
      
      @name = 'hello'
      
      self
    end
  end
end