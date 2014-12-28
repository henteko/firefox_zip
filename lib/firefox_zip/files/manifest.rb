require 'tempfile'

module FirefoxZip
  module Files
    class Manifest
      FILE_NAME = 'manifest.webapp'
      
      def self.get(file_path)
        return nil unless File.exists? file_path
        
        entry = Manifest.get_entry(file_path, "*/#{FILE_NAME}")
        file = Tempfile.new(FILE_NAME)
        file.write(entry.get_input_stream.read)
        
        file
      end
      
      private
      
      def self.get_entry(file_path, file_name)
        Zip::File.open(file_path) do |zip_file|
          return zip_file.glob(file_name).first
        end
      end
    end
  end
end