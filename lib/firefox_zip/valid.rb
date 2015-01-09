require 'systemu'
require 'json'

module FirefoxZip
  class Valid
    def self.run(zip_file_path)
      return raise 'not zip file' unless File.exists? zip_file_path

      status, stdout, stderr = systemu "app-validator #{zip_file_path} -o json"

      raise 'Not run validation error' if status.exitstatus != 0
      result = JSON.parse(stdout)

      raise "Validation error: #{result['message']}" if result['errors'] != 0
    end
  end
end
