require 'tmpdir'

module FirefoxZip
  module Files
    class Manifest
      FILE_NAME = 'manifest.webapp'
      
      def self.get(file_path)
        return nil unless File.exists? file_path

        Dir.mktmpdir do |dir|
          entry = Manifest.get_entry(file_path, "*/#{FILE_NAME}")

          file = File.open("#{dir}/#{FILE_NAME}", 'w')
          file.write(entry.get_input_stream.read)
          file.close
          return File.open(file.path, 'r')
        end
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