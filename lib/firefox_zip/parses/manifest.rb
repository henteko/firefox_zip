require 'json'

module FirefoxZip
  module Parses
    class Manifest
      attr_reader :name, :description, :launch_path, :icons, :icon, :type, :permissions

      def initialize(file_path)
        return unless File.exists? file_path
        
        file = File.open(file_path, 'r')
        data = JSON.parse(file.read)
        
        @name = data['name']
        @description = data['description']
        @launch_path = data['launch_path']
        @icons = data['icons']
        @icon = data['icons']['16']
        @type = data['type']
        @permissions = data['permissions']
      end
    end
  end
end